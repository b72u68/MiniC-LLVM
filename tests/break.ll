declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = bitcast i32 0 to i32
  %i = bitcast i32 %temp1 to i32
  br label %label1
label1:
  %temp16 = bitcast i32 1 to i32
  %temp17 = bitcast i32 0 to i32
  %temp15 = icmp sgt i32 %temp16, %temp17
  br i1 %temp15, label %label2, label %label3
label2:
  %temp4 = bitcast i32 %i to i32
  %temp5 = bitcast i32 1 to i32
  %i = add i32 %temp4, %temp5
  %temp3 = bitcast i32 %i to i32
  %temp6 = bitcast i32 1 to i32
  %temp2 = sub i32 %temp3, %temp6
  %temp8 = bitcast i32 %i to i32
  %temp9 = bitcast i32 50 to i32
  %temp7 = icmp sgt i32 %temp8, %temp9
  br i1 %temp7, label %label4, label %label5
label4:
  br label %label3
  br label %label6
label5:
  br label %label6
label6:
  %temp12 = bitcast i32 %i to i32
  %temp13 = bitcast i32 1 to i32
  %i = add i32 %temp12, %temp13
  %temp11 = bitcast i32 %i to i32
  %temp14 = bitcast i32 1 to i32
  %temp10 = sub i32 %temp11, %temp14
  br label %label1
label3:
  %temp18 = bitcast i32 %i to i32
  ret i32 %temp18
  ret i32 0
}
