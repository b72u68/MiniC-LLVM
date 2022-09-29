%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @peek(%node* %list) {
peek__entry:
  %temp3 = ptrtoint %node* %list to i32
  %temp2 = icmp eq i32 %temp3, 0
  br i1 %temp2, label %label1, label %label2
label1:
  %temp1 = sub i32 0, 1
  ret i32 %temp1
  br label %label3
label2:
  br label %label3
label3:
  %temp5 = getelementptr %node, %node* %list, i32 0, i32 0
  %temp4 = load i32, i32* %temp5
  ret i32 %temp4
  ret i32 0
}

define %node* @push(i32 %val, %node* %list) {
push__entry:
  %temp6 = call i8* @malloc(i32 8)
  %newnode = bitcast i8* %temp6 to %node*
  %temp7 = getelementptr %node, %node* %newnode, i32 0, i32 0
  store i32 %val, i32* %temp7
  %temp8 = getelementptr %node, %node* %newnode, i32 0, i32 1
  store %node* %list, %node** %temp8
  ret %node* %newnode
  ret %node* null
}

define %node* @pop(%node* %list) {
pop__entry:
  %temp10 = ptrtoint %node* %list to i32
  %temp9 = icmp eq i32 %temp10, 0
  br i1 %temp9, label %label4, label %label5
label4:
  ret %node* %list
  br label %label6
label5:
  br label %label6
label6:
  %temp12 = getelementptr %node, %node* %list, i32 0, i32 1
  %temp11 = load %node*, %node** %temp12
  ret %node* %temp11
  ret %node* null
}

define i32 @main() {
main__entry:
  %h = inttoptr i32 0 to %node*
  %i = bitcast i32 0 to i32
  %temp13 = bitcast i32 0 to i32
  br label %label7
label7:
  %temp18 = icmp slt i32 %i, 20
  br i1 %temp18, label %label8, label %label9
label8:
  %temp14 = bitcast i32 %i to i32
  %temp15 = bitcast %node* %h to %node*
  %h = call %node* @push(i32 %temp14, %node* %temp15)
  %i = add i32 %i, 1
  %temp17 = bitcast i32 %i to i32
  %temp16 = sub i32 %temp17, 1
  br label %label7
label9:
  %i = bitcast i32 0 to i32
  br label %label10
label10:
  %temp22 = icmp slt i32 %i, 10
  br i1 %temp22, label %label11, label %label12
label11:
  %temp19 = bitcast %node* %h to %node*
  %h = call %node* @pop(%node* %temp19)
  %i = add i32 %i, 1
  %temp21 = bitcast i32 %i to i32
  %temp20 = sub i32 %temp21, 1
  br label %label10
label12:
  %temp24 = bitcast %node* %h to %node*
  %temp23 = call i32 @peek(%node* %temp24)
  ret i32 %temp23
  ret i32 0
}
