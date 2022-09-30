%int_reducer = type { i32 (i32, i32)*
}
declare i8* @malloc(i32)
define i32 @reduce_int_array_to_int(i32* %arr, i32 %arr_size, %int_reducer* %reducer, i32 %initial_value) {
reduce_int_array_to_int__entry:
  %value = bitcast i32 %initial_value to i32
  %i = bitcast i32 0 to i32
  %temp1 = bitcast i32 0 to i32
  br label %label1
label1:
  %temp9 = icmp slt i32 %i, %arr_size
  br i1 %temp9, label %label2, label %label3
label2:
  %temp3 = getelementptr %int_reducer, %int_reducer* %reducer, i32 0, i32 0
  %temp2 = load i32 (i32, i32)*, i32 (i32, i32)** %temp3
  %temp4 = bitcast i32 %value to i32
  %temp6 = getelementptr i32, i32* %arr, i32 %i
  %temp5 = load i32, i32* %temp6
  %value = call i32 %temp2(i32 %temp4, i32 %temp5)
  %i = add i32 %i, 1
  %temp8 = bitcast i32 %i to i32
  %temp7 = sub i32 %temp8, 1
  br label %label1
label3:
  ret i32 %value
  ret i32 0
}

define i32 @sum(i32 %a, i32 %b) {
sum__entry:
  %temp10 = add i32 %a, %b
  ret i32 %temp10
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp11 = call i8* @malloc(i32 4)
  %sum_reducer = bitcast i8* %temp11 to %int_reducer*
  %temp12 = getelementptr %int_reducer, %int_reducer* %sum_reducer, i32 0, i32 0
  store i32 (i32, i32)* @sum, i32 (i32, i32)** %temp12
  %temp13 = call i8* @malloc(i32 40)
  %A = bitcast i8* %temp13 to i32*
  %i = bitcast i32 0 to i32
  %temp14 = bitcast i32 0 to i32
  br label %label4
label4:
  %temp19 = icmp slt i32 %i, 10
  br i1 %temp19, label %label5, label %label6
label5:
  %temp15 = add i32 %i, 1
  %temp16 = getelementptr i32, i32* %A, i32 %i
  store i32 %temp15, i32* %temp16
  %i = add i32 %i, 1
  %temp18 = bitcast i32 %i to i32
  %temp17 = sub i32 %temp18, 1
  br label %label4
label6:
  %temp21 = bitcast i32* %A to i32*
  %temp22 = bitcast i32 10 to i32
  %temp23 = bitcast %int_reducer* %sum_reducer to %int_reducer*
  %temp24 = bitcast i32 0 to i32
  %temp20 = call i32 @reduce_int_array_to_int(i32* %temp21, i32 %temp22, %int_reducer* %temp23, i32 %temp24)
  ret i32 %temp20
  ret i32 0
}
