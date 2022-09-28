%s1 = type { i32, i32
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2 = call i8* @malloc(i32 8)
  %temp1 = bitcast i8* %temp2 to %s1*
  %st = bitcast %s1* %temp1 to %s1*
  %temp4 = bitcast i32 1 to i32
  %temp5 = getelementptr %s1, %s1* %st, i32 0
  %temp6 = bitcast %s1* %temp5 to i32*
  store i32 %temp4, i32* %temp6
  %temp3 = load i32, i32* %temp6
  %temp8 = bitcast %s1* %st to %s1*
  %temp9 = getelementptr %s1, %s1* %temp8, i32 0
  %temp10 = bitcast %s1* %temp9 to i32*
  %temp7 = load i32, i32* %temp10
  ret i32 %temp7
  ret i32 0
}
