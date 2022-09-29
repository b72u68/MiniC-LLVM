%s1 = type { i32, i8, i32
}
%s2 = type { i32, %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 12)
  %st = bitcast i8* %temp1 to %s1*
  %temp3 = getelementptr %s1, %s1* %st, i32 0, i32 0
  store i32 2, i32* %temp3
  %temp2 = load i32, i32* %temp3
  %temp5 = getelementptr %s1, %s1* %st, i32 0, i32 1
  store i8 97, i8* %temp5
  %temp4 = load i8, i8* %temp5
  %temp7 = getelementptr %s1, %s1* %st, i32 0, i32 2
  store i32 1, i32* %temp7
  %temp6 = load i32, i32* %temp7
  %temp8 = call i8* @malloc(i32 8)
  %st2 = bitcast i8* %temp8 to %s2*
  %temp10 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  store i32 3, i32* %temp10
  %temp9 = load i32, i32* %temp10
  %temp12 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  store %s1* %st, %s1** %temp12
  %temp11 = load %s1*, %s1** %temp12
  %temp16 = getelementptr %s2, %s2* %st2, i32 0, i32 0
  %temp15 = load i32, i32* %temp16
  %temp19 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  %temp18 = load %s1*, %s1** %temp19
  %temp20 = getelementptr %s1, %s1* %temp18, i32 0, i32 0
  %temp17 = load i32, i32* %temp20
  %temp14 = add i32 %temp15, %temp17
  %temp23 = getelementptr %s2, %s2* %st2, i32 0, i32 1
  %temp22 = load %s1*, %s1** %temp23
  %temp24 = getelementptr %s1, %s1* %temp22, i32 0, i32 2
  %temp21 = load i32, i32* %temp24
  %temp13 = add i32 %temp14, %temp21
  ret i32 %temp13
  ret i32 0
}
