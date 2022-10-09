declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %i$1 = bitcast i32 0 to i32
  %j$2 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp4$3 = phi i32 [%temp4$14, %label2], [0, %main__entry]
  %temp3$4 = phi i32 [%temp3$15, %label2], [0, %main__entry]
  %temp2$5 = phi i32 [%temp2$11, %label2], [0, %main__entry]
  %temp1$6 = phi i32 [%temp1$12, %label2], [0, %main__entry]
  %j$7 = phi i32 [%j$13, %label2], [%j$2, %main__entry]
  %i$8 = phi i32 [%i$10, %label2], [%i$1, %main__entry]
  %temp7$9 = icmp slt i32 %i$8, 50
  br i1 %temp7$9, label %label2, label %label3
label2:
  %i$10 = add i32 %i$8, 1
  %temp2$11 = bitcast i32 %i$10 to i32
  %temp1$12 = sub i32 %temp2$11, 1
  %j$13 = add i32 %j$7, 1
  %temp4$14 = bitcast i32 %j$13 to i32
  %temp3$15 = sub i32 %temp4$14, 1
  br label %label1
label3:
  ret i32 %j$7
}
