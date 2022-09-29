%hashmap = type { i32, %node**
}
%node = type { i32, i32, %node*
}
declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp3 = sdiv i32 %a, %b
  %temp2 = mul i32 %b, %temp3
  %temp1 = sub i32 %a, %temp2
  ret i32 %temp1
  ret i32 0
}

define void @set(%hashmap* %h, i32 %key, i32 %val) {
set__entry:
  %temp4 = bitcast i32 %key to i32
  %temp6 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp5 = load i32, i32* %temp6
  %idx = call i32 @mod(i32 %temp4, i32 %temp5)
  %temp8 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp7 = load %node**, %node*** %temp8
  %temp9 = getelementptr %node*, %node** %temp7, i32 %idx
  %curr = load %node*, %node** %temp9
  br label %label1
label1:
  %temp16 = ptrtoint %node* %curr to i32
  %temp15 = icmp ne i32 %temp16, 0
  br i1 %temp15, label %label2, label %label3
label2:
  %temp13 = getelementptr %node, %node* %curr, i32 0, i32 0
  %temp12 = load i32, i32* %temp13
  %temp11 = icmp eq i32 %temp12, %key
  br i1 %temp11, label %label4, label %label5
label4:
  %temp10 = getelementptr %node, %node* %curr, i32 0, i32 1
  store i32 %val, i32* %temp10
  ret
  br label %label6
label5:
  br label %label6
label6:
  %temp14 = getelementptr %node, %node* %curr, i32 0, i32 2
  %curr = load %node*, %node** %temp14
  br label %label1
label3:
  %temp17 = call i8* @malloc(i32 12)
  %n = bitcast i8* %temp17 to %node*
  %temp18 = getelementptr %node, %node* %n, i32 0, i32 0
  store i32 %key, i32* %temp18
  %temp19 = getelementptr %node, %node* %n, i32 0, i32 1
  store i32 %val, i32* %temp19
  %temp22 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp21 = load %node**, %node*** %temp22
  %temp23 = getelementptr %node*, %node** %temp21, i32 %idx
  %temp20 = load %node*, %node** %temp23
  %temp24 = getelementptr %node, %node* %n, i32 0, i32 2
  store %node* %temp20, %node** %temp24
  %temp25 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %arr = load %node**, %node*** %temp25
  %temp26 = getelementptr %node*, %node** %arr, i32 %idx
  store %node* %n, %node** %temp26
  ret
}

define i32 @get(%hashmap* %h, i32 %key) {
get__entry:
  %temp27 = bitcast i32 %key to i32
  %temp29 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp28 = load i32, i32* %temp29
  %idx = call i32 @mod(i32 %temp27, i32 %temp28)
  %temp31 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp30 = load %node**, %node*** %temp31
  %temp32 = getelementptr %node*, %node** %temp30, i32 %idx
  %curr = load %node*, %node** %temp32
  br label %label7
label7:
  %temp40 = ptrtoint %node* %curr to i32
  %temp39 = icmp ne i32 %temp40, 0
  br i1 %temp39, label %label8, label %label9
label8:
  %temp37 = getelementptr %node, %node* %curr, i32 0, i32 0
  %temp36 = load i32, i32* %temp37
  %temp35 = icmp eq i32 %temp36, %key
  br i1 %temp35, label %label10, label %label11
label10:
  %temp34 = getelementptr %node, %node* %curr, i32 0, i32 1
  %temp33 = load i32, i32* %temp34
  ret i32 %temp33
  br label %label12
label11:
  br label %label12
label12:
  %temp38 = getelementptr %node, %node* %curr, i32 0, i32 2
  %curr = load %node*, %node** %temp38
  br label %label7
label9:
  %temp41 = sub i32 0, 1
  ret i32 %temp41
  ret i32 0
}

define void @del(%hashmap* %h, i32 %key) {
del__entry:
  %temp42 = bitcast i32 %key to i32
  %temp44 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp43 = load i32, i32* %temp44
  %idx = call i32 @mod(i32 %temp42, i32 %temp43)
  %temp46 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp45 = load %node**, %node*** %temp46
  %temp47 = getelementptr %node*, %node** %temp45, i32 %idx
  %curr = load %node*, %node** %temp47
  %temp58 = getelementptr %node, %node* %curr, i32 0, i32 0
  %temp57 = load i32, i32* %temp58
  %temp56 = icmp eq i32 %temp57, %key
  br i1 %temp56, label %label13, label %label14
label13:
  %temp48 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %arr = load %node**, %node*** %temp48
  %temp52 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp51 = load %node**, %node*** %temp52
  %temp53 = getelementptr %node*, %node** %temp51, i32 %idx
  %temp50 = load %node*, %node** %temp53
  %temp54 = getelementptr %node, %node* %temp50, i32 0, i32 2
  %temp49 = load %node*, %node** %temp54
  %temp55 = getelementptr %node*, %node** %arr, i32 %idx
  store %node* %temp49, %node** %temp55
  br label %label15
label14:
  br label %label15
label15:
  br label %label16
label16:
  %temp73 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp72 = load %node*, %node** %temp73
  %temp71 = ptrtoint %node* %temp72 to i32
  %temp70 = icmp ne i32 %temp71, 0
  br i1 %temp70, label %label17, label %label18
label17:
  %temp67 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp66 = load %node*, %node** %temp67
  %temp68 = getelementptr %node, %node* %temp66, i32 0, i32 0
  %temp65 = load i32, i32* %temp68
  %temp64 = icmp eq i32 %temp65, %key
  br i1 %temp64, label %label19, label %label20
label19:
  %temp61 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp60 = load %node*, %node** %temp61
  %temp62 = getelementptr %node, %node* %temp60, i32 0, i32 2
  %temp59 = load %node*, %node** %temp62
  %temp63 = getelementptr %node, %node* %curr, i32 0, i32 2
  store %node* %temp59, %node** %temp63
  ret
  br label %label21
label20:
  br label %label21
label21:
  %temp69 = getelementptr %node, %node* %curr, i32 0, i32 2
  %curr = load %node*, %node** %temp69
  br label %label16
label18:
  ret
}

define i32 @main() {
main__entry:
  %temp74 = call i8* @malloc(i32 8)
  %h = bitcast i8* %temp74 to %hashmap*
  %temp75 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  store i32 5, i32* %temp75
  %temp77 = call i8* @malloc(i32 20)
  %temp76 = bitcast i8* %temp77 to %node**
  %temp78 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  store %node** %temp76, %node*** %temp78
  %temp80 = bitcast %hashmap* %h to %hashmap*
  %temp81 = bitcast i32 13 to i32
  %temp82 = bitcast i32 2 to i32
  %temp79 = call void @set(%hashmap* %temp80, i32 %temp81, i32 %temp82)
  %temp84 = bitcast %hashmap* %h to %hashmap*
  %temp85 = bitcast i32 5 to i32
  %temp86 = bitcast i32 19 to i32
  %temp83 = call void @set(%hashmap* %temp84, i32 %temp85, i32 %temp86)
  %temp88 = bitcast %hashmap* %h to %hashmap*
  %temp89 = bitcast i32 3 to i32
  %temp90 = bitcast i32 5 to i32
  %temp87 = call void @set(%hashmap* %temp88, i32 %temp89, i32 %temp90)
  %temp92 = bitcast %hashmap* %h to %hashmap*
  %temp93 = bitcast i32 2 to i32
  %temp94 = bitcast i32 10 to i32
  %temp91 = call void @set(%hashmap* %temp92, i32 %temp93, i32 %temp94)
  %temp96 = bitcast %hashmap* %h to %hashmap*
  %temp97 = bitcast i32 13 to i32
  %temp95 = call void @del(%hashmap* %temp96, i32 %temp97)
  %temp99 = bitcast %hashmap* %h to %hashmap*
  %temp100 = bitcast i32 3 to i32
  %temp98 = call i32 @get(%hashmap* %temp99, i32 %temp100)
  ret i32 %temp98
  ret i32 0
}
