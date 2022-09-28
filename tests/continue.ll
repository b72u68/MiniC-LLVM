declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %i = bitcast i32 0 to i32
  %j = bitcast i32 0 to i32
  br label %label1
label1:
  %temp7 = icmp slt i32 %i, 50
  br i1 %temp7, label %label2, label %label3
label2:
  %i = add i32 %i, 1
  %temp2 = bitcast i32 %i to i32
  %temp1 = sub i32 %temp2, 1
  %j = add i32 %j, 1
  %temp4 = bitcast i32 %j to i32
  %temp3 = sub i32 %temp4, 1
  br label %label1
  %i = add i32 %i, 1
  %temp6 = bitcast i32 %i to i32
  %temp5 = sub i32 %temp6, 1
  br label %label1
label3:
  ret i32 %j
  ret i32 0
}
