%wrapper = type { i32 (i32, i32, i32)*
}
declare i8* @malloc(i32)
define i32 @f(i32 %a, i32 %b, i32 %c) {
f__entry:
  %temp3$1 = mul i32 %a, 100
  %temp4$2 = mul i32 %b, 10
  %temp2$3 = add i32 %temp3$1, %temp4$2
  %temp1$4 = add i32 %temp2$3, %c
  ret i32 %temp1$4
}

define i32 @g(i32 %a, i32 %b, i32 %c) {
g__entry:
  ret i32 0
}

define i32 @main() {
main__entry:
  %temp5$1 = call i8* @malloc(i32 4)
  %fwrapper$2 = bitcast i8* %temp5$1 to %wrapper*
  %temp6$3 = call i8* @malloc(i32 4)
  %gwrapper$4 = bitcast i8* %temp6$3 to %wrapper*
  %temp7$5 = getelementptr %wrapper, %wrapper* %fwrapper$2, i32 0, i32 0
  store i32 (i32, i32, i32)* @f, i32 (i32, i32, i32)** %temp7$5
  %temp8$6 = getelementptr %wrapper, %wrapper* %gwrapper$4, i32 0, i32 0
  store i32 (i32, i32, i32)* @g, i32 (i32, i32, i32)** %temp8$6
  %temp9$7 = call i8* @malloc(i32 12)
  %wrappers$8 = bitcast i8* %temp9$7 to %wrapper**
  %temp11$9 = getelementptr %wrapper*, %wrapper** %wrappers$8, i32 2
  store %wrapper* %gwrapper$4, %wrapper** %temp11$9
  %temp10$10 = load %wrapper*, %wrapper** %temp11$9
  %temp12$11 = getelementptr %wrapper*, %wrapper** %wrappers$8, i32 0
  store %wrapper* %temp10$10, %wrapper** %temp12$11
  %temp13$12 = getelementptr %wrapper*, %wrapper** %wrappers$8, i32 1
  store %wrapper* %fwrapper$2, %wrapper** %temp13$12
  %x$13 = bitcast i32 1 to i32
  %x$14 = add i32 %x$13, 1
  %temp18$15 = bitcast i32 %x$14 to i32
  %temp17$16 = sub i32 %temp18$15, 1
  %temp19$17 = getelementptr %wrapper*, %wrapper** %wrappers$8, i32 %temp17$16
  %temp16$18 = load %wrapper*, %wrapper** %temp19$17
  %temp20$19 = getelementptr %wrapper, %wrapper* %temp16$18, i32 0, i32 0
  %temp15$20 = load i32 (i32, i32, i32)*, i32 (i32, i32, i32)** %temp20$19
  %x$21 = add i32 %x$14, 1
  %temp22$22 = bitcast i32 %x$21 to i32
  %temp21$23 = sub i32 %temp22$22, 1
  %x$24 = add i32 %x$21, 1
  %temp24$25 = bitcast i32 %x$24 to i32
  %temp23$26 = sub i32 %temp24$25, 1
  %x$27 = add i32 %x$24, 1
  %temp26$28 = bitcast i32 %x$27 to i32
  %temp25$29 = sub i32 %temp26$28, 1
  %temp14$30 = call i32 %temp15$20(i32 %temp21$23, i32 %temp23$26, i32 %temp25$29)
  ret i32 %temp14$30
}
