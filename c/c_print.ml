open C_ast

let rec string_of_typ t =
  match t with
  | TVoid -> "void"
  | TBool -> "bool"
  | TChar -> "char"
  | TInt -> "int"
  | TArray t -> (string_of_typ t) ^ "[]"
  | TStruct s -> "struct " ^ s
  | TFunction (r, args) ->
     
     
