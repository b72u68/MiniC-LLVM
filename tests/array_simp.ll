%s1 = type { i32, i32
}
%s2 = type { %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1$1 = call i8* @malloc(i32 12)
  %A$2 = bitcast i8* %temp1$1 to %s1**
  %temp2$3 = call i8* @malloc(i32 8)
  %st1$4 = bitcast i8* %temp2$3 to %s1*
  %temp3$5 = getelementptr %s1, %s1* %st1$4, i32 0, i32 0
  store i32 1, i32* %temp3$5
  %temp4$6 = getelementptr %s1, %s1* %st1$4, i32 0, i32 1
  store i32 2, i32* %temp4$6
  %temp5$7 = getelementptr %s1*, %s1** %A$2, i32 2
  store %s1* %st1$4, %s1** %temp5$7
  %temp9$8 = getelementptr %s1*, %s1** %A$2, i32 2
  %temp8$9 = load %s1*, %s1** %temp9$8
  %temp10$10 = getelementptr %s1, %s1* %temp8$9, i32 0, i32 0
  %temp7$11 = load i32, i32* %temp10$10
  %temp13$12 = getelementptr %s1*, %s1** %A$2, i32 2
  %temp12$13 = load %s1*, %s1** %temp13$12
  %temp14$14 = getelementptr %s1, %s1* %temp12$13, i32 0, i32 1
  %temp11$15 = load i32, i32* %temp14$14
  %temp6$16 = add i32 %temp7$11, %temp11$15
  ret i32 %temp6$16
}
