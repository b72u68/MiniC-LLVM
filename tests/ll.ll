%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @peek(%node* %list) {
peek__entry:
  %temp3$1 = ptrtoint %node* %list to i32
  %temp2$2 = icmp eq i32 %temp3$1, 0
  br i1 %temp2$2, label %label1, label %label2
label1:
  %temp1$5 = sub i32 0, 1
  ret i32 %temp1$5
label2:
  br label %label3
label3:
  %temp5$3 = getelementptr %node, %node* %list, i32 0, i32 0
  %temp4$4 = load i32, i32* %temp5$3
  ret i32 %temp4$4
}

define %node* @push(i32 %val, %node* %list) {
push__entry:
  %temp6$1 = call i8* @malloc(i32 8)
  %newnode$2 = bitcast i8* %temp6$1 to %node*
  %temp7$3 = getelementptr %node, %node* %newnode$2, i32 0, i32 0
  store i32 %val, i32* %temp7$3
  %temp8$4 = getelementptr %node, %node* %newnode$2, i32 0, i32 1
  store %node* %list, %node** %temp8$4
  ret %node* %newnode$2
}

define %node* @pop(%node* %list) {
pop__entry:
  %temp10$1 = ptrtoint %node* %list to i32
  %temp9$2 = icmp eq i32 %temp10$1, 0
  br i1 %temp9$2, label %label7, label %label8
label7:
  ret %node* %list
label8:
  br label %label9
label9:
  %temp12$3 = getelementptr %node, %node* %list, i32 0, i32 1
  %temp11$4 = load %node*, %node** %temp12$3
  ret %node* %temp11$4
}

define i32 @main() {
main__entry:
  %h$1 = inttoptr i32 0 to %node*
  %i$2 = bitcast i32 0 to i32
  %temp13$3 = bitcast i32 0 to i32
  br label %label12
label12:
  %temp17$4 = phi i32 [%temp17$29, %label13], [0, %main__entry]
  %temp16$5 = phi i32 [%temp16$30, %label13], [0, %main__entry]
  %temp15$6 = phi %node* [%temp15$26, %label13], [null, %main__entry]
  %temp14$7 = phi i32 [%temp14$25, %label13], [0, %main__entry]
  %i$8 = phi i32 [%i$28, %label13], [%i$2, %main__entry]
  %h$9 = phi %node* [%h$27, %label13], [%h$1, %main__entry]
  %temp18$10 = icmp slt i32 %i$8, 20
  br i1 %temp18$10, label %label13, label %label14
label13:
  %temp14$25 = bitcast i32 %i$8 to i32
  %temp15$26 = bitcast %node* %h$9 to %node*
  %h$27 = call %node* @push(i32 %temp14$25, %node* %temp15$26)
  %i$28 = add i32 %i$8, 1
  %temp17$29 = bitcast i32 %i$28 to i32
  %temp16$30 = sub i32 %temp17$29, 1
  br label %label12
label14:
  %i$11 = bitcast i32 0 to i32
  br label %label15
label15:
  %temp21$12 = phi i32 [%temp21$23, %label16], [0, %label14]
  %temp20$13 = phi i32 [%temp20$24, %label16], [0, %label14]
  %temp19$14 = phi %node* [%temp19$20, %label16], [null, %label14]
  %i$15 = phi i32 [%i$22, %label16], [%i$11, %label14]
  %h$16 = phi %node* [%h$21, %label16], [%h$9, %label14]
  %temp22$17 = icmp slt i32 %i$15, 10
  br i1 %temp22$17, label %label16, label %label17
label16:
  %temp19$20 = bitcast %node* %h$16 to %node*
  %h$21 = call %node* @pop(%node* %temp19$20)
  %i$22 = add i32 %i$15, 1
  %temp21$23 = bitcast i32 %i$22 to i32
  %temp20$24 = sub i32 %temp21$23, 1
  br label %label15
label17:
  %temp24$18 = bitcast %node* %h$16 to %node*
  %temp23$19 = call i32 @peek(%node* %temp24$18)
  ret i32 %temp23$19
}
