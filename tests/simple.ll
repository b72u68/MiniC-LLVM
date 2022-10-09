declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %a$1 = bitcast i32 1 to i32
  %b$2 = bitcast i32 2 to i32
  %c$3 = add i32 %a$1, %b$2
  %temp1$4 = add i32 %c$3, 3
  ret i32 %temp1$4
}
