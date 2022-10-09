%int_reducer = type { i32 (i32, i32)*
}
declare i8* @malloc(i32)
define i32 @reduce_int_array_to_int(i32* %arr, i32 %arr_size, %int_reducer* %reducer, i32 %initial_value) {
reduce_int_array_to_int__entry:
  %value$1 = bitcast i32 %initial_value to i32
  %i$2 = bitcast i32 0 to i32
  %temp1$3 = bitcast i32 0 to i32
  br label %label1
label1:
  %value$4 = phi i32 [%value$19, %label2], [%value$1, %reduce_int_array_to_int__entry]
  %temp8$5 = phi i32 [%temp8$21, %label2], [0, %reduce_int_array_to_int__entry]
  %temp7$6 = phi i32 [%temp7$22, %label2], [0, %reduce_int_array_to_int__entry]
  %temp6$7 = phi i32* [%temp6$17, %label2], [null, %reduce_int_array_to_int__entry]
  %temp5$8 = phi i32 [%temp5$18, %label2], [0, %reduce_int_array_to_int__entry]
  %temp4$9 = phi i32 [%temp4$16, %label2], [0, %reduce_int_array_to_int__entry]
  %temp3$10 = phi i32 (i32, i32)** [%temp3$14, %label2], [null, %reduce_int_array_to_int__entry]
  %temp2$11 = phi i32 (i32, i32)* [%temp2$15, %label2], [null, %reduce_int_array_to_int__entry]
  %i$12 = phi i32 [%i$20, %label2], [%i$2, %reduce_int_array_to_int__entry]
  %temp9$13 = icmp slt i32 %i$12, %arr_size
  br i1 %temp9$13, label %label2, label %label3
label2:
  %temp3$14 = getelementptr %int_reducer, %int_reducer* %reducer, i32 0, i32 0
  %temp2$15 = load i32 (i32, i32)*, i32 (i32, i32)** %temp3$14
  %temp4$16 = bitcast i32 %value$4 to i32
  %temp6$17 = getelementptr i32, i32* %arr, i32 %i$12
  %temp5$18 = load i32, i32* %temp6$17
  %value$19 = call i32 %temp2$15(i32 %temp4$16, i32 %temp5$18)
  %i$20 = add i32 %i$12, 1
  %temp8$21 = bitcast i32 %i$20 to i32
  %temp7$22 = sub i32 %temp8$21, 1
  br label %label1
label3:
  ret i32 %value$4
}

define i32 @sum(i32 %a, i32 %b) {
sum__entry:
  %temp10$1 = add i32 %a, %b
  ret i32 %temp10$1
}

define i32 @main() {
main__entry:
  %temp11$1 = call i8* @malloc(i32 4)
  %sum_reducer$2 = bitcast i8* %temp11$1 to %int_reducer*
  %temp12$3 = getelementptr %int_reducer, %int_reducer* %sum_reducer$2, i32 0, i32 0
  store i32 (i32, i32)* @sum, i32 (i32, i32)** %temp12$3
  %temp13$4 = call i8* @malloc(i32 40)
  %A$5 = bitcast i8* %temp13$4 to i32*
  %i$6 = bitcast i32 0 to i32
  %temp14$7 = bitcast i32 0 to i32
  br label %label6
label6:
  %temp18$8 = phi i32 [%temp18$22, %label7], [0, %main__entry]
  %temp17$9 = phi i32 [%temp17$23, %label7], [0, %main__entry]
  %temp16$10 = phi i32* [%temp16$20, %label7], [null, %main__entry]
  %temp15$11 = phi i32 [%temp15$19, %label7], [0, %main__entry]
  %i$12 = phi i32 [%i$21, %label7], [%i$6, %main__entry]
  %temp19$13 = icmp slt i32 %i$12, 10
  br i1 %temp19$13, label %label7, label %label8
label7:
  %temp15$19 = add i32 %i$12, 1
  %temp16$20 = getelementptr i32, i32* %A$5, i32 %i$12
  store i32 %temp15$19, i32* %temp16$20
  %i$21 = add i32 %i$12, 1
  %temp18$22 = bitcast i32 %i$21 to i32
  %temp17$23 = sub i32 %temp18$22, 1
  br label %label6
label8:
  %temp21$14 = bitcast i32* %A$5 to i32*
  %temp22$15 = bitcast i32 10 to i32
  %temp23$16 = bitcast %int_reducer* %sum_reducer$2 to %int_reducer*
  %temp24$17 = bitcast i32 0 to i32
  %temp20$18 = call i32 @reduce_int_array_to_int(i32* %temp21$14, i32 %temp22$15, %int_reducer* %temp23$16, i32 %temp24$17)
  ret i32 %temp20$18
}
