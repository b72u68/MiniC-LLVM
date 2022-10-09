declare i8* @malloc(i32)
define void @return_void() {
return_void__entry:
  ret
  ret
}

define i32 @main() {
main__entry:
  %temp1$1 = call void @return_void()
  ret i32 0
}
