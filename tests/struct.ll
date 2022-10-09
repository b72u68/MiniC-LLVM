%s1 = type { i32, i8, i32
}
%s2 = type { i32, %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1$1 = call i8* @malloc(i32 12)
  %st$2 = bitcast i8* %temp1$1 to %s1*
  %temp2$3 = getelementptr %s1, %s1* %st$2, i32 0, i32 0
  store i32 2, i32* %temp2$3
  %temp3$4 = getelementptr %s1, %s1* %st$2, i32 0, i32 1
  store i8 97, i8* %temp3$4
  %temp4$5 = getelementptr %s1, %s1* %st$2, i32 0, i32 2
  store i32 1, i32* %temp4$5
  %temp5$6 = call i8* @malloc(i32 8)
  %st2$7 = bitcast i8* %temp5$6 to %s2*
  %temp6$8 = getelementptr %s2, %s2* %st2$7, i32 0, i32 0
  store i32 3, i32* %temp6$8
  %temp7$9 = getelementptr %s2, %s2* %st2$7, i32 0, i32 1
  store %s1* %st$2, %s1** %temp7$9
  %temp11$10 = getelementptr %s2, %s2* %st2$7, i32 0, i32 0
  %temp10$11 = load i32, i32* %temp11$10
  %temp14$12 = getelementptr %s2, %s2* %st2$7, i32 0, i32 1
  %temp13$13 = load %s1*, %s1** %temp14$12
  %temp15$14 = getelementptr %s1, %s1* %temp13$13, i32 0, i32 0
  %temp12$15 = load i32, i32* %temp15$14
  %temp9$16 = add i32 %temp10$11, %temp12$15
  %temp18$17 = getelementptr %s2, %s2* %st2$7, i32 0, i32 1
  %temp17$18 = load %s1*, %s1** %temp18$17
  %temp19$19 = getelementptr %s1, %s1* %temp17$18, i32 0, i32 2
  %temp16$20 = load i32, i32* %temp19$19
  %temp8$21 = add i32 %temp9$16, %temp16$20
  ret i32 %temp8$21
}
