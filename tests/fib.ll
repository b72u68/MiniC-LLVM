declare i8* @malloc(i32)
define i32 @fib(i32 %n) {
fib__entry:
  %temp6 = icmp sle i32 %n, 1
  br i1 %temp6, label %label1, label %label2
label1:
  ret i32 %n
  br label %label3
label2:
  %temp3 = sub i32 %n, 2
  %temp2 = call i32 @fib(i32 %temp3)
  %temp5 = sub i32 %n, 1
  %temp4 = call i32 @fib(i32 %temp5)
  %temp1 = add i32 %temp2, %temp4
  ret i32 %temp1
  br label %label3
label3:
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp8 = bitcast i32 6 to i32
  %temp7 = call i32 @fib(i32 %temp8)
  ret i32 %temp7
  ret i32 0
}
