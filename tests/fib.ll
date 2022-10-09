declare i8* @malloc(i32)
define i32 @fib(i32 %n) {
fib__entry:
  %temp6$1 = icmp sle i32 %n, 1
  br i1 %temp6$1, label %label1, label %label2
label1:
  ret i32 %n
label2:
  %temp3$2 = sub i32 %n, 2
  %temp2$3 = call i32 @fib(i32 %temp3$2)
  %temp5$4 = sub i32 %n, 1
  %temp4$5 = call i32 @fib(i32 %temp5$4)
  %temp1$6 = add i32 %temp2$3, %temp4$5
  ret i32 %temp1$6
}

define i32 @main() {
main__entry:
  %temp8$1 = bitcast i32 6 to i32
  %temp7$2 = call i32 @fib(i32 %temp8$1)
  ret i32 %temp7$2
}
