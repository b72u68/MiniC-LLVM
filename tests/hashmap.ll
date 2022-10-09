%hashmap = type { i32, %node**
}
%node = type { i32, i32, %node*
}
declare i8* @malloc(i32)
define i32 @mod(i32 %a, i32 %b) {
mod__entry:
  %temp3$1 = sdiv i32 %a, %b
  %temp2$2 = mul i32 %b, %temp3$1
  %temp1$3 = sub i32 %a, %temp2$2
  ret i32 %temp1$3
}

define void @set(%hashmap* %h, i32 %key, i32 %val) {
set__entry:
  %temp4$1 = bitcast i32 %key to i32
  %temp6$2 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp5$3 = load i32, i32* %temp6$2
  %idx$4 = call i32 @mod(i32 %temp4$1, i32 %temp5$3)
  %temp8$5 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp7$6 = load %node**, %node*** %temp8$5
  %temp9$7 = getelementptr %node*, %node** %temp7$6, i32 %idx$4
  %curr$8 = load %node*, %node** %temp9$7
  br label %label2
label2:
  %temp14$9 = phi %node** [%temp14$31, %label7], [null, %set__entry]
  %temp13$10 = phi i32* [%temp13$28, %label7], [null, %set__entry]
  %temp12$11 = phi i32 [%temp12$29, %label7], [0, %set__entry]
  %temp11$12 = phi i1 [%temp11$30, %label7], [0, %set__entry]
  %curr$13 = phi %node* [%curr$32, %label7], [%curr$8, %set__entry]
  %temp16$14 = ptrtoint %node* %curr$13 to i32
  %temp15$15 = icmp ne i32 %temp16$14, 0
  br i1 %temp15$15, label %label3, label %label4
label3:
  %temp13$28 = getelementptr %node, %node* %curr$13, i32 0, i32 0
  %temp12$29 = load i32, i32* %temp13$28
  %temp11$30 = icmp eq i32 %temp12$29, %key
  br i1 %temp11$30, label %label5, label %label6
label4:
  %temp17$16 = call i8* @malloc(i32 12)
  %n$17 = bitcast i8* %temp17$16 to %node*
  %temp18$18 = getelementptr %node, %node* %n$17, i32 0, i32 0
  store i32 %key, i32* %temp18$18
  %temp19$19 = getelementptr %node, %node* %n$17, i32 0, i32 1
  store i32 %val, i32* %temp19$19
  %temp22$20 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp21$21 = load %node**, %node*** %temp22$20
  %temp23$22 = getelementptr %node*, %node** %temp21$21, i32 %idx$4
  %temp20$23 = load %node*, %node** %temp23$22
  %temp24$24 = getelementptr %node, %node* %n$17, i32 0, i32 2
  store %node* %temp20$23, %node** %temp24$24
  %temp25$25 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %arr$26 = load %node**, %node*** %temp25$25
  %temp26$27 = getelementptr %node*, %node** %arr$26, i32 %idx$4
  store %node* %n$17, %node** %temp26$27
  ret
label5:
  %temp10$33 = getelementptr %node, %node* %curr$13, i32 0, i32 1
  store i32 %val, i32* %temp10$33
  ret
label6:
  br label %label7
label7:
  %temp14$31 = getelementptr %node, %node* %curr$13, i32 0, i32 2
  %curr$32 = load %node*, %node** %temp14$31
  br label %label2
}

define i32 @get(%hashmap* %h, i32 %key) {
get__entry:
  %temp27$1 = bitcast i32 %key to i32
  %temp29$2 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp28$3 = load i32, i32* %temp29$2
  %idx$4 = call i32 @mod(i32 %temp27$1, i32 %temp28$3)
  %temp31$5 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp30$6 = load %node**, %node*** %temp31$5
  %temp32$7 = getelementptr %node*, %node** %temp30$6, i32 %idx$4
  %curr$8 = load %node*, %node** %temp32$7
  br label %label9
label10:
  %temp37$17 = getelementptr %node, %node* %curr$13, i32 0, i32 0
  %temp36$18 = load i32, i32* %temp37$17
  %temp35$19 = icmp eq i32 %temp36$18, %key
  br i1 %temp35$19, label %label12, label %label13
label11:
  %temp41$16 = sub i32 0, 1
  ret i32 %temp41$16
label12:
  %temp34$22 = getelementptr %node, %node* %curr$13, i32 0, i32 1
  %temp33$23 = load i32, i32* %temp34$22
  ret i32 %temp33$23
label13:
  br label %label14
label14:
  %temp38$20 = getelementptr %node, %node* %curr$13, i32 0, i32 2
  %curr$21 = load %node*, %node** %temp38$20
  br label %label9
label9:
  %temp38$9 = phi %node** [%temp38$20, %label14], [null, %get__entry]
  %temp37$10 = phi i32* [%temp37$17, %label14], [null, %get__entry]
  %temp36$11 = phi i32 [%temp36$18, %label14], [0, %get__entry]
  %temp35$12 = phi i1 [%temp35$19, %label14], [0, %get__entry]
  %curr$13 = phi %node* [%curr$21, %label14], [%curr$8, %get__entry]
  %temp40$14 = ptrtoint %node* %curr$13 to i32
  %temp39$15 = icmp ne i32 %temp40$14, 0
  br i1 %temp39$15, label %label10, label %label11
}

define void @del(%hashmap* %h, i32 %key) {
del__entry:
  %temp42$1 = bitcast i32 %key to i32
  %temp44$2 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 0
  %temp43$3 = load i32, i32* %temp44$2
  %idx$4 = call i32 @mod(i32 %temp42$1, i32 %temp43$3)
  %temp57$5 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp56$6 = load %node**, %node*** %temp57$5
  %temp58$7 = getelementptr %node*, %node** %temp56$6, i32 %idx$4
  %temp55$8 = load %node*, %node** %temp58$7
  %temp59$9 = getelementptr %node, %node* %temp55$8, i32 0, i32 0
  %temp54$10 = load i32, i32* %temp59$9
  %temp53$11 = icmp eq i32 %temp54$10, %key
  br i1 %temp53$11, label %label17, label %label18
label17:
  %temp45$48 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %arr$49 = load %node**, %node*** %temp45$48
  %temp49$50 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp48$51 = load %node**, %node*** %temp49$50
  %temp50$52 = getelementptr %node*, %node** %temp48$51, i32 %idx$4
  %temp47$53 = load %node*, %node** %temp50$52
  %temp51$54 = getelementptr %node, %node* %temp47$53, i32 0, i32 2
  %temp46$55 = load %node*, %node** %temp51$54
  %temp52$56 = getelementptr %node*, %node** %arr$49, i32 %idx$4
  store %node* %temp46$55, %node** %temp52$56
  br label %label19
label18:
  br label %label19
label19:
  %temp52$12 = phi %node** [%temp52$56, %label17], [null, %label18]
  %temp51$13 = phi %node** [%temp51$54, %label17], [null, %label18]
  %temp50$14 = phi %node** [%temp50$52, %label17], [null, %label18]
  %temp49$15 = phi %node*** [%temp49$50, %label17], [null, %label18]
  %temp48$16 = phi %node** [%temp48$51, %label17], [null, %label18]
  %temp47$17 = phi %node* [%temp47$53, %label17], [null, %label18]
  %temp46$18 = phi %node* [%temp46$55, %label17], [null, %label18]
  %temp45$19 = phi %node*** [%temp45$48, %label17], [null, %label18]
  %arr$20 = phi %node** [%arr$49, %label17], [null, %label18]
  %temp61$21 = getelementptr %hashmap, %hashmap* %h, i32 0, i32 1
  %temp60$22 = load %node**, %node*** %temp61$21
  %temp62$23 = getelementptr %node*, %node** %temp60$22, i32 %idx$4
  %curr$24 = load %node*, %node** %temp62$23
  br label %label20
label20:
  %temp73$25 = phi %node** [%temp73$41, %label25], [null, %label19]
  %temp72$26 = phi i32* [%temp72$38, %label25], [null, %label19]
  %temp71$27 = phi %node** [%temp71$36, %label25], [null, %label19]
  %temp70$28 = phi %node* [%temp70$37, %label25], [null, %label19]
  %temp69$29 = phi i32 [%temp69$39, %label25], [0, %label19]
  %temp68$30 = phi i1 [%temp68$40, %label25], [0, %label19]
  %curr$31 = phi %node* [%curr$42, %label25], [%curr$24, %label19]
  %temp77$32 = getelementptr %node, %node* %curr$31, i32 0, i32 2
  %temp76$33 = load %node*, %node** %temp77$32
  %temp75$34 = ptrtoint %node* %temp76$33 to i32
  %temp74$35 = icmp ne i32 %temp75$34, 0
  br i1 %temp74$35, label %label21, label %label22
label21:
  %temp71$36 = getelementptr %node, %node* %curr$31, i32 0, i32 2
  %temp70$37 = load %node*, %node** %temp71$36
  %temp72$38 = getelementptr %node, %node* %temp70$37, i32 0, i32 0
  %temp69$39 = load i32, i32* %temp72$38
  %temp68$40 = icmp eq i32 %temp69$39, %key
  br i1 %temp68$40, label %label23, label %label24
label22:
  ret
label23:
  %temp65$43 = getelementptr %node, %node* %curr$31, i32 0, i32 2
  %temp64$44 = load %node*, %node** %temp65$43
  %temp66$45 = getelementptr %node, %node* %temp64$44, i32 0, i32 2
  %temp63$46 = load %node*, %node** %temp66$45
  %temp67$47 = getelementptr %node, %node* %curr$31, i32 0, i32 2
  store %node* %temp63$46, %node** %temp67$47
  ret
label24:
  br label %label25
label25:
  %temp73$41 = getelementptr %node, %node* %curr$31, i32 0, i32 2
  %curr$42 = load %node*, %node** %temp73$41
  br label %label20
}

define i32 @main() {
main__entry:
  %temp78$1 = call i8* @malloc(i32 8)
  %h$2 = bitcast i8* %temp78$1 to %hashmap*
  %temp79$3 = getelementptr %hashmap, %hashmap* %h$2, i32 0, i32 0
  store i32 5, i32* %temp79$3
  %temp81$4 = call i8* @malloc(i32 20)
  %temp80$5 = bitcast i8* %temp81$4 to %node**
  %temp82$6 = getelementptr %hashmap, %hashmap* %h$2, i32 0, i32 1
  store %node** %temp80$5, %node*** %temp82$6
  %temp84$7 = bitcast %hashmap* %h$2 to %hashmap*
  %temp85$8 = bitcast i32 13 to i32
  %temp86$9 = bitcast i32 2 to i32
  %temp83$10 = call void @set(%hashmap* %temp84$7, i32 %temp85$8, i32 %temp86$9)
  %temp88$11 = bitcast %hashmap* %h$2 to %hashmap*
  %temp89$12 = bitcast i32 5 to i32
  %temp90$13 = bitcast i32 19 to i32
  %temp87$14 = call void @set(%hashmap* %temp88$11, i32 %temp89$12, i32 %temp90$13)
  %temp92$15 = bitcast %hashmap* %h$2 to %hashmap*
  %temp93$16 = bitcast i32 3 to i32
  %temp94$17 = bitcast i32 5 to i32
  %temp91$18 = call void @set(%hashmap* %temp92$15, i32 %temp93$16, i32 %temp94$17)
  %temp96$19 = bitcast %hashmap* %h$2 to %hashmap*
  %temp97$20 = bitcast i32 2 to i32
  %temp98$21 = bitcast i32 10 to i32
  %temp95$22 = call void @set(%hashmap* %temp96$19, i32 %temp97$20, i32 %temp98$21)
  %temp100$23 = bitcast %hashmap* %h$2 to %hashmap*
  %temp101$24 = bitcast i32 13 to i32
  %temp99$25 = call void @del(%hashmap* %temp100$23, i32 %temp101$24)
  %temp103$26 = bitcast %hashmap* %h$2 to %hashmap*
  %temp104$27 = bitcast i32 13 to i32
  %temp102$28 = call i32 @get(%hashmap* %temp103$26, i32 %temp104$27)
  ret i32 %temp102$28
}
