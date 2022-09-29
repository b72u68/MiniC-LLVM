%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %list = inttoptr i32 0 to %node*
  %temp1 = ptrtoint %node* %list to i32
  ret i32 %temp1
  ret i32 0
}
