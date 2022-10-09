%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %list$1 = inttoptr i32 0 to %node*
  %temp1$2 = ptrtoint %node* %list$1 to i32
  ret i32 %temp1$2
}
