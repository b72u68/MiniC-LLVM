%s1 = type { i32, i32
}
%s2 = type { %s1*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1$1 = call i8* @malloc(i32 8)
  %st1$2 = bitcast i8* %temp1$1 to %s1*
  %temp2$3 = getelementptr %s1, %s1* %st1$2, i32 0, i32 1
  store i32 2, i32* %temp2$3
  %temp3$4 = call i8* @malloc(i32 4)
  %st2$5 = bitcast i8* %temp3$4 to %s2*
  %temp4$6 = getelementptr %s2, %s2* %st2$5, i32 0, i32 0
  store %s1* %st1$2, %s1** %temp4$6
  %temp7$7 = getelementptr %s2, %s2* %st2$5, i32 0, i32 0
  %temp6$8 = load %s1*, %s1** %temp7$7
  %temp8$9 = getelementptr %s1, %s1* %temp6$8, i32 0, i32 1
  %temp5$10 = load i32, i32* %temp8$9
  ret i32 %temp5$10
}
