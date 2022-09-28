%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %temp2 = bitcast i32 0 to i32
  %temp3 = getelementptr i32, i32* %temp2, 
  %temp1 = bitcast i32* %temp3 to %node*
  %list = bitcast %node* %temp1 to %node*
  %temp5 = bitcast %node* %list to %node*
  %temp6 = bitcast %node* %temp5 to i32*
  %temp4 = load i32, i32* %temp6
  ret i32 %temp4
  ret i32 0
}
