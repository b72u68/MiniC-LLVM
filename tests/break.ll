declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %i$1 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp5$2 = phi i32 [%temp5$18, %label6], [0, %main__entry]
  %temp4$3 = phi i32 [%temp4$19, %label6], [0, %main__entry]
  %temp3$4 = phi i1 [%temp3$16, %label6], [0, %main__entry]
  %temp2$5 = phi i32 [%temp2$14, %label6], [0, %main__entry]
  %temp1$6 = phi i32 [%temp1$15, %label6], [0, %main__entry]
  %i$7 = phi i32 [%i$17, %label6], [%i$1, %main__entry]
  %temp6$8 = icmp sgt i32 1, 0
  br i1 %temp6$8, label %label2, label %label3
label2:
  %i$13 = add i32 %i$7, 1
  %temp2$14 = bitcast i32 %i$13 to i32
  %temp1$15 = sub i32 %temp2$14, 1
  %temp3$16 = icmp sgt i32 %i$13, 50
  br i1 %temp3$16, label %label4, label %label5
label3:
  %temp3$9 = phi i1 [%temp3$16, %label4], [%temp3$4, %label1]
  %temp2$10 = phi i32 [%temp2$14, %label4], [%temp2$5, %label1]
  %temp1$11 = phi i32 [%temp1$15, %label4], [%temp1$6, %label1]
  %i$12 = phi i32 [%i$13, %label4], [%i$7, %label1]
  ret i32 %i$12
label4:
  br label %label3
label5:
  br label %label6
label6:
  %i$17 = add i32 %i$13, 1
  %temp5$18 = bitcast i32 %i$17 to i32
  %temp4$19 = sub i32 %temp5$18, 1
  br label %label1
}
