declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = bitcast i32 0 to i32
  %i = bitcast i32 %temp1 to i32
  %temp2 = bitcast i32 0 to i32
  %j = bitcast i32 %temp2 to i32
  br label %label1
label1:
  %temp19 = bitcast i32 %i to i32
  %temp20 = bitcast i32 50 to i32
  %temp18 = icmp slt i32 %temp19, %temp20
  br i1 %temp18, label %label2, label %label3
label2:
  %temp5 = bitcast i32 %i to i32
  %temp6 = bitcast i32 1 to i32
  %i = add i32 %temp5, %temp6
  %temp4 = bitcast i32 %i to i32
  %temp7 = bitcast i32 1 to i32
  %temp3 = sub i32 %temp4, %temp7
  %temp10 = bitcast i32 %j to i32
  %temp11 = bitcast i32 1 to i32
  %j = add i32 %temp10, %temp11
  %temp9 = bitcast i32 %j to i32
  %temp12 = bitcast i32 1 to i32
  %temp8 = sub i32 %temp9, %temp12
  br label %label1
  %temp15 = bitcast i32 %i to i32
  %temp16 = bitcast i32 1 to i32
  %i = add i32 %temp15, %temp16
  %temp14 = bitcast i32 %i to i32
  %temp17 = bitcast i32 1 to i32
  %temp13 = sub i32 %temp14, %temp17
  br label %label1
label3:
  %temp21 = bitcast i32 %j to i32
  ret i32 %temp21
  ret i32 0
}
