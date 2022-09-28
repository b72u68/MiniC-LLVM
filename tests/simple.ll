declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %a = bitcast i32 1 to i32
  %b = bitcast i32 2 to i32
  %c = add i32 %a, %b
  %temp1 = add i32 %c, 3
  ret i32 %temp1
  ret i32 0
}
