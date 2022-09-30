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
  %temp57 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp56 = load %node**, %node*** %temp57
  %temp58 = getelementptr %node*, %node** %temp56, i32 %idx
  %temp55 = load %node*, %node** %temp58
  %temp59 = getelementptr %node, %node* %temp55, i32 0, i32 0
  %temp54 = load i32, i32* %temp59
  %temp53 = icmp eq i32 %temp54, %key
  br i1 %temp53, label %label13, label %label14
label13:
  %temp45 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %arr = load %node**, %node*** %temp45
  %temp49 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp48 = load %node**, %node*** %temp49
  %temp50 = getelementptr %node*, %node** %temp48, i32 %idx
  %temp47 = load %node*, %node** %temp50
  %temp51 = getelementptr %node, %node* %temp47, i32 0, i32 2
  %temp46 = load %node*, %node** %temp51
  %temp52 = getelementptr %node*, %node** %arr, i32 %idx
  store %node* %temp46, %node** %temp52
  br label %label15
label14:
  br label %label15
label15:
  %temp61 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp60 = load %node**, %node*** %temp61
  %temp62 = getelementptr %node*, %node** %temp60, i32 %idx
  %curr = load %node*, %node** %temp62
  br label %label16
label16:
  %temp77 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp76 = load %node*, %node** %temp77
  %temp75 = ptrtoint %node* %temp76 to i32
  %temp74 = icmp ne i32 %temp75, 0
  br i1 %temp74, label %label17, label %label18
label17:
  %temp71 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp70 = load %node*, %node** %temp71
  %temp72 = getelementptr %node, %node* %temp70, i32 0, i32 0
  %temp69 = load i32, i32* %temp72
  %temp68 = icmp eq i32 %temp69, %key
  br i1 %temp68, label %label19, label %label20
label19:
  %temp65 = getelementptr %node, %node* %curr, i32 0, i32 2
  %temp64 = load %node*, %node** %temp65
  %temp66 = getelementptr %node, %node* %temp64, i32 0, i32 2
  %temp63 = load %node*, %node** %temp66
  %temp67 = getelementptr %node, %node* %curr, i32 0, i32 2
  store %node* %temp63, %node** %temp67
  ret
  br label %label21
label20:
  br label %label21
label21:
  %temp73 = getelementptr %node, %node* %curr, i32 0, i32 2
  %curr = load %node*, %node** %temp73
  br label %label16
label18:
  ret
}

define i32 @main() {
main__entry:
  %temp78 = call i8* @malloc(i32 8)
  %h = bitcast i8* %temp78 to %hashmap*
  %temp79 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  store i32 5, i32* %temp79
  %temp81 = call i8* @malloc(i32 20)
  %temp80 = bitcast i8* %temp81 to %node**
  %temp82 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  store %node** %temp80, %node*** %temp82
  %temp84 = bitcast %hashmap* %h to %hashmap*
  %temp85 = bitcast i32 13 to i32
  %temp86 = bitcast i32 2 to i32
  %temp83 = call void @set(%hashmap* %temp84, i32 %temp85, i32 %temp86)
  %temp88 = bitcast %hashmap* %h to %hashmap*
  %temp89 = bitcast i32 5 to i32
  %temp90 = bitcast i32 19 to i32
  %temp87 = call void @set(%hashmap* %temp88, i32 %temp89, i32 %temp90)
  %temp92 = bitcast %hashmap* %h to %hashmap*
  %temp93 = bitcast i32 3 to i32
  %temp94 = bitcast i32 5 to i32
  %temp91 = call void @set(%hashmap* %temp92, i32 %temp93, i32 %temp94)
  %temp96 = bitcast %hashmap* %h to %hashmap*
  %temp97 = bitcast i32 2 to i32
  %temp98 = bitcast i32 10 to i32
  %temp95 = call void @set(%hashmap* %temp96, i32 %temp97, i32 %temp98)
  %temp100 = bitcast %hashmap* %h to %hashmap*
  %temp101 = bitcast i32 13 to i32
  %temp99 = call void @del(%hashmap* %temp100, i32 %temp101)
  %temp103 = bitcast %hashmap* %h to %hashmap*
  %temp104 = bitcast i32 13 to i32
  %temp102 = call i32 @get(%hashmap* %temp103, i32 %temp104)
  ret i32 %temp102
  ret i32 0
}
