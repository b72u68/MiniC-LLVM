%s = type { i32, i8, %bool*
}
declare i8* @malloc(i32)
define void @void_func() {
void_func__entry:
  ret
  ret
}

define i32 @main() {
main__entry:
  %temp3 = call i8* @malloc(i32 12)
  %st = bitcast i8* %temp3 to %s*
  %temp6 = call void @void_func()
  ret i32 0
  ret i32 0
}
