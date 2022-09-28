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
    | _ -> failwith "IITRAN binary operation cannot be converted to LLVM binary arithmetic operation"

let map_c_bop_to_llvm_cmp = function
    | BGt -> L.CSGt
    | BGe -> L.CSGe
    | BLt -> L.CSLt
    | BLe -> L.CSLe
    | BNe -> L.CNe
    | BEq -> L.CEq
    | _ -> failwith "IITRAN binary operation cannot be converted to LLVM binary comparison operation"

let move (dest: L.var) (typ: L.typ) (value: L.value) =
  L.ISet (dest, typ, value)

let rec compile_exp ctx (dest: L.var) (e: t_exp) : L.inst list =
    let t = compile_typ ctx e.einfo in
    match e.edesc with
    | EConst c -> [move dest t (L.Const (val_of_const c))]
    | EVar v ->
            (match t with
            | L.TPointer (L.TFunction _) -> [move dest t (L.Var (L.Global v))]
            | _ -> [move dest t (compile_var v)])
    | EBinop (op, e1, e2) -> compile_binop ctx dest op e1 e2
    | EAssign (l, e2) ->
            (match l.ldesc with
            | LHVar v -> (compile_exp ctx (L.Local v) e2) @ [move dest t (compile_var v)]
            | LHArr (v, e1) ->
                let d1 = new_temp () in
                let il1 = compile_exp ctx d1 e1 in
                let d2 = new_temp () in
                let il2 = compile_exp ctx d2 e2 in
                let elemptr = new_temp () in
                il1 @ il2
                @ [L.IGetElementPtr (elemptr, compile_typ ctx l.linfo, L.Local v, [(itype, L.Var d1)])]
                @ [L.IStore (compile_typ ctx e2.einfo, L.Var d2, elemptr)]
                @ [L.ILoad (dest, t, elemptr)]
            | LHField (v, t', f) ->
                    (match t' with
                    | TStruct st ->
                            (match (get_field_i (fst ctx) st f) with
                            | Some i ->
                                    let d = new_temp () in
                                    let il = compile_exp ctx d e2 in
                                    let elemptr = new_temp () in
                                    let bc_elemptr = new_temp () in
                                    il
                                    @ [L.IGetElementPtr (elemptr, L.TStruct st, L.Local v, [(itype, L.Const i)])]
                                    @ [L.ICast (bc_elemptr, L.CBitcast, L.TPointer (L.TStruct st), L.Var elemptr, L.TPointer t)]
                                    @ [L.IStore (compile_typ ctx l.linfo, L.Var d, bc_elemptr)]
                                    @ [L.ILoad (dest, t, bc_elemptr)]
                            |None -> raise (TypeError (Printf.sprintf "Cannot find field %s in struct %s" f st, l.lloc)))
                    | _ -> raise (TypeError (Printf.sprintf "Exptected %s to have struct type" v, l.lloc))))
    | ENewStruct st ->
            let sizeof_st = (L.sizeof (snd ctx) (L.TStruct st)) * word_size in
            let elemptr = new_temp () in
            [L.ICall (elemptr, L.TPointer ctype, malloc, [(itype, L.Const sizeof_st)])]
            @ [L.ICast (dest, L.CBitcast, L.TPointer ctype, L.Var elemptr, t)]
    | ENewArray (t', n) ->
            let sizeof_arr = (L.sizeof (snd ctx) (compile_typ ctx t')) * n * word_size in
            let elemptr = new_temp () in
            [L.ICall (elemptr, L.TPointer ctype, malloc, [(itype, L.Const sizeof_arr)])]
            @ [L.ICast (dest, L.CBitcast, L.TPointer ctype, L.Var elemptr, t)]
    | EUnop (op, e') -> compile_unop ctx dest op e'
    | ECall (e', el) ->
            let rec compile_args ils args = function
                | [] -> (ils, List.rev args)
                | e::el ->
                        let d = new_temp () in
                        let il = compile_exp ctx d e in
                        compile_args (ils @ il) ((compile_typ ctx e.einfo, L.Var d)::args) el
            in
            let funptr = new_temp () in
            let il = compile_exp ctx funptr e' in
            let (ils, args) = compile_args [] [] el in
            il @ ils @ [L.ICall (dest, t, funptr, args)]
    | EArrIndex (e1, e2) ->
            let d1 = new_temp () in
            let il1 = compile_exp ctx d1 e1 in
            let d2 = new_temp () in
            let il2 = compile_exp ctx d2 e2 in
            let elemptr = new_temp () in
            il1 @ il2
            @ [L.IGetElementPtr (elemptr, compile_typ ctx e1.einfo, d1, [(itype, L.Var d2)])]
            @ [L.ILoad (dest, t, elemptr)]
    | EField (e', f) ->
            (match e'.einfo with
            | TStruct st ->
                    (match get_field_i_and_typ (fst ctx) st f with
                    | Some (i, t') ->
                            let d = new_temp () in
                            let il = compile_exp ctx d e' in
                            let elemptr = new_temp () in
                            let bc_elemptr = new_temp () in
                            il @ [L.IGetElementPtr (elemptr, L.TStruct st, d, [(itype, L.Const i)])]
                            @ [L.ICast (bc_elemptr, L.CBitcast, L.TPointer (L.TStruct st), L.Var elemptr, L.TPointer t)]
                            @ [L.ILoad (dest, t, bc_elemptr)]
                    | None -> raise (TypeError (Printf.sprintf "Cannot find field %s in struct %s" f st, e.eloc)))
            | _ -> raise (TypeError ("EField expression expected struct type", e.eloc)))
    | ECast (e', t') -> []

and compile_binop ctx (dest: L.var) (op: bop) (e1: t_exp) (e2: t_exp) : L.inst list =
    let t = compile_typ ctx e1.einfo in
    match op with
    | BAdd | BSub | BMul | BDiv ->
            let d1 = new_temp () in
            let il1 = compile_exp ctx d1 e1 in
            let d2 = new_temp () in
            let il2 = compile_exp ctx d2 e2 in
            il1 @ il2 @ [L.IBinop (dest, map_c_bop_to_llvm_bop op, t, L.Var d1, L.Var d2)]
    | BGt | BGe | BLt | BLe | BNe | BEq ->
            let d1 = new_temp () in
            let il1 = compile_exp ctx d1 e1 in
            let d2 = new_temp () in
            let il2 = compile_exp ctx d2 e2 in
            il1 @ il2 @ [L.ICmp (dest, map_c_bop_to_llvm_cmp op, t, L.Var d1, L.Var d2)]
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

and compile_unop ctx (dest: L.var) (op: unop) (e: t_exp) : L.inst list =
    let t = compile_typ ctx e.einfo in
    let d = new_temp () in
    let il = compile_exp ctx d e in
    match op with
    | UNeg -> il @ [L.IBinop (dest, L.BSub, t, L.Const 0, L.Var d)]
    | UNot -> il @ [L.IBinop (dest, L.BXor, t, L.Var d, L.Const 1)]

and compile_branch_exp ctx (e: t_exp) (tlabel: L.label) (flabel: L.label) : L.inst list =
    let d = new_temp () in
    (compile_exp ctx d e) @ [L.ICondBr (L.Var d, tlabel, flabel)]

let rec compile_stmt ctx break_lbl cont_lbl (s: t_stmt): L.inst list =
    match s.sdesc with
    | SDecl (v, t, None) -> []
    | SDecl (v, t, Some e) ->
            let d = new_temp () in
            let il = compile_exp ctx d e in
            il @ [move (L.Local v) (compile_typ ctx t) (L.Var d)]
    | SBlock sl -> List.fold_left (fun acc s -> acc @ (compile_stmt ctx break_lbl cont_lbl s)) [] sl
    | SExp e -> compile_exp ctx (new_temp ()) e
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
            let d = new_temp () in
            let il = compile_exp ctx d e in
            il @ [L.IRet (Some (compile_typ ctx e.einfo, L.Var d))]

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
