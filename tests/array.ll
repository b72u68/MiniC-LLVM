declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2 = call i8* @malloc(i32 40)
  %temp1 = bitcast i8* %temp2 to i32*
  %A = bitcast i32* %temp1 to i32*
  %temp3 = bitcast i32 0 to i32
  %result = bitcast i32 %temp3 to i32
  %temp4 = bitcast i32 0 to i32
  %i = bitcast i32 %temp4 to i32
  %temp5 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp16 = bitcast i32 %i to i32
  %temp17 = bitcast i32 10 to i32
  %temp15 = icmp slt i32 %temp16, %temp17
  br i1 %temp15, label %label2, label %label3
label2:
  %temp7 = bitcast i32 %i to i32
  %temp8 = bitcast i32 %i to i32
  %temp9 = getelementptr i32, i32* %A, i32 %temp7
  store i32 %temp8, i32* %temp9
  %temp6 = load i32, i32* %temp9
  %temp12 = bitcast i32 %i to i32
  %temp13 = bitcast i32 1 to i32
  %i = add i32 %temp12, %temp13
  %temp11 = bitcast i32 %i to i32
  %temp14 = bitcast i32 1 to i32
  %temp10 = sub i32 %temp11, %temp14
  br label %label1
label3:
  %temp18 = bitcast i32 0 to i32
  %j = bitcast i32 %temp18 to i32
  %temp19 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp29 = bitcast i32 %j to i32
  %temp30 = bitcast i32 10 to i32
  %temp28 = icmp slt i32 %temp29, %temp30
  br i1 %temp28, label %label5, label %label6
label5:
  %temp21 = bitcast i32 %result to i32
  %temp22 = bitcast i32 %j to i32
  %result = add i32 %temp21, %temp22
  %temp20 = bitcast i32 %result to i32
  %temp25 = bitcast i32 %j to i32
  %temp26 = bitcast i32 1 to i32
  %j = add i32 %temp25, %temp26
  %temp24 = bitcast i32 %j to i32
  %temp27 = bitcast i32 1 to i32
  %temp23 = sub i32 %temp24, %temp27
  br label %label4
label6:
  %temp31 = bitcast i32 %result to i32
  ret i32 %temp31
  ret i32 0
}
