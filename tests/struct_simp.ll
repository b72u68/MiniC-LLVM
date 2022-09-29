%s1 = type { i32, i32
}
%s2 = type { %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 8)
  %st1 = bitcast i8* %temp1 to %s1*
  %temp2 = getelementptr %s1, %s1* %st1, i32 0, i32 1
  store i32 2, i32* %temp2
  %temp3 = call i8* @malloc(i32 4)
  %st2 = bitcast i8* %temp3 to %s2*
  %temp4 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  store %s1* %st1, %s1** %temp4
  %temp7 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  %temp6 = load %s1*, %s1** %temp7
  %temp8 = getelementptr %s1, %s1* %temp6, i32 0, i32 1
  %temp5 = load i32, i32* %temp8
  ret i32 %temp5
  ret i32 0
}
