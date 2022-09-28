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
  %temp12 = icmp slt i32 4, 6
  br i1 %temp12, label %label1, label %label2
label1:
  %temp9 = bitcast i32 (i32)* @inc to i32 (i32)*
  %temp10 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0
  %temp11 = bitcast %fptr_s* %temp10 to i32 (i32)**
  store i32 (i32)* %temp9, i32 (i32)** %temp11
  %temp8 = load i32 (i32)*, i32 (i32)** %temp11
  br label %label3
label2:
  %temp5 = bitcast i32 (i32)* @dec to i32 (i32)*
  %temp6 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0
  %temp7 = bitcast %fptr_s* %temp6 to i32 (i32)**
  store i32 (i32)* %temp5, i32 (i32)** %temp7
  %temp4 = load i32 (i32)*, i32 (i32)** %temp7
  br label %label3
label3:
  %temp15 = bitcast %fptr_s* %fptr to %fptr_s*
  %temp16 = getelementptr %fptr_s, %fptr_s* %temp15, i32 0
  %temp17 = bitcast %fptr_s* %temp16 to i32 (i32)**
  %temp14 = load i32 (i32)*, i32 (i32)** %temp17
  %temp18 = bitcast i32 41 to i32
  %temp13 = call i32 %temp14(i32 %temp18)
  ret i32 %temp13
  ret i32 0
}
