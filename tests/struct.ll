%s1 = type { i32, i8, i32
}
%s2 = type { i32, %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 12)
  %st = bitcast i8* %temp1 to %s1*
  %temp2 = getelementptr %s1, %s1* %st, i32 0, i32 0
  store i32 2, i32* %temp2
  %temp3 = getelementptr %s1, %s1* %st, i32 0, i32 1
  store i8 97, i8* %temp3
  %temp4 = getelementptr %s1, %s1* %st, i32 0, i32 2
  store i32 1, i32* %temp4
  %temp5 = call i8* @malloc(i32 8)
  %st2 = bitcast i8* %temp5 to %s2*
  %temp6 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  store i32 3, i32* %temp6
  %temp7 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  store %s1* %st, %s1** %temp7
  %temp11 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  %temp10 = load i32, i32* %temp11
  %temp14 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  %temp13 = load %s1*, %s1** %temp14
  %temp15 = getelementptr %s1, %s1* %temp13, i32 0, i32 0
  %temp12 = load i32, i32* %temp15
  %temp9 = add i32 %temp10, %temp12
  %temp18 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  %temp17 = load %s1*, %s1** %temp18
  %temp19 = getelementptr %s1, %s1* %temp17, i32 0, i32 2
  %temp16 = load i32, i32* %temp19
  %temp8 = add i32 %temp9, %temp16
  ret i32 %temp8
  ret i32 0
}
