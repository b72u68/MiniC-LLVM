%fptr_s = type { i32 (i32)*
}
declare i8* @malloc(i32)
define i32 @inc(i32 %x) {
inc__entry:
  %temp1 = add i32 %x, 1
  ret i32 %temp1
  ret i32 0
}

define i32 @dec(i32 %x) {
dec__entry:
  %temp2 = sub i32 %x, 1
  ret i32 %temp2
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp3 = call i8* @malloc(i32 4)
  %fptr = bitcast i8* %temp3 to %fptr_s*
  %temp6 = icmp slt i32 4, 6
  br i1 %temp6, label %label1, label %label2
label1:
  %temp5 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0, i32 0
  store i32 (i32)* @inc, i32 (i32)** %temp5
  br label %label3
label2:
  %temp4 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0, i32 0
  store i32 (i32)* @dec, i32 (i32)** %temp4
  br label %label3
label3:
  %temp9 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0, i32 0
  %temp8 = load i32 (i32)*, i32 (i32)** %temp9
  %temp10 = bitcast i32 41 to i32
  %temp7 = call i32 %temp8(i32 %temp10)
  ret i32 %temp7
  ret i32 0
}
