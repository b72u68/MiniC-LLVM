declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %sum$1 = bitcast i32 0 to i32
  %N$2 = bitcast i32 100 to i32
  %i$3 = bitcast i32 1 to i32
  br label %label1
label1:
  %sum$4 = phi i32 [%sum$7, %label2], [%sum$1, %main__entry]
  %i$5 = phi i32 [%i$8, %label2], [%i$3, %main__entry]
  %temp1$6 = icmp sle i32 %i$5, %N$2
  br i1 %temp1$6, label %label2, label %label3
label2:
  %sum$7 = add i32 %sum$4, %i$5
  %i$8 = add i32 %i$5, 1
  br label %label1
label3:
  ret i32 %sum$4
}
