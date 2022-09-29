%s1 = type { i32, i32
}
%s2 = type { %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1 = call i8* @malloc(i32 12)
  %A = bitcast i8* %temp1 to %s1**
  %temp2 = call i8* @malloc(i32 8)
  %st1 = bitcast i8* %temp2 to %s1*
  %temp3 = getelementptr %s1, %s1* %st1, i32 0, i32 0
  store i32 1, i32* %temp3
  %temp4 = getelementptr %s1, %s1* %st1, i32 0, i32 1
  store i32 2, i32* %temp4
  %temp5 = getelementptr %s1*, %s1** %A, i32 2
  store %s1* %st1, %s1** %temp5
  %temp9 = getelementptr %s1*, %s1** %A, i32 2
  %temp8 = load %s1*, %s1** %temp9
  %temp10 = getelementptr %s1, %s1* %temp8, i32 0, i32 0
  %temp7 = load i32, i32* %temp10
  %temp13 = getelementptr %s1*, %s1** %A, i32 2
  %temp12 = load %s1*, %s1** %temp13
  %temp14 = getelementptr %s1, %s1* %temp12, i32 0, i32 1
  %temp11 = load i32, i32* %temp14
  %temp6 = add i32 %temp7, %temp11
  ret i32 %temp6
  ret i32 0
}
