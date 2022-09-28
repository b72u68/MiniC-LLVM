%node = type { i32, %node*
}
declare i8* @malloc(i32)
define i32 @peek(%node* %list) {
peek__entry:
  %temp5 = bitcast %node* %list to %node*
  %temp6 = bitcast i32 0 to i32
  %temp3 = icmp eq i32 %temp4, %temp6
  br i1 %temp3, label %label1, label %label2
label1:
  %temp2 = bitcast i32 1 to i32
  %temp1 = sub i32 0, %temp2
  ret i32 %temp1
  br label %label3
label2:
  br label %label3
label3:
  %temp8 = bitcast %node* %list to %node*
  %temp9 = getelementptr %node, %node* %temp8, i32 0
  %temp10 = bitcast %node* %temp9 to i32*
  %temp7 = load i32, i32* %temp10
  ret i32 %temp7
  ret i32 0
}

define %node* @push(i32 %val, %node* %list) {
push__entry:
  %temp12 = call i8* @malloc(i32 8)
  %temp11 = bitcast i8* %temp12 to %node*
  %newnode = bitcast %node* %temp11 to %node*
  %temp14 = bitcast i32 %val to i32
  %temp15 = getelementptr %node, %node* %newnode, i32 0
  %temp16 = bitcast %node* %temp15 to i32*
  store i32 %temp14, i32* %temp16
  %temp13 = load i32, i32* %temp16
  %temp18 = bitcast %node* %list to %node*
  %temp19 = getelementptr %node, %node* %newnode, i32 1
  %temp20 = bitcast %node* %temp19 to %node**
  store %node* %temp18, %node** %temp20
  %temp17 = load %node*, %node** %temp20
  %temp21 = bitcast %node* %newnode to %node*
  ret %node* %temp21
  ret %node* null
}

define %node* @pop(%node* %list) {
pop__entry:
  %temp25 = bitcast %node* %list to %node*
  %temp26 = bitcast i32 0 to i32
  %temp23 = icmp eq i32 %temp24, %temp26
  br i1 %temp23, label %label4, label %label5
label4:
  %temp22 = bitcast %node* %list to %node*
  ret %node* %temp22
  br label %label6
label5:
  br label %label6
label6:
  %temp28 = bitcast %node* %list to %node*
  %temp29 = getelementptr %node, %node* %temp28, i32 1
  %temp30 = bitcast %node* %temp29 to %node**
  %temp27 = load %node*, %node** %temp30
  ret %node* %temp27
  ret %node* null
}

define i32 @main() {
main__entry:
  %temp32 = bitcast i32 0 to i32
  %h = bitcast %node* %temp31 to %node*
  %temp33 = bitcast i32 0 to i32
  %i = bitcast i32 %temp33 to i32
  %temp34 = bitcast i32 0 to i32
  br label %label7
label7:
  %temp45 = bitcast i32 %i to i32
  %temp46 = bitcast i32 20 to i32
  %temp44 = icmp slt i32 %temp45, %temp46
  br i1 %temp44, label %label8, label %label9
label8:
  %temp36 = bitcast %node* (i32, %node*)* @push to %node* (i32, %node*)*
  %temp37 = bitcast i32 %i to i32
  %temp38 = bitcast %node* %h to %node*
  %h = call %node* %temp36(i32 %temp37, %node* %temp38)
  %temp35 = bitcast %node* %h to %node*
  %temp41 = bitcast i32 %i to i32
  %temp42 = bitcast i32 1 to i32
  %i = add i32 %temp41, %temp42
  %temp40 = bitcast i32 %i to i32
  %temp43 = bitcast i32 1 to i32
  %temp39 = sub i32 %temp40, %temp43
  br label %label7
label9:
  %i = bitcast i32 0 to i32
  %temp47 = bitcast i32 %i to i32
  br label %label10
label10:
  %temp57 = bitcast i32 %i to i32
  %temp58 = bitcast i32 10 to i32
  %temp56 = icmp slt i32 %temp57, %temp58
  br i1 %temp56, label %label11, label %label12
label11:
  %temp49 = bitcast %node* (%node*)* @pop to %node* (%node*)*
  %temp50 = bitcast %node* %h to %node*
  %h = call %node* %temp49(%node* %temp50)
  %temp48 = bitcast %node* %h to %node*
  %temp53 = bitcast i32 %i to i32
  %temp54 = bitcast i32 1 to i32
  %i = add i32 %temp53, %temp54
  %temp52 = bitcast i32 %i to i32
  %temp55 = bitcast i32 1 to i32
  %temp51 = sub i32 %temp52, %temp55
  br label %label10
label12:
  %temp60 = bitcast i32 (%node*)* @peek to i32 (%node*)*
  %temp61 = bitcast %node* %h to %node*
  %temp59 = call i32 %temp60(%node* %temp61)
  ret i32 %temp59
  ret i32 0
}
