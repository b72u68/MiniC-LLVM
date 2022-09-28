declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = bitcast i32 1 to i32
  %a = bitcast i32 %temp1 to i32
  %temp2 = bitcast i32 2 to i32
  %b = bitcast i32 %temp2 to i32
  %temp4 = bitcast i32 %a to i32
  %temp5 = bitcast i32 %b to i32
  %temp3 = add i32 %temp4, %temp5
  %c = bitcast i32 %temp3 to i32
  %temp7 = bitcast i32 %c to i32
  %temp8 = bitcast i32 3 to i32
  %temp6 = add i32 %temp7, %temp8
  ret i32 %temp6
  ret i32 0
}
