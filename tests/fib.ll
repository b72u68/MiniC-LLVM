declare i8* @malloc(i32)
define i32 @fib(i32 %n) {
fib__entry:
  %temp8 = icmp sle i32 %n, 1
  br i1 %temp8, label %label1, label %label2
label1:
  ret i32 %n
  br label %label3
label2:
  %temp3 = bitcast i32 (i32)* @fib to i32 (i32)*
  %temp4 = sub i32 %n, 2
  %temp2 = call i32 %temp3(i32 %temp4)
  %temp6 = bitcast i32 (i32)* @fib to i32 (i32)*
  %temp7 = sub i32 %n, 1
  %temp5 = call i32 %temp6(i32 %temp7)
  %temp1 = add i32 %temp2, %temp5
  ret i32 %temp1
  br label %label3
label3:
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp10 = bitcast i32 (i32)* @fib to i32 (i32)*
  %temp11 = bitcast i32 6 to i32
  %temp9 = call i32 %temp10(i32 %temp11)
  ret i32 %temp9
  ret i32 0
}
