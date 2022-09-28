declare i8* @malloc(i32)
define i32 @fib(i32 %n) {
fib__entry:
  %temp1 = bitcast i32 1 to i32
  ret i32 %temp1
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp3 = bitcast i32 (i32)* @fib to i32 (i32)*
  %temp4 = bitcast i32 6 to i32
  %temp2 = call i32 %temp3(i32 %temp4)
  ret i32 %temp2
  ret i32 0
}
