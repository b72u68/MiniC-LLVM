%s1 = type { i32, i8, i32
}
%s2 = type { i32, %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2 = call i8* @malloc(i32 12)
  %temp1 = bitcast i8* %temp2 to %s1*
  %st = bitcast %s1* %temp1 to %s1*
  %temp4 = bitcast i32 2 to i32
  %temp5 = getelementptr %s1, %s1* %st, i32 0
  %temp6 = bitcast %s1* %temp5 to i32*
  store i32 %temp4, i32* %temp6
  %temp3 = load i32, i32* %temp6
  %temp8 = bitcast i8 97 to i8
  %temp9 = getelementptr %s1, %s1* %st, i32 1
  %temp10 = bitcast %s1* %temp9 to i8*
  store i8 %temp8, i8* %temp10
  %temp7 = load i8, i8* %temp10
  %temp12 = bitcast i32 1 to i32
  %temp13 = getelementptr %s1, %s1* %st, i32 2
  %temp14 = bitcast %s1* %temp13 to i32*
  store i32 %temp12, i32* %temp14
  %temp11 = load i32, i32* %temp14
  %temp16 = call i8* @malloc(i32 8)
  %temp15 = bitcast i8* %temp16 to %s2*
  %st2 = bitcast %s2* %temp15 to %s2*
  %temp18 = bitcast i32 3 to i32
  %temp19 = getelementptr %s2, %s2* %st2, i32 0
  %temp20 = bitcast %s2* %temp19 to i32*
  store i32 %temp18, i32* %temp20
  %temp17 = load i32, i32* %temp20
  %temp22 = bitcast %s1* %st to %s1*
  %temp23 = getelementptr %s2, %s2* %st2, i32 1
  %temp24 = bitcast %s2* %temp23 to %s1**
  store %s1* %temp22, %s1** %temp24
  %temp21 = load %s1*, %s1** %temp24
  %temp28 = bitcast %s2* %st2 to %s2*
  %temp29 = getelementptr %s2, %s2* %temp28, i32 0
  %temp30 = bitcast %s2* %temp29 to i32*
  %temp27 = load i32, i32* %temp30
  %temp33 = bitcast %s2* %st2 to %s2*
  %temp34 = getelementptr %s2, %s2* %temp33, i32 1
  %temp35 = bitcast %s2* %temp34 to %s1**
  %temp32 = load %s1*, %s1** %temp35
  %temp36 = getelementptr %s1, %s1* %temp32, i32 0
  %temp37 = bitcast %s1* %temp36 to i32*
  %temp31 = load i32, i32* %temp37
  %temp26 = add i32 %temp27, %temp31
  %temp40 = bitcast %s2* %st2 to %s2*
  %temp41 = getelementptr %s2, %s2* %temp40, i32 1
  %temp42 = bitcast %s2* %temp41 to %s1**
  %temp39 = load %s1*, %s1** %temp42
  %temp43 = getelementptr %s1, %s1* %temp39, i32 2
  %temp44 = bitcast %s1* %temp43 to i32*
  %temp38 = load i32, i32* %temp44
  %temp25 = add i32 %temp26, %temp38
  ret i32 %temp25
  ret i32 0
}
