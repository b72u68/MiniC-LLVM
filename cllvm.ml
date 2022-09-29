(* IIT CS 443 - Fall 2022 *)
(* C to LLVM Compiler *)
(* Project 3 *)
(* My Dinh *)

open C.Ast
module L = LLVM.Ast
open C.Typecheck

exception CompileError of string * loc
exception TypeError of string * loc

exception Unimplemented

let new_temp = L.new_temp
let new_label = L.new_label

let compile_var s = L.Var (L.Local s)

let btype = L.TInteger 1
let ctype = L.TInteger 8
let itype = L.TInteger 32

(* Will probably be useful *)
let word_size = Config.word_size
let malloc = L.Global "malloc"

let rec compile_typ ctx t =
  match t with
  | TVoid -> L.TVoid
  | TBool -> btype
  | TChar -> ctype
  | TInt -> itype
  | TArray t -> L.TPointer (compile_typ ctx t)
  | TStruct s -> L.TPointer (L.TStruct s)
  | TFunction (rt, args) ->
     L.TPointer (L.TFunction
                   (compile_typ ctx rt,
                    List.map (fun (t, _) -> compile_typ ctx t) args))

let val_of_const = function
    | CChar c -> Char.code c
    | CInt n -> n

let map_c_bop_to_llvm_bop = function
    | BAdd -> L.BAdd
    | BSub -> L.BSub
    | BMul -> L.BMul
    | BDiv -> L.BDiv
    | _ -> failwith "C binary operation cannot be converted to LLVM binary arithmetic operation"

let map_c_bop_to_llvm_cmp = function
    | BGt -> L.CSGt
    | BGe -> L.CSGe
    | BLt -> L.CSLt
    | BLe -> L.CSLe
    | BNe -> L.CNe
    | BEq -> L.CEq
    | _ -> failwith "C binary operation cannot be converted to LLVM binary comparison operation"

let move (dest: L.var) (typ: L.typ) (value: L.value) =
  L.ISet (dest, typ, value)

let rec compile_exp ctx (dest: L.var) (e: t_exp) : L.inst list =
    let e_typ = compile_typ ctx e.einfo in
    match e.edesc with
    | EConst c -> [move dest e_typ (L.Const (val_of_const c))]
    | EVar v ->
            (match e.einfo with
            | TFunction _ -> [move dest e_typ (L.Var (L.Global v))]
            | _ -> [move dest e_typ (compile_var v)])
    | EBinop (op, e1, e2) -> compile_binop_exp ctx dest op e1 e2
    | EAssign ({ldesc = LHVar v}, e') ->
            (compile_exp ctx (L.Local v) e') @ [move dest e_typ (compile_var v)]
    | EAssign ({ldesc = LHArr (v, e1)} as l, e2) ->
            let (il1, vd1) = compile_nested_exp ctx e1 in
            let (il2, vd2) = compile_nested_exp ctx e2 in
            let elemptr = new_temp () in
            il1 @ il2
            @ [L.IGetElementPtr (elemptr, compile_typ ctx l.linfo, L.Local v, [(itype, vd1)])]
            @ [L.IStore (compile_typ ctx e2.einfo, vd2, elemptr)]
            @ [L.ILoad (dest, e_typ, elemptr)]
    | EAssign ({ldesc = LHField (v, TStruct st, f)} as l, e') ->
            (match (get_field_i (fst ctx) st f) with
            | Some i ->
                    let (il', vd') = compile_nested_exp ctx e' in
                    let elemptr = new_temp () in
                    il'
                    @ [L.IGetElementPtr (elemptr, L.TStruct st, L.Local v, [(itype, L.Const 0); (itype, L.Const i)])]
                    @ [L.IStore (e_typ, vd', elemptr)]
                    @ [L.ILoad (dest, e_typ, elemptr)]
            |None -> raise (TypeError (Printf.sprintf "Cannot find field %s in struct %s" f st, l.lloc)))
    | EAssign (l, _) -> raise (TypeError (Printf.sprintf "Unsupported type in lhs", l.lloc))
    | ENewStruct st ->
            let sizeof_st = (L.sizeof (snd ctx) (L.TStruct st)) * word_size in
            let elemptr = new_temp () in
            [L.ICall (elemptr, L.TPointer ctype, malloc, [(itype, L.Const sizeof_st)])]
            @ [L.ICast (dest, L.CBitcast, L.TPointer ctype, L.Var elemptr, e_typ)]
    | ENewArray (t', n) ->
            let sizeof_arr = (L.sizeof (snd ctx) (compile_typ ctx t')) * n * word_size in
            let elemptr = new_temp () in
            [L.ICall (elemptr, L.TPointer ctype, malloc, [(itype, L.Const sizeof_arr)])]
            @ [L.ICast (dest, L.CBitcast, L.TPointer ctype, L.Var elemptr, e_typ)]
    | EUnop (op, e') -> compile_unop_exp ctx dest op e'
    | ECall (e', el) ->
            let rec compile_args ils args = function
                | [] -> (ils, List.rev args)
                | e::el ->
                        let d = new_temp () in
                        let il = compile_exp ctx d e in
                        compile_args (ils @ il) ((compile_typ ctx e.einfo, L.Var d)::args) el
            in
            let (il, vfptr) = compile_nested_exp ctx e' in
            (match vfptr with
            | L.Const _ -> raise (TypeError ("ECall expected Var value, got Const", e.eloc))
            | L.Var fptr ->
                let (ils, args) = compile_args [] [] el in
                il @ ils @ [L.ICall (dest, e_typ, fptr, args)])
    | EArrIndex (e1, e2) ->
            let (il1, vd1) = compile_nested_exp ctx e1 in
            (match vd1 with
            | L.Const _ -> raise (TypeError ("EArrIndex expected Var value, got Const", e.eloc))
            | L.Var d1 ->
                let (il2, vd2) = compile_nested_exp ctx e2 in
                let elemptr = new_temp () in
                il1 @ il2
                @ [L.IGetElementPtr (elemptr, e_typ, d1, [(itype, vd2)])]
                @ [L.ILoad (dest, e_typ, elemptr)])
    | EField ({einfo = TStruct st} as e', f) ->
            (match get_field_i (fst ctx) st f with
            | Some i ->
                    let (il', vd') = compile_nested_exp ctx e' in
                    (match vd' with
                    | L.Const _ -> raise (TypeError ("EField expected Var value, got Const", e.eloc))
                    | L.Var d' ->
                            let elemptr = new_temp () in
                            il' @ [L.IGetElementPtr (elemptr, L.TStruct st, d', [(itype, L.Const 0); (itype, L.Const i)])]
                            @ [L.ILoad (dest, e_typ, elemptr)])
            | None -> raise (TypeError (Printf.sprintf "Cannot find field %s in struct %s" f st, e.eloc)))
    | EField _ -> raise (TypeError ("EField expression expected struct type", e.eloc))
    | ECast (e', t') ->
            let (il', vd') = compile_nested_exp ctx e' in
            il' @
            (match e'.einfo with
            | TBool ->
                    (match t' with
                    | TBool -> []
                    | TChar -> [L.ICast (dest, L.CZext, btype, vd', ctype)]
                    | TInt -> [L.ICast (dest, L.CZext, btype, vd', itype)]
                    | _ ->
                            let cd = new_temp () in
                            [L.ICast (cd, L.CZext, btype, vd', itype)]
                            @ [L.ICast (dest, L.CInttoptr, itype, L.Var cd, compile_typ ctx t')])
            | TChar ->
                    (match t' with
                    | TBool -> [L.ICast (dest, L.CTrunc, ctype, vd', btype)]
                    | TChar -> []
                    | TInt -> [L.ICast (dest, L.CZext, ctype, vd', itype)]
                    | _ ->
                            let cd = new_temp () in
                            [L.ICast (cd, L.CZext, ctype, vd', itype)]
                            @ [L.ICast (dest, L.CInttoptr, itype, L.Var cd, compile_typ ctx t')])
            | TInt ->
                    (match t' with
                    | TBool -> [L.ICast (dest, L.CTrunc, itype, vd', btype)]
                    | TChar -> [L.ICast (dest, L.CTrunc, itype, vd', ctype)]
                    | TInt -> []
                    | _ -> [L.ICast (dest, L.CInttoptr, itype, vd', compile_typ ctx t')])
            | _ ->
                    (match t' with
                    | TBool ->
                            let cd = new_temp () in
                            [L.ICast (cd, L.CPtrtoint, compile_typ ctx e'.einfo, vd', itype)]
                            @ [L.ICast (dest, L.CTrunc, itype, L.Var cd, btype)]
                    | TChar ->
                            let cd = new_temp () in
                            [L.ICast (cd, L.CPtrtoint, compile_typ ctx e'.einfo, vd', itype)]
                            @ [L.ICast (dest, L.CTrunc, itype, L.Var cd, ctype)]
                    | TInt -> [L.ICast (dest, L.CPtrtoint, compile_typ ctx e'.einfo, vd', itype)]
                    | _ -> [L.ICast (dest, L.CBitcast, compile_typ ctx e'.einfo, vd', compile_typ ctx t')]))

and compile_nested_exp ctx (e: t_exp) : L.inst list * L.value =
    match e.edesc with
    | EVar v ->
            (match e.einfo with
            | TFunction _ -> ([], L.Var (L.Global v))
            | _ -> ([], compile_var v))
    | EConst c -> ([], L.Const (val_of_const c))
    | _ -> let d = new_temp () in (compile_exp ctx d e, L.Var d)

and compile_binop_exp ctx (dest: L.var) (op: bop) (e1: t_exp) (e2: t_exp) : L.inst list =
    let t = compile_typ ctx e1.einfo in
    match op with
    | BAdd | BSub | BMul | BDiv ->
            let (il1, vd1) = compile_nested_exp ctx e1 in
            let (il2, vd2) = compile_nested_exp ctx e2 in
            il1 @ il2 @ [L.IBinop (dest, map_c_bop_to_llvm_bop op, t, vd1, vd2)]
    | BGt | BGe | BLt | BLe | BNe | BEq ->
            let (il1, vd1) = compile_nested_exp ctx e1 in
            let (il2, vd2) = compile_nested_exp ctx e2 in
            il1 @ il2 @ [L.ICmp (dest, map_c_bop_to_llvm_cmp op, t, vd1, vd2)]
    | BAnd ->
            let e1true = new_label () in
            let tdest = new_label () in
            let fdest = new_label () in
            let ldone = new_label () in
            (compile_branch_exp ctx e1 e1true fdest)
            @ [L.ILabel e1true] @ (compile_branch_exp ctx e2 tdest fdest)
            @ [L.ILabel tdest] @ [move dest btype (L.Const 1)] @ [L.IBr ldone]
            @ [L.ILabel fdest] @ [move dest btype (L.Const 0)] @ [L.IBr ldone]
            @ [L.ILabel ldone]
    | BOr ->
            let e1false = new_label () in
            let tdest = new_label () in
            let fdest = new_label () in
            let ldone = new_label () in
            (compile_branch_exp ctx e1 tdest e1false)
            @ [L.ILabel e1false] @ (compile_branch_exp ctx e2 tdest fdest)
            @ [L.ILabel tdest] @ [move dest btype (L.Const 1)] @ [L.IBr ldone]
            @ [L.ILabel fdest] @ [move dest btype (L.Const 0)] @ [L.IBr ldone]
            @ [L.ILabel ldone]

and compile_unop_exp ctx (dest: L.var) (op: unop) (e: t_exp) : L.inst list =
    let t = compile_typ ctx e.einfo in
    let (il, vd) = compile_nested_exp ctx e in
    match op with
    | UNeg -> il @ [L.IBinop (dest, L.BSub, t, L.Const 0, vd)]
    | UNot -> il @ [L.IBinop (dest, L.BXor, t, vd, L.Const 1)]

and compile_branch_exp ctx (e: t_exp) (tlabel: L.label) (flabel: L.label) : L.inst list =
    let (il, vd) = compile_nested_exp ctx e in
    il @ [L.ICondBr (vd, tlabel, flabel)]

let rec compile_stmt ctx break_lbl cont_lbl (s: t_stmt): L.inst list =
    match s.sdesc with
    | SDecl (v, t, None) -> []
    | SDecl (v, t, Some e) -> compile_exp ctx (L.Local v) e
    | SBlock sl -> List.fold_left (fun acc s -> acc @ (compile_stmt ctx break_lbl cont_lbl s)) [] sl
    | SExp e ->
            (match e.edesc with
            | EAssign ({ldesc = LHVar v}, e') -> (compile_exp ctx (L.Local v) e')
            | _ -> compile_exp ctx (new_temp ()) e)
    | SIf (e, s1, s2) ->
            let ltrue = new_label () in
            let lfalse = new_label () in
            let ldone = new_label () in
            (compile_branch_exp ctx e ltrue lfalse)
            @ [L.ILabel ltrue] @ (compile_stmt ctx break_lbl cont_lbl s1) @ [L.IBr ldone]
            @ [L.ILabel lfalse] @ (compile_stmt ctx break_lbl cont_lbl s2) @ [L.IBr ldone]
            @ [L.ILabel ldone]
    | SWhile (e, s) ->
            let ltest = new_label () in
            let lbody = new_label () in
            let ldone = new_label () in
            [L.IBr ltest]
            @ [L.ILabel ltest] @ (compile_branch_exp ctx e lbody ldone)
            @ [L.ILabel lbody] @ (compile_stmt ctx (Some ldone) (Some ltest) s) @ [L.IBr ltest]
            @ [L.ILabel ldone]
    | SBreak ->
            (match break_lbl with
            | Some lbreak -> [L.IBr lbreak]
            | None -> failwith "Cannot find label for break")
    | SContinue ->
            (match cont_lbl with
            | Some lcont -> [L.IBr lcont]
            | None -> failwith "Cannot find label for continue")
    | SReturn None -> [L.IRet None]
    | SReturn (Some e) ->
            let (il, vd) = compile_nested_exp ctx e in
            il @ [L.IRet (Some (compile_typ ctx e.einfo, vd))]

let compile_func ctx (name, t, body) : L.func =
  match t with
  | TFunction (tret, args) ->
     let tret = compile_typ ctx tret in
     let targs = List.map (fun (t, s) -> (compile_typ ctx t, s)) args in
     L.make_func name tret targs
       ((L.ILabel (name ^ "__entry"))::(compile_stmt ctx None None body)
        @ [match tret with
           | L.TVoid -> L.IRet None
           | _ -> L.IRet (Some (tret, Const 0))])
  | _ -> raise (CompileError ("not a function type", ("", 0)))

let rec compile_def ctx d : L.func list =
  match d.ddesc with
  | DFun (s, t, b) -> [compile_func ctx (s, t, b)]
  | _ -> []

let compile_prog (ctx, ds) : L.prog * L.typdefs =
  let tds = Varmap.map (List.map (compile_typ ctx)) (get_typedefs ctx) in
  (List.concat (List.map (compile_def (ctx, tds)) ds), tds)
