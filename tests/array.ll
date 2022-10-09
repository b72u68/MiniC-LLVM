declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp1$1 = call i8* @malloc(i32 40)
  %A$2 = bitcast i8* %temp1$1 to i32*
  %result$3 = bitcast i32 0 to i32
  %i$4 = bitcast i32 0 to i32
  %temp2$5 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp5$6 = phi i32 [%temp5$24, %label2], [0, %main__entry]
  %temp4$7 = phi i32 [%temp4$25, %label2], [0, %main__entry]
  %temp3$8 = phi i32* [%temp3$22, %label2], [null, %main__entry]
  %i$9 = phi i32 [%i$23, %label2], [%i$4, %main__entry]
  %temp6$10 = icmp slt i32 %i$9, 10
  br i1 %temp6$10, label %label2, label %label3
label2:
  %temp3$22 = getelementptr i32, i32* %A$2, i32 %i$9
  store i32 %i$9, i32* %temp3$22
  %i$23 = add i32 %i$9, 1
  %temp5$24 = bitcast i32 %i$23 to i32
  %temp4$25 = sub i32 %temp5$24, 1
  br label %label1
label3:
  %j$11 = bitcast i32 0 to i32
  %temp7$12 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp9$13 = phi i32 [%temp9$20, %label5], [0, %label3]
  %temp8$14 = phi i32 [%temp8$21, %label5], [0, %label3]
  %result$15 = phi i32 [%result$18, %label5], [%result$3, %label3]
  %j$16 = phi i32 [%j$19, %label5], [%j$11, %label3]
  %temp10$17 = icmp slt i32 %j$16, 10
  br i1 %temp10$17, label %label5, label %label6
label5:
  %result$18 = add i32 %result$15, %j$16
  %j$19 = add i32 %j$16, 1
  %temp9$20 = bitcast i32 %j$19 to i32
  %temp8$21 = sub i32 %temp9$20, 1
  br label %label4
label6:
  ret i32 %result$15
}
