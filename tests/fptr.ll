%fptr_s = type { i32 (i32)*
}
declare i8* @malloc(i32)
define i32 @inc(i32 %x) {
inc__entry:
  %temp1$1 = add i32 %x, 1
  ret i32 %temp1$1
}

define i32 @dec(i32 %x) {
dec__entry:
  %temp2$1 = sub i32 %x, 1
  ret i32 %temp2$1
}

define i32 @main() {
main__entry:
  %temp3$1 = call i8* @malloc(i32 4)
  %fptr$2 = bitcast i8* %temp3$1 to %fptr_s*
  %temp6$3 = icmp slt i32 4, 6
  br i1 %temp6$3, label %label3, label %label4
label3:
  %temp5$11 = getelementptr %fptr_s, %fptr_s* %fptr$2, i32 0, i32 0
  store i32 (i32)* @inc, i32 (i32)** %temp5$11
  br label %label5
label4:
  %temp4$10 = getelementptr %fptr_s, %fptr_s* %fptr$2, i32 0, i32 0
  store i32 (i32)* @dec, i32 (i32)** %temp4$10
  br label %label5
label5:
  %temp5$4 = phi i32 (i32)** [%temp5$11, %label3], [null, %label4]
  %temp4$5 = phi i32 (i32)** [null, %label3], [%temp4$10, %label4]
  %temp9$6 = getelementptr %fptr_s, %fptr_s* %fptr$2, i32 0, i32 0
  %temp8$7 = load i32 (i32)*, i32 (i32)** %temp9$6
  %temp10$8 = bitcast i32 41 to i32
  %temp7$9 = call i32 %temp8$7(i32 %temp10$8)
  ret i32 %temp7$9
}
