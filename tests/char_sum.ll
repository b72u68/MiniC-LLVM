declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1$1 = call i8* @malloc(i32 88)
  %str$2 = bitcast i8* %temp1$1 to i8*
  %temp2$3 = getelementptr i8, i8* %str$2, i32 0
  store i8 78, i8* %temp2$3
  %temp3$4 = getelementptr i8, i8* %str$2, i32 1
  store i8 111, i8* %temp3$4
  %temp4$5 = getelementptr i8, i8* %str$2, i32 2
  store i8 32, i8* %temp4$5
  %temp5$6 = getelementptr i8, i8* %str$2, i32 3
  store i8 78, i8* %temp5$6
  %temp6$7 = getelementptr i8, i8* %str$2, i32 4
  store i8 68, i8* %temp6$7
  %temp7$8 = getelementptr i8, i8* %str$2, i32 5
  store i8 45, i8* %temp7$8
  %temp8$9 = getelementptr i8, i8* %str$2, i32 6
  store i8 65, i8* %temp8$9
  %temp9$10 = getelementptr i8, i8* %str$2, i32 7
  store i8 114, i8* %temp9$10
  %temp10$11 = getelementptr i8, i8* %str$2, i32 8
  store i8 114, i8* %temp10$11
  %temp11$12 = getelementptr i8, i8* %str$2, i32 9
  store i8 97, i8* %temp11$12
  %temp12$13 = getelementptr i8, i8* %str$2, i32 10
  store i8 121, i8* %temp12$13
  %temp13$14 = getelementptr i8, i8* %str$2, i32 11
  store i8 115, i8* %temp13$14
  %temp14$15 = getelementptr i8, i8* %str$2, i32 12
  store i8 32, i8* %temp14$15
  %temp15$16 = getelementptr i8, i8* %str$2, i32 13
  store i8 84, i8* %temp15$16
  %temp16$17 = getelementptr i8, i8* %str$2, i32 14
  store i8 111, i8* %temp16$17
  %temp17$18 = getelementptr i8, i8* %str$2, i32 15
  store i8 100, i8* %temp17$18
  %temp18$19 = getelementptr i8, i8* %str$2, i32 16
  store i8 97, i8* %temp18$19
  %temp19$20 = getelementptr i8, i8* %str$2, i32 17
  store i8 121, i8* %temp19$20
  %temp20$21 = getelementptr i8, i8* %str$2, i32 18
  store i8 32, i8* %temp20$21
  %temp21$22 = getelementptr i8, i8* %str$2, i32 19
  store i8 32, i8* %temp21$22
  %temp22$23 = getelementptr i8, i8* %str$2, i32 20
  store i8 58, i8* %temp22$23
  %temp23$24 = getelementptr i8, i8* %str$2, i32 21
  store i8 40, i8* %temp23$24
  %total$25 = bitcast i32 0 to i32
  %i$26 = bitcast i32 0 to i32
  %temp24$27 = bitcast i32 0 to i32
  br label %label1
label1:
  %total$28 = phi i32 [%total$39, %label2], [%total$25, %main__entry]
  %temp29$29 = phi i32 [%temp29$41, %label2], [0, %main__entry]
  %temp28$30 = phi i32 [%temp28$42, %label2], [0, %main__entry]
  %temp27$31 = phi i8* [%temp27$36, %label2], [null, %main__entry]
  %temp26$32 = phi i8 [%temp26$37, %label2], [0, %main__entry]
  %temp25$33 = phi i32 [%temp25$38, %label2], [0, %main__entry]
  %i$34 = phi i32 [%i$40, %label2], [%i$26, %main__entry]
  %temp30$35 = icmp slt i32 %i$34, 22
  br i1 %temp30$35, label %label2, label %label3
label2:
  %temp27$36 = getelementptr i8, i8* %str$2, i32 %i$34
  %temp26$37 = load i8, i8* %temp27$36
  %temp25$38 = zext i8 %temp26$37 to i32
  %total$39 = add i32 %total$28, %temp25$38
  %i$40 = add i32 %i$34, 1
  %temp29$41 = bitcast i32 %i$40 to i32
  %temp28$42 = sub i32 %temp29$41, 1
  br label %label1
label3:
  ret i32 %total$28
}
