declare i8* @malloc(i32)
define i32 @main() {
main__entry:
  %i$1 = bitcast i32 42 to i32
  %temp1$2 = icmp eq i32 %i$1, 0
  br i1 %temp1$2, label %label1, label %label2
label1:
  ret i32 0
label10:
  br label %label11
label101:
  ret i32 1
label102:
  br label %label103
label103:
  %temp27$28 = icmp eq i32 %i$1, 26
  br i1 %temp27$28, label %label105, label %label106
label105:
  ret i32 0
label106:
  br label %label107
label107:
  %temp28$29 = icmp eq i32 %i$1, 27
  br i1 %temp28$29, label %label109, label %label110
label109:
  ret i32 1
label11:
  %temp4$5 = icmp eq i32 %i$1, 3
  br i1 %temp4$5, label %label13, label %label14
label110:
  br label %label111
label111:
  %temp29$30 = icmp eq i32 %i$1, 28
  br i1 %temp29$30, label %label113, label %label114
label113:
  ret i32 0
label114:
  br label %label115
label115:
  %temp30$31 = icmp eq i32 %i$1, 29
  br i1 %temp30$31, label %label117, label %label118
label117:
  ret i32 1
label118:
  br label %label119
label119:
  %temp31$32 = icmp eq i32 %i$1, 30
  br i1 %temp31$32, label %label121, label %label122
label121:
  ret i32 0
label122:
  br label %label123
label123:
  %temp32$33 = icmp eq i32 %i$1, 31
  br i1 %temp32$33, label %label125, label %label126
label125:
  ret i32 1
label126:
  br label %label127
label127:
  %temp33$34 = icmp eq i32 %i$1, 32
  br i1 %temp33$34, label %label129, label %label130
label129:
  ret i32 0
label13:
  ret i32 1
label130:
  br label %label131
label131:
  %temp34$35 = icmp eq i32 %i$1, 33
  br i1 %temp34$35, label %label133, label %label134
label133:
  ret i32 1
label134:
  br label %label135
label135:
  %temp35$36 = icmp eq i32 %i$1, 34
  br i1 %temp35$36, label %label137, label %label138
label137:
  ret i32 0
label138:
  br label %label139
label139:
  %temp36$37 = icmp eq i32 %i$1, 35
  br i1 %temp36$37, label %label141, label %label142
label14:
  br label %label15
label141:
  ret i32 1
label142:
  br label %label143
label143:
  %temp37$38 = icmp eq i32 %i$1, 36
  br i1 %temp37$38, label %label145, label %label146
label145:
  ret i32 0
label146:
  br label %label147
label147:
  %temp38$39 = icmp eq i32 %i$1, 37
  br i1 %temp38$39, label %label149, label %label150
label149:
  ret i32 1
label15:
  %temp5$6 = icmp eq i32 %i$1, 4
  br i1 %temp5$6, label %label17, label %label18
label150:
  br label %label151
label151:
  %temp39$40 = icmp eq i32 %i$1, 38
  br i1 %temp39$40, label %label153, label %label154
label153:
  ret i32 0
label154:
  br label %label155
label155:
  %temp40$41 = icmp eq i32 %i$1, 39
  br i1 %temp40$41, label %label157, label %label158
label157:
  ret i32 1
label158:
  br label %label159
label159:
  %temp41$42 = icmp eq i32 %i$1, 40
  br i1 %temp41$42, label %label161, label %label162
label161:
  ret i32 0
label162:
  br label %label163
label163:
  %temp42$43 = icmp eq i32 %i$1, 41
  br i1 %temp42$43, label %label165, label %label166
label165:
  ret i32 1
label166:
  br label %label167
label167:
  %temp43$44 = icmp eq i32 %i$1, 42
  br i1 %temp43$44, label %label169, label %label170
label169:
  ret i32 0
label17:
  ret i32 0
label170:
  br label %label171
label171:
  %temp44$45 = icmp eq i32 %i$1, 43
  br i1 %temp44$45, label %label173, label %label174
label173:
  ret i32 1
label174:
  br label %label175
label175:
  %temp45$46 = icmp eq i32 %i$1, 44
  br i1 %temp45$46, label %label177, label %label178
label177:
  ret i32 0
label178:
  br label %label179
label179:
  %temp46$47 = icmp eq i32 %i$1, 45
  br i1 %temp46$47, label %label181, label %label182
label18:
  br label %label19
label181:
  ret i32 1
label182:
  br label %label183
label183:
  %temp47$48 = icmp eq i32 %i$1, 46
  br i1 %temp47$48, label %label185, label %label186
label185:
  ret i32 0
label186:
  br label %label187
label187:
  %temp48$49 = icmp eq i32 %i$1, 47
  br i1 %temp48$49, label %label189, label %label190
label189:
  ret i32 1
label19:
  %temp6$7 = icmp eq i32 %i$1, 5
  br i1 %temp6$7, label %label21, label %label22
label190:
  br label %label191
label191:
  %temp49$50 = icmp eq i32 %i$1, 48
  br i1 %temp49$50, label %label193, label %label194
label193:
  ret i32 0
label194:
  br label %label195
label195:
  %temp50$51 = icmp eq i32 %i$1, 49
  br i1 %temp50$51, label %label197, label %label198
label197:
  ret i32 1
label198:
  br label %label199
label199:
  %temp51$52 = icmp eq i32 %i$1, 50
  br i1 %temp51$52, label %label201, label %label202
label2:
  br label %label3
label201:
  ret i32 0
label202:
  br label %label203
label203:
  %temp52$53 = icmp eq i32 %i$1, 51
  br i1 %temp52$53, label %label205, label %label206
label205:
  ret i32 1
label206:
  br label %label207
label207:
  %temp53$54 = icmp eq i32 %i$1, 52
  br i1 %temp53$54, label %label209, label %label210
label209:
  ret i32 0
label21:
  ret i32 1
label210:
  br label %label211
label211:
  %temp54$55 = icmp eq i32 %i$1, 53
  br i1 %temp54$55, label %label213, label %label214
label213:
  ret i32 1
label214:
  br label %label215
label215:
  %temp55$56 = icmp eq i32 %i$1, 54
  br i1 %temp55$56, label %label217, label %label218
label217:
  ret i32 0
label218:
  br label %label219
label219:
  %temp56$57 = icmp eq i32 %i$1, 55
  br i1 %temp56$57, label %label221, label %label222
label22:
  br label %label23
label221:
  ret i32 1
label222:
  br label %label223
label223:
  %temp57$58 = icmp eq i32 %i$1, 56
  br i1 %temp57$58, label %label225, label %label226
label225:
  ret i32 0
label226:
  br label %label227
label227:
  %temp58$59 = icmp eq i32 %i$1, 57
  br i1 %temp58$59, label %label229, label %label230
label229:
  ret i32 1
label23:
  %temp7$8 = icmp eq i32 %i$1, 6
  br i1 %temp7$8, label %label25, label %label26
label230:
  br label %label231
label231:
  %temp59$60 = icmp eq i32 %i$1, 58
  br i1 %temp59$60, label %label233, label %label234
label233:
  ret i32 0
label234:
  br label %label235
label235:
  %temp60$61 = icmp eq i32 %i$1, 59
  br i1 %temp60$61, label %label237, label %label238
label237:
  ret i32 1
label238:
  br label %label239
label239:
  %temp61$62 = icmp eq i32 %i$1, 60
  br i1 %temp61$62, label %label241, label %label242
label241:
  ret i32 0
label242:
  br label %label243
label243:
  %temp62$63 = icmp eq i32 %i$1, 61
  br i1 %temp62$63, label %label245, label %label246
label245:
  ret i32 1
label246:
  br label %label247
label247:
  %temp63$64 = icmp eq i32 %i$1, 62
  br i1 %temp63$64, label %label249, label %label250
label249:
  ret i32 0
label25:
  ret i32 0
label250:
  br label %label251
label251:
  %temp64$65 = icmp eq i32 %i$1, 63
  br i1 %temp64$65, label %label253, label %label254
label253:
  ret i32 1
label254:
  br label %label255
label255:
  %temp65$66 = icmp eq i32 %i$1, 64
  br i1 %temp65$66, label %label257, label %label258
label257:
  ret i32 0
label258:
  br label %label259
label259:
  %temp66$67 = icmp eq i32 %i$1, 65
  br i1 %temp66$67, label %label261, label %label262
label26:
  br label %label27
label261:
  ret i32 1
label262:
  br label %label263
label263:
  %temp67$68 = icmp eq i32 %i$1, 66
  br i1 %temp67$68, label %label265, label %label266
label265:
  ret i32 0
label266:
  br label %label267
label267:
  %temp68$69 = icmp eq i32 %i$1, 67
  br i1 %temp68$69, label %label269, label %label270
label269:
  ret i32 1
label27:
  %temp8$9 = icmp eq i32 %i$1, 7
  br i1 %temp8$9, label %label29, label %label30
label270:
  br label %label271
label271:
  %temp69$70 = icmp eq i32 %i$1, 68
  br i1 %temp69$70, label %label273, label %label274
label273:
  ret i32 0
label274:
  br label %label275
label275:
  %temp70$71 = icmp eq i32 %i$1, 69
  br i1 %temp70$71, label %label277, label %label278
label277:
  ret i32 1
label278:
  br label %label279
label279:
  %temp71$72 = icmp eq i32 %i$1, 70
  br i1 %temp71$72, label %label281, label %label282
label281:
  ret i32 0
label282:
  br label %label283
label283:
  %temp72$73 = icmp eq i32 %i$1, 71
  br i1 %temp72$73, label %label285, label %label286
label285:
  ret i32 1
label286:
  br label %label287
label287:
  %temp73$74 = icmp eq i32 %i$1, 72
  br i1 %temp73$74, label %label289, label %label290
label289:
  ret i32 0
label29:
  ret i32 1
label290:
  br label %label291
label291:
  %temp74$75 = icmp eq i32 %i$1, 73
  br i1 %temp74$75, label %label293, label %label294
label293:
  ret i32 1
label294:
  br label %label295
label295:
  %temp75$76 = icmp eq i32 %i$1, 74
  br i1 %temp75$76, label %label297, label %label298
label297:
  ret i32 0
label298:
  br label %label299
label299:
  %temp76$77 = icmp eq i32 %i$1, 75
  br i1 %temp76$77, label %label301, label %label302
label3:
  %temp2$3 = icmp eq i32 %i$1, 1
  br i1 %temp2$3, label %label5, label %label6
label30:
  br label %label31
label301:
  ret i32 1
label302:
  br label %label303
label303:
  %temp77$78 = icmp eq i32 %i$1, 76
  br i1 %temp77$78, label %label305, label %label306
label305:
  ret i32 0
label306:
  br label %label307
label307:
  %temp78$79 = icmp eq i32 %i$1, 77
  br i1 %temp78$79, label %label309, label %label310
label309:
  ret i32 1
label31:
  %temp9$10 = icmp eq i32 %i$1, 8
  br i1 %temp9$10, label %label33, label %label34
label310:
  br label %label311
label311:
  %temp79$80 = icmp eq i32 %i$1, 78
  br i1 %temp79$80, label %label313, label %label314
label313:
  ret i32 0
label314:
  br label %label315
label315:
  %temp80$81 = icmp eq i32 %i$1, 79
  br i1 %temp80$81, label %label317, label %label318
label317:
  ret i32 1
label318:
  br label %label319
label319:
  %temp81$82 = icmp eq i32 %i$1, 80
  br i1 %temp81$82, label %label321, label %label322
label321:
  ret i32 0
label322:
  br label %label323
label323:
  %temp82$83 = icmp eq i32 %i$1, 81
  br i1 %temp82$83, label %label325, label %label326
label325:
  ret i32 1
label326:
  br label %label327
label327:
  %temp83$84 = icmp eq i32 %i$1, 82
  br i1 %temp83$84, label %label329, label %label330
label329:
  ret i32 0
label33:
  ret i32 0
label330:
  br label %label331
label331:
  %temp84$85 = icmp eq i32 %i$1, 83
  br i1 %temp84$85, label %label333, label %label334
label333:
  ret i32 1
label334:
  br label %label335
label335:
  %temp85$86 = icmp eq i32 %i$1, 84
  br i1 %temp85$86, label %label337, label %label338
label337:
  ret i32 0
label338:
  br label %label339
label339:
  %temp86$87 = icmp eq i32 %i$1, 85
  br i1 %temp86$87, label %label341, label %label342
label34:
  br label %label35
label341:
  ret i32 1
label342:
  br label %label343
label343:
  %temp87$88 = icmp eq i32 %i$1, 86
  br i1 %temp87$88, label %label345, label %label346
label345:
  ret i32 0
label346:
  br label %label347
label347:
  %temp88$89 = icmp eq i32 %i$1, 87
  br i1 %temp88$89, label %label349, label %label350
label349:
  ret i32 1
label35:
  %temp10$11 = icmp eq i32 %i$1, 9
  br i1 %temp10$11, label %label37, label %label38
label350:
  br label %label351
label351:
  %temp89$90 = icmp eq i32 %i$1, 88
  br i1 %temp89$90, label %label353, label %label354
label353:
  ret i32 0
label354:
  br label %label355
label355:
  %temp90$91 = icmp eq i32 %i$1, 89
  br i1 %temp90$91, label %label357, label %label358
label357:
  ret i32 1
label358:
  br label %label359
label359:
  %temp91$92 = icmp eq i32 %i$1, 90
  br i1 %temp91$92, label %label361, label %label362
label361:
  ret i32 0
label362:
  br label %label363
label363:
  %temp92$93 = icmp eq i32 %i$1, 91
  br i1 %temp92$93, label %label365, label %label366
label365:
  ret i32 1
label366:
  br label %label367
label367:
  %temp93$94 = icmp eq i32 %i$1, 92
  br i1 %temp93$94, label %label369, label %label370
label369:
  ret i32 0
label37:
  ret i32 1
label370:
  br label %label371
label371:
  %temp94$95 = icmp eq i32 %i$1, 93
  br i1 %temp94$95, label %label373, label %label374
label373:
  ret i32 1
label374:
  br label %label375
label375:
  %temp95$96 = icmp eq i32 %i$1, 94
  br i1 %temp95$96, label %label377, label %label378
label377:
  ret i32 0
label378:
  br label %label379
label379:
  %temp96$97 = icmp eq i32 %i$1, 95
  br i1 %temp96$97, label %label381, label %label382
label38:
  br label %label39
label381:
  ret i32 1
label382:
  br label %label383
label383:
  %temp97$98 = icmp eq i32 %i$1, 96
  br i1 %temp97$98, label %label385, label %label386
label385:
  ret i32 0
label386:
  br label %label387
label387:
  %temp98$99 = icmp eq i32 %i$1, 97
  br i1 %temp98$99, label %label389, label %label390
label389:
  ret i32 1
label39:
  %temp11$12 = icmp eq i32 %i$1, 10
  br i1 %temp11$12, label %label41, label %label42
label390:
  br label %label391
label391:
  %temp99$100 = icmp eq i32 %i$1, 98
  br i1 %temp99$100, label %label393, label %label394
label393:
  ret i32 0
label394:
  br label %label395
label395:
  %temp100$101 = icmp eq i32 %i$1, 99
  br i1 %temp100$101, label %label397, label %label398
label397:
  ret i32 1
label398:
  br label %label399
label399:
  ret i32 0
label41:
  ret i32 0
label42:
  br label %label43
label43:
  %temp12$13 = icmp eq i32 %i$1, 11
  br i1 %temp12$13, label %label45, label %label46
label45:
  ret i32 1
label46:
  br label %label47
label47:
  %temp13$14 = icmp eq i32 %i$1, 12
  br i1 %temp13$14, label %label49, label %label50
label49:
  ret i32 0
label5:
  ret i32 1
label50:
  br label %label51
label51:
  %temp14$15 = icmp eq i32 %i$1, 13
  br i1 %temp14$15, label %label53, label %label54
label53:
  ret i32 1
label54:
  br label %label55
label55:
  %temp15$16 = icmp eq i32 %i$1, 14
  br i1 %temp15$16, label %label57, label %label58
label57:
  ret i32 0
label58:
  br label %label59
label59:
  %temp16$17 = icmp eq i32 %i$1, 15
  br i1 %temp16$17, label %label61, label %label62
label6:
  br label %label7
label61:
  ret i32 1
label62:
  br label %label63
label63:
  %temp17$18 = icmp eq i32 %i$1, 16
  br i1 %temp17$18, label %label65, label %label66
label65:
  ret i32 0
label66:
  br label %label67
label67:
  %temp18$19 = icmp eq i32 %i$1, 17
  br i1 %temp18$19, label %label69, label %label70
label69:
  ret i32 1
label7:
  %temp3$4 = icmp eq i32 %i$1, 2
  br i1 %temp3$4, label %label9, label %label10
label70:
  br label %label71
label71:
  %temp19$20 = icmp eq i32 %i$1, 18
  br i1 %temp19$20, label %label73, label %label74
label73:
  ret i32 0
label74:
  br label %label75
label75:
  %temp20$21 = icmp eq i32 %i$1, 19
  br i1 %temp20$21, label %label77, label %label78
label77:
  ret i32 1
label78:
  br label %label79
label79:
  %temp21$22 = icmp eq i32 %i$1, 20
  br i1 %temp21$22, label %label81, label %label82
label81:
  ret i32 0
label82:
  br label %label83
label83:
  %temp22$23 = icmp eq i32 %i$1, 21
  br i1 %temp22$23, label %label85, label %label86
label85:
  ret i32 1
label86:
  br label %label87
label87:
  %temp23$24 = icmp eq i32 %i$1, 22
  br i1 %temp23$24, label %label89, label %label90
label89:
  ret i32 0
label9:
  ret i32 0
label90:
  br label %label91
label91:
  %temp24$25 = icmp eq i32 %i$1, 23
  br i1 %temp24$25, label %label93, label %label94
label93:
  ret i32 1
label94:
  br label %label95
label95:
  %temp25$26 = icmp eq i32 %i$1, 24
  br i1 %temp25$26, label %label97, label %label98
label97:
  ret i32 0
label98:
  br label %label99
label99:
  %temp26$27 = icmp eq i32 %i$1, 25
  br i1 %temp26$27, label %label101, label %label102
}
