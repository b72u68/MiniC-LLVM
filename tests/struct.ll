%s1 = type { i32, i8, i32
}
%s2 = type { i32, %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 12)
  %st = bitcast i8* %temp1 to %s1*
  %temp3 = getelementptr %s1, %s1* %st, i32 0
  %temp4 = bitcast %s1* %temp3 to i32*
  store i32 2, i32* %temp4
  %temp2 = load i32, i32* %temp4
  %temp6 = getelementptr %s1, %s1* %st, i32 1
  %temp7 = bitcast %s1* %temp6 to i8*
  store i8 97, i8* %temp7
  %temp5 = load i8, i8* %temp7
  %temp9 = getelementptr %s1, %s1* %st, i32 2
  %temp10 = bitcast %s1* %temp9 to i32*
  store i32 1, i32* %temp10
  %temp8 = load i32, i32* %temp10
  %temp11 = call i8* @malloc(i32 8)
  %st2 = bitcast i8* %temp11 to %s2*
  %temp13 = getelementptr %s2, %s2* %st2, i32 0
  %temp14 = bitcast %s2* %temp13 to i32*
  store i32 3, i32* %temp14
  %temp12 = load i32, i32* %temp14
  %temp16 = getelementptr %s2, %s2* %st2, i32 1
  %temp17 = bitcast %s2* %temp16 to %s1**
  store %s1* %st, %s1** %temp17
  %temp15 = load %s1*, %s1** %temp17
  %temp21 = bitcast %s2* %st2 to %s2*
  %temp22 = getelementptr %s2, %s2* %temp21, i32 0
  %temp23 = bitcast %s2* %temp22 to i32*
  %temp20 = load i32, i32* %temp23
  %temp26 = bitcast %s2* %st2 to %s2*
  %temp27 = getelementptr %s2, %s2* %temp26, i32 1
  %temp28 = bitcast %s2* %temp27 to %s1**
  %temp25 = load %s1*, %s1** %temp28
  %temp29 = getelementptr %s1, %s1* %temp25, i32 0
  %temp30 = bitcast %s1* %temp29 to i32*
  %temp24 = load i32, i32* %temp30
  %temp19 = add i32 %temp20, %temp24
  %temp33 = bitcast %s2* %st2 to %s2*
  %temp34 = getelementptr %s2, %s2* %temp33, i32 1
  %temp35 = bitcast %s2* %temp34 to %s1**
  %temp32 = load %s1*, %s1** %temp35
  %temp36 = getelementptr %s1, %s1* %temp32, i32 2
  %temp37 = bitcast %s1* %temp36 to i32*
  %temp31 = load i32, i32* %temp37
  %temp18 = add i32 %temp19, %temp31
  ret i32 %temp18
  ret i32 0
}
