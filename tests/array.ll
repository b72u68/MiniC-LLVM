declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 40)
  %A = bitcast i8* %temp1 to i32*
  %result = bitcast i32 0 to i32
  %i = bitcast i32 0 to i32
  %temp2 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp9 = icmp slt i32 %i, 10
  br i1 %temp9, label %label2, label %label3
label2:
  %temp4 = getelementptr i32, i32* %A, i32 %i
  store i32 %i, i32* %temp4
  %temp3 = load i32, i32* %temp4
  %temp6 = getelementptr i32, i32* %A, i32 %i
  %temp5 = load i32, i32* %temp6
  %i = add i32 %i, 1
  %temp8 = bitcast i32 %i to i32
  %temp7 = sub i32 %temp8, 1
  br label %label1
label3:
  %j = bitcast i32 0 to i32
  %temp10 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp13 = icmp slt i32 %j, 10
  br i1 %temp13, label %label5, label %label6
label5:
  %result = add i32 %result, %j
  %j = add i32 %j, 1
  %temp12 = bitcast i32 %j to i32
  %temp11 = sub i32 %temp12, 1
  br label %label4
label6:
  ret i32 %result
  ret i32 0
}
