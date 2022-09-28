%fptr_s = type { i32 (i32)*
}
declare i8* @malloc(i32)
define i32 @inc(i32 %x) {
inc__entry:
  %temp2 = bitcast i32 %x to i32
  %temp3 = bitcast i32 1 to i32
  %temp1 = add i32 %temp2, %temp3
  ret i32 %temp1
  ret i32 0
}

define i32 @dec(i32 %x) {
dec__entry:
  %temp5 = bitcast i32 %x to i32
  %temp6 = bitcast i32 1 to i32
  %temp4 = sub i32 %temp5, %temp6
  ret i32 %temp4
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp8 = call i8* @malloc(i32 4)
  %temp7 = bitcast i8* %temp8 to %fptr_s*
  %fptr = bitcast %fptr_s* %temp7 to %fptr_s*
  %temp18 = bitcast i32 4 to i32
  %temp19 = bitcast i32 6 to i32
  %temp17 = icmp slt i32 %temp18, %temp19
  br i1 %temp17, label %label1, label %label2
label1:
  %temp14 = bitcast i32 (i32)* @inc to i32 (i32)*
  %temp15 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0
  %temp16 = bitcast %fptr_s* %temp15 to i32 (i32)**
  store i32 (i32)* %temp14, i32 (i32)** %temp16
  %temp13 = load i32 (i32)*, i32 (i32)** %temp16
  br label %label3
label2:
  %temp10 = bitcast i32 (i32)* @dec to i32 (i32)*
  %temp11 = getelementptr %fptr_s, %fptr_s* %fptr, i32 0
  %temp12 = bitcast %fptr_s* %temp11 to i32 (i32)**
  store i32 (i32)* %temp10, i32 (i32)** %temp12
  %temp9 = load i32 (i32)*, i32 (i32)** %temp12
  br label %label3
label3:
  %temp22 = bitcast %fptr_s* %fptr to %fptr_s*
  %temp23 = getelementptr %fptr_s, %fptr_s* %temp22, i32 0
  %temp24 = bitcast %fptr_s* %temp23 to i32 (i32)**
  %temp21 = load i32 (i32)*, i32 (i32)** %temp24
  %temp25 = bitcast i32 41 to i32
  %temp20 = call i32 %temp21(i32 %temp25)
  ret i32 %temp20
  ret i32 0
}
