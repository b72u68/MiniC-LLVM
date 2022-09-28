declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %i = bitcast i32 0 to i32
  br label %label1
label1:
  %temp6 = icmp sgt i32 1, 0
  br i1 %temp6, label %label2, label %label3
label2:
  %i = add i32 %i, 1
  %temp2 = bitcast i32 %i to i32
  %temp1 = sub i32 %temp2, 1
  %temp3 = icmp sgt i32 %i, 50
  br i1 %temp3, label %label4, label %label5
label4:
  br label %label3
  br label %label6
label5:
  br label %label6
label6:
  %i = add i32 %i, 1
  %temp5 = bitcast i32 %i to i32
  %temp4 = sub i32 %temp5, 1
  br label %label1
label3:
  ret i32 %i
  ret i32 0
}
