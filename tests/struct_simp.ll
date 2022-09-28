%s1 = type { i32, i32
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 8)
  %st = bitcast i8* %temp1 to %s1*
  %temp3 = getelementptr %s1, %s1* %st, i32 0
  %temp4 = bitcast %s1* %temp3 to i32*
  store i32 1, i32* %temp4
  %temp2 = load i32, i32* %temp4
  %temp6 = bitcast %s1* %st to %s1*
  %temp7 = getelementptr %s1, %s1* %temp6, i32 0
  %temp8 = bitcast %s1* %temp7 to i32*
  %temp5 = load i32, i32* %temp8
  ret i32 %temp5
  ret i32 0
}
