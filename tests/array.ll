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
  %temp6 = icmp slt i32 %i, 10
  br i1 %temp6, label %label2, label %label3
label2:
  %temp3 = getelementptr i32, i32* %A, i32 %i
  store i32 %i, i32* %temp3
  %i = add i32 %i, 1
  %temp5 = bitcast i32 %i to i32
  %temp4 = sub i32 %temp5, 1
  br label %label1
label3:
  %j = bitcast i32 0 to i32
  %temp7 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp10 = icmp slt i32 %j, 10
  br i1 %temp10, label %label5, label %label6
label5:
  %result = add i32 %result, %j
  %j = add i32 %j, 1
  %temp9 = bitcast i32 %j to i32
  %temp8 = sub i32 %temp9, 1
  br label %label4
label6:
  ret i32 %result
  ret i32 0
}
