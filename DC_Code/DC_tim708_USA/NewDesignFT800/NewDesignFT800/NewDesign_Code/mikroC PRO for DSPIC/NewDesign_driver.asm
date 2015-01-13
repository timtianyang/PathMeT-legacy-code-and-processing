
NewDesign_driver_IsInsideObject:
	LNK	#8

;NewDesign_driver.c,1291 :: 		static char IsInsideObject(TObjInfo *AObjInfo, unsigned int X, unsigned int Y) {
;NewDesign_driver.c,1292 :: 		TRect  *ptrPressRect = 0;
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSNewDesign_driver_IsInsideObject_ptrPressRect_L0), W0
	REPEAT	#3
	MOV	[W0++], [W1++]
;NewDesign_driver.c,1293 :: 		TRect  *ptrPressCircle = 0;
;NewDesign_driver.c,1294 :: 		TCRect *ptrPressRectC = 0;
;NewDesign_driver.c,1295 :: 		TCRect *ptrPressCircleC = 0;
; ptrPressCircleC start address is: 8 (W4)
	MOV	#0, W4
	MOV	#0, W5
;NewDesign_driver.c,1297 :: 		if ((AObjInfo->HitX == X) && (AObjInfo->HitY == Y))
	ADD	W10, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA Z	L_NewDesign_driver_IsInsideObject635
	GOTO	L_NewDesign_driver_IsInsideObject471
L_NewDesign_driver_IsInsideObject635:
	ADD	W10, #10, W0
	MOV	[W0], W0
	CP	W0, W12
	BRA Z	L_NewDesign_driver_IsInsideObject636
	GOTO	L_NewDesign_driver_IsInsideObject470
L_NewDesign_driver_IsInsideObject636:
; ptrPressCircleC end address is: 8 (W4)
L_NewDesign_driver_IsInsideObject469:
;NewDesign_driver.c,1298 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;NewDesign_driver.c,1297 :: 		if ((AObjInfo->HitX == X) && (AObjInfo->HitY == Y))
L_NewDesign_driver_IsInsideObject471:
; ptrPressCircleC start address is: 8 (W4)
L_NewDesign_driver_IsInsideObject470:
;NewDesign_driver.c,1300 :: 		switch (AObjInfo->Type) {
	ADD	W10, #4, W3
	GOTO	L_NewDesign_driver_IsInsideObject3
;NewDesign_driver.c,1302 :: 		case VTFT_OT_BOX: {
L_NewDesign_driver_IsInsideObject5:
;NewDesign_driver.c,1303 :: 		ptrPressRect = (TRect *)&(((TBox *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1304 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1307 :: 		case VTFT_OT_CBOX: {
L_NewDesign_driver_IsInsideObject6:
;NewDesign_driver.c,1308 :: 		ptrPressRectC = (TCRect *)&(((TCBox *)AObjInfo->Obj)->Left);
	MOV	[W10++], W1
	MOV	[W10--], W2
	ADD	W14, #4, W0
	ADD	W1, #6, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1309 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1312 :: 		case VTFT_OT_BOXROUND: {
L_NewDesign_driver_IsInsideObject7:
;NewDesign_driver.c,1313 :: 		ptrPressRect = (TRect *)&(((TBox_Round *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1314 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1317 :: 		case VTFT_OT_CBOXROUND: {
L_NewDesign_driver_IsInsideObject8:
;NewDesign_driver.c,1318 :: 		ptrPressRectC = (TCRect *)&(((TCBox_Round *)AObjInfo->Obj)->Left);
	MOV	[W10++], W1
	MOV	[W10--], W2
	ADD	W14, #4, W0
	ADD	W1, #6, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1319 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1322 :: 		case VTFT_OT_EVEGAUGE: {
L_NewDesign_driver_IsInsideObject9:
;NewDesign_driver.c,1323 :: 		ptrPressCircle = (TRect *)&(((TEveGauge *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #2, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1324 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1327 :: 		case VTFT_OT_EVEKEYS: {
L_NewDesign_driver_IsInsideObject10:
;NewDesign_driver.c,1328 :: 		ptrPressRect = (TRect *)&(((TEveKeys *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1329 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1332 :: 		case VTFT_OT_EVEPROGRESSBAR: {
L_NewDesign_driver_IsInsideObject11:
;NewDesign_driver.c,1333 :: 		ptrPressRect = (TRect *)&(((TEveProgressBar *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1334 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1337 :: 		case VTFT_OT_EVETOGGLE: {
L_NewDesign_driver_IsInsideObject12:
;NewDesign_driver.c,1338 :: 		ptrPressRect = (TRect *)&(((TEveToggle *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1339 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1342 :: 		case VTFT_OT_EVEBUTTON: {
L_NewDesign_driver_IsInsideObject13:
;NewDesign_driver.c,1343 :: 		ptrPressRect = (TRect *)&(((TEveButton *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1344 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1347 :: 		case VTFT_OT_EVETEXT: {
L_NewDesign_driver_IsInsideObject14:
;NewDesign_driver.c,1348 :: 		ptrPressRect = (TRect *)&(((TEveText *)AObjInfo->Obj)->Left);
	MOV	[W10], W1
	ADD	W14, #0, W0
	ADD	W1, #6, [W0]
;NewDesign_driver.c,1349 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1352 :: 		case VTFT_OT_CEVETEXT: {
L_NewDesign_driver_IsInsideObject15:
;NewDesign_driver.c,1353 :: 		ptrPressRectC = (TCRect *)&(((TCEveText *)AObjInfo->Obj)->Left);
	MOV	[W10++], W1
	MOV	[W10--], W2
	ADD	W14, #4, W0
	ADD	W1, #6, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1354 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1357 :: 		case VTFT_OT_CEVENUMBER: {
L_NewDesign_driver_IsInsideObject16:
;NewDesign_driver.c,1358 :: 		ptrPressRectC = (TCRect *)&(((TCEveNumber *)AObjInfo->Obj)->Left);
	MOV	[W10++], W1
	MOV	[W10--], W2
	ADD	W14, #4, W0
	ADD	W1, #6, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1359 :: 		break;
	GOTO	L_NewDesign_driver_IsInsideObject4
;NewDesign_driver.c,1361 :: 		}
L_NewDesign_driver_IsInsideObject3:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #12
	BRA NZ	L_NewDesign_driver_IsInsideObject637
	GOTO	L_NewDesign_driver_IsInsideObject5
L_NewDesign_driver_IsInsideObject637:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #13
	BRA NZ	L_NewDesign_driver_IsInsideObject638
	GOTO	L_NewDesign_driver_IsInsideObject6
L_NewDesign_driver_IsInsideObject638:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #14
	BRA NZ	L_NewDesign_driver_IsInsideObject639
	GOTO	L_NewDesign_driver_IsInsideObject7
L_NewDesign_driver_IsInsideObject639:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #15
	BRA NZ	L_NewDesign_driver_IsInsideObject640
	GOTO	L_NewDesign_driver_IsInsideObject8
L_NewDesign_driver_IsInsideObject640:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #25
	BRA NZ	L_NewDesign_driver_IsInsideObject641
	GOTO	L_NewDesign_driver_IsInsideObject9
L_NewDesign_driver_IsInsideObject641:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #27
	BRA NZ	L_NewDesign_driver_IsInsideObject642
	GOTO	L_NewDesign_driver_IsInsideObject10
L_NewDesign_driver_IsInsideObject642:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #29
	BRA NZ	L_NewDesign_driver_IsInsideObject643
	GOTO	L_NewDesign_driver_IsInsideObject11
L_NewDesign_driver_IsInsideObject643:
	MOV.B	[W3], W0
	ZE	W0, W0
	CP	W0, #31
	BRA NZ	L_NewDesign_driver_IsInsideObject644
	GOTO	L_NewDesign_driver_IsInsideObject12
L_NewDesign_driver_IsInsideObject644:
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#36, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_IsInsideObject645
	GOTO	L_NewDesign_driver_IsInsideObject13
L_NewDesign_driver_IsInsideObject645:
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#40, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_IsInsideObject646
	GOTO	L_NewDesign_driver_IsInsideObject14
L_NewDesign_driver_IsInsideObject646:
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#41, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_IsInsideObject647
	GOTO	L_NewDesign_driver_IsInsideObject15
L_NewDesign_driver_IsInsideObject647:
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#43, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_IsInsideObject648
	GOTO	L_NewDesign_driver_IsInsideObject16
L_NewDesign_driver_IsInsideObject648:
L_NewDesign_driver_IsInsideObject4:
;NewDesign_driver.c,1363 :: 		if (ptrPressRect) {
	ADD	W14, #0, W0
	CP0	[W0]
	BRA NZ	L_NewDesign_driver_IsInsideObject649
	GOTO	L_NewDesign_driver_IsInsideObject17
L_NewDesign_driver_IsInsideObject649:
; ptrPressCircleC end address is: 8 (W4)
;NewDesign_driver.c,1364 :: 		if ((ptrPressRect->Left <= X) && (ptrPressRect->Left+ptrPressRect->Width-1 >= X) &&
	MOV	[W14+0], W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LEU	L_NewDesign_driver_IsInsideObject650
	GOTO	L_NewDesign_driver_IsInsideObject475
L_NewDesign_driver_IsInsideObject650:
	MOV	[W14+0], W0
	MOV	[W0], W1
	MOV	[W14+0], W0
	ADD	W0, #4, W0
	ADD	W1, [W0], W0
	DEC	W0
	CP	W0, W11
	BRA GEU	L_NewDesign_driver_IsInsideObject651
	GOTO	L_NewDesign_driver_IsInsideObject474
L_NewDesign_driver_IsInsideObject651:
;NewDesign_driver.c,1365 :: 		(ptrPressRect->Top  <= Y) && (ptrPressRect->Top+ptrPressRect->Height-1 >= Y))
	MOV	[W14+0], W0
	INC2	W0
	MOV	[W0], W0
	CP	W0, W12
	BRA LEU	L_NewDesign_driver_IsInsideObject652
	GOTO	L_NewDesign_driver_IsInsideObject473
L_NewDesign_driver_IsInsideObject652:
	MOV	[W14+0], W0
	ADD	W0, #2, W1
	MOV	[W14+0], W0
	ADD	W0, #6, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W12
	BRA GEU	L_NewDesign_driver_IsInsideObject653
	GOTO	L_NewDesign_driver_IsInsideObject472
L_NewDesign_driver_IsInsideObject653:
L_NewDesign_driver_IsInsideObject468:
;NewDesign_driver.c,1366 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;NewDesign_driver.c,1364 :: 		if ((ptrPressRect->Left <= X) && (ptrPressRect->Left+ptrPressRect->Width-1 >= X) &&
L_NewDesign_driver_IsInsideObject475:
L_NewDesign_driver_IsInsideObject474:
;NewDesign_driver.c,1365 :: 		(ptrPressRect->Top  <= Y) && (ptrPressRect->Top+ptrPressRect->Height-1 >= Y))
L_NewDesign_driver_IsInsideObject473:
L_NewDesign_driver_IsInsideObject472:
;NewDesign_driver.c,1367 :: 		}
	GOTO	L_NewDesign_driver_IsInsideObject21
L_NewDesign_driver_IsInsideObject17:
;NewDesign_driver.c,1368 :: 		else if (ptrPressRectC) {
; ptrPressCircleC start address is: 8 (W4)
	ADD	W14, #4, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L_NewDesign_driver_IsInsideObject654
	GOTO	L_NewDesign_driver_IsInsideObject22
L_NewDesign_driver_IsInsideObject654:
; ptrPressCircleC end address is: 8 (W4)
;NewDesign_driver.c,1369 :: 		if ((ptrPressRectC->Left <= X) && (ptrPressRectC->Left+ptrPressRectC->Width-1 >= X) &&
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W11
	BRA LEU	L_NewDesign_driver_IsInsideObject655
	GOTO	L_NewDesign_driver_IsInsideObject479
L_NewDesign_driver_IsInsideObject655:
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	MOV	W1, 50
	MOV	[W0], W2
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	ADD	W0, #4, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GEU	L_NewDesign_driver_IsInsideObject656
	GOTO	L_NewDesign_driver_IsInsideObject478
L_NewDesign_driver_IsInsideObject656:
;NewDesign_driver.c,1370 :: 		(ptrPressRectC->Top  <= Y) && (ptrPressRectC->Top +ptrPressRectC->Height-1 >= Y))
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W12
	BRA LEU	L_NewDesign_driver_IsInsideObject657
	GOTO	L_NewDesign_driver_IsInsideObject477
L_NewDesign_driver_IsInsideObject657:
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	ADD	W0, #6, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W12
	BRA GEU	L_NewDesign_driver_IsInsideObject658
	GOTO	L_NewDesign_driver_IsInsideObject476
L_NewDesign_driver_IsInsideObject658:
L_NewDesign_driver_IsInsideObject467:
;NewDesign_driver.c,1371 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;NewDesign_driver.c,1369 :: 		if ((ptrPressRectC->Left <= X) && (ptrPressRectC->Left+ptrPressRectC->Width-1 >= X) &&
L_NewDesign_driver_IsInsideObject479:
L_NewDesign_driver_IsInsideObject478:
;NewDesign_driver.c,1370 :: 		(ptrPressRectC->Top  <= Y) && (ptrPressRectC->Top +ptrPressRectC->Height-1 >= Y))
L_NewDesign_driver_IsInsideObject477:
L_NewDesign_driver_IsInsideObject476:
;NewDesign_driver.c,1372 :: 		}
	GOTO	L_NewDesign_driver_IsInsideObject26
L_NewDesign_driver_IsInsideObject22:
;NewDesign_driver.c,1373 :: 		else if (ptrPressCircle) {
; ptrPressCircleC start address is: 8 (W4)
	ADD	W14, #2, W0
	CP0	[W0]
	BRA NZ	L_NewDesign_driver_IsInsideObject659
	GOTO	L_NewDesign_driver_IsInsideObject27
L_NewDesign_driver_IsInsideObject659:
; ptrPressCircleC end address is: 8 (W4)
;NewDesign_driver.c,1374 :: 		if ((ptrPressCircle->Left <= X) && (ptrPressCircle->Left+ptrPressCircle->Width*2-1 >= X) &&
	MOV	[W14+2], W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LEU	L_NewDesign_driver_IsInsideObject660
	GOTO	L_NewDesign_driver_IsInsideObject483
L_NewDesign_driver_IsInsideObject660:
	MOV	[W14+2], W0
	MOV	[W0], W1
	MOV	[W14+2], W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GEU	L_NewDesign_driver_IsInsideObject661
	GOTO	L_NewDesign_driver_IsInsideObject482
L_NewDesign_driver_IsInsideObject661:
;NewDesign_driver.c,1375 :: 		(ptrPressCircle->Top  <= Y) && (ptrPressCircle->Top+ptrPressCircle->Width*2-1 >= Y))
	MOV	[W14+2], W0
	INC2	W0
	MOV	[W0], W0
	CP	W0, W12
	BRA LEU	L_NewDesign_driver_IsInsideObject662
	GOTO	L_NewDesign_driver_IsInsideObject481
L_NewDesign_driver_IsInsideObject662:
	MOV	[W14+2], W0
	ADD	W0, #2, W1
	MOV	[W14+2], W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W12
	BRA GEU	L_NewDesign_driver_IsInsideObject663
	GOTO	L_NewDesign_driver_IsInsideObject480
L_NewDesign_driver_IsInsideObject663:
L_NewDesign_driver_IsInsideObject466:
;NewDesign_driver.c,1376 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;NewDesign_driver.c,1374 :: 		if ((ptrPressCircle->Left <= X) && (ptrPressCircle->Left+ptrPressCircle->Width*2-1 >= X) &&
L_NewDesign_driver_IsInsideObject483:
L_NewDesign_driver_IsInsideObject482:
;NewDesign_driver.c,1375 :: 		(ptrPressCircle->Top  <= Y) && (ptrPressCircle->Top+ptrPressCircle->Width*2-1 >= Y))
L_NewDesign_driver_IsInsideObject481:
L_NewDesign_driver_IsInsideObject480:
;NewDesign_driver.c,1377 :: 		}
	GOTO	L_NewDesign_driver_IsInsideObject31
L_NewDesign_driver_IsInsideObject27:
;NewDesign_driver.c,1378 :: 		else if (ptrPressCircleC) {
; ptrPressCircleC start address is: 8 (W4)
	IOR	W5, W4, W0
	BRA NZ	L_NewDesign_driver_IsInsideObject664
	GOTO	L_NewDesign_driver_IsInsideObject32
L_NewDesign_driver_IsInsideObject664:
;NewDesign_driver.c,1379 :: 		if ((ptrPressCircleC->Left <= X) && (ptrPressCircleC->Left+ptrPressCircleC->Width*2-1 >= X) &&
	MOV	W5, 50
	MOV	[W4], W0
	CP	W0, W11
	BRA LEU	L_NewDesign_driver_IsInsideObject665
	GOTO	L_NewDesign_driver_IsInsideObject487
L_NewDesign_driver_IsInsideObject665:
	MOV	W5, 50
	MOV	[W4], W2
	ADD	W4, #4, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GEU	L_NewDesign_driver_IsInsideObject666
	GOTO	L_NewDesign_driver_IsInsideObject486
L_NewDesign_driver_IsInsideObject666:
;NewDesign_driver.c,1380 :: 		(ptrPressCircleC->Top  <= Y) && (ptrPressCircleC->Top+ptrPressCircleC->Width*2-1 >= Y))
	ADD	W4, #2, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W12
	BRA LEU	L_NewDesign_driver_IsInsideObject667
	GOTO	L_NewDesign_driver_IsInsideObject485
L_NewDesign_driver_IsInsideObject667:
	ADD	W4, #2, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W4, #4, W0
	ADDC	W5, #0, W1
; ptrPressCircleC end address is: 8 (W4)
	MOV	W1, 50
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W12
	BRA GEU	L_NewDesign_driver_IsInsideObject668
	GOTO	L_NewDesign_driver_IsInsideObject484
L_NewDesign_driver_IsInsideObject668:
L_NewDesign_driver_IsInsideObject465:
;NewDesign_driver.c,1381 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;NewDesign_driver.c,1379 :: 		if ((ptrPressCircleC->Left <= X) && (ptrPressCircleC->Left+ptrPressCircleC->Width*2-1 >= X) &&
L_NewDesign_driver_IsInsideObject487:
L_NewDesign_driver_IsInsideObject486:
;NewDesign_driver.c,1380 :: 		(ptrPressCircleC->Top  <= Y) && (ptrPressCircleC->Top+ptrPressCircleC->Width*2-1 >= Y))
L_NewDesign_driver_IsInsideObject485:
L_NewDesign_driver_IsInsideObject484:
;NewDesign_driver.c,1382 :: 		}
L_NewDesign_driver_IsInsideObject32:
L_NewDesign_driver_IsInsideObject31:
L_NewDesign_driver_IsInsideObject26:
L_NewDesign_driver_IsInsideObject21:
;NewDesign_driver.c,1384 :: 		return 0;
	CLR	W0
;NewDesign_driver.c,1385 :: 		}
L_end_IsInsideObject:
	ULNK
	RETURN
; end of NewDesign_driver_IsInsideObject

_DrawBox:

;NewDesign_driver.c,1387 :: 		void DrawBox(TBox *ABox) {
;NewDesign_driver.c,1388 :: 		if (ABox->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawBox670
	GOTO	L_DrawBox36
L__DrawBox670:
;NewDesign_driver.c,1389 :: 		if ((VTFT_OT_BOX == TouchS.ActObjInfo.Type) && (ABox == (TBox *)TouchS.ActObjInfo.Obj)) {
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #12
	BRA Z	L__DrawBox671
	GOTO	L__DrawBox490
L__DrawBox671:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawBox672
	GOTO	L__DrawBox489
L__DrawBox672:
L__DrawBox488:
;NewDesign_driver.c,1390 :: 		if (ABox->Gradient != _FT800_BRUSH_GR_NONE) {
	ADD	W10, #26, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__DrawBox673
	GOTO	L_DrawBox40
L__DrawBox673:
;NewDesign_driver.c,1391 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ABox->Gradient, ABox->Press_Color, ABox->Press_ColorTo, ABox->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W3
	ADD	W10, #24, W2
	ADD	W10, #20, W1
	ADD	W10, #26, W0
	PUSH	W10
	MOV	[W2], W13
	MOV	[W1], W12
	MOV.B	[W0], W11
	MOV.B	#1, W10
	ZE	W3, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP	W10
;NewDesign_driver.c,1392 :: 		}
	GOTO	L_DrawBox41
L_DrawBox40:
;NewDesign_driver.c,1394 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABox->Press_Color, ABox->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #20, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
;NewDesign_driver.c,1395 :: 		}
L_DrawBox41:
;NewDesign_driver.c,1396 :: 		}
	GOTO	L_DrawBox42
;NewDesign_driver.c,1389 :: 		if ((VTFT_OT_BOX == TouchS.ActObjInfo.Type) && (ABox == (TBox *)TouchS.ActObjInfo.Obj)) {
L__DrawBox490:
L__DrawBox489:
;NewDesign_driver.c,1398 :: 		if (ABox->Gradient != _FT800_BRUSH_GR_NONE) {
	ADD	W10, #26, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__DrawBox674
	GOTO	L_DrawBox43
L__DrawBox674:
;NewDesign_driver.c,1399 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ABox->Gradient, ABox->Color, ABox->ColorTo, ABox->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W3
	ADD	W10, #22, W2
	ADD	W10, #18, W1
	ADD	W10, #26, W0
	PUSH	W10
	MOV	[W2], W13
	MOV	[W1], W12
	MOV.B	[W0], W11
	MOV.B	#1, W10
	ZE	W3, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP	W10
;NewDesign_driver.c,1400 :: 		}
	GOTO	L_DrawBox44
L_DrawBox43:
;NewDesign_driver.c,1402 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABox->Color, ABox->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #18, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
;NewDesign_driver.c,1403 :: 		}
L_DrawBox44:
;NewDesign_driver.c,1404 :: 		}
L_DrawBox42:
;NewDesign_driver.c,1406 :: 		FT800_Canvas_Pen(ABox->Pen_Width, ABox->Pen_Color, ABox->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #16, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Pen
	POP	W10
;NewDesign_driver.c,1408 :: 		if (ABox->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawBox675
	GOTO	L_DrawBox45
L__DrawBox675:
;NewDesign_driver.c,1409 :: 		FT800_Canvas_Tag(ABox->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawBox45:
;NewDesign_driver.c,1411 :: 		FT800_Screen_Box(ABox->Left, ABox->Top, ABox->Left+ABox->Width-1, ABox->Top+ABox->Height-1);
	ADD	W10, #8, W3
	ADD	W10, #12, W0
	MOV	[W0], W0
	ADD	W0, [W3], W0
	SUB	W0, #1, W2
	ADD	W10, #6, W1
	ADD	W10, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	MOV	W2, W13
	MOV	W0, W12
	MOV	[W3], W11
	MOV	[W1], W10
	CALL	_FT800_Screen_Box
;NewDesign_driver.c,1412 :: 		}
L_DrawBox36:
;NewDesign_driver.c,1413 :: 		}
L_end_DrawBox:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawBox

_DrawCBox:

;NewDesign_driver.c,1415 :: 		void DrawCBox(TCBox *ACBox) {
;NewDesign_driver.c,1416 :: 		if (ACBox->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCBox677
	GOTO	L_DrawCBox46
L__DrawCBox677:
;NewDesign_driver.c,1417 :: 		if ((VTFT_OT_CBOX == TouchS.ActObjInfo.Type) && (ACBox == (TCBox *)TouchS.ActObjInfo.Obj)) {
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #13
	BRA Z	L__DrawCBox678
	GOTO	L__DrawCBox493
L__DrawCBox678:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0++]
	CPB	W11, [W0--]
	BRA Z	L__DrawCBox679
	GOTO	L__DrawCBox492
L__DrawCBox679:
L__DrawCBox491:
;NewDesign_driver.c,1418 :: 		if (ACBox->Gradient != _FT800_BRUSH_GR_NONE) {
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__DrawCBox680
	GOTO	L_DrawCBox50
L__DrawCBox680:
;NewDesign_driver.c,1419 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ACBox->Gradient, ACBox->Press_Color, ACBox->Press_ColorTo, ACBox->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W4
	ADD	W10, #24, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W3
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV	W3, W13
	MOV	W2, W12
	MOV.B	W0, W11
	MOV.B	#1, W10
	ZE	W4, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP.D	W10
;NewDesign_driver.c,1420 :: 		}
	GOTO	L_DrawCBox51
L_DrawCBox50:
;NewDesign_driver.c,1422 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBox->Press_Color, ACBox->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W2
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	PUSH.D	W10
	MOV.B	W2, W12
	MOV	W0, W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP.D	W10
;NewDesign_driver.c,1423 :: 		}
L_DrawCBox51:
;NewDesign_driver.c,1424 :: 		}
	GOTO	L_DrawCBox52
;NewDesign_driver.c,1417 :: 		if ((VTFT_OT_CBOX == TouchS.ActObjInfo.Type) && (ACBox == (TCBox *)TouchS.ActObjInfo.Obj)) {
L__DrawCBox493:
L__DrawCBox492:
;NewDesign_driver.c,1426 :: 		if (ACBox->Gradient != _FT800_BRUSH_GR_NONE) {
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__DrawCBox681
	GOTO	L_DrawCBox53
L__DrawCBox681:
;NewDesign_driver.c,1427 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ACBox->Gradient, ACBox->Color, ACBox->ColorTo, ACBox->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W4
	ADD	W10, #22, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W3
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV	W3, W13
	MOV	W2, W12
	MOV.B	W0, W11
	MOV.B	#1, W10
	ZE	W4, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP.D	W10
;NewDesign_driver.c,1428 :: 		}
	GOTO	L_DrawCBox54
L_DrawCBox53:
;NewDesign_driver.c,1430 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBox->Color, ACBox->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W2
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	PUSH.D	W10
	MOV.B	W2, W12
	MOV	W0, W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP.D	W10
;NewDesign_driver.c,1431 :: 		}
L_DrawCBox54:
;NewDesign_driver.c,1432 :: 		}
L_DrawCBox52:
;NewDesign_driver.c,1434 :: 		FT800_Canvas_Pen(ACBox->Pen_Width, ACBox->Pen_Color, ACBox->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W3
	ADD	W10, #16, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #14, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV.B	W3, W12
	MOV	W2, W11
	MOV.B	W0, W10
	CALL	_FT800_Canvas_Pen
	POP.D	W10
;NewDesign_driver.c,1436 :: 		if (ACBox->Tag)
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCBox682
	GOTO	L_DrawCBox55
L__DrawCBox682:
;NewDesign_driver.c,1437 :: 		FT800_Canvas_Tag(ACBox->Tag);
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP.D	W10
L_DrawCBox55:
;NewDesign_driver.c,1439 :: 		FT800_Screen_Box(ACBox->Left, ACBox->Top, ACBox->Left+ACBox->Width-1, ACBox->Top+ACBox->Height-1);
	ADD	W10, #8, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W4
	ADD	W10, #12, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W4, W0, W0
	SUB	W0, #1, W3
	ADD	W10, #6, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #10, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	MOV	W3, W13
	MOV	W0, W12
	MOV	W4, W11
	MOV	W2, W10
	CALL	_FT800_Screen_Box
;NewDesign_driver.c,1440 :: 		}
L_DrawCBox46:
;NewDesign_driver.c,1441 :: 		}
L_end_DrawCBox:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawCBox

_DrawBoxRound:

;NewDesign_driver.c,1443 :: 		void DrawBoxRound(TBox_Round *ABoxRound) {
;NewDesign_driver.c,1444 :: 		if (ABoxRound->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawBoxRound684
	GOTO	L_DrawBoxRound56
L__DrawBoxRound684:
;NewDesign_driver.c,1445 :: 		if ((VTFT_OT_BOXROUND == TouchS.ActObjInfo.Type) && (ABoxRound == (TBox_Round *)TouchS.ActObjInfo.Obj))
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #14
	BRA Z	L__DrawBoxRound685
	GOTO	L__DrawBoxRound496
L__DrawBoxRound685:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawBoxRound686
	GOTO	L__DrawBoxRound495
L__DrawBoxRound686:
L__DrawBoxRound494:
;NewDesign_driver.c,1446 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABoxRound->Press_Color, ABoxRound->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #20, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
	GOTO	L_DrawBoxRound60
;NewDesign_driver.c,1445 :: 		if ((VTFT_OT_BOXROUND == TouchS.ActObjInfo.Type) && (ABoxRound == (TBox_Round *)TouchS.ActObjInfo.Obj))
L__DrawBoxRound496:
L__DrawBoxRound495:
;NewDesign_driver.c,1448 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABoxRound->Color, ABoxRound->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #18, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
L_DrawBoxRound60:
;NewDesign_driver.c,1450 :: 		FT800_Canvas_Pen(ABoxRound->Pen_Width, ABoxRound->Pen_Color, ABoxRound->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #16, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Pen
	POP	W10
;NewDesign_driver.c,1452 :: 		if (ABoxRound->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawBoxRound687
	GOTO	L_DrawBoxRound61
L__DrawBoxRound687:
;NewDesign_driver.c,1453 :: 		FT800_Canvas_Tag(ABoxRound->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawBoxRound61:
;NewDesign_driver.c,1455 :: 		FT800_Screen_BoxRound(ABoxRound->Left, ABoxRound->Top, ABoxRound->Left+ABoxRound->Width-1, ABoxRound->Top+ABoxRound->Height-1, ABoxRound->Corner_Radius);
	ADD	W10, #22, W4
	ADD	W10, #8, W3
	ADD	W10, #12, W0
	MOV	[W0], W0
	ADD	W0, [W3], W0
	SUB	W0, #1, W2
	ADD	W10, #6, W1
	ADD	W10, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	MOV	W2, W13
	MOV	W0, W12
	MOV	[W3], W11
	MOV	[W1], W10
	ZE	[W4], W0
	PUSH	W0
	CALL	_FT800_Screen_BoxRound
	SUB	#2, W15
;NewDesign_driver.c,1456 :: 		}
L_DrawBoxRound56:
;NewDesign_driver.c,1457 :: 		}
L_end_DrawBoxRound:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawBoxRound

_DrawCBoxRound:

;NewDesign_driver.c,1459 :: 		void DrawCBoxRound(TCBox_Round *ACBoxRound) {
;NewDesign_driver.c,1460 :: 		if (ACBoxRound->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCBoxRound689
	GOTO	L_DrawCBoxRound62
L__DrawCBoxRound689:
;NewDesign_driver.c,1461 :: 		if ((VTFT_OT_CBOXROUND == TouchS.ActObjInfo.Type) && (ACBoxRound == (TCBox_Round *)TouchS.ActObjInfo.Obj))
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #15
	BRA Z	L__DrawCBoxRound690
	GOTO	L__DrawCBoxRound499
L__DrawCBoxRound690:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0++]
	CPB	W11, [W0--]
	BRA Z	L__DrawCBoxRound691
	GOTO	L__DrawCBoxRound498
L__DrawCBoxRound691:
L__DrawCBoxRound497:
;NewDesign_driver.c,1462 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBoxRound->Press_Color, ACBoxRound->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W2
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	PUSH.D	W10
	MOV.B	W2, W12
	MOV	W0, W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP.D	W10
	GOTO	L_DrawCBoxRound66
;NewDesign_driver.c,1461 :: 		if ((VTFT_OT_CBOXROUND == TouchS.ActObjInfo.Type) && (ACBoxRound == (TCBox_Round *)TouchS.ActObjInfo.Obj))
L__DrawCBoxRound499:
L__DrawCBoxRound498:
;NewDesign_driver.c,1464 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBoxRound->Color, ACBoxRound->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W2
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	PUSH.D	W10
	MOV.B	W2, W12
	MOV	W0, W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP.D	W10
L_DrawCBoxRound66:
;NewDesign_driver.c,1466 :: 		FT800_Canvas_Pen(ACBoxRound->Pen_Width, ACBoxRound->Pen_Color, ACBoxRound->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W3
	ADD	W10, #16, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #14, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV.B	W3, W12
	MOV	W2, W11
	MOV.B	W0, W10
	CALL	_FT800_Canvas_Pen
	POP.D	W10
;NewDesign_driver.c,1468 :: 		if (ACBoxRound->Tag)
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCBoxRound692
	GOTO	L_DrawCBoxRound67
L__DrawCBoxRound692:
;NewDesign_driver.c,1469 :: 		FT800_Canvas_Tag(ACBoxRound->Tag);
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP.D	W10
L_DrawCBoxRound67:
;NewDesign_driver.c,1471 :: 		FT800_Screen_BoxRound(ACBoxRound->Left, ACBoxRound->Top, ACBoxRound->Left+ACBoxRound->Width-1, ACBoxRound->Top+ACBoxRound->Height-1, ACBoxRound->Corner_Radius);
	ADD	W10, #22, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W5
	ADD	W10, #8, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W4
	ADD	W10, #12, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W4, W0, W0
	SUB	W0, #1, W3
	ADD	W10, #6, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #10, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	MOV	W3, W13
	MOV	W0, W12
	MOV	W4, W11
	MOV	W2, W10
	ZE	W5, W0
	PUSH	W0
	CALL	_FT800_Screen_BoxRound
	SUB	#2, W15
;NewDesign_driver.c,1472 :: 		}
L_DrawCBoxRound62:
;NewDesign_driver.c,1473 :: 		}
L_end_DrawCBoxRound:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawCBoxRound

_DrawLine:

;NewDesign_driver.c,1475 :: 		void DrawLine(TLine *ALine) {
;NewDesign_driver.c,1476 :: 		if (ALine->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawLine694
	GOTO	L_DrawLine68
L__DrawLine694:
;NewDesign_driver.c,1477 :: 		FT800_Canvas_Pen(ALine->Pen_Width, ALine->Pen_Color, ALine->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #16, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Pen
	POP	W10
;NewDesign_driver.c,1479 :: 		if (ALine->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawLine695
	GOTO	L_DrawLine69
L__DrawLine695:
;NewDesign_driver.c,1480 :: 		FT800_Canvas_Tag(ALine->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawLine69:
;NewDesign_driver.c,1482 :: 		FT800_Screen_Line(ALine->First_Point_X, ALine->First_Point_Y, ALine->Second_Point_X, ALine->Second_Point_Y);
	ADD	W10, #12, W3
	ADD	W10, #10, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W3], W13
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_FT800_Screen_Line
;NewDesign_driver.c,1483 :: 		}
L_DrawLine68:
;NewDesign_driver.c,1484 :: 		}
L_end_DrawLine:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawLine

_DrawEveGauge:

;NewDesign_driver.c,1486 :: 		void DrawEveGauge(TEveGauge *AEveGauge) {
;NewDesign_driver.c,1489 :: 		if (AEveGauge->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveGauge697
	GOTO	L_DrawEveGauge70
L__DrawEveGauge697:
;NewDesign_driver.c,1490 :: 		if ((VTFT_OT_EVEGAUGE == TouchS.ActObjInfo.Type) && (AEveGauge == (TEveGauge *)TouchS.ActObjInfo.Obj))
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #25
	BRA Z	L__DrawEveGauge698
	GOTO	L__DrawEveGauge502
L__DrawEveGauge698:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawEveGauge699
	GOTO	L__DrawEveGauge501
L__DrawEveGauge699:
L__DrawEveGauge500:
;NewDesign_driver.c,1491 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveGauge->Press_Color, AEveGauge->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #18, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
	GOTO	L_DrawEveGauge74
;NewDesign_driver.c,1490 :: 		if ((VTFT_OT_EVEGAUGE == TouchS.ActObjInfo.Type) && (AEveGauge == (TEveGauge *)TouchS.ActObjInfo.Obj))
L__DrawEveGauge502:
L__DrawEveGauge501:
;NewDesign_driver.c,1493 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveGauge->Color, AEveGauge->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #16, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
L_DrawEveGauge74:
;NewDesign_driver.c,1495 :: 		FT800_Canvas_Pen(AEveGauge->Pen_Width, AEveGauge->Pen_Color, AEveGauge->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #14, W1
	ADD	W10, #12, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Pen
	POP	W10
;NewDesign_driver.c,1497 :: 		FT800_Canvas_CPGraphics_Major(AEveGauge->Major);
	ADD	W10, #20, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Major
	POP	W10
;NewDesign_driver.c,1498 :: 		FT800_Canvas_CPGraphics_Minor(AEveGauge->Minor);
	ADD	W10, #21, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Minor
	POP	W10
;NewDesign_driver.c,1500 :: 		FT800_Canvas_CPGraphics_Range(AEveGauge->Range);
	ADD	W10, #24, W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Range
	POP	W10
;NewDesign_driver.c,1502 :: 		FT800_Canvas_CPGraphics_Value(AEveGauge->Value);
	ADD	W10, #22, W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Value
	POP	W10
;NewDesign_driver.c,1504 :: 		if (AEveGauge->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveGauge700
	GOTO	L_DrawEveGauge75
L__DrawEveGauge700:
;NewDesign_driver.c,1505 :: 		FT800_Canvas_Tag(AEveGauge->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveGauge75:
;NewDesign_driver.c,1507 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1508 :: 		if (AEveGauge->Flat)
	ADD	W10, #26, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveGauge701
	GOTO	L__DrawEveGauge503
L__DrawEveGauge701:
;NewDesign_driver.c,1509 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
	MOV	#256, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
; drawOptions end address is: 4 (W2)
	GOTO	L_DrawEveGauge76
L__DrawEveGauge503:
;NewDesign_driver.c,1508 :: 		if (AEveGauge->Flat)
;NewDesign_driver.c,1509 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
L_DrawEveGauge76:
;NewDesign_driver.c,1510 :: 		if (AEveGauge->NoBackground)
; drawOptions start address is: 4 (W2)
	ADD	W10, #27, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveGauge702
	GOTO	L__DrawEveGauge504
L__DrawEveGauge702:
;NewDesign_driver.c,1511 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOBACK;
	MOV	#4096, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
; drawOptions end address is: 4 (W2)
	GOTO	L_DrawEveGauge77
L__DrawEveGauge504:
;NewDesign_driver.c,1510 :: 		if (AEveGauge->NoBackground)
;NewDesign_driver.c,1511 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOBACK;
L_DrawEveGauge77:
;NewDesign_driver.c,1512 :: 		if (!AEveGauge->TicksVisible)
; drawOptions start address is: 4 (W2)
	ADD	W10, #29, W0
	CP0.B	[W0]
	BRA Z	L__DrawEveGauge703
	GOTO	L__DrawEveGauge505
L__DrawEveGauge703:
;NewDesign_driver.c,1513 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOTICKS;
	MOV	#8192, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
; drawOptions end address is: 4 (W2)
	GOTO	L_DrawEveGauge78
L__DrawEveGauge505:
;NewDesign_driver.c,1512 :: 		if (!AEveGauge->TicksVisible)
;NewDesign_driver.c,1513 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOTICKS;
L_DrawEveGauge78:
;NewDesign_driver.c,1514 :: 		if (AEveGauge->NoPointer)
; drawOptions start address is: 4 (W2)
	ADD	W10, #28, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveGauge704
	GOTO	L__DrawEveGauge506
L__DrawEveGauge704:
;NewDesign_driver.c,1515 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOPTR;
	MOV	#16384, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveGauge79
L__DrawEveGauge506:
;NewDesign_driver.c,1514 :: 		if (AEveGauge->NoPointer)
	MOV.D	W2, W0
;NewDesign_driver.c,1515 :: 		drawOptions |= _FT800_CP_DRAW_OPT_NOPTR;
L_DrawEveGauge79:
;NewDesign_driver.c,1516 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1520 :: 		AEveGauge->Radius);
	ADD	W10, #10, W2
;NewDesign_driver.c,1519 :: 		AEveGauge->Top+AEveGauge->Radius,
	ADD	W10, #8, W0
	MOV	[W0], W0
	ADD	W0, [W2], W1
;NewDesign_driver.c,1518 :: 		FT800_Screen_GaugeCp(AEveGauge->Left+AEveGauge->Radius,
	ADD	W10, #6, W0
	MOV	[W0], W0
	ADD	W0, [W2], W0
;NewDesign_driver.c,1520 :: 		AEveGauge->Radius);
	MOV	[W2], W12
;NewDesign_driver.c,1519 :: 		AEveGauge->Top+AEveGauge->Radius,
	MOV	W1, W11
;NewDesign_driver.c,1518 :: 		FT800_Screen_GaugeCp(AEveGauge->Left+AEveGauge->Radius,
	MOV	W0, W10
;NewDesign_driver.c,1520 :: 		AEveGauge->Radius);
	CALL	_FT800_Screen_GaugeCP
;NewDesign_driver.c,1521 :: 		}
L_DrawEveGauge70:
;NewDesign_driver.c,1522 :: 		}
L_end_DrawEveGauge:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveGauge

_DrawEveToggle:

;NewDesign_driver.c,1524 :: 		void DrawEveToggle(TEveToggle *AEveToggle) {
;NewDesign_driver.c,1527 :: 		if (AEveToggle->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveToggle706
	GOTO	L_DrawEveToggle80
L__DrawEveToggle706:
;NewDesign_driver.c,1528 :: 		if ((VTFT_OT_EVETOGGLE == TouchS.ActObjInfo.Type) && (AEveToggle == (TEveToggle *)TouchS.ActObjInfo.Obj))
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #31
	BRA Z	L__DrawEveToggle707
	GOTO	L__DrawEveToggle509
L__DrawEveToggle707:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawEveToggle708
	GOTO	L__DrawEveToggle508
L__DrawEveToggle708:
L__DrawEveToggle507:
;NewDesign_driver.c,1529 :: 		FT800_Canvas_BrushDualColor(_FT800_BRUSH_STYLE_SOLID, AEveToggle->Press_Color, AEveToggle->Color, AEveToggle->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #20, W1
	ADD	W10, #22, W0
	PUSH	W10
	MOV.B	[W2], W13
	MOV	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushDualColor
	POP	W10
	GOTO	L_DrawEveToggle84
;NewDesign_driver.c,1528 :: 		if ((VTFT_OT_EVETOGGLE == TouchS.ActObjInfo.Type) && (AEveToggle == (TEveToggle *)TouchS.ActObjInfo.Obj))
L__DrawEveToggle509:
L__DrawEveToggle508:
;NewDesign_driver.c,1531 :: 		FT800_Canvas_BrushDualColor(_FT800_BRUSH_STYLE_SOLID, AEveToggle->Background_Color, AEveToggle->Color, AEveToggle->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #20, W1
	ADD	W10, #18, W0
	PUSH	W10
	MOV.B	[W2], W13
	MOV	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushDualColor
	POP	W10
L_DrawEveToggle84:
;NewDesign_driver.c,1533 :: 		if (AEveToggle->FontHandle >= 16)
	MOV	#34, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawEveToggle709
	GOTO	L_DrawEveToggle85
L__DrawEveToggle709:
;NewDesign_driver.c,1534 :: 		FT800_Canvas_FontSystem(AEveToggle->FontHandle, AEveToggle->Font_Color, AEveToggle->Opacity);
	ADD	W10, #4, W2
	MOV	#32, W0
	ADD	W10, W0, W1
	MOV	#34, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_FontSystem
	POP	W10
	GOTO	L_DrawEveToggle86
L_DrawEveToggle85:
;NewDesign_driver.c,1536 :: 		FT800_Canvas_Font(AEveToggle->FontHandle, AEveToggle->FontName, AEveToggle->Source, AEveToggle->Font_Color, AEveToggle->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W4
	MOV	#32, W0
	ADD	W10, W0, W3
	MOV	#36, W0
	ADD	W10, W0, W2
	ADD	W10, #28, W1
	MOV	#34, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV	[W1++], W11
	MOV	[W1--], W12
	MOV.B	[W0], W10
	ZE	W4, W0
	PUSH	W0
	PUSH	[W3]
	PUSH	[W2++]
	PUSH	[W2--]
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP	W10
L_DrawEveToggle86:
;NewDesign_driver.c,1538 :: 		if (AEveToggle->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveToggle710
	GOTO	L_DrawEveToggle87
L__DrawEveToggle710:
;NewDesign_driver.c,1539 :: 		FT800_Canvas_Tag(AEveToggle->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveToggle87:
;NewDesign_driver.c,1541 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1542 :: 		if (AEveToggle->Flat)
	MOV	#42, W0
	ADD	W10, W0, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveToggle711
	GOTO	L__DrawEveToggle510
L__DrawEveToggle711:
;NewDesign_driver.c,1543 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
	MOV	#256, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveToggle88
L__DrawEveToggle510:
;NewDesign_driver.c,1542 :: 		if (AEveToggle->Flat)
	MOV.D	W2, W0
;NewDesign_driver.c,1543 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
L_DrawEveToggle88:
;NewDesign_driver.c,1544 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1546 :: 		FT800_Screen_ToggleCP(AEveToggle->Left, AEveToggle->Top, AEveToggle->Width, AEveToggle->State, AEveToggle->StateOFF_Caption, AEveToggle->StateON_Caption);
	ADD	W10, #26, W5
	ADD	W10, #24, W4
	MOV	#40, W0
	ADD	W10, W0, W3
	ADD	W10, #10, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W3], W13
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	PUSH	[W5]
	PUSH	[W4]
	CALL	_FT800_Screen_ToggleCP
	SUB	#4, W15
;NewDesign_driver.c,1547 :: 		}
L_DrawEveToggle80:
;NewDesign_driver.c,1548 :: 		}
L_end_DrawEveToggle:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveToggle

_DrawEveProgressBar:

;NewDesign_driver.c,1550 :: 		void DrawEveProgressBar(TEveProgressBar *AEveProgressBar) {
;NewDesign_driver.c,1553 :: 		if (AEveProgressBar->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveProgressBar713
	GOTO	L_DrawEveProgressBar89
L__DrawEveProgressBar713:
;NewDesign_driver.c,1554 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveProgressBar->Background_Color, AEveProgressBar->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W10
;NewDesign_driver.c,1556 :: 		FT800_Canvas_Pen(1, AEveProgressBar->Color, AEveProgressBar->Opacity);
	ADD	W10, #4, W1
	ADD	W10, #16, W0
	PUSH	W10
	MOV.B	[W1], W12
	MOV	[W0], W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_Pen
	POP	W10
;NewDesign_driver.c,1558 :: 		FT800_Canvas_CPGraphics_Range(AEveProgressBar->Range);
	ADD	W10, #20, W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Range
	POP	W10
;NewDesign_driver.c,1560 :: 		FT800_Canvas_CPGraphics_Value(AEveProgressBar->Value);
	ADD	W10, #18, W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_FT800_Canvas_CPGraphics_Value
	POP	W10
;NewDesign_driver.c,1562 :: 		if (AEveProgressBar->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveProgressBar714
	GOTO	L_DrawEveProgressBar90
L__DrawEveProgressBar714:
;NewDesign_driver.c,1563 :: 		FT800_Canvas_Tag(AEveProgressBar->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveProgressBar90:
;NewDesign_driver.c,1565 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1566 :: 		if (AEveProgressBar->Flat)
	ADD	W10, #22, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveProgressBar715
	GOTO	L__DrawEveProgressBar511
L__DrawEveProgressBar715:
;NewDesign_driver.c,1567 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
	MOV	#256, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveProgressBar91
L__DrawEveProgressBar511:
;NewDesign_driver.c,1566 :: 		if (AEveProgressBar->Flat)
	MOV.D	W2, W0
;NewDesign_driver.c,1567 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
L_DrawEveProgressBar91:
;NewDesign_driver.c,1568 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1570 :: 		FT800_Screen_ProgressBarCP(AEveProgressBar->Left, AEveProgressBar->Top, AEveProgressBar->Width, AEveProgressBar->Height);
	ADD	W10, #12, W3
	ADD	W10, #10, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W3], W13
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_FT800_Screen_ProgressBarCP
;NewDesign_driver.c,1571 :: 		}
L_DrawEveProgressBar89:
;NewDesign_driver.c,1572 :: 		}
L_end_DrawEveProgressBar:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveProgressBar

_DrawEveKeys:

;NewDesign_driver.c,1574 :: 		void DrawEveKeys(TEveKeys *AEveKeys) {
;NewDesign_driver.c,1577 :: 		if (AEveKeys->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveKeys717
	GOTO	L_DrawEveKeys92
L__DrawEveKeys717:
;NewDesign_driver.c,1578 :: 		FT800_Canvas_Brush(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveKeys->Color, AEveKeys->ColorTo, AEveKeys->Press_Color, AEveKeys->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W3
	ADD	W10, #16, W2
	ADD	W10, #18, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV	[W1], W13
	MOV	[W0], W12
	MOV.B	#2, W11
	MOV.B	#1, W10
	ZE	W3, W0
	PUSH	W0
	PUSH	[W2]
	CALL	_FT800_Canvas_Brush
	SUB	#4, W15
	POP	W10
;NewDesign_driver.c,1580 :: 		if (AEveKeys->FontHandle >= 16)
	ADD	W10, #30, W0
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawEveKeys718
	GOTO	L_DrawEveKeys93
L__DrawEveKeys718:
;NewDesign_driver.c,1581 :: 		FT800_Canvas_FontSystem(AEveKeys->FontHandle, AEveKeys->Font_Color, AEveKeys->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #28, W1
	ADD	W10, #30, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_FontSystem
	POP	W10
	GOTO	L_DrawEveKeys94
L_DrawEveKeys93:
;NewDesign_driver.c,1583 :: 		FT800_Canvas_Font(AEveKeys->FontHandle, AEveKeys->FontName, AEveKeys->Source, AEveKeys->Font_Color, AEveKeys->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W4
	ADD	W10, #28, W3
	MOV	#32, W0
	ADD	W10, W0, W2
	ADD	W10, #24, W1
	ADD	W10, #30, W0
	PUSH	W10
	MOV	[W1++], W11
	MOV	[W1--], W12
	MOV.B	[W0], W10
	ZE	W4, W0
	PUSH	W0
	PUSH	[W3]
	PUSH	[W2++]
	PUSH	[W2--]
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP	W10
L_DrawEveKeys94:
;NewDesign_driver.c,1585 :: 		if (AEveKeys->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveKeys719
	GOTO	L_DrawEveKeys95
L__DrawEveKeys719:
;NewDesign_driver.c,1586 :: 		FT800_Canvas_Tag(AEveKeys->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveKeys95:
;NewDesign_driver.c,1588 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1589 :: 		if (AEveKeys->Flat)
	MOV	#36, W0
	ADD	W10, W0, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveKeys720
	GOTO	L__DrawEveKeys515
L__DrawEveKeys720:
;NewDesign_driver.c,1590 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
	MOV	#256, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
; drawOptions end address is: 4 (W2)
	GOTO	L_DrawEveKeys96
L__DrawEveKeys515:
;NewDesign_driver.c,1589 :: 		if (AEveKeys->Flat)
;NewDesign_driver.c,1590 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
L_DrawEveKeys96:
;NewDesign_driver.c,1591 :: 		if ((VTFT_OT_EVEKEYS == TouchS.ActObjInfo.Type) && (AEveKeys == (TEveKeys *)TouchS.ActObjInfo.Obj))
; drawOptions start address is: 4 (W2)
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W0
	CP	W0, #27
	BRA Z	L__DrawEveKeys721
	GOTO	L__DrawEveKeys516
L__DrawEveKeys721:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawEveKeys722
	GOTO	L__DrawEveKeys517
L__DrawEveKeys722:
L__DrawEveKeys512:
;NewDesign_driver.c,1592 :: 		drawOptions |= TouchS.Tag;
	MOV	#lo_addr(_TouchS+1), W0
	ZE	[W0], W0
	CLR	W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
	MOV.D	W0, W2
; drawOptions end address is: 0 (W0)
;NewDesign_driver.c,1591 :: 		if ((VTFT_OT_EVEKEYS == TouchS.ActObjInfo.Type) && (AEveKeys == (TEveKeys *)TouchS.ActObjInfo.Obj))
	GOTO	L__DrawEveKeys514
L__DrawEveKeys516:
L__DrawEveKeys514:
; drawOptions start address is: 4 (W2)
; drawOptions end address is: 4 (W2)
	GOTO	L__DrawEveKeys513
L__DrawEveKeys517:
L__DrawEveKeys513:
;NewDesign_driver.c,1593 :: 		if (AEveKeys->AutoSize)
; drawOptions start address is: 4 (W2)
	MOV	#37, W0
	ADD	W10, W0, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveKeys723
	GOTO	L__DrawEveKeys518
L__DrawEveKeys723:
;NewDesign_driver.c,1594 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
	MOV	#1536, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveKeys100
L__DrawEveKeys518:
;NewDesign_driver.c,1593 :: 		if (AEveKeys->AutoSize)
	MOV.D	W2, W0
;NewDesign_driver.c,1594 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
L_DrawEveKeys100:
;NewDesign_driver.c,1595 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1597 :: 		FT800_Screen_KeysCP(AEveKeys->Left, AEveKeys->Top, AEveKeys->Width, AEveKeys->Height, AEveKeys->Caption);
	ADD	W10, #22, W4
	ADD	W10, #12, W3
	ADD	W10, #10, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W3], W13
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	PUSH	[W4]
	CALL	_FT800_Screen_KeysCP
	SUB	#2, W15
;NewDesign_driver.c,1598 :: 		}
L_DrawEveKeys92:
;NewDesign_driver.c,1599 :: 		}
L_end_DrawEveKeys:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveKeys

_DrawEveButton:

;NewDesign_driver.c,1601 :: 		void DrawEveButton(TEveButton *AEveButton) {
;NewDesign_driver.c,1604 :: 		if (AEveButton->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveButton725
	GOTO	L_DrawEveButton101
L__DrawEveButton725:
;NewDesign_driver.c,1605 :: 		if ((VTFT_OT_EVEBUTTON == TouchS.ActObjInfo.Type) && (AEveButton == (TEveButton *)TouchS.ActObjInfo.Obj)) {
	MOV	#lo_addr(_TouchS+10), W0
	ZE	[W0], W1
	MOV	#36, W0
	CP	W0, W1
	BRA Z	L__DrawEveButton726
	GOTO	L__DrawEveButton521
L__DrawEveButton726:
	MOV	#lo_addr(_TouchS+6), W0
	CP	W10, [W0]
	BRA Z	L__DrawEveButton727
	GOTO	L__DrawEveButton520
L__DrawEveButton727:
L__DrawEveButton519:
;NewDesign_driver.c,1606 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveButton->Press_Color, AEveButton->Press_ColorTo, AEveButton->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W2
	ADD	W10, #20, W1
	ADD	W10, #16, W0
	PUSH	W10
	MOV	[W1], W13
	MOV	[W0], W12
	MOV.B	#2, W11
	MOV.B	#1, W10
	ZE	W2, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP	W10
;NewDesign_driver.c,1607 :: 		}
	GOTO	L_DrawEveButton105
;NewDesign_driver.c,1605 :: 		if ((VTFT_OT_EVEBUTTON == TouchS.ActObjInfo.Type) && (AEveButton == (TEveButton *)TouchS.ActObjInfo.Obj)) {
L__DrawEveButton521:
L__DrawEveButton520:
;NewDesign_driver.c,1609 :: 		FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveButton->Color, AEveButton->ColorTo, AEveButton->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W2
	ADD	W10, #18, W1
	ADD	W10, #14, W0
	PUSH	W10
	MOV	[W1], W13
	MOV	[W0], W12
	MOV.B	#2, W11
	MOV.B	#1, W10
	ZE	W2, W0
	PUSH	W0
	CALL	_FT800_Canvas_BrushGradient
	SUB	#2, W15
	POP	W10
;NewDesign_driver.c,1610 :: 		}
L_DrawEveButton105:
;NewDesign_driver.c,1612 :: 		if (AEveButton->FontHandle >= 16)
	ADD	W10, #30, W0
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawEveButton728
	GOTO	L_DrawEveButton106
L__DrawEveButton728:
;NewDesign_driver.c,1613 :: 		FT800_Canvas_FontSystem(AEveButton->FontHandle, AEveButton->Font_Color, AEveButton->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #28, W1
	ADD	W10, #30, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_FontSystem
	POP	W10
	GOTO	L_DrawEveButton107
L_DrawEveButton106:
;NewDesign_driver.c,1615 :: 		FT800_Canvas_Font(AEveButton->FontHandle, AEveButton->FontName, AEveButton->Source, AEveButton->Font_Color, AEveButton->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W4
	ADD	W10, #28, W3
	MOV	#32, W0
	ADD	W10, W0, W2
	ADD	W10, #24, W1
	ADD	W10, #30, W0
	PUSH	W10
	MOV	[W1++], W11
	MOV	[W1--], W12
	MOV.B	[W0], W10
	ZE	W4, W0
	PUSH	W0
	PUSH	[W3]
	PUSH	[W2++]
	PUSH	[W2--]
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP	W10
L_DrawEveButton107:
;NewDesign_driver.c,1617 :: 		if (AEveButton->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveButton729
	GOTO	L_DrawEveButton108
L__DrawEveButton729:
;NewDesign_driver.c,1618 :: 		FT800_Canvas_Tag(AEveButton->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveButton108:
;NewDesign_driver.c,1620 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1621 :: 		if (AEveButton->Flat)
	MOV	#36, W0
	ADD	W10, W0, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveButton730
	GOTO	L__DrawEveButton522
L__DrawEveButton730:
;NewDesign_driver.c,1622 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
	MOV	#256, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveButton109
L__DrawEveButton522:
;NewDesign_driver.c,1621 :: 		if (AEveButton->Flat)
	MOV.D	W2, W0
;NewDesign_driver.c,1622 :: 		drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
L_DrawEveButton109:
;NewDesign_driver.c,1623 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1625 :: 		FT800_Screen_ButtonCP(AEveButton->Left, AEveButton->Top, AEveButton->Width, AEveButton->Height, AEveButton->Caption);
	ADD	W10, #22, W4
	ADD	W10, #12, W3
	ADD	W10, #10, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W3], W13
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	PUSH	[W4]
	CALL	_FT800_Screen_ButtonCP
	SUB	#2, W15
;NewDesign_driver.c,1626 :: 		}
L_DrawEveButton101:
;NewDesign_driver.c,1627 :: 		}
L_end_DrawEveButton:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveButton

_DrawEveText:

;NewDesign_driver.c,1629 :: 		void DrawEveText(TEveText *AEveText) {
;NewDesign_driver.c,1632 :: 		if (AEveText->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W10, #3, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveText732
	GOTO	L_DrawEveText110
L__DrawEveText732:
;NewDesign_driver.c,1633 :: 		if (AEveText->FontHandle >= 16)
	ADD	W10, #24, W0
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawEveText733
	GOTO	L_DrawEveText111
L__DrawEveText733:
;NewDesign_driver.c,1634 :: 		FT800_Canvas_FontSystem(AEveText->FontHandle, AEveText->Font_Color, AEveText->Opacity);
	ADD	W10, #4, W2
	ADD	W10, #22, W1
	ADD	W10, #24, W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_FontSystem
	POP	W10
	GOTO	L_DrawEveText112
L_DrawEveText111:
;NewDesign_driver.c,1636 :: 		FT800_Canvas_Font(AEveText->FontHandle, AEveText->FontName, AEveText->Source, AEveText->Font_Color, AEveText->Opacity);
	ADD	W10, #4, W0
	MOV.B	[W0], W4
	ADD	W10, #22, W3
	ADD	W10, #26, W2
	ADD	W10, #18, W1
	ADD	W10, #24, W0
	PUSH	W10
	MOV	[W1++], W11
	MOV	[W1--], W12
	MOV.B	[W0], W10
	ZE	W4, W0
	PUSH	W0
	PUSH	[W3]
	PUSH	[W2++]
	PUSH	[W2--]
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP	W10
L_DrawEveText112:
;NewDesign_driver.c,1638 :: 		if (AEveText->Tag)
	ADD	W10, #5, W0
	CP0.B	[W0]
	BRA NZ	L__DrawEveText734
	GOTO	L_DrawEveText113
L__DrawEveText734:
;NewDesign_driver.c,1639 :: 		FT800_Canvas_Tag(AEveText->Tag);
	ADD	W10, #5, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP	W10
L_DrawEveText113:
;NewDesign_driver.c,1641 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1642 :: 		if (AEveText->TextAlign == taCenter)
	ADD	W10, #16, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__DrawEveText735
	GOTO	L_DrawEveText114
L__DrawEveText735:
;NewDesign_driver.c,1643 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
	MOV	#1536, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveText115
L_DrawEveText114:
;NewDesign_driver.c,1644 :: 		else if (AEveText->TextAlign == taCenterX)
; drawOptions start address is: 4 (W2)
	ADD	W10, #16, W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DrawEveText736
	GOTO	L_DrawEveText116
L__DrawEveText736:
;NewDesign_driver.c,1645 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
	MOV	#512, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveText117
L_DrawEveText116:
;NewDesign_driver.c,1646 :: 		else if (AEveText->TextAlign == taCenterY)
; drawOptions start address is: 4 (W2)
	ADD	W10, #16, W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__DrawEveText737
	GOTO	L_DrawEveText118
L__DrawEveText737:
;NewDesign_driver.c,1647 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
	MOV	#1024, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveText119
L_DrawEveText118:
;NewDesign_driver.c,1648 :: 		else if (AEveText->TextAlign == taRightX)
; drawOptions start address is: 4 (W2)
	ADD	W10, #16, W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__DrawEveText738
	GOTO	L__DrawEveText523
L__DrawEveText738:
;NewDesign_driver.c,1649 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
	MOV	#2048, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawEveText120
L__DrawEveText523:
;NewDesign_driver.c,1648 :: 		else if (AEveText->TextAlign == taRightX)
	MOV.D	W2, W0
;NewDesign_driver.c,1649 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
L_DrawEveText120:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawEveText119:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawEveText117:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawEveText115:
;NewDesign_driver.c,1650 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP	W10
;NewDesign_driver.c,1652 :: 		FT800_Screen_TextCP(AEveText->Left, AEveText->Top, AEveText->Caption);
	ADD	W10, #14, W2
	ADD	W10, #8, W1
	ADD	W10, #6, W0
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_FT800_Screen_TextCP
;NewDesign_driver.c,1653 :: 		}
L_DrawEveText110:
;NewDesign_driver.c,1654 :: 		}
L_end_DrawEveText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawEveText

_DrawCEveText:

;NewDesign_driver.c,1656 :: 		void DrawCEveText(TCEveText *ACEveText) {
;NewDesign_driver.c,1659 :: 		if (ACEveText->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCEveText740
	GOTO	L_DrawCEveText121
L__DrawCEveText740:
;NewDesign_driver.c,1660 :: 		if (ACEveText->FontHandle >= 16)
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawCEveText741
	GOTO	L_DrawCEveText122
L__DrawCEveText741:
;NewDesign_driver.c,1661 :: 		FT800_Canvas_FontSystem(ACEveText->FontHandle, ACEveText->Font_Color, ACEveText->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W3
	ADD	W10, #24, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV.B	W3, W12
	MOV	W2, W11
	MOV.B	W0, W10
	CALL	_FT800_Canvas_FontSystem
	POP.D	W10
	GOTO	L_DrawCEveText123
L_DrawCEveText122:
;NewDesign_driver.c,1663 :: 		FT800_Canvas_Font(ACEveText->FontHandle, ACEveText->FontName, ACEveText->Source, ACEveText->Font_Color, ACEveText->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W7
	ADD	W10, #24, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W6
	ADD	W10, #28, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.D	[W0], W4
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.D	[W0], W2
	ADD	W10, #26, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV	W2, W11
	MOV	W3, W12
	MOV.B	W0, W10
	ZE	W7, W0
	PUSH	W0
	PUSH	W6
	PUSH.D	W4
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP.D	W10
L_DrawCEveText123:
;NewDesign_driver.c,1665 :: 		if (ACEveText->Tag)
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCEveText742
	GOTO	L_DrawCEveText124
L__DrawCEveText742:
;NewDesign_driver.c,1666 :: 		FT800_Canvas_Tag(ACEveText->Tag);
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP.D	W10
L_DrawCEveText124:
;NewDesign_driver.c,1668 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1669 :: 		if (ACEveText->TextAlign == taCenter)
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__DrawCEveText743
	GOTO	L_DrawCEveText125
L__DrawCEveText743:
;NewDesign_driver.c,1670 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
	MOV	#1536, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveText126
L_DrawCEveText125:
;NewDesign_driver.c,1671 :: 		else if (ACEveText->TextAlign == taCenterX)
; drawOptions start address is: 4 (W2)
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DrawCEveText744
	GOTO	L_DrawCEveText127
L__DrawCEveText744:
;NewDesign_driver.c,1672 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
	MOV	#512, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveText128
L_DrawCEveText127:
;NewDesign_driver.c,1673 :: 		else if (ACEveText->TextAlign == taCenterY)
; drawOptions start address is: 4 (W2)
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__DrawCEveText745
	GOTO	L_DrawCEveText129
L__DrawCEveText745:
;NewDesign_driver.c,1674 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
	MOV	#1024, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveText130
L_DrawCEveText129:
;NewDesign_driver.c,1675 :: 		else if (ACEveText->TextAlign == taRightX)
; drawOptions start address is: 4 (W2)
	ADD	W10, #18, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__DrawCEveText746
	GOTO	L__DrawCEveText524
L__DrawCEveText746:
;NewDesign_driver.c,1676 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
	MOV	#2048, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveText131
L__DrawCEveText524:
;NewDesign_driver.c,1675 :: 		else if (ACEveText->TextAlign == taRightX)
	MOV.D	W2, W0
;NewDesign_driver.c,1676 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
L_DrawCEveText131:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawCEveText130:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawCEveText128:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawCEveText126:
;NewDesign_driver.c,1677 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
; drawOptions start address is: 0 (W0)
	PUSH.D	W10
; drawOptions end address is: 0 (W0)
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP.D	W10
;NewDesign_driver.c,1679 :: 		FT800_Screen_TextCP_Const(ACEveText->Left, ACEveText->Top, ACEveText->Caption);
	ADD	W10, #14, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0++], W3
	MOV	[W0--], W4
	ADD	W10, #8, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #6, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	MOV	W3, W12
	MOV	W4, W13
	MOV	W2, W11
	MOV	W0, W10
	CALL	_FT800_Screen_TextCP_Const
;NewDesign_driver.c,1680 :: 		}
L_DrawCEveText121:
;NewDesign_driver.c,1681 :: 		}
L_end_DrawCEveText:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawCEveText

_DrawCEveNumber:

;NewDesign_driver.c,1683 :: 		void DrawCEveNumber(TCEveNumber *ACEveNumber) {
;NewDesign_driver.c,1686 :: 		if (ACEveNumber->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCEveNumber748
	GOTO	L_DrawCEveNumber132
L__DrawCEveNumber748:
;NewDesign_driver.c,1687 :: 		if (ACEveNumber->FontHandle >= 16)
	ADD	W10, #22, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA GEU	L__DrawCEveNumber749
	GOTO	L_DrawCEveNumber133
L__DrawCEveNumber749:
;NewDesign_driver.c,1688 :: 		FT800_Canvas_FontSystem(ACEveNumber->FontHandle, ACEveNumber->Font_Color, ACEveNumber->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W3
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #22, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV.B	W3, W12
	MOV	W2, W11
	MOV.B	W0, W10
	CALL	_FT800_Canvas_FontSystem
	POP.D	W10
	GOTO	L_DrawCEveNumber134
L_DrawCEveNumber133:
;NewDesign_driver.c,1690 :: 		FT800_Canvas_Font(ACEveNumber->FontHandle, ACEveNumber->FontName, ACEveNumber->Source, ACEveNumber->Font_Color, ACEveNumber->Opacity);
	ADD	W10, #4, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W7
	ADD	W10, #20, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W6
	ADD	W10, #24, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.D	[W0], W4
	ADD	W10, #16, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.D	[W0], W2
	ADD	W10, #22, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV	W2, W11
	MOV	W3, W12
	MOV.B	W0, W10
	ZE	W7, W0
	PUSH	W0
	PUSH	W6
	PUSH.D	W4
	CALL	_FT800_Canvas_Font
	SUB	#8, W15
	POP.D	W10
L_DrawCEveNumber134:
;NewDesign_driver.c,1692 :: 		if (ACEveNumber->Tag)
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCEveNumber750
	GOTO	L_DrawCEveNumber135
L__DrawCEveNumber750:
;NewDesign_driver.c,1693 :: 		FT800_Canvas_Tag(ACEveNumber->Tag);
	ADD	W10, #5, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.B	[W0], W10
	CALL	_FT800_Canvas_Tag
	POP.D	W10
L_DrawCEveNumber135:
;NewDesign_driver.c,1695 :: 		drawOptions = 0;
; drawOptions start address is: 4 (W2)
	CLR	W2
	CLR	W3
;NewDesign_driver.c,1696 :: 		if (ACEveNumber->TextAlign == taCenter)
	ADD	W10, #15, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__DrawCEveNumber751
	GOTO	L_DrawCEveNumber136
L__DrawCEveNumber751:
;NewDesign_driver.c,1697 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
	MOV	#1536, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
	GOTO	L_DrawCEveNumber137
L_DrawCEveNumber136:
;NewDesign_driver.c,1698 :: 		else if (ACEveNumber->TextAlign == taCenterX)
	ADD	W10, #15, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DrawCEveNumber752
	GOTO	L_DrawCEveNumber138
L__DrawCEveNumber752:
;NewDesign_driver.c,1699 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
	MOV	#512, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
	MOV.D	W0, W2
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveNumber139
L_DrawCEveNumber138:
;NewDesign_driver.c,1700 :: 		else if (ACEveNumber->TextAlign == taCenterY)
; drawOptions start address is: 4 (W2)
	ADD	W10, #15, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__DrawCEveNumber753
	GOTO	L_DrawCEveNumber140
L__DrawCEveNumber753:
;NewDesign_driver.c,1701 :: 		drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
	MOV	#1024, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveNumber141
L_DrawCEveNumber140:
;NewDesign_driver.c,1702 :: 		else if (ACEveNumber->TextAlign == taRightX)
; drawOptions start address is: 4 (W2)
	ADD	W10, #15, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__DrawCEveNumber754
	GOTO	L__DrawCEveNumber525
L__DrawCEveNumber754:
;NewDesign_driver.c,1703 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
	MOV	#2048, W0
	MOV	#0, W1
; drawOptions start address is: 0 (W0)
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
; drawOptions end address is: 0 (W0)
	GOTO	L_DrawCEveNumber142
L__DrawCEveNumber525:
;NewDesign_driver.c,1702 :: 		else if (ACEveNumber->TextAlign == taRightX)
	MOV.D	W2, W0
;NewDesign_driver.c,1703 :: 		drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
L_DrawCEveNumber142:
; drawOptions start address is: 0 (W0)
; drawOptions end address is: 0 (W0)
L_DrawCEveNumber141:
; drawOptions start address is: 0 (W0)
	MOV.D	W0, W2
; drawOptions end address is: 0 (W0)
L_DrawCEveNumber139:
; drawOptions start address is: 4 (W2)
; drawOptions end address is: 4 (W2)
L_DrawCEveNumber137:
;NewDesign_driver.c,1704 :: 		if (ACEveNumber->Signed)
; drawOptions start address is: 4 (W2)
	MOV	#32, W0
	MOV	#0, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__DrawCEveNumber755
	GOTO	L__DrawCEveNumber526
L__DrawCEveNumber755:
;NewDesign_driver.c,1705 :: 		drawOptions |= _FT800_CP_DRAW_OPT_SIGNED;
	MOV	#256, W0
	MOV	#0, W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
; drawOptions end address is: 4 (W2)
	GOTO	L_DrawCEveNumber143
L__DrawCEveNumber526:
;NewDesign_driver.c,1704 :: 		if (ACEveNumber->Signed)
;NewDesign_driver.c,1705 :: 		drawOptions |= _FT800_CP_DRAW_OPT_SIGNED;
L_DrawCEveNumber143:
;NewDesign_driver.c,1706 :: 		drawOptions |= ACEveNumber->Text_Length;
; drawOptions start address is: 4 (W2)
	ADD	W10, #14, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
; drawOptions end address is: 4 (W2)
;NewDesign_driver.c,1707 :: 		FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);
	PUSH.D	W10
	MOV.D	W0, W10
	CALL	_FT800_Canvas_CPGraphics_DrawingOptions
	POP.D	W10
;NewDesign_driver.c,1709 :: 		FT800_Screen_NumberCP(ACEveNumber->Left, ACEveNumber->Top, ACEveNumber->Value);
	ADD	W10, #28, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0++], W3
	MOV	[W0--], W4
	ADD	W10, #8, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W10, #6, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	MOV	W3, W12
	MOV	W4, W13
	MOV	W2, W11
	MOV	W0, W10
	CALL	_FT800_Screen_NumberCP
;NewDesign_driver.c,1710 :: 		}
L_DrawCEveNumber132:
;NewDesign_driver.c,1711 :: 		}
L_end_DrawCEveNumber:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawCEveNumber

_DrawObject:
	LNK	#2

;NewDesign_driver.c,1713 :: 		void DrawObject(TPointer aObj, char aObjType) {
;NewDesign_driver.c,1716 :: 		drawHandler = DrawHandlerTable[aObjType];
	ZE	W12, W0
	SL	W0, #2, W1
	MOV	#lo_addr(_DrawHandlerTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,1717 :: 		if (drawHandler)
	CP0	W0
	BRA NZ	L__DrawObject757
	GOTO	L_DrawObject144
L__DrawObject757:
;NewDesign_driver.c,1718 :: 		drawHandler(aObj);
	MOV	[W14+0], W0
	CALL	W0
L_DrawObject144:
;NewDesign_driver.c,1719 :: 		}
L_end_DrawObject:
	ULNK
	RETURN
; end of _DrawObject

_DrawScreenO:
	LNK	#70

;NewDesign_driver.c,1721 :: 		void DrawScreenO(TScreen *aScreen, char aOptions) {
;NewDesign_driver.c,1755 :: 		if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_FADE) {
	PUSH	W10
	PUSH	W12
	PUSH	W13
	BTSS	W11, #2
	GOTO	L_DrawScreenO145
;NewDesign_driver.c,1756 :: 		FT800_PWM_Get(0, &pwmDuty);
	ADD	W14, #4, W0
	PUSH.D	W10
	MOV	W0, W11
	CLR	W10
	CALL	_FT800_PWM_Get
	POP.D	W10
;NewDesign_driver.c,1757 :: 		FT800_PWM_FadeOut(pwmDuty, 0, pwmDuty/32? pwmDuty/32 : 1, 1);
	ADD	W14, #4, W0
	ZE	[W0], W0
	ASR	W0, #5, W0
	CP0	W0
	BRA NZ	L__DrawScreenO759
	GOTO	L_DrawScreenO146
L__DrawScreenO759:
	ADD	W14, #4, W0
	ZE	[W0], W0
	ASR	W0, #5, W0
; ?FLOC___DrawScreenO?T2222 start address is: 0 (W0)
; ?FLOC___DrawScreenO?T2222 end address is: 0 (W0)
	GOTO	L_DrawScreenO147
L_DrawScreenO146:
; ?FLOC___DrawScreenO?T2222 start address is: 0 (W0)
	MOV	#1, W0
; ?FLOC___DrawScreenO?T2222 end address is: 0 (W0)
L_DrawScreenO147:
; ?FLOC___DrawScreenO?T2222 start address is: 0 (W0)
	PUSH.D	W10
	MOV	#1, W13
	MOV.B	W0, W12
; ?FLOC___DrawScreenO?T2222 end address is: 0 (W0)
	CLR	W11
	MOV.B	[W14+4], W10
	CALL	_FT800_PWM_FadeOut
	POP.D	W10
;NewDesign_driver.c,1758 :: 		}
	GOTO	L_DrawScreenO148
L_DrawScreenO145:
;NewDesign_driver.c,1759 :: 		else if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_OFF) {
	BTSS	W11, #3
	GOTO	L_DrawScreenO149
;NewDesign_driver.c,1760 :: 		FT800_PWM_Get(0, &pwmDuty);
	ADD	W14, #4, W0
	PUSH.D	W10
	MOV	W0, W11
	CLR	W10
	CALL	_FT800_PWM_Get
;NewDesign_driver.c,1761 :: 		FT800_PWM_Duty(0);
	CLR	W10
	CALL	_FT800_PWM_Duty
	POP.D	W10
;NewDesign_driver.c,1762 :: 		}
L_DrawScreenO149:
L_DrawScreenO148:
;NewDesign_driver.c,1765 :: 		if (CurrentScreen != aScreen)
	MOV	#lo_addr(_CurrentScreen), W0
	CP	W10, [W0]
	BRA NZ	L__DrawScreenO760
	GOTO	L_DrawScreenO150
L__DrawScreenO760:
;NewDesign_driver.c,1766 :: 		memset(&TouchS.ActObjInfo, 0, sizeof(TObjInfo));
	PUSH.D	W10
	MOV	#12, W12
	CLR	W11
	MOV	#lo_addr(_TouchS+6), W10
	CALL	_memset
	POP.D	W10
L_DrawScreenO150:
;NewDesign_driver.c,1768 :: 		CurrentScreen = aScreen;
	MOV	W10, _CurrentScreen
;NewDesign_driver.c,1771 :: 		cntBox            = CurrentScreen->BoxesCount;
	ADD	W10, #7, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+5]
;NewDesign_driver.c,1772 :: 		cntCBox           = CurrentScreen->CBoxesCount;
	ADD	W10, #12, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+6]
;NewDesign_driver.c,1773 :: 		cntBoxRound       = CurrentScreen->Boxes_RoundCount;
	ADD	W10, #18, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+7]
;NewDesign_driver.c,1774 :: 		cntCBoxRound      = CurrentScreen->CBoxes_RoundCount;
	ADD	W10, #24, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+8]
;NewDesign_driver.c,1775 :: 		cntLine           = CurrentScreen->LinesCount;
	ADD	W10, #30, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+9]
;NewDesign_driver.c,1776 :: 		cntEveGauge       = CurrentScreen->EveGaugesCount;
	MOV	#36, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+10]
;NewDesign_driver.c,1777 :: 		cntEveKeys        = CurrentScreen->EveKeysCount;
	MOV	#42, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+11]
;NewDesign_driver.c,1778 :: 		cntEveProgressBar = CurrentScreen->EveProgressBarsCount;
	MOV	#48, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+12]
;NewDesign_driver.c,1779 :: 		cntEveToggle      = CurrentScreen->EveTogglesCount;
	MOV	#54, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+13]
;NewDesign_driver.c,1780 :: 		cntEveButton      = CurrentScreen->EveButtonsCount;
	MOV	#60, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+14]
;NewDesign_driver.c,1781 :: 		cntEveText        = CurrentScreen->EveTextsCount;
	MOV	#66, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+15]
;NewDesign_driver.c,1782 :: 		cntCEveText       = CurrentScreen->CEveTextsCount;
	MOV	#72, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+16]
;NewDesign_driver.c,1783 :: 		cntCEveNumber     = CurrentScreen->CEveNumbersCount;
	MOV	#78, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+17]
;NewDesign_driver.c,1785 :: 		pBox            = CurrentScreen->Boxes;
	ADD	W10, #8, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+18]
	MOV	W1, [W14+20]
;NewDesign_driver.c,1786 :: 		pCBox           = CurrentScreen->CBoxes;
	ADD	W10, #14, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+22]
	MOV	W1, [W14+24]
;NewDesign_driver.c,1787 :: 		pBoxRound       = CurrentScreen->Boxes_Round;
	ADD	W10, #20, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+26]
	MOV	W1, [W14+28]
;NewDesign_driver.c,1788 :: 		pCBoxRound      = CurrentScreen->CBoxes_Round;
	ADD	W10, #26, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
;NewDesign_driver.c,1789 :: 		pLine           = CurrentScreen->Lines;
	MOV	#32, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
;NewDesign_driver.c,1790 :: 		pEveGauge       = CurrentScreen->EveGauges;
	MOV	#38, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+38]
	MOV	W1, [W14+40]
;NewDesign_driver.c,1791 :: 		pEveKeys        = CurrentScreen->EveKeys;
	MOV	#44, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+42]
	MOV	W1, [W14+44]
;NewDesign_driver.c,1792 :: 		pEveProgressBar = CurrentScreen->EveProgressBars;
	MOV	#50, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+46]
	MOV	W1, [W14+48]
;NewDesign_driver.c,1793 :: 		pEveToggle      = CurrentScreen->EveToggles;
	MOV	#56, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+50]
	MOV	W1, [W14+52]
;NewDesign_driver.c,1794 :: 		pEveButton      = CurrentScreen->EveButtons;
	MOV	#62, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+54]
	MOV	W1, [W14+56]
;NewDesign_driver.c,1795 :: 		pEveText        = CurrentScreen->EveTexts;
	MOV	#68, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+58]
	MOV	W1, [W14+60]
;NewDesign_driver.c,1796 :: 		pCEveText       = CurrentScreen->CEveTexts;
	MOV	#74, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+62]
	MOV	W1, [W14+64]
;NewDesign_driver.c,1797 :: 		pCEveNumber     = CurrentScreen->CEveNumbers;
	MOV	#80, W0
	ADD	W10, W0, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+66]
	MOV	W1, [W14+68]
;NewDesign_driver.c,1799 :: 		FT800_Screen_BeginUpdateCP();
	PUSH	W11
	CALL	_FT800_Screen_BeginUpdateCP
;NewDesign_driver.c,1800 :: 		FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, CurrentScreen->Color, 255);
	MOV	_CurrentScreen, W0
	MOV	[W0], W0
	MOV.B	#255, W12
	MOV	W0, W11
	MOV.B	#1, W10
	CALL	_FT800_Canvas_BrushSingleColor
	POP	W11
;NewDesign_driver.c,1801 :: 		FT800_Canvas_Tag(0);
	CLR	W10
	CALL	_FT800_Canvas_Tag
;NewDesign_driver.c,1802 :: 		FT800_Screen_Clear(_FT800_CLEAR_ALL);
	PUSH	W11
	MOV.B	#7, W10
	CALL	_FT800_Screen_Clear
	POP	W11
;NewDesign_driver.c,1804 :: 		actObjOrder = -1;
	MOV	#65535, W0
	MOV	W0, [W14+2]
;NewDesign_driver.c,1805 :: 		if (TouchS.ActObjInfo.Obj)
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO761
	GOTO	L_DrawScreenO151
L__DrawScreenO761:
;NewDesign_driver.c,1806 :: 		if (TouchS.ActObjInfo.Flags & VTFT_INT_BRING_TO_FRONT)
	MOV	#lo_addr(_TouchS+12), W0
	ZE	[W0], W0
	AND	W0, #4, W0
	CP0	W0
	BRA NZ	L__DrawScreenO762
	GOTO	L_DrawScreenO152
L__DrawScreenO762:
;NewDesign_driver.c,1807 :: 		actObjOrder = TouchS.ActObjInfo.Order;
	MOV	#lo_addr(_TouchS+11), W0
	ZE	[W0], W0
	MOV	W0, [W14+2]
L_DrawScreenO152:
L_DrawScreenO151:
;NewDesign_driver.c,1809 :: 		cOrder = 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;NewDesign_driver.c,1810 :: 		while (cOrder < CurrentScreen->ObjectsCount) {
L_DrawScreenO153:
	MOV	_CurrentScreen, W0
	ADD	W0, #6, W1
	MOV.B	[W14+0], W0
	CP.B	W0, [W1]
	BRA LTU	L__DrawScreenO763
	GOTO	L_DrawScreenO154
L__DrawScreenO763:
;NewDesign_driver.c,1811 :: 		saveOrder = cOrder;
	MOV.B	[W14+0], W0
	MOV.B	W0, [W14+1]
;NewDesign_driver.c,1812 :: 		if (pBox) {
	ADD	W14, #18, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO764
	GOTO	L_DrawScreenO155
L__DrawScreenO764:
;NewDesign_driver.c,1813 :: 		while ((*pBox)->Order == cOrder) {
L_DrawScreenO156:
	MOV	[W14+18], W0
	MOV	[W14+20], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO765
	GOTO	L_DrawScreenO157
L__DrawScreenO765:
;NewDesign_driver.c,1814 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO766
	GOTO	L_DrawScreenO158
L__DrawScreenO766:
;NewDesign_driver.c,1815 :: 		DrawBox(*pBox);
	MOV	[W14+18], W0
	MOV	[W14+20], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawBox
	POP.D	W10
L_DrawScreenO158:
;NewDesign_driver.c,1816 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1817 :: 		pBox++;
	MOV	[W14+18], W1
	MOV	[W14+20], W2
	ADD	W14, #18, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1818 :: 		cntBox--;
	MOV.B	[W14+5], W0
	DEC.B	W0
	MOV.B	W0, [W14+5]
;NewDesign_driver.c,1819 :: 		if (!cntBox) {
	BRA Z	L__DrawScreenO767
	GOTO	L_DrawScreenO159
L__DrawScreenO767:
;NewDesign_driver.c,1820 :: 		pBox = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+18]
	MOV	W1, [W14+20]
;NewDesign_driver.c,1821 :: 		break;
	GOTO	L_DrawScreenO157
;NewDesign_driver.c,1822 :: 		}
L_DrawScreenO159:
;NewDesign_driver.c,1823 :: 		}
	GOTO	L_DrawScreenO156
L_DrawScreenO157:
;NewDesign_driver.c,1824 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO768
	GOTO	L_DrawScreenO160
L__DrawScreenO768:
;NewDesign_driver.c,1825 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO160:
;NewDesign_driver.c,1826 :: 		}
L_DrawScreenO155:
;NewDesign_driver.c,1828 :: 		if (pCBox) {
	ADD	W14, #22, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO769
	GOTO	L_DrawScreenO161
L__DrawScreenO769:
;NewDesign_driver.c,1829 :: 		while ((*pCBox)->Order == cOrder) {
L_DrawScreenO162:
	MOV	[W14+22], W2
	MOV	[W14+24], W3
	MOV	W3, 50
	MOV.D	[W2], W0
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO770
	GOTO	L_DrawScreenO163
L__DrawScreenO770:
;NewDesign_driver.c,1830 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO771
	GOTO	L_DrawScreenO164
L__DrawScreenO771:
;NewDesign_driver.c,1831 :: 		DrawCBox(*pCBox);
	MOV	[W14+22], W0
	MOV	[W14+24], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.D	[W0], W10
	CALL	_DrawCBox
	POP.D	W10
L_DrawScreenO164:
;NewDesign_driver.c,1832 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1833 :: 		pCBox++;
	MOV	[W14+22], W1
	MOV	[W14+24], W2
	ADD	W14, #22, W0
	ADD	W1, #4, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1834 :: 		cntCBox--;
	MOV.B	[W14+6], W0
	DEC.B	W0
	MOV.B	W0, [W14+6]
;NewDesign_driver.c,1835 :: 		if (!cntCBox) {
	BRA Z	L__DrawScreenO772
	GOTO	L_DrawScreenO165
L__DrawScreenO772:
;NewDesign_driver.c,1836 :: 		pCBox = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+22]
	MOV	W1, [W14+24]
;NewDesign_driver.c,1837 :: 		break;
	GOTO	L_DrawScreenO163
;NewDesign_driver.c,1838 :: 		}
L_DrawScreenO165:
;NewDesign_driver.c,1839 :: 		}
	GOTO	L_DrawScreenO162
L_DrawScreenO163:
;NewDesign_driver.c,1840 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO773
	GOTO	L_DrawScreenO166
L__DrawScreenO773:
;NewDesign_driver.c,1841 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO166:
;NewDesign_driver.c,1842 :: 		}
L_DrawScreenO161:
;NewDesign_driver.c,1844 :: 		if (pBoxRound) {
	ADD	W14, #26, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO774
	GOTO	L_DrawScreenO167
L__DrawScreenO774:
;NewDesign_driver.c,1845 :: 		while ((*pBoxRound)->Order == cOrder) {
L_DrawScreenO168:
	MOV	[W14+26], W0
	MOV	[W14+28], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO775
	GOTO	L_DrawScreenO169
L__DrawScreenO775:
;NewDesign_driver.c,1846 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO776
	GOTO	L_DrawScreenO170
L__DrawScreenO776:
;NewDesign_driver.c,1847 :: 		DrawBoxRound(*pBoxRound);
	MOV	[W14+26], W0
	MOV	[W14+28], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawBoxRound
	POP.D	W10
L_DrawScreenO170:
;NewDesign_driver.c,1848 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1849 :: 		pBoxRound++;
	MOV	[W14+26], W1
	MOV	[W14+28], W2
	ADD	W14, #26, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1850 :: 		cntBoxRound--;
	MOV.B	[W14+7], W0
	DEC.B	W0
	MOV.B	W0, [W14+7]
;NewDesign_driver.c,1851 :: 		if (!cntBoxRound) {
	BRA Z	L__DrawScreenO777
	GOTO	L_DrawScreenO171
L__DrawScreenO777:
;NewDesign_driver.c,1852 :: 		pBoxRound = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+26]
	MOV	W1, [W14+28]
;NewDesign_driver.c,1853 :: 		break;
	GOTO	L_DrawScreenO169
;NewDesign_driver.c,1854 :: 		}
L_DrawScreenO171:
;NewDesign_driver.c,1855 :: 		}
	GOTO	L_DrawScreenO168
L_DrawScreenO169:
;NewDesign_driver.c,1856 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO778
	GOTO	L_DrawScreenO172
L__DrawScreenO778:
;NewDesign_driver.c,1857 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO172:
;NewDesign_driver.c,1858 :: 		}
L_DrawScreenO167:
;NewDesign_driver.c,1860 :: 		if (pCBoxRound) {
	ADD	W14, #30, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO779
	GOTO	L_DrawScreenO173
L__DrawScreenO779:
;NewDesign_driver.c,1861 :: 		while ((*pCBoxRound)->Order == cOrder) {
L_DrawScreenO174:
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	MOV	W3, 50
	MOV.D	[W2], W0
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO780
	GOTO	L_DrawScreenO175
L__DrawScreenO780:
;NewDesign_driver.c,1862 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO781
	GOTO	L_DrawScreenO176
L__DrawScreenO781:
;NewDesign_driver.c,1863 :: 		DrawCBoxRound(*pCBoxRound);
	MOV	[W14+30], W0
	MOV	[W14+32], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.D	[W0], W10
	CALL	_DrawCBoxRound
	POP.D	W10
L_DrawScreenO176:
;NewDesign_driver.c,1864 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1865 :: 		pCBoxRound++;
	MOV	[W14+30], W1
	MOV	[W14+32], W2
	ADD	W14, #30, W0
	ADD	W1, #4, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1866 :: 		cntCBoxRound--;
	MOV.B	[W14+8], W0
	DEC.B	W0
	MOV.B	W0, [W14+8]
;NewDesign_driver.c,1867 :: 		if (!cntCBoxRound) {
	BRA Z	L__DrawScreenO782
	GOTO	L_DrawScreenO177
L__DrawScreenO782:
;NewDesign_driver.c,1868 :: 		pCBoxRound = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
;NewDesign_driver.c,1869 :: 		break;
	GOTO	L_DrawScreenO175
;NewDesign_driver.c,1870 :: 		}
L_DrawScreenO177:
;NewDesign_driver.c,1871 :: 		}
	GOTO	L_DrawScreenO174
L_DrawScreenO175:
;NewDesign_driver.c,1872 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO783
	GOTO	L_DrawScreenO178
L__DrawScreenO783:
;NewDesign_driver.c,1873 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO178:
;NewDesign_driver.c,1874 :: 		}
L_DrawScreenO173:
;NewDesign_driver.c,1876 :: 		if (pLine) {
	MOV	#34, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO784
	GOTO	L_DrawScreenO179
L__DrawScreenO784:
;NewDesign_driver.c,1877 :: 		while ((*pLine)->Order == cOrder) {
L_DrawScreenO180:
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO785
	GOTO	L_DrawScreenO181
L__DrawScreenO785:
;NewDesign_driver.c,1878 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO786
	GOTO	L_DrawScreenO182
L__DrawScreenO786:
;NewDesign_driver.c,1879 :: 		DrawLine(*pLine);
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawLine
	POP.D	W10
L_DrawScreenO182:
;NewDesign_driver.c,1880 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1881 :: 		pLine++;
	MOV	[W14+34], W1
	MOV	[W14+36], W2
	MOV	#34, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1882 :: 		cntLine--;
	MOV.B	[W14+9], W0
	DEC.B	W0
	MOV.B	W0, [W14+9]
;NewDesign_driver.c,1883 :: 		if (!cntLine) {
	BRA Z	L__DrawScreenO787
	GOTO	L_DrawScreenO183
L__DrawScreenO787:
;NewDesign_driver.c,1884 :: 		pLine = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
;NewDesign_driver.c,1885 :: 		break;
	GOTO	L_DrawScreenO181
;NewDesign_driver.c,1886 :: 		}
L_DrawScreenO183:
;NewDesign_driver.c,1887 :: 		}
	GOTO	L_DrawScreenO180
L_DrawScreenO181:
;NewDesign_driver.c,1888 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO788
	GOTO	L_DrawScreenO184
L__DrawScreenO788:
;NewDesign_driver.c,1889 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO184:
;NewDesign_driver.c,1890 :: 		}
L_DrawScreenO179:
;NewDesign_driver.c,1892 :: 		if (pEveGauge) {
	MOV	#38, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO789
	GOTO	L_DrawScreenO185
L__DrawScreenO789:
;NewDesign_driver.c,1893 :: 		while ((*pEveGauge)->Order == cOrder) {
L_DrawScreenO186:
	MOV	[W14+38], W0
	MOV	[W14+40], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO790
	GOTO	L_DrawScreenO187
L__DrawScreenO790:
;NewDesign_driver.c,1894 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO791
	GOTO	L_DrawScreenO188
L__DrawScreenO791:
;NewDesign_driver.c,1895 :: 		DrawEveGauge(*pEveGauge);
	MOV	[W14+38], W0
	MOV	[W14+40], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveGauge
	POP.D	W10
L_DrawScreenO188:
;NewDesign_driver.c,1896 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1897 :: 		pEveGauge++;
	MOV	[W14+38], W1
	MOV	[W14+40], W2
	MOV	#38, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1898 :: 		cntEveGauge--;
	MOV.B	[W14+10], W0
	DEC.B	W0
	MOV.B	W0, [W14+10]
;NewDesign_driver.c,1899 :: 		if (!cntEveGauge) {
	BRA Z	L__DrawScreenO792
	GOTO	L_DrawScreenO189
L__DrawScreenO792:
;NewDesign_driver.c,1900 :: 		pEveGauge = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+38]
	MOV	W1, [W14+40]
;NewDesign_driver.c,1901 :: 		break;
	GOTO	L_DrawScreenO187
;NewDesign_driver.c,1902 :: 		}
L_DrawScreenO189:
;NewDesign_driver.c,1903 :: 		}
	GOTO	L_DrawScreenO186
L_DrawScreenO187:
;NewDesign_driver.c,1904 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO793
	GOTO	L_DrawScreenO190
L__DrawScreenO793:
;NewDesign_driver.c,1905 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO190:
;NewDesign_driver.c,1906 :: 		}
L_DrawScreenO185:
;NewDesign_driver.c,1908 :: 		if (pEveKeys) {
	MOV	#42, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO794
	GOTO	L_DrawScreenO191
L__DrawScreenO794:
;NewDesign_driver.c,1909 :: 		while ((*pEveKeys)->Order == cOrder) {
L_DrawScreenO192:
	MOV	[W14+42], W0
	MOV	[W14+44], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO795
	GOTO	L_DrawScreenO193
L__DrawScreenO795:
;NewDesign_driver.c,1910 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO796
	GOTO	L_DrawScreenO194
L__DrawScreenO796:
;NewDesign_driver.c,1911 :: 		DrawEveKeys(*pEveKeys);
	MOV	[W14+42], W0
	MOV	[W14+44], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveKeys
	POP.D	W10
L_DrawScreenO194:
;NewDesign_driver.c,1912 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1913 :: 		pEveKeys++;
	MOV	[W14+42], W1
	MOV	[W14+44], W2
	MOV	#42, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1914 :: 		cntEveKeys--;
	MOV.B	[W14+11], W0
	DEC.B	W0
	MOV.B	W0, [W14+11]
;NewDesign_driver.c,1915 :: 		if (!cntEveKeys) {
	BRA Z	L__DrawScreenO797
	GOTO	L_DrawScreenO195
L__DrawScreenO797:
;NewDesign_driver.c,1916 :: 		pEveKeys = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+42]
	MOV	W1, [W14+44]
;NewDesign_driver.c,1917 :: 		break;
	GOTO	L_DrawScreenO193
;NewDesign_driver.c,1918 :: 		}
L_DrawScreenO195:
;NewDesign_driver.c,1919 :: 		}
	GOTO	L_DrawScreenO192
L_DrawScreenO193:
;NewDesign_driver.c,1920 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO798
	GOTO	L_DrawScreenO196
L__DrawScreenO798:
;NewDesign_driver.c,1921 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO196:
;NewDesign_driver.c,1922 :: 		}
L_DrawScreenO191:
;NewDesign_driver.c,1924 :: 		if (pEveProgressBar) {
	MOV	#46, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO799
	GOTO	L_DrawScreenO197
L__DrawScreenO799:
;NewDesign_driver.c,1925 :: 		while ((*pEveProgressBar)->Order == cOrder) {
L_DrawScreenO198:
	MOV	[W14+46], W0
	MOV	[W14+48], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO800
	GOTO	L_DrawScreenO199
L__DrawScreenO800:
;NewDesign_driver.c,1926 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO801
	GOTO	L_DrawScreenO200
L__DrawScreenO801:
;NewDesign_driver.c,1927 :: 		DrawEveProgressBar(*pEveProgressBar);
	MOV	[W14+46], W0
	MOV	[W14+48], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveProgressBar
	POP.D	W10
L_DrawScreenO200:
;NewDesign_driver.c,1928 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1929 :: 		pEveProgressBar++;
	MOV	[W14+46], W1
	MOV	[W14+48], W2
	MOV	#46, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1930 :: 		cntEveProgressBar--;
	MOV.B	[W14+12], W0
	DEC.B	W0
	MOV.B	W0, [W14+12]
;NewDesign_driver.c,1931 :: 		if (!cntEveProgressBar) {
	BRA Z	L__DrawScreenO802
	GOTO	L_DrawScreenO201
L__DrawScreenO802:
;NewDesign_driver.c,1932 :: 		pEveProgressBar = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+46]
	MOV	W1, [W14+48]
;NewDesign_driver.c,1933 :: 		break;
	GOTO	L_DrawScreenO199
;NewDesign_driver.c,1934 :: 		}
L_DrawScreenO201:
;NewDesign_driver.c,1935 :: 		}
	GOTO	L_DrawScreenO198
L_DrawScreenO199:
;NewDesign_driver.c,1936 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO803
	GOTO	L_DrawScreenO202
L__DrawScreenO803:
;NewDesign_driver.c,1937 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO202:
;NewDesign_driver.c,1938 :: 		}
L_DrawScreenO197:
;NewDesign_driver.c,1940 :: 		if (pEveToggle) {
	MOV	#50, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO804
	GOTO	L_DrawScreenO203
L__DrawScreenO804:
;NewDesign_driver.c,1941 :: 		while ((*pEveToggle)->Order == cOrder) {
L_DrawScreenO204:
	MOV	[W14+50], W0
	MOV	[W14+52], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO805
	GOTO	L_DrawScreenO205
L__DrawScreenO805:
;NewDesign_driver.c,1942 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO806
	GOTO	L_DrawScreenO206
L__DrawScreenO806:
;NewDesign_driver.c,1943 :: 		DrawEveToggle(*pEveToggle);
	MOV	[W14+50], W0
	MOV	[W14+52], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveToggle
	POP.D	W10
L_DrawScreenO206:
;NewDesign_driver.c,1944 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1945 :: 		pEveToggle++;
	MOV	[W14+50], W1
	MOV	[W14+52], W2
	MOV	#50, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1946 :: 		cntEveToggle--;
	MOV.B	[W14+13], W0
	DEC.B	W0
	MOV.B	W0, [W14+13]
;NewDesign_driver.c,1947 :: 		if (!cntEveToggle) {
	BRA Z	L__DrawScreenO807
	GOTO	L_DrawScreenO207
L__DrawScreenO807:
;NewDesign_driver.c,1948 :: 		pEveToggle = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+50]
	MOV	W1, [W14+52]
;NewDesign_driver.c,1949 :: 		break;
	GOTO	L_DrawScreenO205
;NewDesign_driver.c,1950 :: 		}
L_DrawScreenO207:
;NewDesign_driver.c,1951 :: 		}
	GOTO	L_DrawScreenO204
L_DrawScreenO205:
;NewDesign_driver.c,1952 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO808
	GOTO	L_DrawScreenO208
L__DrawScreenO808:
;NewDesign_driver.c,1953 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO208:
;NewDesign_driver.c,1954 :: 		}
L_DrawScreenO203:
;NewDesign_driver.c,1956 :: 		if (pEveButton) {
	MOV	#54, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO809
	GOTO	L_DrawScreenO209
L__DrawScreenO809:
;NewDesign_driver.c,1957 :: 		while ((*pEveButton)->Order == cOrder) {
L_DrawScreenO210:
	MOV	[W14+54], W0
	MOV	[W14+56], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO810
	GOTO	L_DrawScreenO211
L__DrawScreenO810:
;NewDesign_driver.c,1958 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO811
	GOTO	L_DrawScreenO212
L__DrawScreenO811:
;NewDesign_driver.c,1959 :: 		DrawEveButton(*pEveButton);
	MOV	[W14+54], W0
	MOV	[W14+56], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveButton
	POP.D	W10
L_DrawScreenO212:
;NewDesign_driver.c,1960 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1961 :: 		pEveButton++;
	MOV	[W14+54], W1
	MOV	[W14+56], W2
	MOV	#54, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1962 :: 		cntEveButton--;
	MOV.B	[W14+14], W0
	DEC.B	W0
	MOV.B	W0, [W14+14]
;NewDesign_driver.c,1963 :: 		if (!cntEveButton) {
	BRA Z	L__DrawScreenO812
	GOTO	L_DrawScreenO213
L__DrawScreenO812:
;NewDesign_driver.c,1964 :: 		pEveButton = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+54]
	MOV	W1, [W14+56]
;NewDesign_driver.c,1965 :: 		break;
	GOTO	L_DrawScreenO211
;NewDesign_driver.c,1966 :: 		}
L_DrawScreenO213:
;NewDesign_driver.c,1967 :: 		}
	GOTO	L_DrawScreenO210
L_DrawScreenO211:
;NewDesign_driver.c,1968 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO813
	GOTO	L_DrawScreenO214
L__DrawScreenO813:
;NewDesign_driver.c,1969 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO214:
;NewDesign_driver.c,1970 :: 		}
L_DrawScreenO209:
;NewDesign_driver.c,1972 :: 		if (pEveText) {
	MOV	#58, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO814
	GOTO	L_DrawScreenO215
L__DrawScreenO814:
;NewDesign_driver.c,1973 :: 		while ((*pEveText)->Order == cOrder) {
L_DrawScreenO216:
	MOV	[W14+58], W0
	MOV	[W14+60], W1
	MOV	W1, 50
	MOV	[W0], W0
	INC2	W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO815
	GOTO	L_DrawScreenO217
L__DrawScreenO815:
;NewDesign_driver.c,1974 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO816
	GOTO	L_DrawScreenO218
L__DrawScreenO816:
;NewDesign_driver.c,1975 :: 		DrawEveText(*pEveText);
	MOV	[W14+58], W0
	MOV	[W14+60], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV	[W0], W10
	CALL	_DrawEveText
	POP.D	W10
L_DrawScreenO218:
;NewDesign_driver.c,1976 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1977 :: 		pEveText++;
	MOV	[W14+58], W1
	MOV	[W14+60], W2
	MOV	#58, W0
	ADD	W14, W0, W0
	ADD	W1, #2, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1978 :: 		cntEveText--;
	MOV.B	[W14+15], W0
	DEC.B	W0
	MOV.B	W0, [W14+15]
;NewDesign_driver.c,1979 :: 		if (!cntEveText) {
	BRA Z	L__DrawScreenO817
	GOTO	L_DrawScreenO219
L__DrawScreenO817:
;NewDesign_driver.c,1980 :: 		pEveText = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+58]
	MOV	W1, [W14+60]
;NewDesign_driver.c,1981 :: 		break;
	GOTO	L_DrawScreenO217
;NewDesign_driver.c,1982 :: 		}
L_DrawScreenO219:
;NewDesign_driver.c,1983 :: 		}
	GOTO	L_DrawScreenO216
L_DrawScreenO217:
;NewDesign_driver.c,1984 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO818
	GOTO	L_DrawScreenO220
L__DrawScreenO818:
;NewDesign_driver.c,1985 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO220:
;NewDesign_driver.c,1986 :: 		}
L_DrawScreenO215:
;NewDesign_driver.c,1988 :: 		if (pCEveText) {
	MOV	#62, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO819
	GOTO	L_DrawScreenO221
L__DrawScreenO819:
;NewDesign_driver.c,1989 :: 		while ((*pCEveText)->Order == cOrder) {
L_DrawScreenO222:
	MOV	[W14+62], W2
	MOV	[W14+64], W3
	MOV	W3, 50
	MOV.D	[W2], W0
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO820
	GOTO	L_DrawScreenO223
L__DrawScreenO820:
;NewDesign_driver.c,1990 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO821
	GOTO	L_DrawScreenO224
L__DrawScreenO821:
;NewDesign_driver.c,1991 :: 		DrawCEveText(*pCEveText);
	MOV	[W14+62], W0
	MOV	[W14+64], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.D	[W0], W10
	CALL	_DrawCEveText
	POP.D	W10
L_DrawScreenO224:
;NewDesign_driver.c,1992 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,1993 :: 		pCEveText++;
	MOV	[W14+62], W1
	MOV	[W14+64], W2
	MOV	#62, W0
	ADD	W14, W0, W0
	ADD	W1, #4, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,1994 :: 		cntCEveText--;
	MOV.B	[W14+16], W0
	DEC.B	W0
	MOV.B	W0, [W14+16]
;NewDesign_driver.c,1995 :: 		if (!cntCEveText) {
	BRA Z	L__DrawScreenO822
	GOTO	L_DrawScreenO225
L__DrawScreenO822:
;NewDesign_driver.c,1996 :: 		pCEveText = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+62]
	MOV	W1, [W14+64]
;NewDesign_driver.c,1997 :: 		break;
	GOTO	L_DrawScreenO223
;NewDesign_driver.c,1998 :: 		}
L_DrawScreenO225:
;NewDesign_driver.c,1999 :: 		}
	GOTO	L_DrawScreenO222
L_DrawScreenO223:
;NewDesign_driver.c,2000 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO823
	GOTO	L_DrawScreenO226
L__DrawScreenO823:
;NewDesign_driver.c,2001 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO226:
;NewDesign_driver.c,2002 :: 		}
L_DrawScreenO221:
;NewDesign_driver.c,2004 :: 		if (pCEveNumber) {
	MOV	#66, W1
	ADD	W14, W1, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO824
	GOTO	L_DrawScreenO227
L__DrawScreenO824:
;NewDesign_driver.c,2005 :: 		while ((*pCEveNumber)->Order == cOrder) {
L_DrawScreenO228:
	MOV	[W14+66], W2
	MOV	[W14+68], W3
	MOV	W3, 50
	MOV.D	[W2], W0
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA Z	L__DrawScreenO825
	GOTO	L_DrawScreenO229
L__DrawScreenO825:
;NewDesign_driver.c,2006 :: 		if (actObjOrder != cOrder) // draw pressed object at the end
	ADD	W14, #0, W0
	ZE	[W0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA NZ	L__DrawScreenO826
	GOTO	L_DrawScreenO230
L__DrawScreenO826:
;NewDesign_driver.c,2007 :: 		DrawCEveNumber(*pCEveNumber);
	MOV	[W14+66], W0
	MOV	[W14+68], W1
	MOV	W1, 50
	PUSH.D	W10
	MOV.D	[W0], W10
	CALL	_DrawCEveNumber
	POP.D	W10
L_DrawScreenO230:
;NewDesign_driver.c,2008 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,2009 :: 		pCEveNumber++;
	MOV	[W14+66], W1
	MOV	[W14+68], W2
	MOV	#66, W0
	ADD	W14, W0, W0
	ADD	W1, #4, [W0++]
	ADDC	W2, #0, [W0--]
;NewDesign_driver.c,2010 :: 		cntCEveNumber--;
	MOV.B	[W14+17], W0
	DEC.B	W0
	MOV.B	W0, [W14+17]
;NewDesign_driver.c,2011 :: 		if (!cntCEveNumber) {
	BRA Z	L__DrawScreenO827
	GOTO	L_DrawScreenO231
L__DrawScreenO827:
;NewDesign_driver.c,2012 :: 		pCEveNumber = 0;
	CLR	W0
	CLR	W1
	MOV	W0, [W14+66]
	MOV	W1, [W14+68]
;NewDesign_driver.c,2013 :: 		break;
	GOTO	L_DrawScreenO229
;NewDesign_driver.c,2014 :: 		}
L_DrawScreenO231:
;NewDesign_driver.c,2015 :: 		}
	GOTO	L_DrawScreenO228
L_DrawScreenO229:
;NewDesign_driver.c,2016 :: 		if (saveOrder != cOrder)
	MOV.B	[W14+1], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	BRA NZ	L__DrawScreenO828
	GOTO	L_DrawScreenO232
L__DrawScreenO828:
;NewDesign_driver.c,2017 :: 		continue;
	GOTO	L_DrawScreenO153
L_DrawScreenO232:
;NewDesign_driver.c,2018 :: 		}
L_DrawScreenO227:
;NewDesign_driver.c,2020 :: 		cOrder++;
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;NewDesign_driver.c,2021 :: 		}
	GOTO	L_DrawScreenO153
L_DrawScreenO154:
;NewDesign_driver.c,2024 :: 		if (TouchS.ActObjInfo.Obj)
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L__DrawScreenO829
	GOTO	L_DrawScreenO233
L__DrawScreenO829:
;NewDesign_driver.c,2025 :: 		DrawObject(TouchS.ActObjInfo.Obj, TouchS.ActObjInfo.Type);
	MOV	#lo_addr(_TouchS+10), W0
	PUSH.D	W10
	MOV.B	[W0], W12
	MOV	_TouchS+6, W10
	MOV	_TouchS+8, W11
	CALL	_DrawObject
	POP.D	W10
L_DrawScreenO233:
;NewDesign_driver.c,2027 :: 		FT800_Screen_EndUpdate();
	PUSH.D	W10
	CALL	_FT800_Screen_EndUpdate
;NewDesign_driver.c,2029 :: 		FT800_Screen_Show();
	CALL	_FT800_Screen_Show
	POP.D	W10
;NewDesign_driver.c,2032 :: 		if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_FADE) {
	BTSS	W11, #2
	GOTO	L_DrawScreenO234
;NewDesign_driver.c,2033 :: 		FT800_PWM_FadeIn(0, pwmDuty, 1, 3);
	PUSH.D	W10
	MOV	#3, W13
	MOV.B	#1, W12
	MOV.B	[W14+4], W11
	CLR	W10
	CALL	_FT800_PWM_FadeIn
	POP.D	W10
;NewDesign_driver.c,2034 :: 		}
	GOTO	L_DrawScreenO235
L_DrawScreenO234:
;NewDesign_driver.c,2035 :: 		else if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_OFF) {
	BTSS	W11, #3
	GOTO	L_DrawScreenO236
;NewDesign_driver.c,2036 :: 		FT800_PWM_Duty(pwmDuty);
	PUSH.D	W10
	MOV.B	[W14+4], W10
	CALL	_FT800_PWM_Duty
	POP.D	W10
;NewDesign_driver.c,2037 :: 		}
L_DrawScreenO236:
L_DrawScreenO235:
;NewDesign_driver.c,2039 :: 		}
L_end_DrawScreenO:
	POP	W13
	POP	W12
	POP	W10
	ULNK
	RETURN
; end of _DrawScreenO

_DrawScreen:

;NewDesign_driver.c,2041 :: 		void DrawScreen(TScreen *aScreen) {
;NewDesign_driver.c,2042 :: 		if (aScreen != CurrentScreen)
	PUSH	W11
	MOV	#lo_addr(_CurrentScreen), W0
	CP	W10, [W0]
	BRA NZ	L__DrawScreen831
	GOTO	L_DrawScreen237
L__DrawScreen831:
;NewDesign_driver.c,2043 :: 		DrawScreenO(aScreen, VTFT_LOAD_RES_ALL | VTFT_DISPLAY_EFF_LIGHTS_FADE);
	MOV.B	#7, W11
	CALL	_DrawScreenO
	GOTO	L_DrawScreen238
L_DrawScreen237:
;NewDesign_driver.c,2045 :: 		DrawScreenO(aScreen, VTFT_LOAD_RES_NONE);
	CLR	W11
	CALL	_DrawScreenO
L_DrawScreen238:
;NewDesign_driver.c,2046 :: 		}
L_end_DrawScreen:
	POP	W11
	RETURN
; end of _DrawScreen

_GetActiveObjectByXY:

;NewDesign_driver.c,2048 :: 		char GetActiveObjectByXY(int X, int Y, TObjInfo *AObjInfo) {
;NewDesign_driver.c,2067 :: 		memset(AObjInfo, 0, sizeof(TObjInfo));
	PUSH	W12
	PUSH.D	W10
	CLR	W11
	MOV	W12, W10
	MOV	#12, W12
	CALL	_memset
	POP.D	W10
	POP	W12
;NewDesign_driver.c,2071 :: 		hiOrder = -1;
; hiOrder start address is: 10 (W5)
	MOV	#65535, W5
;NewDesign_driver.c,2074 :: 		i    = CurrentScreen->BoxesCount;
	MOV	_CurrentScreen, W0
	ADD	W0, #7, W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2075 :: 		ptrO = CurrentScreen->Boxes+CurrentScreen->BoxesCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #8, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2076 :: 		while (i--) {
L_GetActiveObjectByXY239:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY833
	GOTO	L__GetActiveObjectByXY598
L__GetActiveObjectByXY833:
; i end address is: 6 (W3)
;NewDesign_driver.c,2077 :: 		pBox = (TBox *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pBox start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2078 :: 		if (pBox->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY834
	GOTO	L_GetActiveObjectByXY241
L__GetActiveObjectByXY834:
; pBox end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2079 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY240
L_GetActiveObjectByXY241:
;NewDesign_driver.c,2080 :: 		if (pBox->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pBox start address is: 12 (W6)
	ADD	W6, #27, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY835
	GOTO	L_GetActiveObjectByXY242
L__GetActiveObjectByXY835:
;NewDesign_driver.c,2081 :: 		if ((pBox->Left <= X) && (pBox->Left+pBox->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY836
	GOTO	L__GetActiveObjectByXY550
L__GetActiveObjectByXY836:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY837
	GOTO	L__GetActiveObjectByXY549
L__GetActiveObjectByXY837:
;NewDesign_driver.c,2082 :: 		(pBox->Top  <= Y) && (pBox->Top+pBox->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY838
	GOTO	L__GetActiveObjectByXY548
L__GetActiveObjectByXY838:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY839
	GOTO	L__GetActiveObjectByXY547
L__GetActiveObjectByXY839:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY543:
;NewDesign_driver.c,2083 :: 		AObjInfo->Obj   = (TPointer)pBox;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2084 :: 		AObjInfo->Type  = VTFT_OT_BOX;
	ADD	W12, #4, W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2085 :: 		AObjInfo->Order = pBox->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2086 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2087 :: 		if ((pBox->Press_Color != pBox->Color) ||
	ADD	W6, #20, W0
	MOV	[W0], W1
	ADD	W6, #18, W0
	MOV	[W0], W0
;NewDesign_driver.c,2089 :: 		(pBox->Press_ColorTo != pBox->ColorTo)))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByXY840
	GOTO	L__GetActiveObjectByXY546
L__GetActiveObjectByXY840:
;NewDesign_driver.c,2088 :: 		((pBox->Gradient != _FT800_BRUSH_GR_NONE) &&
	ADD	W6, #26, W0
;NewDesign_driver.c,2089 :: 		(pBox->Press_ColorTo != pBox->ColorTo)))
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__GetActiveObjectByXY841
	GOTO	L__GetActiveObjectByXY545
L__GetActiveObjectByXY841:
	ADD	W6, #24, W0
	MOV	[W0], W1
	ADD	W6, #22, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByXY842
	GOTO	L__GetActiveObjectByXY544
L__GetActiveObjectByXY842:
	GOTO	L__GetActiveObjectByXY541
L__GetActiveObjectByXY545:
L__GetActiveObjectByXY544:
	GOTO	L_GetActiveObjectByXY250
L__GetActiveObjectByXY541:
L__GetActiveObjectByXY546:
;NewDesign_driver.c,2090 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY250:
;NewDesign_driver.c,2092 :: 		hiOrder         = pBox->Order;
	ADD	W6, #2, W0
; pBox end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2094 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY240
;NewDesign_driver.c,2081 :: 		if ((pBox->Left <= X) && (pBox->Left+pBox->Width-1 >= X) &&
L__GetActiveObjectByXY550:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY549:
;NewDesign_driver.c,2082 :: 		(pBox->Top  <= Y) && (pBox->Top+pBox->Height-1 >= Y)) {
L__GetActiveObjectByXY548:
L__GetActiveObjectByXY547:
;NewDesign_driver.c,2096 :: 		}
L_GetActiveObjectByXY242:
;NewDesign_driver.c,2097 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2098 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY239
L__GetActiveObjectByXY598:
;NewDesign_driver.c,2076 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2098 :: 		}
L_GetActiveObjectByXY240:
;NewDesign_driver.c,2101 :: 		i    = CurrentScreen->CBoxesCount;
; hiOrder start address is: 10 (W5)
	MOV	_CurrentScreen, W0
	ADD	W0, #12, W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2102 :: 		ptrCO = CurrentScreen->CBoxes+CurrentScreen->CBoxesCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #14, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH	W1
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
; ptrCO end address is: 0 (W0)
	MOV	W5, W3
	MOV	W0, W5
	MOV.B	W6, W1
	POP	W6
;NewDesign_driver.c,2103 :: 		while (i--) {
L_GetActiveObjectByXY251:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; i start address is: 2 (W1)
; hiOrder start address is: 6 (W3)
	MOV.B	W1, W0
; i start address is: 8 (W4)
	SUB.B	W1, #1, W4
; i end address is: 2 (W1)
; i end address is: 8 (W4)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY843
	GOTO	L__GetActiveObjectByXY599
L__GetActiveObjectByXY843:
; i end address is: 8 (W4)
;NewDesign_driver.c,2104 :: 		pCBox = (TCBox *)(*ptrCO);
; i start address is: 8 (W4)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCBox start address is: 14 (W7)
	MOV	W0, W7
	MOV	W1, W8
;NewDesign_driver.c,2105 :: 		if (pCBox->Order < hiOrder)
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W3
	BRA LT	L__GetActiveObjectByXY844
	GOTO	L_GetActiveObjectByXY253
L__GetActiveObjectByXY844:
; pCBox end address is: 14 (W7)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2106 :: 		break;
	MOV	W3, W5
	GOTO	L_GetActiveObjectByXY252
L_GetActiveObjectByXY253:
;NewDesign_driver.c,2107 :: 		if (pCBox->Active) {
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; pCBox start address is: 14 (W7)
	ADD	W7, #27, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY845
	GOTO	L_GetActiveObjectByXY254
L__GetActiveObjectByXY845:
;NewDesign_driver.c,2108 :: 		if ((pCBox->Left <= X) && (pCBox->Left+pCBox->Width-1 >= X) &&
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY846
	GOTO	L__GetActiveObjectByXY557
L__GetActiveObjectByXY846:
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #10, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY847
	GOTO	L__GetActiveObjectByXY556
L__GetActiveObjectByXY847:
;NewDesign_driver.c,2109 :: 		(pCBox->Top  <= Y) && (pCBox->Top+pCBox->Height-1 >= Y)) {
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY848
	GOTO	L__GetActiveObjectByXY555
L__GetActiveObjectByXY848:
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #12, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY849
	GOTO	L__GetActiveObjectByXY554
L__GetActiveObjectByXY849:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
L__GetActiveObjectByXY540:
;NewDesign_driver.c,2110 :: 		AObjInfo->Obj   = (TPointer)pCBox;
	MOV	W7, [W12++]
	MOV	W8, [W12--]
;NewDesign_driver.c,2111 :: 		AObjInfo->Type  = VTFT_OT_CBOX;
	ADD	W12, #4, W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2112 :: 		AObjInfo->Order = pCBox->Order;
	ADD	W12, #5, W2
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2113 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2114 :: 		if ((pCBox->Press_Color != pCBox->Color) ||
	ADD	W7, #20, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #18, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
;NewDesign_driver.c,2116 :: 		(pCBox->Press_ColorTo != pCBox->ColorTo)))
	CP	W2, W0
	BRA Z	L__GetActiveObjectByXY850
	GOTO	L__GetActiveObjectByXY553
L__GetActiveObjectByXY850:
;NewDesign_driver.c,2115 :: 		((pCBox->Gradient != _FT800_BRUSH_GR_NONE) &&
	ADD	W7, #26, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
;NewDesign_driver.c,2116 :: 		(pCBox->Press_ColorTo != pCBox->ColorTo)))
	CP.B	W0, #0
	BRA NZ	L__GetActiveObjectByXY851
	GOTO	L__GetActiveObjectByXY552
L__GetActiveObjectByXY851:
	ADD	W7, #24, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #22, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W2, W0
	BRA NZ	L__GetActiveObjectByXY852
	GOTO	L__GetActiveObjectByXY551
L__GetActiveObjectByXY852:
	GOTO	L__GetActiveObjectByXY538
L__GetActiveObjectByXY552:
L__GetActiveObjectByXY551:
	GOTO	L_GetActiveObjectByXY262
L__GetActiveObjectByXY538:
L__GetActiveObjectByXY553:
;NewDesign_driver.c,2117 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY262:
;NewDesign_driver.c,2119 :: 		hiOrder         = pCBox->Order;
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
; pCBox end address is: 14 (W7)
	MOV	W1, 50
	MOV.B	[W0], W0
; hiOrder start address is: 10 (W5)
	ZE	W0, W5
;NewDesign_driver.c,2121 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY252
;NewDesign_driver.c,2108 :: 		if ((pCBox->Left <= X) && (pCBox->Left+pCBox->Width-1 >= X) &&
L__GetActiveObjectByXY557:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
L__GetActiveObjectByXY556:
;NewDesign_driver.c,2109 :: 		(pCBox->Top  <= Y) && (pCBox->Top+pCBox->Height-1 >= Y)) {
L__GetActiveObjectByXY555:
L__GetActiveObjectByXY554:
;NewDesign_driver.c,2123 :: 		}
L_GetActiveObjectByXY254:
;NewDesign_driver.c,2124 :: 		ptrCO--;
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2125 :: 		}
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
	MOV.B	W4, W1
	GOTO	L_GetActiveObjectByXY251
L__GetActiveObjectByXY599:
;NewDesign_driver.c,2103 :: 		while (i--) {
	MOV	W3, W5
;NewDesign_driver.c,2125 :: 		}
L_GetActiveObjectByXY252:
;NewDesign_driver.c,2128 :: 		i    = CurrentScreen->Boxes_RoundCount;
; hiOrder start address is: 10 (W5)
	MOV	_CurrentScreen, W0
	ADD	W0, #18, W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2129 :: 		ptrO = CurrentScreen->Boxes_Round+CurrentScreen->Boxes_RoundCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #20, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2130 :: 		while (i--) {
L_GetActiveObjectByXY263:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY853
	GOTO	L__GetActiveObjectByXY600
L__GetActiveObjectByXY853:
; i end address is: 6 (W3)
;NewDesign_driver.c,2131 :: 		pBoxRound = (TBox_Round *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pBoxRound start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2132 :: 		if (pBoxRound->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY854
	GOTO	L_GetActiveObjectByXY265
L__GetActiveObjectByXY854:
; pBoxRound end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2133 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY264
L_GetActiveObjectByXY265:
;NewDesign_driver.c,2134 :: 		if (pBoxRound->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pBoxRound start address is: 12 (W6)
	ADD	W6, #23, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY855
	GOTO	L_GetActiveObjectByXY266
L__GetActiveObjectByXY855:
;NewDesign_driver.c,2135 :: 		if ((pBoxRound->Left <= X) && (pBoxRound->Left+pBoxRound->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY856
	GOTO	L__GetActiveObjectByXY561
L__GetActiveObjectByXY856:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY857
	GOTO	L__GetActiveObjectByXY560
L__GetActiveObjectByXY857:
;NewDesign_driver.c,2136 :: 		(pBoxRound->Top  <= Y) && (pBoxRound->Top+pBoxRound->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY858
	GOTO	L__GetActiveObjectByXY559
L__GetActiveObjectByXY858:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY859
	GOTO	L__GetActiveObjectByXY558
L__GetActiveObjectByXY859:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY537:
;NewDesign_driver.c,2137 :: 		AObjInfo->Obj   = (TPointer)pBoxRound;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2138 :: 		AObjInfo->Type  = VTFT_OT_BOXROUND;
	ADD	W12, #4, W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2139 :: 		AObjInfo->Order = pBoxRound->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2140 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2141 :: 		if (pBoxRound->Press_Color != pBoxRound->Color)
	ADD	W6, #20, W0
	MOV	[W0], W1
	ADD	W6, #18, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByXY860
	GOTO	L_GetActiveObjectByXY270
L__GetActiveObjectByXY860:
;NewDesign_driver.c,2142 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY270:
;NewDesign_driver.c,2144 :: 		hiOrder         = pBoxRound->Order;
	ADD	W6, #2, W0
; pBoxRound end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2146 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY264
;NewDesign_driver.c,2135 :: 		if ((pBoxRound->Left <= X) && (pBoxRound->Left+pBoxRound->Width-1 >= X) &&
L__GetActiveObjectByXY561:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY560:
;NewDesign_driver.c,2136 :: 		(pBoxRound->Top  <= Y) && (pBoxRound->Top+pBoxRound->Height-1 >= Y)) {
L__GetActiveObjectByXY559:
L__GetActiveObjectByXY558:
;NewDesign_driver.c,2148 :: 		}
L_GetActiveObjectByXY266:
;NewDesign_driver.c,2149 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2150 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY263
L__GetActiveObjectByXY600:
;NewDesign_driver.c,2130 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2150 :: 		}
L_GetActiveObjectByXY264:
;NewDesign_driver.c,2153 :: 		i    = CurrentScreen->CBoxes_RoundCount;
; hiOrder start address is: 10 (W5)
	MOV	_CurrentScreen, W0
	ADD	W0, #24, W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2154 :: 		ptrCO = CurrentScreen->CBoxes_Round+CurrentScreen->CBoxes_RoundCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #26, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH	W1
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
; ptrCO end address is: 0 (W0)
	MOV	W5, W3
	MOV	W0, W5
	MOV.B	W6, W1
	POP	W6
;NewDesign_driver.c,2155 :: 		while (i--) {
L_GetActiveObjectByXY271:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; i start address is: 2 (W1)
; hiOrder start address is: 6 (W3)
	MOV.B	W1, W0
; i start address is: 8 (W4)
	SUB.B	W1, #1, W4
; i end address is: 2 (W1)
; i end address is: 8 (W4)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY861
	GOTO	L__GetActiveObjectByXY601
L__GetActiveObjectByXY861:
; i end address is: 8 (W4)
;NewDesign_driver.c,2156 :: 		pCBoxRound = (TCBox_Round *)(*ptrCO);
; i start address is: 8 (W4)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCBoxRound start address is: 14 (W7)
	MOV	W0, W7
	MOV	W1, W8
;NewDesign_driver.c,2157 :: 		if (pCBoxRound->Order < hiOrder)
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W3
	BRA LT	L__GetActiveObjectByXY862
	GOTO	L_GetActiveObjectByXY273
L__GetActiveObjectByXY862:
; pCBoxRound end address is: 14 (W7)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2158 :: 		break;
	MOV	W3, W5
	GOTO	L_GetActiveObjectByXY272
L_GetActiveObjectByXY273:
;NewDesign_driver.c,2159 :: 		if (pCBoxRound->Active) {
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; pCBoxRound start address is: 14 (W7)
	ADD	W7, #23, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY863
	GOTO	L_GetActiveObjectByXY274
L__GetActiveObjectByXY863:
;NewDesign_driver.c,2160 :: 		if ((pCBoxRound->Left <= X) && (pCBoxRound->Left+pCBoxRound->Width-1 >= X) &&
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY864
	GOTO	L__GetActiveObjectByXY565
L__GetActiveObjectByXY864:
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #10, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY865
	GOTO	L__GetActiveObjectByXY564
L__GetActiveObjectByXY865:
;NewDesign_driver.c,2161 :: 		(pCBoxRound->Top  <= Y) && (pCBoxRound->Top+pCBoxRound->Height-1 >= Y)) {
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY866
	GOTO	L__GetActiveObjectByXY563
L__GetActiveObjectByXY866:
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #12, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY867
	GOTO	L__GetActiveObjectByXY562
L__GetActiveObjectByXY867:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
L__GetActiveObjectByXY536:
;NewDesign_driver.c,2162 :: 		AObjInfo->Obj   = (TPointer)pCBoxRound;
	MOV	W7, [W12++]
	MOV	W8, [W12--]
;NewDesign_driver.c,2163 :: 		AObjInfo->Type  = VTFT_OT_CBOXROUND;
	ADD	W12, #4, W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2164 :: 		AObjInfo->Order = pCBoxRound->Order;
	ADD	W12, #5, W2
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2165 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2166 :: 		if (pCBoxRound->Press_Color != pCBoxRound->Color)
	ADD	W7, #20, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #18, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W2, W0
	BRA NZ	L__GetActiveObjectByXY868
	GOTO	L_GetActiveObjectByXY278
L__GetActiveObjectByXY868:
;NewDesign_driver.c,2167 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY278:
;NewDesign_driver.c,2169 :: 		hiOrder         = pCBoxRound->Order;
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
; pCBoxRound end address is: 14 (W7)
	MOV	W1, 50
	MOV.B	[W0], W0
; hiOrder start address is: 10 (W5)
	ZE	W0, W5
;NewDesign_driver.c,2171 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY272
;NewDesign_driver.c,2160 :: 		if ((pCBoxRound->Left <= X) && (pCBoxRound->Left+pCBoxRound->Width-1 >= X) &&
L__GetActiveObjectByXY565:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
L__GetActiveObjectByXY564:
;NewDesign_driver.c,2161 :: 		(pCBoxRound->Top  <= Y) && (pCBoxRound->Top+pCBoxRound->Height-1 >= Y)) {
L__GetActiveObjectByXY563:
L__GetActiveObjectByXY562:
;NewDesign_driver.c,2173 :: 		}
L_GetActiveObjectByXY274:
;NewDesign_driver.c,2174 :: 		ptrCO--;
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2175 :: 		}
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
	MOV.B	W4, W1
	GOTO	L_GetActiveObjectByXY271
L__GetActiveObjectByXY601:
;NewDesign_driver.c,2155 :: 		while (i--) {
	MOV	W3, W5
;NewDesign_driver.c,2175 :: 		}
L_GetActiveObjectByXY272:
;NewDesign_driver.c,2178 :: 		i    = CurrentScreen->EveGaugesCount;
; hiOrder start address is: 10 (W5)
	MOV	#36, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2179 :: 		ptrO = CurrentScreen->EveGauges+CurrentScreen->EveGaugesCount-1;
	MOV	#38, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2180 :: 		while (i--) {
L_GetActiveObjectByXY279:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY869
	GOTO	L__GetActiveObjectByXY602
L__GetActiveObjectByXY869:
; i end address is: 6 (W3)
;NewDesign_driver.c,2181 :: 		pEveGauge = (TEveGauge *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pEveGauge start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2182 :: 		if (pEveGauge->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY870
	GOTO	L_GetActiveObjectByXY281
L__GetActiveObjectByXY870:
; pEveGauge end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2183 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY280
L_GetActiveObjectByXY281:
;NewDesign_driver.c,2184 :: 		if (pEveGauge->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pEveGauge start address is: 12 (W6)
	ADD	W6, #30, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY871
	GOTO	L_GetActiveObjectByXY282
L__GetActiveObjectByXY871:
;NewDesign_driver.c,2186 :: 		if ((pEveGauge->Left <= X) && (pEveGauge->Left+pEveGauge->Radius*2-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY872
	GOTO	L__GetActiveObjectByXY569
L__GetActiveObjectByXY872:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY873
	GOTO	L__GetActiveObjectByXY568
L__GetActiveObjectByXY873:
;NewDesign_driver.c,2187 :: 		(pEveGauge->Top  <= Y) && (pEveGauge->Top+pEveGauge->Radius*2-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY874
	GOTO	L__GetActiveObjectByXY567
L__GetActiveObjectByXY874:
	ADD	W6, #8, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	SL	W0, #1, W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY875
	GOTO	L__GetActiveObjectByXY566
L__GetActiveObjectByXY875:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY535:
;NewDesign_driver.c,2188 :: 		AObjInfo->Obj   = (TPointer)pEveGauge;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2189 :: 		AObjInfo->Type  = VTFT_OT_EVEGAUGE;
	ADD	W12, #4, W1
	MOV.B	#25, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2190 :: 		AObjInfo->Order = pEveGauge->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2191 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2192 :: 		if (pEveGauge->Press_Color != pEveGauge->Color)
	ADD	W6, #18, W0
	MOV	[W0], W1
	ADD	W6, #16, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByXY876
	GOTO	L_GetActiveObjectByXY286
L__GetActiveObjectByXY876:
;NewDesign_driver.c,2193 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY286:
;NewDesign_driver.c,2195 :: 		hiOrder         = pEveGauge->Order;
	ADD	W6, #2, W0
; pEveGauge end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2197 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY280
;NewDesign_driver.c,2186 :: 		if ((pEveGauge->Left <= X) && (pEveGauge->Left+pEveGauge->Radius*2-1 >= X) &&
L__GetActiveObjectByXY569:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY568:
;NewDesign_driver.c,2187 :: 		(pEveGauge->Top  <= Y) && (pEveGauge->Top+pEveGauge->Radius*2-1 >= Y)) {
L__GetActiveObjectByXY567:
L__GetActiveObjectByXY566:
;NewDesign_driver.c,2199 :: 		}
L_GetActiveObjectByXY282:
;NewDesign_driver.c,2200 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2201 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY279
L__GetActiveObjectByXY602:
;NewDesign_driver.c,2180 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2201 :: 		}
L_GetActiveObjectByXY280:
;NewDesign_driver.c,2204 :: 		i    = CurrentScreen->EveKeysCount;
; hiOrder start address is: 10 (W5)
	MOV	#42, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2205 :: 		ptrO = CurrentScreen->EveKeys+CurrentScreen->EveKeysCount-1;
	MOV	#44, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2206 :: 		while (i--) {
L_GetActiveObjectByXY287:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY877
	GOTO	L__GetActiveObjectByXY603
L__GetActiveObjectByXY877:
; i end address is: 6 (W3)
;NewDesign_driver.c,2207 :: 		pEveKeys = (TEveKeys *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pEveKeys start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2208 :: 		if (pEveKeys->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY878
	GOTO	L_GetActiveObjectByXY289
L__GetActiveObjectByXY878:
; pEveKeys end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2209 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY288
L_GetActiveObjectByXY289:
;NewDesign_driver.c,2210 :: 		if (pEveKeys->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pEveKeys start address is: 12 (W6)
	MOV	#38, W0
	ADD	W6, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY879
	GOTO	L_GetActiveObjectByXY290
L__GetActiveObjectByXY879:
;NewDesign_driver.c,2211 :: 		if ((pEveKeys->Left <= X) && (pEveKeys->Left+pEveKeys->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY880
	GOTO	L__GetActiveObjectByXY575
L__GetActiveObjectByXY880:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY881
	GOTO	L__GetActiveObjectByXY574
L__GetActiveObjectByXY881:
;NewDesign_driver.c,2212 :: 		(pEveKeys->Top  <= Y) && (pEveKeys->Top+pEveKeys->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY882
	GOTO	L__GetActiveObjectByXY573
L__GetActiveObjectByXY882:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY883
	GOTO	L__GetActiveObjectByXY572
L__GetActiveObjectByXY883:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY534:
;NewDesign_driver.c,2213 :: 		AObjInfo->Obj   = (TPointer)pEveKeys;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2214 :: 		AObjInfo->Type  = VTFT_OT_EVEKEYS;
	ADD	W12, #4, W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2215 :: 		AObjInfo->Order = pEveKeys->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2216 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2217 :: 		if ((pEveKeys->Press_Color != pEveKeys->Color) ||
	ADD	W6, #16, W0
	MOV	[W0], W1
	ADD	W6, #14, W0
	MOV	[W0], W0
;NewDesign_driver.c,2218 :: 		(pEveKeys->Press_ColorTo != pEveKeys->ColorTo))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByXY884
	GOTO	L__GetActiveObjectByXY571
L__GetActiveObjectByXY884:
	ADD	W6, #20, W0
	MOV	[W0], W1
	ADD	W6, #18, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA Z	L__GetActiveObjectByXY885
	GOTO	L__GetActiveObjectByXY570
L__GetActiveObjectByXY885:
	GOTO	L_GetActiveObjectByXY296
L__GetActiveObjectByXY571:
L__GetActiveObjectByXY570:
;NewDesign_driver.c,2219 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY296:
;NewDesign_driver.c,2221 :: 		hiOrder         = pEveKeys->Order;
	ADD	W6, #2, W0
; pEveKeys end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2223 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY288
;NewDesign_driver.c,2211 :: 		if ((pEveKeys->Left <= X) && (pEveKeys->Left+pEveKeys->Width-1 >= X) &&
L__GetActiveObjectByXY575:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY574:
;NewDesign_driver.c,2212 :: 		(pEveKeys->Top  <= Y) && (pEveKeys->Top+pEveKeys->Height-1 >= Y)) {
L__GetActiveObjectByXY573:
L__GetActiveObjectByXY572:
;NewDesign_driver.c,2225 :: 		}
L_GetActiveObjectByXY290:
;NewDesign_driver.c,2226 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2227 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY287
L__GetActiveObjectByXY603:
;NewDesign_driver.c,2206 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2227 :: 		}
L_GetActiveObjectByXY288:
;NewDesign_driver.c,2230 :: 		i    = CurrentScreen->EveTogglesCount;
; hiOrder start address is: 10 (W5)
	MOV	#54, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2231 :: 		ptrO = CurrentScreen->EveToggles+CurrentScreen->EveTogglesCount-1;
	MOV	#56, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2232 :: 		while (i--) {
L_GetActiveObjectByXY297:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY886
	GOTO	L__GetActiveObjectByXY604
L__GetActiveObjectByXY886:
; i end address is: 6 (W3)
;NewDesign_driver.c,2233 :: 		pEveToggle = (TEveToggle *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pEveToggle start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2234 :: 		if (pEveToggle->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY887
	GOTO	L_GetActiveObjectByXY299
L__GetActiveObjectByXY887:
; pEveToggle end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2235 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY298
L_GetActiveObjectByXY299:
;NewDesign_driver.c,2236 :: 		if (pEveToggle->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pEveToggle start address is: 12 (W6)
	MOV	#43, W0
	ADD	W6, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY888
	GOTO	L_GetActiveObjectByXY300
L__GetActiveObjectByXY888:
;NewDesign_driver.c,2237 :: 		if ((pEveToggle->Left <= X) && (pEveToggle->Left+pEveToggle->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY889
	GOTO	L__GetActiveObjectByXY579
L__GetActiveObjectByXY889:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY890
	GOTO	L__GetActiveObjectByXY578
L__GetActiveObjectByXY890:
;NewDesign_driver.c,2238 :: 		(pEveToggle->Top  <= Y) && (pEveToggle->Top+pEveToggle->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY891
	GOTO	L__GetActiveObjectByXY577
L__GetActiveObjectByXY891:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY892
	GOTO	L__GetActiveObjectByXY576
L__GetActiveObjectByXY892:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY532:
;NewDesign_driver.c,2239 :: 		AObjInfo->Obj   = (TPointer)pEveToggle;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2240 :: 		AObjInfo->Type  = VTFT_OT_EVETOGGLE;
	ADD	W12, #4, W1
	MOV.B	#31, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2241 :: 		AObjInfo->Order = pEveToggle->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2242 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2243 :: 		AObjInfo->Flags |= VTFT_INT_INTRINSIC_CLICK_EFF;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2244 :: 		if (pEveToggle->Background_Color != pEveToggle->Color)
	ADD	W6, #18, W0
	MOV	[W0], W1
	ADD	W6, #20, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByXY893
	GOTO	L_GetActiveObjectByXY304
L__GetActiveObjectByXY893:
;NewDesign_driver.c,2245 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY304:
;NewDesign_driver.c,2247 :: 		hiOrder         = pEveToggle->Order;
	ADD	W6, #2, W0
; pEveToggle end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2249 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY298
;NewDesign_driver.c,2237 :: 		if ((pEveToggle->Left <= X) && (pEveToggle->Left+pEveToggle->Width-1 >= X) &&
L__GetActiveObjectByXY579:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY578:
;NewDesign_driver.c,2238 :: 		(pEveToggle->Top  <= Y) && (pEveToggle->Top+pEveToggle->Height-1 >= Y)) {
L__GetActiveObjectByXY577:
L__GetActiveObjectByXY576:
;NewDesign_driver.c,2251 :: 		}
L_GetActiveObjectByXY300:
;NewDesign_driver.c,2252 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2253 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY297
L__GetActiveObjectByXY604:
;NewDesign_driver.c,2232 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2253 :: 		}
L_GetActiveObjectByXY298:
;NewDesign_driver.c,2256 :: 		i    = CurrentScreen->EveButtonsCount;
; hiOrder start address is: 10 (W5)
	MOV	#60, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2257 :: 		ptrO = CurrentScreen->EveButtons+CurrentScreen->EveButtonsCount-1;
	MOV	#62, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2258 :: 		while (i--) {
L_GetActiveObjectByXY305:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY894
	GOTO	L__GetActiveObjectByXY605
L__GetActiveObjectByXY894:
; i end address is: 6 (W3)
;NewDesign_driver.c,2259 :: 		pEveButton = (TEveButton *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pEveButton start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2260 :: 		if (pEveButton->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY895
	GOTO	L_GetActiveObjectByXY307
L__GetActiveObjectByXY895:
; pEveButton end address is: 12 (W6)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2261 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY306
L_GetActiveObjectByXY307:
;NewDesign_driver.c,2262 :: 		if (pEveButton->Active) {
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; pEveButton start address is: 12 (W6)
	MOV	#37, W0
	ADD	W6, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY896
	GOTO	L_GetActiveObjectByXY308
L__GetActiveObjectByXY896:
;NewDesign_driver.c,2263 :: 		if ((pEveButton->Left <= X) && (pEveButton->Left+pEveButton->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY897
	GOTO	L__GetActiveObjectByXY585
L__GetActiveObjectByXY897:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY898
	GOTO	L__GetActiveObjectByXY584
L__GetActiveObjectByXY898:
;NewDesign_driver.c,2264 :: 		(pEveButton->Top  <= Y) && (pEveButton->Top+pEveButton->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY899
	GOTO	L__GetActiveObjectByXY583
L__GetActiveObjectByXY899:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY900
	GOTO	L__GetActiveObjectByXY582
L__GetActiveObjectByXY900:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY531:
;NewDesign_driver.c,2265 :: 		AObjInfo->Obj   = (TPointer)pEveButton;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2266 :: 		AObjInfo->Type  = VTFT_OT_EVEBUTTON;
	ADD	W12, #4, W1
	MOV.B	#36, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2267 :: 		AObjInfo->Order = pEveButton->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2268 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2269 :: 		if ((pEveButton->Press_Color != pEveButton->Color) ||
	ADD	W6, #16, W0
	MOV	[W0], W1
	ADD	W6, #14, W0
	MOV	[W0], W0
;NewDesign_driver.c,2270 :: 		(pEveButton->Press_ColorTo != pEveButton->ColorTo))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByXY901
	GOTO	L__GetActiveObjectByXY581
L__GetActiveObjectByXY901:
	ADD	W6, #20, W0
	MOV	[W0], W1
	ADD	W6, #18, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA Z	L__GetActiveObjectByXY902
	GOTO	L__GetActiveObjectByXY580
L__GetActiveObjectByXY902:
	GOTO	L_GetActiveObjectByXY314
L__GetActiveObjectByXY581:
L__GetActiveObjectByXY580:
;NewDesign_driver.c,2271 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W12, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByXY314:
;NewDesign_driver.c,2273 :: 		hiOrder         = pEveButton->Order;
	ADD	W6, #2, W0
; pEveButton end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2275 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY306
;NewDesign_driver.c,2263 :: 		if ((pEveButton->Left <= X) && (pEveButton->Left+pEveButton->Width-1 >= X) &&
L__GetActiveObjectByXY585:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY584:
;NewDesign_driver.c,2264 :: 		(pEveButton->Top  <= Y) && (pEveButton->Top+pEveButton->Height-1 >= Y)) {
L__GetActiveObjectByXY583:
L__GetActiveObjectByXY582:
;NewDesign_driver.c,2277 :: 		}
L_GetActiveObjectByXY308:
;NewDesign_driver.c,2278 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2279 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY305
L__GetActiveObjectByXY605:
;NewDesign_driver.c,2258 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2279 :: 		}
L_GetActiveObjectByXY306:
;NewDesign_driver.c,2282 :: 		i    = CurrentScreen->EveTextsCount;
; hiOrder start address is: 10 (W5)
	MOV	#66, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2283 :: 		ptrO = CurrentScreen->EveTexts+CurrentScreen->EveTextsCount-1;
	MOV	#68, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 0 (W0)
	SUB	W0, #2, W0
	SUBB	W1, #0, W1
	MOV	W5, W2
; ptrO end address is: 0 (W0)
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
	MOV.D	W0, W4
	MOV.B	W6, W1
;NewDesign_driver.c,2284 :: 		while (i--) {
L_GetActiveObjectByXY315:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 4 (W2)
	MOV.B	W1, W0
; i start address is: 6 (W3)
	SUB.B	W1, #1, W3
; i end address is: 6 (W3)
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY903
	GOTO	L__GetActiveObjectByXY606
L__GetActiveObjectByXY903:
; i end address is: 6 (W3)
;NewDesign_driver.c,2285 :: 		pEveText = (TEveText *)(*ptrO);
; i start address is: 6 (W3)
	MOV	W5, 50
	MOV	[W4], W0
; pEveText start address is: 12 (W6)
	MOV	W0, W6
;NewDesign_driver.c,2286 :: 		if (pEveText->Order < hiOrder)
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W2
	BRA LT	L__GetActiveObjectByXY904
	GOTO	L_GetActiveObjectByXY317
L__GetActiveObjectByXY904:
; i end address is: 6 (W3)
; pEveText end address is: 12 (W6)
; ptrO end address is: 8 (W4)
;NewDesign_driver.c,2287 :: 		break;
	MOV	W2, W5
	GOTO	L_GetActiveObjectByXY316
L_GetActiveObjectByXY317:
;NewDesign_driver.c,2288 :: 		if (pEveText->Active) {
; ptrO start address is: 8 (W4)
; pEveText start address is: 12 (W6)
; i start address is: 6 (W3)
	ADD	W6, #30, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByXY905
	GOTO	L_GetActiveObjectByXY318
L__GetActiveObjectByXY905:
;NewDesign_driver.c,2289 :: 		if ((pEveText->Left <= X) && (pEveText->Left+pEveText->Width-1 >= X) &&
	ADD	W6, #6, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY906
	GOTO	L__GetActiveObjectByXY589
L__GetActiveObjectByXY906:
	ADD	W6, #6, W1
	ADD	W6, #10, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY907
	GOTO	L__GetActiveObjectByXY588
L__GetActiveObjectByXY907:
;NewDesign_driver.c,2290 :: 		(pEveText->Top  <= Y) && (pEveText->Top+pEveText->Height-1 >= Y)) {
	ADD	W6, #8, W0
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY908
	GOTO	L__GetActiveObjectByXY587
L__GetActiveObjectByXY908:
	ADD	W6, #8, W1
	ADD	W6, #12, W0
	MOV	[W0], W0
	ADD	W0, [W1], W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY909
	GOTO	L__GetActiveObjectByXY586
L__GetActiveObjectByXY909:
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
L__GetActiveObjectByXY529:
;NewDesign_driver.c,2291 :: 		AObjInfo->Obj   = (TPointer)pEveText;
	MOV	W6, W0
	CLR	W1
	MOV.D	W0, [W12]
;NewDesign_driver.c,2292 :: 		AObjInfo->Type  = VTFT_OT_EVETEXT;
	ADD	W12, #4, W1
	MOV.B	#40, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2293 :: 		AObjInfo->Order = pEveText->Order;
	ADD	W12, #5, W1
	ADD	W6, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2294 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2296 :: 		hiOrder         = pEveText->Order;
	ADD	W6, #2, W0
; pEveText end address is: 12 (W6)
; hiOrder start address is: 10 (W5)
	ZE	[W0], W5
;NewDesign_driver.c,2298 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY316
;NewDesign_driver.c,2289 :: 		if ((pEveText->Left <= X) && (pEveText->Left+pEveText->Width-1 >= X) &&
L__GetActiveObjectByXY589:
; ptrO start address is: 8 (W4)
; i start address is: 6 (W3)
; hiOrder start address is: 4 (W2)
L__GetActiveObjectByXY588:
;NewDesign_driver.c,2290 :: 		(pEveText->Top  <= Y) && (pEveText->Top+pEveText->Height-1 >= Y)) {
L__GetActiveObjectByXY587:
L__GetActiveObjectByXY586:
;NewDesign_driver.c,2300 :: 		}
L_GetActiveObjectByXY318:
;NewDesign_driver.c,2301 :: 		ptrO--;
	SUB	W4, #2, W4
	SUBB	W5, #0, W5
;NewDesign_driver.c,2302 :: 		}
; hiOrder end address is: 4 (W2)
; i end address is: 6 (W3)
; ptrO end address is: 8 (W4)
	MOV.B	W3, W1
	GOTO	L_GetActiveObjectByXY315
L__GetActiveObjectByXY606:
;NewDesign_driver.c,2284 :: 		while (i--) {
	MOV	W2, W5
;NewDesign_driver.c,2302 :: 		}
L_GetActiveObjectByXY316:
;NewDesign_driver.c,2305 :: 		i    = CurrentScreen->CEveTextsCount;
; hiOrder start address is: 10 (W5)
	MOV	#72, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2306 :: 		ptrCO = CurrentScreen->CEveTexts+CurrentScreen->CEveTextsCount-1;
	MOV	#74, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH	W1
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
; ptrCO end address is: 0 (W0)
	MOV	W5, W3
	MOV	W0, W5
	MOV.B	W6, W1
	POP	W6
;NewDesign_driver.c,2307 :: 		while (i--) {
L_GetActiveObjectByXY322:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; i start address is: 2 (W1)
; hiOrder start address is: 6 (W3)
	MOV.B	W1, W0
; i start address is: 8 (W4)
	SUB.B	W1, #1, W4
; i end address is: 2 (W1)
; i end address is: 8 (W4)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY910
	GOTO	L__GetActiveObjectByXY607
L__GetActiveObjectByXY910:
; i end address is: 8 (W4)
;NewDesign_driver.c,2308 :: 		pCEveText = (TCEveText *)(*ptrCO);
; i start address is: 8 (W4)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCEveText start address is: 14 (W7)
	MOV	W0, W7
	MOV	W1, W8
;NewDesign_driver.c,2309 :: 		if (pCEveText->Order < hiOrder)
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W3
	BRA LT	L__GetActiveObjectByXY911
	GOTO	L_GetActiveObjectByXY324
L__GetActiveObjectByXY911:
; pCEveText end address is: 14 (W7)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2310 :: 		break;
	MOV	W3, W5
	GOTO	L_GetActiveObjectByXY323
L_GetActiveObjectByXY324:
;NewDesign_driver.c,2311 :: 		if (pCEveText->Active) {
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; pCEveText start address is: 14 (W7)
	MOV	#32, W0
	MOV	#0, W1
	ADD	W7, W0, W0
	ADDC	W8, W1, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY912
	GOTO	L_GetActiveObjectByXY325
L__GetActiveObjectByXY912:
;NewDesign_driver.c,2312 :: 		if ((pCEveText->Left <= X) && (pCEveText->Left+pCEveText->Width-1 >= X) &&
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY913
	GOTO	L__GetActiveObjectByXY593
L__GetActiveObjectByXY913:
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #10, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY914
	GOTO	L__GetActiveObjectByXY592
L__GetActiveObjectByXY914:
;NewDesign_driver.c,2313 :: 		(pCEveText->Top  <= Y) && (pCEveText->Top+pCEveText->Height-1 >= Y)) {
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY915
	GOTO	L__GetActiveObjectByXY591
L__GetActiveObjectByXY915:
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #12, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY916
	GOTO	L__GetActiveObjectByXY590
L__GetActiveObjectByXY916:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
L__GetActiveObjectByXY528:
;NewDesign_driver.c,2314 :: 		AObjInfo->Obj   = (TPointer)pCEveText;
	MOV	W7, [W12++]
	MOV	W8, [W12--]
;NewDesign_driver.c,2315 :: 		AObjInfo->Type  = VTFT_OT_CEVETEXT;
	ADD	W12, #4, W1
	MOV.B	#41, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2316 :: 		AObjInfo->Order = pCEveText->Order;
	ADD	W12, #5, W2
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2317 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2319 :: 		hiOrder         = pCEveText->Order;
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
; pCEveText end address is: 14 (W7)
	MOV	W1, 50
	MOV.B	[W0], W0
; hiOrder start address is: 10 (W5)
	ZE	W0, W5
;NewDesign_driver.c,2321 :: 		break;
; hiOrder end address is: 10 (W5)
	GOTO	L_GetActiveObjectByXY323
;NewDesign_driver.c,2312 :: 		if ((pCEveText->Left <= X) && (pCEveText->Left+pCEveText->Width-1 >= X) &&
L__GetActiveObjectByXY593:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
L__GetActiveObjectByXY592:
;NewDesign_driver.c,2313 :: 		(pCEveText->Top  <= Y) && (pCEveText->Top+pCEveText->Height-1 >= Y)) {
L__GetActiveObjectByXY591:
L__GetActiveObjectByXY590:
;NewDesign_driver.c,2323 :: 		}
L_GetActiveObjectByXY325:
;NewDesign_driver.c,2324 :: 		ptrCO--;
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2325 :: 		}
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
	MOV.B	W4, W1
	GOTO	L_GetActiveObjectByXY322
L__GetActiveObjectByXY607:
;NewDesign_driver.c,2307 :: 		while (i--) {
	MOV	W3, W5
;NewDesign_driver.c,2325 :: 		}
L_GetActiveObjectByXY323:
;NewDesign_driver.c,2328 :: 		i    = CurrentScreen->CEveNumbersCount;
; hiOrder start address is: 10 (W5)
	MOV	#78, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 12 (W6)
	MOV.B	[W2], W6
;NewDesign_driver.c,2329 :: 		ptrCO = CurrentScreen->CEveNumbers+CurrentScreen->CEveNumbersCount-1;
	MOV	#80, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH	W1
; hiOrder end address is: 10 (W5)
; i end address is: 12 (W6)
; ptrCO end address is: 0 (W0)
	MOV	W5, W3
	MOV	W0, W5
	MOV.B	W6, W1
	POP	W6
;NewDesign_driver.c,2330 :: 		while (i--) {
L_GetActiveObjectByXY329:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
; i start address is: 2 (W1)
; hiOrder start address is: 6 (W3)
; hiOrder end address is: 6 (W3)
	MOV.B	W1, W0
; i start address is: 8 (W4)
	SUB.B	W1, #1, W4
; i end address is: 2 (W1)
; i end address is: 8 (W4)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY917
	GOTO	L_GetActiveObjectByXY330
L__GetActiveObjectByXY917:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
;NewDesign_driver.c,2331 :: 		pCEveNumber = (TCEveNumber *)(*ptrCO);
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCEveNumber start address is: 14 (W7)
	MOV	W0, W7
	MOV	W1, W8
;NewDesign_driver.c,2332 :: 		if (pCEveNumber->Order < hiOrder)
	ADD	W0, #2, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, W3
	BRA LT	L__GetActiveObjectByXY918
	GOTO	L_GetActiveObjectByXY331
L__GetActiveObjectByXY918:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; pCEveNumber end address is: 14 (W7)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2333 :: 		break;
	GOTO	L_GetActiveObjectByXY330
L_GetActiveObjectByXY331:
;NewDesign_driver.c,2334 :: 		if (pCEveNumber->Active) {
; ptrCO start address is: 10 (W5)
; pCEveNumber start address is: 14 (W7)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
	MOV	#33, W0
	MOV	#0, W1
	ADD	W7, W0, W0
	ADDC	W8, W1, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByXY919
	GOTO	L_GetActiveObjectByXY332
L__GetActiveObjectByXY919:
;NewDesign_driver.c,2335 :: 		if ((pCEveNumber->Left <= X) && (pCEveNumber->Left+pCEveNumber->Width-1 >= X) &&
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W10
	BRA LE	L__GetActiveObjectByXY920
	GOTO	L__GetActiveObjectByXY597
L__GetActiveObjectByXY920:
	ADD	W7, #6, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #10, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W10
	BRA GE	L__GetActiveObjectByXY921
	GOTO	L__GetActiveObjectByXY596
L__GetActiveObjectByXY921:
;NewDesign_driver.c,2336 :: 		(pCEveNumber->Top  <= Y) && (pCEveNumber->Top+pCEveNumber->Height-1 >= Y)) {
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	CP	W0, W11
	BRA LE	L__GetActiveObjectByXY922
	GOTO	L__GetActiveObjectByXY595
L__GetActiveObjectByXY922:
	ADD	W7, #8, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W7, #12, W0
	ADDC	W8, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W2, W0, W0
	DEC	W0
	CP	W0, W11
	BRA GE	L__GetActiveObjectByXY923
	GOTO	L__GetActiveObjectByXY594
L__GetActiveObjectByXY923:
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
L__GetActiveObjectByXY527:
;NewDesign_driver.c,2337 :: 		AObjInfo->Obj   = (TPointer)pCEveNumber;
	MOV	W7, [W12++]
	MOV	W8, [W12--]
;NewDesign_driver.c,2338 :: 		AObjInfo->Type  = VTFT_OT_CEVENUMBER;
	ADD	W12, #4, W1
	MOV.B	#43, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2339 :: 		AObjInfo->Order = pCEveNumber->Order;
	ADD	W12, #5, W2
	ADD	W7, #2, W0
	ADDC	W8, #0, W1
; pCEveNumber end address is: 14 (W7)
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2340 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W12, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2344 :: 		break;
	GOTO	L_GetActiveObjectByXY330
;NewDesign_driver.c,2335 :: 		if ((pCEveNumber->Left <= X) && (pCEveNumber->Left+pCEveNumber->Width-1 >= X) &&
L__GetActiveObjectByXY597:
; ptrCO start address is: 10 (W5)
; i start address is: 8 (W4)
; hiOrder start address is: 6 (W3)
L__GetActiveObjectByXY596:
;NewDesign_driver.c,2336 :: 		(pCEveNumber->Top  <= Y) && (pCEveNumber->Top+pCEveNumber->Height-1 >= Y)) {
L__GetActiveObjectByXY595:
L__GetActiveObjectByXY594:
;NewDesign_driver.c,2346 :: 		}
L_GetActiveObjectByXY332:
;NewDesign_driver.c,2347 :: 		ptrCO--;
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2348 :: 		}
; hiOrder end address is: 6 (W3)
; i end address is: 8 (W4)
; ptrCO end address is: 10 (W5)
	MOV.B	W4, W1
	GOTO	L_GetActiveObjectByXY329
L_GetActiveObjectByXY330:
;NewDesign_driver.c,2350 :: 		if (AObjInfo->Obj) {
	MOV.D	[W12], W0
	IOR	W1, W0, W0
	BRA NZ	L__GetActiveObjectByXY924
	GOTO	L_GetActiveObjectByXY336
L__GetActiveObjectByXY924:
;NewDesign_driver.c,2351 :: 		AObjInfo->HitX = X;
	ADD	W12, #8, W0
	MOV	W10, [W0]
;NewDesign_driver.c,2352 :: 		AObjInfo->HitY = Y;
	ADD	W12, #10, W0
	MOV	W11, [W0]
;NewDesign_driver.c,2353 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_GetActiveObjectByXY
;NewDesign_driver.c,2354 :: 		}
L_GetActiveObjectByXY336:
;NewDesign_driver.c,2356 :: 		return 0;
	CLR	W0
;NewDesign_driver.c,2358 :: 		}
L_end_GetActiveObjectByXY:
	RETURN
; end of _GetActiveObjectByXY

_GetActiveObjectByTag:

;NewDesign_driver.c,2360 :: 		char GetActiveObjectByTag(char ATag, TObjInfo *AObjInfo) {
;NewDesign_driver.c,2378 :: 		memset(AObjInfo, 0, sizeof(TObjInfo));
	PUSH	W12
	PUSH.D	W10
	MOV	#12, W12
	MOV	W11, W10
	CLR	W11
	CALL	_memset
	POP.D	W10
;NewDesign_driver.c,2383 :: 		i    = CurrentScreen->BoxesCount;
	MOV	_CurrentScreen, W0
	ADD	W0, #7, W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2384 :: 		ptrO = CurrentScreen->Boxes+CurrentScreen->BoxesCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #8, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2385 :: 		while (i--) {
L_GetActiveObjectByTag338:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag926
	GOTO	L_GetActiveObjectByTag339
L__GetActiveObjectByTag926:
; i end address is: 2 (W1)
;NewDesign_driver.c,2386 :: 		pBox = (TBox *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pBox start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2387 :: 		if (pBox->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag927
	GOTO	L_GetActiveObjectByTag340
L__GetActiveObjectByTag927:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2388 :: 		if (pBox->Active) {
	ADD	W2, #27, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag928
	GOTO	L_GetActiveObjectByTag341
L__GetActiveObjectByTag928:
;NewDesign_driver.c,2389 :: 		AObjInfo->Obj   = (TPointer)pBox;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2390 :: 		AObjInfo->Type  = VTFT_OT_BOX;
	ADD	W11, #4, W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2391 :: 		AObjInfo->Order = pBox->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2392 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2393 :: 		if ((pBox->Press_Color != pBox->Color) ||
	ADD	W2, #20, W0
	MOV	[W0], W1
	ADD	W2, #18, W0
	MOV	[W0], W0
;NewDesign_driver.c,2395 :: 		(pBox->Press_ColorTo != pBox->ColorTo)))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByTag929
	GOTO	L__GetActiveObjectByTag616
L__GetActiveObjectByTag929:
;NewDesign_driver.c,2394 :: 		((pBox->Gradient != _FT800_BRUSH_GR_NONE) &&
	ADD	W2, #26, W0
;NewDesign_driver.c,2395 :: 		(pBox->Press_ColorTo != pBox->ColorTo)))
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__GetActiveObjectByTag930
	GOTO	L__GetActiveObjectByTag615
L__GetActiveObjectByTag930:
	ADD	W2, #24, W0
	MOV	[W0], W1
	ADD	W2, #22, W0
; pBox end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByTag931
	GOTO	L__GetActiveObjectByTag614
L__GetActiveObjectByTag931:
	GOTO	L__GetActiveObjectByTag612
L__GetActiveObjectByTag615:
L__GetActiveObjectByTag614:
	GOTO	L_GetActiveObjectByTag346
L__GetActiveObjectByTag612:
L__GetActiveObjectByTag616:
;NewDesign_driver.c,2396 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag346:
;NewDesign_driver.c,2398 :: 		}
L_GetActiveObjectByTag341:
;NewDesign_driver.c,2399 :: 		break;
	GOTO	L_GetActiveObjectByTag339
;NewDesign_driver.c,2400 :: 		}
L_GetActiveObjectByTag340:
;NewDesign_driver.c,2401 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2402 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag338
L_GetActiveObjectByTag339:
;NewDesign_driver.c,2405 :: 		i    = CurrentScreen->CBoxesCount;
	MOV	_CurrentScreen, W0
	ADD	W0, #12, W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2406 :: 		ptrCO = CurrentScreen->CBoxes+CurrentScreen->CBoxesCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #14, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH.D	W0
; i end address is: 10 (W5)
; ptrCO end address is: 0 (W0)
	MOV.B	W5, W1
	POP	W6
	POP	W5
;NewDesign_driver.c,2407 :: 		while (i--) {
L_GetActiveObjectByTag347:
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
; i start address is: 2 (W1)
	MOV.B	W1, W0
; i start address is: 4 (W2)
	SUB.B	W1, #1, W2
; i end address is: 2 (W1)
; i end address is: 4 (W2)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag932
	GOTO	L_GetActiveObjectByTag348
L__GetActiveObjectByTag932:
; i end address is: 4 (W2)
;NewDesign_driver.c,2408 :: 		pCBox = (TCBox *)(*ptrCO);
; i start address is: 4 (W2)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCBox start address is: 6 (W3)
	MOV	W0, W3
	MOV	W1, W4
;NewDesign_driver.c,2409 :: 		if (pCBox->Tag == ATag) {
	ADD	W0, #5, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__GetActiveObjectByTag933
	GOTO	L_GetActiveObjectByTag349
L__GetActiveObjectByTag933:
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2410 :: 		if (pCBox->Active) {
	ADD	W3, #27, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag934
	GOTO	L_GetActiveObjectByTag350
L__GetActiveObjectByTag934:
;NewDesign_driver.c,2411 :: 		AObjInfo->Obj   = (TPointer)pCBox;
	MOV	W3, [W11++]
	MOV	W4, [W11--]
;NewDesign_driver.c,2412 :: 		AObjInfo->Type  = VTFT_OT_CBOX;
	ADD	W11, #4, W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2413 :: 		AObjInfo->Order = pCBox->Order;
	ADD	W11, #5, W2
	ADD	W3, #2, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2414 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2415 :: 		if ((pCBox->Press_Color != pCBox->Color) ||
	ADD	W3, #20, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W3, #18, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV	[W0], W0
;NewDesign_driver.c,2417 :: 		(pCBox->Press_ColorTo != pCBox->ColorTo)))
	CP	W2, W0
	BRA Z	L__GetActiveObjectByTag935
	GOTO	L__GetActiveObjectByTag619
L__GetActiveObjectByTag935:
;NewDesign_driver.c,2416 :: 		((pCBox->Gradient != _FT800_BRUSH_GR_NONE) &&
	ADD	W3, #26, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
;NewDesign_driver.c,2417 :: 		(pCBox->Press_ColorTo != pCBox->ColorTo)))
	CP.B	W0, #0
	BRA NZ	L__GetActiveObjectByTag936
	GOTO	L__GetActiveObjectByTag618
L__GetActiveObjectByTag936:
	ADD	W3, #24, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W3, #22, W0
	ADDC	W4, #0, W1
; pCBox end address is: 6 (W3)
	MOV	W1, 50
	MOV	[W0], W0
	CP	W2, W0
	BRA NZ	L__GetActiveObjectByTag937
	GOTO	L__GetActiveObjectByTag617
L__GetActiveObjectByTag937:
	GOTO	L__GetActiveObjectByTag610
L__GetActiveObjectByTag618:
L__GetActiveObjectByTag617:
	GOTO	L_GetActiveObjectByTag355
L__GetActiveObjectByTag610:
L__GetActiveObjectByTag619:
;NewDesign_driver.c,2418 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag355:
;NewDesign_driver.c,2420 :: 		}
L_GetActiveObjectByTag350:
;NewDesign_driver.c,2421 :: 		break;
	GOTO	L_GetActiveObjectByTag348
;NewDesign_driver.c,2422 :: 		}
L_GetActiveObjectByTag349:
;NewDesign_driver.c,2423 :: 		ptrCO--;
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2424 :: 		}
	MOV.B	W2, W1
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
	GOTO	L_GetActiveObjectByTag347
L_GetActiveObjectByTag348:
;NewDesign_driver.c,2427 :: 		i    = CurrentScreen->Boxes_RoundCount;
	MOV	_CurrentScreen, W0
	ADD	W0, #18, W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2428 :: 		ptrO = CurrentScreen->Boxes_Round+CurrentScreen->Boxes_RoundCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #20, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2429 :: 		while (i--) {
L_GetActiveObjectByTag356:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag938
	GOTO	L_GetActiveObjectByTag357
L__GetActiveObjectByTag938:
; i end address is: 2 (W1)
;NewDesign_driver.c,2430 :: 		pBoxRound = (TBox_Round *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pBoxRound start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2431 :: 		if (pBoxRound->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag939
	GOTO	L_GetActiveObjectByTag358
L__GetActiveObjectByTag939:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2432 :: 		if (pBoxRound->Active) {
	ADD	W2, #23, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag940
	GOTO	L_GetActiveObjectByTag359
L__GetActiveObjectByTag940:
;NewDesign_driver.c,2433 :: 		AObjInfo->Obj   = (TPointer)pBoxRound;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2434 :: 		AObjInfo->Type  = VTFT_OT_BOXROUND;
	ADD	W11, #4, W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2435 :: 		AObjInfo->Order = pBoxRound->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2436 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2437 :: 		if (pBoxRound->Press_Color != pBoxRound->Color)
	ADD	W2, #20, W0
	MOV	[W0], W1
	ADD	W2, #18, W0
; pBoxRound end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByTag941
	GOTO	L_GetActiveObjectByTag360
L__GetActiveObjectByTag941:
;NewDesign_driver.c,2438 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag360:
;NewDesign_driver.c,2440 :: 		}
L_GetActiveObjectByTag359:
;NewDesign_driver.c,2441 :: 		break;
	GOTO	L_GetActiveObjectByTag357
;NewDesign_driver.c,2442 :: 		}
L_GetActiveObjectByTag358:
;NewDesign_driver.c,2443 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2444 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag356
L_GetActiveObjectByTag357:
;NewDesign_driver.c,2447 :: 		i    = CurrentScreen->CBoxes_RoundCount;
	MOV	_CurrentScreen, W0
	ADD	W0, #24, W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2448 :: 		ptrCO = CurrentScreen->CBoxes_Round+CurrentScreen->CBoxes_RoundCount-1;
	MOV	_CurrentScreen, W0
	ADD	W0, #26, W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH.D	W0
; i end address is: 10 (W5)
; ptrCO end address is: 0 (W0)
	MOV.B	W5, W1
	POP	W6
	POP	W5
;NewDesign_driver.c,2449 :: 		while (i--) {
L_GetActiveObjectByTag361:
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
; i start address is: 2 (W1)
	MOV.B	W1, W0
; i start address is: 4 (W2)
	SUB.B	W1, #1, W2
; i end address is: 2 (W1)
; i end address is: 4 (W2)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag942
	GOTO	L_GetActiveObjectByTag362
L__GetActiveObjectByTag942:
; i end address is: 4 (W2)
;NewDesign_driver.c,2450 :: 		pCBoxRound = (TCBox_Round *)(*ptrCO);
; i start address is: 4 (W2)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCBoxRound start address is: 6 (W3)
	MOV	W0, W3
	MOV	W1, W4
;NewDesign_driver.c,2451 :: 		if (pCBoxRound->Tag == ATag) {
	ADD	W0, #5, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__GetActiveObjectByTag943
	GOTO	L_GetActiveObjectByTag363
L__GetActiveObjectByTag943:
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2452 :: 		if (pCBoxRound->Active) {
	ADD	W3, #23, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag944
	GOTO	L_GetActiveObjectByTag364
L__GetActiveObjectByTag944:
;NewDesign_driver.c,2453 :: 		AObjInfo->Obj   = (TPointer)pCBoxRound;
	MOV	W3, [W11++]
	MOV	W4, [W11--]
;NewDesign_driver.c,2454 :: 		AObjInfo->Type  = VTFT_OT_CBOXROUND;
	ADD	W11, #4, W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2455 :: 		AObjInfo->Order = pCBoxRound->Order;
	ADD	W11, #5, W2
	ADD	W3, #2, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2456 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2457 :: 		if (pCBoxRound->Press_Color != pCBoxRound->Color)
	ADD	W3, #20, W0
	ADDC	W4, #0, W1
	MOV	W1, 50
	MOV	[W0], W2
	ADD	W3, #18, W0
	ADDC	W4, #0, W1
; pCBoxRound end address is: 6 (W3)
	MOV	W1, 50
	MOV	[W0], W0
	CP	W2, W0
	BRA NZ	L__GetActiveObjectByTag945
	GOTO	L_GetActiveObjectByTag365
L__GetActiveObjectByTag945:
;NewDesign_driver.c,2458 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag365:
;NewDesign_driver.c,2460 :: 		}
L_GetActiveObjectByTag364:
;NewDesign_driver.c,2461 :: 		break;
	GOTO	L_GetActiveObjectByTag362
;NewDesign_driver.c,2462 :: 		}
L_GetActiveObjectByTag363:
;NewDesign_driver.c,2463 :: 		ptrCO--;
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2464 :: 		}
	MOV.B	W2, W1
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
	GOTO	L_GetActiveObjectByTag361
L_GetActiveObjectByTag362:
;NewDesign_driver.c,2467 :: 		i    = CurrentScreen->EveGaugesCount;
	MOV	#36, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2468 :: 		ptrO = CurrentScreen->EveGauges+CurrentScreen->EveGaugesCount-1;
	MOV	#38, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2469 :: 		while (i--) {
L_GetActiveObjectByTag366:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag946
	GOTO	L_GetActiveObjectByTag367
L__GetActiveObjectByTag946:
; i end address is: 2 (W1)
;NewDesign_driver.c,2470 :: 		pEveGauge = (TEveGauge *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pEveGauge start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2471 :: 		if (pEveGauge->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag947
	GOTO	L_GetActiveObjectByTag368
L__GetActiveObjectByTag947:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2472 :: 		if (pEveGauge->Active) {
	ADD	W2, #30, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag948
	GOTO	L_GetActiveObjectByTag369
L__GetActiveObjectByTag948:
;NewDesign_driver.c,2473 :: 		AObjInfo->Obj   = (TPointer)pEveGauge;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2474 :: 		AObjInfo->Type  = VTFT_OT_EVEGAUGE;
	ADD	W11, #4, W1
	MOV.B	#25, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2475 :: 		AObjInfo->Order = pEveGauge->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2476 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2477 :: 		if (pEveGauge->Press_Color != pEveGauge->Color)
	ADD	W2, #18, W0
	MOV	[W0], W1
	ADD	W2, #16, W0
; pEveGauge end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByTag949
	GOTO	L_GetActiveObjectByTag370
L__GetActiveObjectByTag949:
;NewDesign_driver.c,2478 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag370:
;NewDesign_driver.c,2480 :: 		}
L_GetActiveObjectByTag369:
;NewDesign_driver.c,2481 :: 		break;
	GOTO	L_GetActiveObjectByTag367
;NewDesign_driver.c,2482 :: 		}
L_GetActiveObjectByTag368:
;NewDesign_driver.c,2483 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2484 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag366
L_GetActiveObjectByTag367:
;NewDesign_driver.c,2487 :: 		i    = CurrentScreen->EveKeysCount;
	MOV	#42, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2488 :: 		ptrO = CurrentScreen->EveKeys+CurrentScreen->EveKeysCount-1;
	MOV	#44, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2489 :: 		while (i--) {
L_GetActiveObjectByTag371:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag950
	GOTO	L_GetActiveObjectByTag372
L__GetActiveObjectByTag950:
; i end address is: 2 (W1)
;NewDesign_driver.c,2490 :: 		pEveKeys = (TEveKeys *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pEveKeys start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2491 :: 		if (pEveKeys->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag951
	GOTO	L_GetActiveObjectByTag373
L__GetActiveObjectByTag951:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2492 :: 		if (pEveKeys->Active) {
	MOV	#38, W0
	ADD	W2, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag952
	GOTO	L_GetActiveObjectByTag374
L__GetActiveObjectByTag952:
;NewDesign_driver.c,2493 :: 		AObjInfo->Obj   = (TPointer)pEveKeys;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2494 :: 		AObjInfo->Type  = VTFT_OT_EVEKEYS;
	ADD	W11, #4, W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2495 :: 		AObjInfo->Order = pEveKeys->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2496 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2497 :: 		if ((pEveKeys->Press_Color != pEveKeys->Color) ||
	ADD	W2, #16, W0
	MOV	[W0], W1
	ADD	W2, #14, W0
	MOV	[W0], W0
;NewDesign_driver.c,2498 :: 		(pEveKeys->Press_ColorTo != pEveKeys->ColorTo))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByTag953
	GOTO	L__GetActiveObjectByTag621
L__GetActiveObjectByTag953:
	ADD	W2, #20, W0
	MOV	[W0], W1
	ADD	W2, #18, W0
; pEveKeys end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA Z	L__GetActiveObjectByTag954
	GOTO	L__GetActiveObjectByTag620
L__GetActiveObjectByTag954:
	GOTO	L_GetActiveObjectByTag377
L__GetActiveObjectByTag621:
L__GetActiveObjectByTag620:
;NewDesign_driver.c,2499 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag377:
;NewDesign_driver.c,2501 :: 		}
L_GetActiveObjectByTag374:
;NewDesign_driver.c,2502 :: 		break;
	GOTO	L_GetActiveObjectByTag372
;NewDesign_driver.c,2503 :: 		}
L_GetActiveObjectByTag373:
;NewDesign_driver.c,2504 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2505 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag371
L_GetActiveObjectByTag372:
;NewDesign_driver.c,2508 :: 		i    = CurrentScreen->EveTogglesCount;
	MOV	#54, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2509 :: 		ptrO = CurrentScreen->EveToggles+CurrentScreen->EveTogglesCount-1;
	MOV	#56, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2510 :: 		while (i--) {
L_GetActiveObjectByTag378:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag955
	GOTO	L_GetActiveObjectByTag379
L__GetActiveObjectByTag955:
; i end address is: 2 (W1)
;NewDesign_driver.c,2511 :: 		pEveToggle = (TEveToggle *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pEveToggle start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2512 :: 		if (pEveToggle->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag956
	GOTO	L_GetActiveObjectByTag380
L__GetActiveObjectByTag956:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2513 :: 		if (pEveToggle->Active) {
	MOV	#43, W0
	ADD	W2, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag957
	GOTO	L_GetActiveObjectByTag381
L__GetActiveObjectByTag957:
;NewDesign_driver.c,2514 :: 		AObjInfo->Obj   = (TPointer)pEveToggle;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2515 :: 		AObjInfo->Type  = VTFT_OT_EVETOGGLE;
	ADD	W11, #4, W1
	MOV.B	#31, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2516 :: 		AObjInfo->Order = pEveToggle->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2517 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2518 :: 		AObjInfo->Flags |= VTFT_INT_INTRINSIC_CLICK_EFF;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2519 :: 		if (pEveToggle->Background_Color != pEveToggle->Color)
	ADD	W2, #18, W0
	MOV	[W0], W1
	ADD	W2, #20, W0
; pEveToggle end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA NZ	L__GetActiveObjectByTag958
	GOTO	L_GetActiveObjectByTag382
L__GetActiveObjectByTag958:
;NewDesign_driver.c,2520 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag382:
;NewDesign_driver.c,2522 :: 		}
L_GetActiveObjectByTag381:
;NewDesign_driver.c,2523 :: 		break;
	GOTO	L_GetActiveObjectByTag379
;NewDesign_driver.c,2524 :: 		}
L_GetActiveObjectByTag380:
;NewDesign_driver.c,2525 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2526 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag378
L_GetActiveObjectByTag379:
;NewDesign_driver.c,2529 :: 		i    = CurrentScreen->EveButtonsCount;
	MOV	#60, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2530 :: 		ptrO = CurrentScreen->EveButtons+CurrentScreen->EveButtonsCount-1;
	MOV	#62, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2531 :: 		while (i--) {
L_GetActiveObjectByTag383:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag959
	GOTO	L_GetActiveObjectByTag384
L__GetActiveObjectByTag959:
; i end address is: 2 (W1)
;NewDesign_driver.c,2532 :: 		pEveButton = (TEveButton *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pEveButton start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2533 :: 		if (pEveButton->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag960
	GOTO	L_GetActiveObjectByTag385
L__GetActiveObjectByTag960:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2534 :: 		if (pEveButton->Active) {
	MOV	#37, W0
	ADD	W2, W0, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag961
	GOTO	L_GetActiveObjectByTag386
L__GetActiveObjectByTag961:
;NewDesign_driver.c,2535 :: 		AObjInfo->Obj   = (TPointer)pEveButton;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2536 :: 		AObjInfo->Type  = VTFT_OT_EVEBUTTON;
	ADD	W11, #4, W1
	MOV.B	#36, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2537 :: 		AObjInfo->Order = pEveButton->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2538 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2539 :: 		if ((pEveButton->Press_Color != pEveButton->Color) ||
	ADD	W2, #16, W0
	MOV	[W0], W1
	ADD	W2, #14, W0
	MOV	[W0], W0
;NewDesign_driver.c,2540 :: 		(pEveButton->Press_ColorTo != pEveButton->ColorTo))
	CP	W1, W0
	BRA Z	L__GetActiveObjectByTag962
	GOTO	L__GetActiveObjectByTag623
L__GetActiveObjectByTag962:
	ADD	W2, #20, W0
	MOV	[W0], W1
	ADD	W2, #18, W0
; pEveButton end address is: 4 (W2)
	MOV	[W0], W0
	CP	W1, W0
	BRA Z	L__GetActiveObjectByTag963
	GOTO	L__GetActiveObjectByTag622
L__GetActiveObjectByTag963:
	GOTO	L_GetActiveObjectByTag389
L__GetActiveObjectByTag623:
L__GetActiveObjectByTag622:
;NewDesign_driver.c,2541 :: 		AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;
	ADD	W11, #6, W1
	ZE	[W1], W0
	IOR	W0, #3, W0
	MOV.B	W0, [W1]
L_GetActiveObjectByTag389:
;NewDesign_driver.c,2543 :: 		}
L_GetActiveObjectByTag386:
;NewDesign_driver.c,2544 :: 		break;
	GOTO	L_GetActiveObjectByTag384
;NewDesign_driver.c,2545 :: 		}
L_GetActiveObjectByTag385:
;NewDesign_driver.c,2546 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2547 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag383
L_GetActiveObjectByTag384:
;NewDesign_driver.c,2550 :: 		i    = CurrentScreen->EveTextsCount;
	MOV	#66, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2551 :: 		ptrO = CurrentScreen->EveTexts+CurrentScreen->EveTextsCount-1;
	MOV	#68, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrO start address is: 6 (W3)
	SUB	W0, #2, W3
	SUBB	W1, #0, W4
	MOV.B	W5, W1
; ptrO end address is: 6 (W3)
; i end address is: 10 (W5)
;NewDesign_driver.c,2552 :: 		while (i--) {
L_GetActiveObjectByTag390:
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
; i start address is: 2 (W1)
	MOV.B	W1, W0
	DEC.B	W1
; i end address is: 2 (W1)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag964
	GOTO	L_GetActiveObjectByTag391
L__GetActiveObjectByTag964:
; i end address is: 2 (W1)
;NewDesign_driver.c,2553 :: 		pEveText = (TEveText *)(*ptrO);
; i start address is: 2 (W1)
	MOV	W4, 50
	MOV	[W3], W0
; pEveText start address is: 4 (W2)
	MOV	W0, W2
;NewDesign_driver.c,2554 :: 		if (pEveText->Tag == ATag) {
	ADD	W0, #5, W0
	CP.B	W10, [W0]
	BRA Z	L__GetActiveObjectByTag965
	GOTO	L_GetActiveObjectByTag392
L__GetActiveObjectByTag965:
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
;NewDesign_driver.c,2555 :: 		if (pEveText->Active) {
	ADD	W2, #30, W0
	CP0.B	[W0]
	BRA NZ	L__GetActiveObjectByTag966
	GOTO	L_GetActiveObjectByTag393
L__GetActiveObjectByTag966:
;NewDesign_driver.c,2556 :: 		AObjInfo->Obj   = (TPointer)pEveText;
	MOV	W2, W0
	CLR	W1
	MOV.D	W0, [W11]
;NewDesign_driver.c,2557 :: 		AObjInfo->Type  = VTFT_OT_EVETEXT;
	ADD	W11, #4, W1
	MOV.B	#40, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2558 :: 		AObjInfo->Order = pEveText->Order;
	ADD	W11, #5, W1
	ADD	W2, #2, W0
; pEveText end address is: 4 (W2)
	MOV.B	[W0], [W1]
;NewDesign_driver.c,2559 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2560 :: 		}
L_GetActiveObjectByTag393:
;NewDesign_driver.c,2561 :: 		break;
	GOTO	L_GetActiveObjectByTag391
;NewDesign_driver.c,2562 :: 		}
L_GetActiveObjectByTag392:
;NewDesign_driver.c,2563 :: 		ptrO--;
; i start address is: 2 (W1)
; ptrO start address is: 6 (W3)
	SUB	W3, #2, W3
	SUBB	W4, #0, W4
;NewDesign_driver.c,2564 :: 		}
; ptrO end address is: 6 (W3)
; i end address is: 2 (W1)
	GOTO	L_GetActiveObjectByTag390
L_GetActiveObjectByTag391:
;NewDesign_driver.c,2567 :: 		i    = CurrentScreen->CEveTextsCount;
	MOV	#72, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2568 :: 		ptrCO = CurrentScreen->CEveTexts+CurrentScreen->CEveTextsCount-1;
	MOV	#74, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH.D	W0
; i end address is: 10 (W5)
; ptrCO end address is: 0 (W0)
	MOV.B	W5, W1
	POP	W6
	POP	W5
;NewDesign_driver.c,2569 :: 		while (i--) {
L_GetActiveObjectByTag394:
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
; i start address is: 2 (W1)
	MOV.B	W1, W0
; i start address is: 4 (W2)
	SUB.B	W1, #1, W2
; i end address is: 2 (W1)
; i end address is: 4 (W2)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag967
	GOTO	L_GetActiveObjectByTag395
L__GetActiveObjectByTag967:
; i end address is: 4 (W2)
;NewDesign_driver.c,2570 :: 		pCEveText = (TCEveText *)(*ptrCO);
; i start address is: 4 (W2)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCEveText start address is: 6 (W3)
	MOV	W0, W3
	MOV	W1, W4
;NewDesign_driver.c,2571 :: 		if (pCEveText->Tag == ATag) {
	ADD	W0, #5, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__GetActiveObjectByTag968
	GOTO	L_GetActiveObjectByTag396
L__GetActiveObjectByTag968:
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2572 :: 		if (pCEveText->Active) {
	MOV	#32, W0
	MOV	#0, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag969
	GOTO	L_GetActiveObjectByTag397
L__GetActiveObjectByTag969:
;NewDesign_driver.c,2573 :: 		AObjInfo->Obj   = (TPointer)pCEveText;
	MOV	W3, [W11++]
	MOV	W4, [W11--]
;NewDesign_driver.c,2574 :: 		AObjInfo->Type  = VTFT_OT_CEVETEXT;
	ADD	W11, #4, W1
	MOV.B	#41, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2575 :: 		AObjInfo->Order = pCEveText->Order;
	ADD	W11, #5, W2
	ADD	W3, #2, W0
	ADDC	W4, #0, W1
; pCEveText end address is: 6 (W3)
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2576 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2577 :: 		}
L_GetActiveObjectByTag397:
;NewDesign_driver.c,2578 :: 		break;
	GOTO	L_GetActiveObjectByTag395
;NewDesign_driver.c,2579 :: 		}
L_GetActiveObjectByTag396:
;NewDesign_driver.c,2580 :: 		ptrCO--;
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2581 :: 		}
	MOV.B	W2, W1
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
	GOTO	L_GetActiveObjectByTag394
L_GetActiveObjectByTag395:
;NewDesign_driver.c,2584 :: 		i    = CurrentScreen->CEveNumbersCount;
	MOV	#78, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W2
; i start address is: 10 (W5)
	MOV.B	[W2], W5
;NewDesign_driver.c,2585 :: 		ptrCO = CurrentScreen->CEveNumbers+CurrentScreen->CEveNumbersCount-1;
	MOV	#80, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W4
	ZE	[W2], W0
	CLR	W1
	SL	W0, W2
	RLC	W1, W3
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
; ptrCO start address is: 0 (W0)
	SUB	W0, #4, W0
	SUBB	W1, #0, W1
	PUSH.D	W0
; i end address is: 10 (W5)
; ptrCO end address is: 0 (W0)
	MOV.B	W5, W1
	POP	W6
	POP	W5
;NewDesign_driver.c,2586 :: 		while (i--) {
L_GetActiveObjectByTag398:
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
; i start address is: 2 (W1)
	MOV.B	W1, W0
; i start address is: 4 (W2)
	SUB.B	W1, #1, W2
; i end address is: 2 (W1)
; i end address is: 4 (W2)
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag970
	GOTO	L_GetActiveObjectByTag399
L__GetActiveObjectByTag970:
; i end address is: 4 (W2)
;NewDesign_driver.c,2587 :: 		pCEveNumber = (TCEveNumber *)(*ptrCO);
; i start address is: 4 (W2)
	MOV	W6, 50
	MOV.D	[W5], W0
; pCEveNumber start address is: 6 (W3)
	MOV	W0, W3
	MOV	W1, W4
;NewDesign_driver.c,2588 :: 		if (pCEveNumber->Tag == ATag) {
	ADD	W0, #5, W0
	ADDC	W1, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__GetActiveObjectByTag971
	GOTO	L_GetActiveObjectByTag400
L__GetActiveObjectByTag971:
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
;NewDesign_driver.c,2589 :: 		if (pCEveNumber->Active) {
	MOV	#33, W0
	MOV	#0, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	CP0.B	W0
	BRA NZ	L__GetActiveObjectByTag972
	GOTO	L_GetActiveObjectByTag401
L__GetActiveObjectByTag972:
;NewDesign_driver.c,2590 :: 		AObjInfo->Obj   = (TPointer)pCEveNumber;
	MOV	W3, [W11++]
	MOV	W4, [W11--]
;NewDesign_driver.c,2591 :: 		AObjInfo->Type  = VTFT_OT_CEVENUMBER;
	ADD	W11, #4, W1
	MOV.B	#43, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2592 :: 		AObjInfo->Order = pCEveNumber->Order;
	ADD	W11, #5, W2
	ADD	W3, #2, W0
	ADDC	W4, #0, W1
; pCEveNumber end address is: 6 (W3)
	MOV	W1, 50
	MOV.B	[W0], W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2593 :: 		AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
	ADD	W11, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2594 :: 		}
L_GetActiveObjectByTag401:
;NewDesign_driver.c,2595 :: 		break;
	GOTO	L_GetActiveObjectByTag399
;NewDesign_driver.c,2596 :: 		}
L_GetActiveObjectByTag400:
;NewDesign_driver.c,2597 :: 		ptrCO--;
; ptrCO start address is: 10 (W5)
; i start address is: 4 (W2)
	SUB	W5, #4, W5
	SUBB	W6, #0, W6
;NewDesign_driver.c,2598 :: 		}
	MOV.B	W2, W1
; i end address is: 4 (W2)
; ptrCO end address is: 10 (W5)
	GOTO	L_GetActiveObjectByTag398
L_GetActiveObjectByTag399:
;NewDesign_driver.c,2600 :: 		if (AObjInfo->Obj) {
	MOV.D	[W11], W0
	IOR	W1, W0, W0
	BRA NZ	L__GetActiveObjectByTag973
	GOTO	L_GetActiveObjectByTag402
L__GetActiveObjectByTag973:
;NewDesign_driver.c,2601 :: 		AObjInfo->HitTag = ATag;
	ADD	W11, #7, W0
	MOV.B	W10, [W0]
;NewDesign_driver.c,2602 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_GetActiveObjectByTag
;NewDesign_driver.c,2603 :: 		}
L_GetActiveObjectByTag402:
;NewDesign_driver.c,2605 :: 		return 0;
	CLR	W0
;NewDesign_driver.c,2607 :: 		}
;NewDesign_driver.c,2605 :: 		return 0;
;NewDesign_driver.c,2607 :: 		}
L_end_GetActiveObjectByTag:
	POP	W12
	RETURN
; end of _GetActiveObjectByTag

NewDesign_driver_ProcessEvent:

;NewDesign_driver.c,2609 :: 		static void ProcessEvent(TEvent *pEvent) {
;NewDesign_driver.c,2610 :: 		if (pEvent) {
	PUSH	W11
	PUSH	W12
	CP0	W10
	BRA NZ	L_NewDesign_driver_ProcessEvent975
	GOTO	L_NewDesign_driver_ProcessEvent404
L_NewDesign_driver_ProcessEvent975:
;NewDesign_driver.c,2611 :: 		if (pEvent->Sound.SndAct == VTFT_SNDACT_PLAY)
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, #1
	BRA Z	L_NewDesign_driver_ProcessEvent976
	GOTO	L_NewDesign_driver_ProcessEvent405
L_NewDesign_driver_ProcessEvent976:
;NewDesign_driver.c,2612 :: 		FT800_Sound_SetAndPlay(pEvent->Sound.Effect, pEvent->Sound.Pitch, pEvent->Sound.Volume);
	ADD	W10, #2, W0
	ADD	W0, #3, W2
	ADD	W0, #2, W1
	INC	W0
	PUSH	W10
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	CALL	_FT800_Sound_SetAndPlay
	POP	W10
	GOTO	L_NewDesign_driver_ProcessEvent406
L_NewDesign_driver_ProcessEvent405:
;NewDesign_driver.c,2613 :: 		else if (pEvent->Sound.SndAct == VTFT_SNDACT_STOP)
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, #2
	BRA Z	L_NewDesign_driver_ProcessEvent977
	GOTO	L_NewDesign_driver_ProcessEvent407
L_NewDesign_driver_ProcessEvent977:
;NewDesign_driver.c,2614 :: 		FT800_Sound_Stop();
	PUSH	W10
	CALL	_FT800_Sound_Stop
	POP	W10
L_NewDesign_driver_ProcessEvent407:
L_NewDesign_driver_ProcessEvent406:
;NewDesign_driver.c,2615 :: 		if (pEvent->Action)
	MOV	[W10], W0
	CP0	W0
	BRA NZ	L_NewDesign_driver_ProcessEvent978
	GOTO	L_NewDesign_driver_ProcessEvent408
L_NewDesign_driver_ProcessEvent978:
;NewDesign_driver.c,2616 :: 		pEvent->Action();
	MOV	[W10], W0
	CALL	W0
L_NewDesign_driver_ProcessEvent408:
;NewDesign_driver.c,2617 :: 		}
L_NewDesign_driver_ProcessEvent404:
;NewDesign_driver.c,2618 :: 		}
L_end_ProcessEvent:
	POP	W12
	POP	W11
	RETURN
; end of NewDesign_driver_ProcessEvent

NewDesign_driver_ProcessCEvent:

;NewDesign_driver.c,2620 :: 		static void ProcessCEvent(TCEvent *pEventC) {
;NewDesign_driver.c,2621 :: 		if (pEventC) {
	PUSH	W12
	IOR	W11, W10, W0
	BRA NZ	L_NewDesign_driver_ProcessCEvent980
	GOTO	L_NewDesign_driver_ProcessCEvent409
L_NewDesign_driver_ProcessCEvent980:
;NewDesign_driver.c,2622 :: 		if (pEventC->Sound.SndAct == VTFT_SNDACT_PLAY)
	ADD	W10, #2, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, #1
	BRA Z	L_NewDesign_driver_ProcessCEvent981
	GOTO	L_NewDesign_driver_ProcessCEvent410
L_NewDesign_driver_ProcessCEvent981:
;NewDesign_driver.c,2623 :: 		FT800_Sound_SetAndPlay(pEventC->Sound.Effect, pEventC->Sound.Pitch, pEventC->Sound.Volume);
	ADD	W10, #2, W4
	ADDC	W11, #0, W5
	ADD	W4, #3, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W3
	ADD	W4, #2, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W2
	ADD	W4, #1, W0
	ADDC	W5, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	PUSH.D	W10
	MOV.B	W3, W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_FT800_Sound_SetAndPlay
	POP.D	W10
	GOTO	L_NewDesign_driver_ProcessCEvent411
L_NewDesign_driver_ProcessCEvent410:
;NewDesign_driver.c,2624 :: 		else if (pEventC->Sound.SndAct == VTFT_SNDACT_STOP)
	ADD	W10, #2, W0
	ADDC	W11, #0, W1
	MOV	W1, 50
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, #2
	BRA Z	L_NewDesign_driver_ProcessCEvent982
	GOTO	L_NewDesign_driver_ProcessCEvent412
L_NewDesign_driver_ProcessCEvent982:
;NewDesign_driver.c,2625 :: 		FT800_Sound_Stop();
	PUSH.D	W10
	CALL	_FT800_Sound_Stop
	POP.D	W10
L_NewDesign_driver_ProcessCEvent412:
L_NewDesign_driver_ProcessCEvent411:
;NewDesign_driver.c,2626 :: 		if (pEventC->Action)
	MOV	W11, 50
	MOV	[W10], W0
	CP0	W0
	BRA NZ	L_NewDesign_driver_ProcessCEvent983
	GOTO	L_NewDesign_driver_ProcessCEvent413
L_NewDesign_driver_ProcessCEvent983:
;NewDesign_driver.c,2627 :: 		pEventC->Action();
	MOV	W11, 50
	MOV	[W10], W0
	CALL	W0
L_NewDesign_driver_ProcessCEvent413:
;NewDesign_driver.c,2628 :: 		}
L_NewDesign_driver_ProcessCEvent409:
;NewDesign_driver.c,2629 :: 		}
L_end_ProcessCEvent:
	POP	W12
	RETURN
; end of NewDesign_driver_ProcessCEvent

NewDesign_driver_OnEvent:
	LNK	#6

;NewDesign_driver.c,2631 :: 		static void OnEvent(TObjInfo *AObjInfo, char AEventType){
;NewDesign_driver.c,2633 :: 		TEvent  *pEvent = 0;
	PUSH	W10
	PUSH	W11
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSNewDesign_driver_OnEvent_pEvent_L0), W0
	REPEAT	#2
	MOV	[W0++], [W1++]
;NewDesign_driver.c,2635 :: 		TCEvent *pEventC = 0;
;NewDesign_driver.c,2637 :: 		switch (AObjInfo->Type) {
	ADD	W10, #4, W4
	GOTO	L_NewDesign_driver_OnEvent414
;NewDesign_driver.c,2639 :: 		case VTFT_OT_BOX: {
L_NewDesign_driver_OnEvent416:
;NewDesign_driver.c,2640 :: 		ppEvent = &(((TBox *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W0
	ADD	W0, #28, W1
;NewDesign_driver.c,2641 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2642 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2645 :: 		case VTFT_OT_CBOX: {
L_NewDesign_driver_OnEvent417:
;NewDesign_driver.c,2646 :: 		ppEventC = &(((TCBox *)AObjInfo->Obj)->OnUp);
	MOV.D	[W10], W0
	ADD	W0, #28, W2
	ADDC	W1, #0, W3
;NewDesign_driver.c,2647 :: 		pEventC  = ppEventC[AEventType];
	ZE	W11, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
	MOV	W3, 50
	MOV.D	[W2], W0
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
;NewDesign_driver.c,2648 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2651 :: 		case VTFT_OT_BOXROUND: {
L_NewDesign_driver_OnEvent418:
;NewDesign_driver.c,2652 :: 		ppEvent = &(((TBox_Round *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W0
	ADD	W0, #24, W1
;NewDesign_driver.c,2653 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2654 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2657 :: 		case VTFT_OT_CBOXROUND: {
L_NewDesign_driver_OnEvent419:
;NewDesign_driver.c,2658 :: 		ppEventC = &(((TCBox_Round *)AObjInfo->Obj)->OnUp);
	MOV.D	[W10], W0
	ADD	W0, #24, W2
	ADDC	W1, #0, W3
;NewDesign_driver.c,2659 :: 		pEventC  = ppEventC[AEventType];
	ZE	W11, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
	MOV	W3, 50
	MOV.D	[W2], W0
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
;NewDesign_driver.c,2660 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2663 :: 		case VTFT_OT_EVEGAUGE: {
L_NewDesign_driver_OnEvent420:
;NewDesign_driver.c,2664 :: 		ppEvent = &(((TEveGauge *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W1
	MOV	#32, W0
	ADD	W1, W0, W1
;NewDesign_driver.c,2665 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2666 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2669 :: 		case VTFT_OT_EVEKEYS: {
L_NewDesign_driver_OnEvent421:
;NewDesign_driver.c,2670 :: 		ppEvent = &(((TEveKeys *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W1
	MOV	#40, W0
	ADD	W1, W0, W1
;NewDesign_driver.c,2671 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2672 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2675 :: 		case VTFT_OT_EVETOGGLE: {
L_NewDesign_driver_OnEvent422:
;NewDesign_driver.c,2676 :: 		ppEvent = &(((TEveToggle *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W1
	MOV	#44, W0
	ADD	W1, W0, W1
;NewDesign_driver.c,2677 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2678 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2681 :: 		case VTFT_OT_EVEBUTTON: {
L_NewDesign_driver_OnEvent423:
;NewDesign_driver.c,2682 :: 		ppEvent = &(((TEveButton *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W1
	MOV	#38, W0
	ADD	W1, W0, W1
;NewDesign_driver.c,2683 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2684 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2687 :: 		case VTFT_OT_EVETEXT: {
L_NewDesign_driver_OnEvent424:
;NewDesign_driver.c,2688 :: 		ppEvent = &(((TEveText *)AObjInfo->Obj)->OnUp);
	MOV	[W10], W1
	MOV	#32, W0
	ADD	W1, W0, W1
;NewDesign_driver.c,2689 :: 		pEvent  = ppEvent[AEventType];
	ZE	W11, W0
	SL	W0, #1, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;NewDesign_driver.c,2690 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2693 :: 		case VTFT_OT_CEVETEXT: {
L_NewDesign_driver_OnEvent425:
;NewDesign_driver.c,2694 :: 		ppEventC = &(((TCEveText *)AObjInfo->Obj)->OnUp);
	MOV.D	[W10], W2
	MOV	#34, W0
	MOV	#0, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
;NewDesign_driver.c,2695 :: 		pEventC  = ppEventC[AEventType];
	ZE	W11, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
	MOV	W3, 50
	MOV.D	[W2], W0
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
;NewDesign_driver.c,2696 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2699 :: 		case VTFT_OT_CEVENUMBER: {
L_NewDesign_driver_OnEvent426:
;NewDesign_driver.c,2700 :: 		ppEventC = &(((TCEveNumber *)AObjInfo->Obj)->OnUp);
	MOV.D	[W10], W2
	MOV	#34, W0
	MOV	#0, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
;NewDesign_driver.c,2701 :: 		pEventC  = ppEventC[AEventType];
	ZE	W11, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W2, W0, W2
	ADDC	W3, W1, W3
	MOV	W3, 50
	MOV.D	[W2], W0
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
;NewDesign_driver.c,2702 :: 		break;
	GOTO	L_NewDesign_driver_OnEvent415
;NewDesign_driver.c,2704 :: 		} // end switch
L_NewDesign_driver_OnEvent414:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #12
	BRA NZ	L_NewDesign_driver_OnEvent985
	GOTO	L_NewDesign_driver_OnEvent416
L_NewDesign_driver_OnEvent985:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #13
	BRA NZ	L_NewDesign_driver_OnEvent986
	GOTO	L_NewDesign_driver_OnEvent417
L_NewDesign_driver_OnEvent986:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #14
	BRA NZ	L_NewDesign_driver_OnEvent987
	GOTO	L_NewDesign_driver_OnEvent418
L_NewDesign_driver_OnEvent987:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #15
	BRA NZ	L_NewDesign_driver_OnEvent988
	GOTO	L_NewDesign_driver_OnEvent419
L_NewDesign_driver_OnEvent988:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #25
	BRA NZ	L_NewDesign_driver_OnEvent989
	GOTO	L_NewDesign_driver_OnEvent420
L_NewDesign_driver_OnEvent989:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #27
	BRA NZ	L_NewDesign_driver_OnEvent990
	GOTO	L_NewDesign_driver_OnEvent421
L_NewDesign_driver_OnEvent990:
	MOV.B	[W4], W0
	ZE	W0, W0
	CP	W0, #31
	BRA NZ	L_NewDesign_driver_OnEvent991
	GOTO	L_NewDesign_driver_OnEvent422
L_NewDesign_driver_OnEvent991:
	MOV.B	[W4], W0
	ZE	W0, W1
	MOV	#36, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_OnEvent992
	GOTO	L_NewDesign_driver_OnEvent423
L_NewDesign_driver_OnEvent992:
	MOV.B	[W4], W0
	ZE	W0, W1
	MOV	#40, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_OnEvent993
	GOTO	L_NewDesign_driver_OnEvent424
L_NewDesign_driver_OnEvent993:
	MOV.B	[W4], W0
	ZE	W0, W1
	MOV	#41, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_OnEvent994
	GOTO	L_NewDesign_driver_OnEvent425
L_NewDesign_driver_OnEvent994:
	MOV.B	[W4], W0
	ZE	W0, W1
	MOV	#43, W0
	CP	W1, W0
	BRA NZ	L_NewDesign_driver_OnEvent995
	GOTO	L_NewDesign_driver_OnEvent426
L_NewDesign_driver_OnEvent995:
L_NewDesign_driver_OnEvent415:
;NewDesign_driver.c,2706 :: 		if (pEvent) {
	ADD	W14, #0, W0
	CP0	[W0]
	BRA NZ	L_NewDesign_driver_OnEvent996
	GOTO	L_NewDesign_driver_OnEvent427
L_NewDesign_driver_OnEvent996:
;NewDesign_driver.c,2707 :: 		ProcessEvent(pEvent);
	MOV	[W14+0], W10
	CALL	NewDesign_driver_ProcessEvent
;NewDesign_driver.c,2708 :: 		}
L_NewDesign_driver_OnEvent427:
;NewDesign_driver.c,2710 :: 		if (pEventC) {
	ADD	W14, #2, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L_NewDesign_driver_OnEvent997
	GOTO	L_NewDesign_driver_OnEvent428
L_NewDesign_driver_OnEvent997:
;NewDesign_driver.c,2711 :: 		ProcessCEvent(pEventC);
	MOV	[W14+2], W10
	MOV	[W14+4], W11
	CALL	NewDesign_driver_ProcessCEvent
;NewDesign_driver.c,2712 :: 		}
L_NewDesign_driver_OnEvent428:
;NewDesign_driver.c,2713 :: 		}
L_end_OnEvent:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of NewDesign_driver_OnEvent

NewDesign_driver_ProcessIntrinsicClickEffects:
	LNK	#2

;NewDesign_driver.c,2715 :: 		static void ProcessIntrinsicClickEffects(TObjInfo *AObjInfo) {
;NewDesign_driver.c,2720 :: 		if (!(AObjInfo->Flags & VTFT_INT_INTRINSIC_CLICK_EFF))
	ADD	W10, #6, W0
	MOV.B	[W0], W0
	BTSC	W0, #3
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects429
;NewDesign_driver.c,2721 :: 		return;
	GOTO	L_end_ProcessIntrinsicClickEffects
L_NewDesign_driver_ProcessIntrinsicClickEffects429:
;NewDesign_driver.c,2723 :: 		switch (AObjInfo->Type) {
	ADD	W10, #4, W0
	MOV	W0, [W14+0]
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects430
;NewDesign_driver.c,2724 :: 		case VTFT_OT_EVETOGGLE:
L_NewDesign_driver_ProcessIntrinsicClickEffects432:
;NewDesign_driver.c,2726 :: 		toggleStepVal = 65535/TOGGLE_STEP_CNT;
; toggleStepVal start address is: 4 (W2)
	MOV	#4369, W2
;NewDesign_driver.c,2727 :: 		if (((TEveToggle *)AObjInfo->Obj)->State)
	MOV	[W10], W1
	MOV	#40, W0
	ADD	W1, W0, W0
	CP0	[W0]
	BRA NZ	L_NewDesign_driver_ProcessIntrinsicClickEffects999
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects624
L_NewDesign_driver_ProcessIntrinsicClickEffects999:
;NewDesign_driver.c,2729 :: 		toggleStepVal = -toggleStepVal;
; toggleStepVal start address is: 4 (W2)
	SUBR	W2, #0, W2
; toggleStepVal end address is: 4 (W2)
; toggleStepVal end address is: 4 (W2)
;NewDesign_driver.c,2730 :: 		}
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects433
L_NewDesign_driver_ProcessIntrinsicClickEffects624:
;NewDesign_driver.c,2727 :: 		if (((TEveToggle *)AObjInfo->Obj)->State)
;NewDesign_driver.c,2730 :: 		}
L_NewDesign_driver_ProcessIntrinsicClickEffects433:
;NewDesign_driver.c,2731 :: 		for (i=0; i<TOGGLE_STEP_CNT; i++)
; toggleStepVal start address is: 4 (W2)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_NewDesign_driver_ProcessIntrinsicClickEffects434:
; i start address is: 6 (W3)
; toggleStepVal start address is: 4 (W2)
; toggleStepVal end address is: 4 (W2)
	CP.B	W3, #15
	BRA LTU	L_NewDesign_driver_ProcessIntrinsicClickEffects1000
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects435
L_NewDesign_driver_ProcessIntrinsicClickEffects1000:
; toggleStepVal end address is: 4 (W2)
;NewDesign_driver.c,2733 :: 		((TEveToggle *)AObjInfo->Obj)->State += toggleStepVal;
; toggleStepVal start address is: 4 (W2)
	MOV	[W10], W1
	MOV	#40, W0
	ADD	W1, W0, W0
	ADD	W2, [W0], [W0]
;NewDesign_driver.c,2734 :: 		DrawScreen(CurrentScreen);
	PUSH.D	W2
	PUSH	W10
	MOV	_CurrentScreen, W10
	CALL	_DrawScreen
	POP	W10
	POP.D	W2
;NewDesign_driver.c,2731 :: 		for (i=0; i<TOGGLE_STEP_CNT; i++)
	INC.B	W3
;NewDesign_driver.c,2735 :: 		}
; toggleStepVal end address is: 4 (W2)
; i end address is: 6 (W3)
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects434
L_NewDesign_driver_ProcessIntrinsicClickEffects435:
;NewDesign_driver.c,2736 :: 		AObjInfo->Flags &= ~VTFT_INT_REPAINT_ON_UP;
	ADD	W10, #6, W2
	ZE	[W2], W1
	MOV	#65533, W0
	AND	W1, W0, W0
	MOV.B	W0, [W2]
;NewDesign_driver.c,2737 :: 		break;
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects431
;NewDesign_driver.c,2739 :: 		}
L_NewDesign_driver_ProcessIntrinsicClickEffects430:
	MOV	[W14+0], W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CP	W0, #31
	BRA NZ	L_NewDesign_driver_ProcessIntrinsicClickEffects1001
	GOTO	L_NewDesign_driver_ProcessIntrinsicClickEffects432
L_NewDesign_driver_ProcessIntrinsicClickEffects1001:
L_NewDesign_driver_ProcessIntrinsicClickEffects431:
;NewDesign_driver.c,2740 :: 		}
L_end_ProcessIntrinsicClickEffects:
	ULNK
	RETURN
; end of NewDesign_driver_ProcessIntrinsicClickEffects

NewDesign_driver_Process_TP_Press:

;NewDesign_driver.c,2742 :: 		static void Process_TP_Press() {
;NewDesign_driver.c,2744 :: 		if (CurrentScreen->Active)
	PUSH	W10
	PUSH	W11
	MOV	#88, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_Press1003
	GOTO	L_NewDesign_driver_Process_TP_Press437
L_NewDesign_driver_Process_TP_Press1003:
;NewDesign_driver.c,2745 :: 		if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
	MOV	#89, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA Z	L_NewDesign_driver_Process_TP_Press1004
	GOTO	L_NewDesign_driver_Process_TP_Press627
L_NewDesign_driver_Process_TP_Press1004:
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L_NewDesign_driver_Process_TP_Press1005
	GOTO	L_NewDesign_driver_Process_TP_Press626
L_NewDesign_driver_Process_TP_Press1005:
	GOTO	L_NewDesign_driver_Process_TP_Press440
L_NewDesign_driver_Process_TP_Press627:
L_NewDesign_driver_Process_TP_Press626:
;NewDesign_driver.c,2746 :: 		ProcessEvent(CurrentScreen->OnPress);
	MOV	#96, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	MOV	[W0], W10
	CALL	NewDesign_driver_ProcessEvent
L_NewDesign_driver_Process_TP_Press440:
L_NewDesign_driver_Process_TP_Press437:
;NewDesign_driver.c,2749 :: 		if (!TouchS.ActObjInfo.Obj)
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA Z	L_NewDesign_driver_Process_TP_Press1006
	GOTO	L_NewDesign_driver_Process_TP_Press441
L_NewDesign_driver_Process_TP_Press1006:
;NewDesign_driver.c,2750 :: 		return;
	GOTO	L_end_Process_TP_Press
L_NewDesign_driver_Process_TP_Press441:
;NewDesign_driver.c,2752 :: 		OnEvent(&TouchS.ActObjInfo, VTFT_EVT_PRESS);
	MOV.B	#3, W11
	MOV	#lo_addr(_TouchS+6), W10
	CALL	NewDesign_driver_OnEvent
;NewDesign_driver.c,2753 :: 		}
L_end_Process_TP_Press:
	POP	W11
	POP	W10
	RETURN
; end of NewDesign_driver_Process_TP_Press

NewDesign_driver_Process_TP_Up:
	LNK	#14

;NewDesign_driver.c,2755 :: 		static void Process_TP_Up() {
;NewDesign_driver.c,2760 :: 		if (CurrentScreen->Active)
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#88, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_Up1008
	GOTO	L_NewDesign_driver_Process_TP_Up442
L_NewDesign_driver_Process_TP_Up1008:
;NewDesign_driver.c,2761 :: 		if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
	MOV	#89, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA Z	L_NewDesign_driver_Process_TP_Up1009
	GOTO	L_NewDesign_driver_Process_TP_Up630
L_NewDesign_driver_Process_TP_Up1009:
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L_NewDesign_driver_Process_TP_Up1010
	GOTO	L_NewDesign_driver_Process_TP_Up629
L_NewDesign_driver_Process_TP_Up1010:
	GOTO	L_NewDesign_driver_Process_TP_Up445
L_NewDesign_driver_Process_TP_Up630:
L_NewDesign_driver_Process_TP_Up629:
;NewDesign_driver.c,2762 :: 		ProcessEvent(CurrentScreen->OnUp);
	MOV	#90, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	MOV	[W0], W10
	CALL	NewDesign_driver_ProcessEvent
L_NewDesign_driver_Process_TP_Up445:
L_NewDesign_driver_Process_TP_Up442:
;NewDesign_driver.c,2764 :: 		actObj = TouchS.ActObjInfo;
	ADD	W14, #2, W1
	MOV	#lo_addr(_TouchS+6), W0
	REPEAT	#5
	MOV	[W0++], [W1++]
;NewDesign_driver.c,2766 :: 		memset(&TouchS.ActObjInfo, 0, sizeof(TObjInfo));
	MOV	#12, W12
	CLR	W11
	MOV	#lo_addr(_TouchS+6), W10
	CALL	_memset
;NewDesign_driver.c,2769 :: 		if (!actObj.Obj)
	ADD	W14, #2, W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA Z	L_NewDesign_driver_Process_TP_Up1011
	GOTO	L_NewDesign_driver_Process_TP_Up446
L_NewDesign_driver_Process_TP_Up1011:
;NewDesign_driver.c,2770 :: 		return;
	GOTO	L_end_Process_TP_Up
L_NewDesign_driver_Process_TP_Up446:
;NewDesign_driver.c,2772 :: 		isClick = IsInsideObject(&actObj, TouchS.X, TouchS.Y);
	ADD	W14, #2, W0
	MOV	_TouchS+4, W12
	MOV	_TouchS+2, W11
	MOV	W0, W10
	CALL	NewDesign_driver_IsInsideObject
	MOV.B	W0, [W14+0]
;NewDesign_driver.c,2774 :: 		if (isClick) {
	CP0.B	W0
	BRA NZ	L_NewDesign_driver_Process_TP_Up1012
	GOTO	L_NewDesign_driver_Process_TP_Up447
L_NewDesign_driver_Process_TP_Up1012:
;NewDesign_driver.c,2775 :: 		ProcessIntrinsicClickEffects(&actObj);
	ADD	W14, #2, W0
	MOV	W0, W10
	CALL	NewDesign_driver_ProcessIntrinsicClickEffects
;NewDesign_driver.c,2776 :: 		}
L_NewDesign_driver_Process_TP_Up447:
;NewDesign_driver.c,2778 :: 		if (actObj.Flags & VTFT_INT_REPAINT_ON_UP)
	ADD	W14, #8, W0
	ZE	[W0], W0
	AND	W0, #2, W0
	CP0	W0
	BRA NZ	L_NewDesign_driver_Process_TP_Up1013
	GOTO	L_NewDesign_driver_Process_TP_Up448
L_NewDesign_driver_Process_TP_Up1013:
;NewDesign_driver.c,2779 :: 		DrawScreen(CurrentScreen);
	MOV	_CurrentScreen, W10
	CALL	_DrawScreen
L_NewDesign_driver_Process_TP_Up448:
;NewDesign_driver.c,2781 :: 		OnEvent(&actObj, VTFT_EVT_UP);
	ADD	W14, #2, W0
	CLR	W11
	MOV	W0, W10
	CALL	NewDesign_driver_OnEvent
;NewDesign_driver.c,2782 :: 		if (isClick)
	ADD	W14, #0, W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_Up1014
	GOTO	L_NewDesign_driver_Process_TP_Up449
L_NewDesign_driver_Process_TP_Up1014:
;NewDesign_driver.c,2783 :: 		OnEvent(&actObj, VTFT_EVT_CLICK);
	ADD	W14, #2, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	NewDesign_driver_OnEvent
L_NewDesign_driver_Process_TP_Up449:
;NewDesign_driver.c,2784 :: 		}
L_end_Process_TP_Up:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of NewDesign_driver_Process_TP_Up

NewDesign_driver_Process_TP_Down:

;NewDesign_driver.c,2786 :: 		static void Process_TP_Down() {
;NewDesign_driver.c,2788 :: 		if (TouchS.Tag) {        // objects must not have zero for tag value
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_TouchS+1), W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_Down1016
	GOTO	L_NewDesign_driver_Process_TP_Down450
L_NewDesign_driver_Process_TP_Down1016:
;NewDesign_driver.c,2789 :: 		if (TouchS.Tag != 255) // can not search objects by default tag value
	MOV	#lo_addr(_TouchS+1), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L_NewDesign_driver_Process_TP_Down1017
	GOTO	L_NewDesign_driver_Process_TP_Down451
L_NewDesign_driver_Process_TP_Down1017:
;NewDesign_driver.c,2790 :: 		GetActiveObjectByTag(TouchS.Tag, &TouchS.ActObjInfo);
	MOV	#lo_addr(_TouchS+1), W0
	MOV	#lo_addr(_TouchS+6), W11
	MOV.B	[W0], W10
	CALL	_GetActiveObjectByTag
L_NewDesign_driver_Process_TP_Down451:
;NewDesign_driver.c,2791 :: 		if (!TouchS.ActObjInfo.Obj) // object not found by tag, search by coordinates
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA Z	L_NewDesign_driver_Process_TP_Down1018
	GOTO	L_NewDesign_driver_Process_TP_Down452
L_NewDesign_driver_Process_TP_Down1018:
;NewDesign_driver.c,2792 :: 		GetActiveObjectByXY(TouchS.X, TouchS.Y, &TouchS.ActObjInfo);
	MOV	#lo_addr(_TouchS+6), W12
	MOV	_TouchS+4, W11
	MOV	_TouchS+2, W10
	CALL	_GetActiveObjectByXY
L_NewDesign_driver_Process_TP_Down452:
;NewDesign_driver.c,2793 :: 		}
L_NewDesign_driver_Process_TP_Down450:
;NewDesign_driver.c,2796 :: 		if (CurrentScreen->Active)
	MOV	#88, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_Down1019
	GOTO	L_NewDesign_driver_Process_TP_Down453
L_NewDesign_driver_Process_TP_Down1019:
;NewDesign_driver.c,2797 :: 		if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
	MOV	#89, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA Z	L_NewDesign_driver_Process_TP_Down1020
	GOTO	L_NewDesign_driver_Process_TP_Down633
L_NewDesign_driver_Process_TP_Down1020:
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA NZ	L_NewDesign_driver_Process_TP_Down1021
	GOTO	L_NewDesign_driver_Process_TP_Down632
L_NewDesign_driver_Process_TP_Down1021:
	GOTO	L_NewDesign_driver_Process_TP_Down456
L_NewDesign_driver_Process_TP_Down633:
L_NewDesign_driver_Process_TP_Down632:
;NewDesign_driver.c,2798 :: 		ProcessEvent(CurrentScreen->OnDown);
	MOV	#92, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	MOV	[W0], W10
	CALL	NewDesign_driver_ProcessEvent
L_NewDesign_driver_Process_TP_Down456:
L_NewDesign_driver_Process_TP_Down453:
;NewDesign_driver.c,2801 :: 		if (!TouchS.ActObjInfo.Obj)
	MOV	#lo_addr(_TouchS+6), W1
	MOV	[W1++], W0
	IOR	W0, [W1--], W0
	BRA Z	L_NewDesign_driver_Process_TP_Down1022
	GOTO	L_NewDesign_driver_Process_TP_Down457
L_NewDesign_driver_Process_TP_Down1022:
;NewDesign_driver.c,2802 :: 		return;
	GOTO	L_end_Process_TP_Down
L_NewDesign_driver_Process_TP_Down457:
;NewDesign_driver.c,2804 :: 		if (TouchS.ActObjInfo.Flags & VTFT_INT_REPAINT_ON_DOWN)
	MOV	#lo_addr(_TouchS+12), W0
	ZE	[W0], W0
	AND	W0, #1, W0
	CP0	W0
	BRA NZ	L_NewDesign_driver_Process_TP_Down1023
	GOTO	L_NewDesign_driver_Process_TP_Down458
L_NewDesign_driver_Process_TP_Down1023:
;NewDesign_driver.c,2805 :: 		DrawScreen(CurrentScreen);
	MOV	_CurrentScreen, W10
	CALL	_DrawScreen
L_NewDesign_driver_Process_TP_Down458:
;NewDesign_driver.c,2807 :: 		OnEvent(&TouchS.ActObjInfo, VTFT_EVT_DOWN);
	MOV.B	#1, W11
	MOV	#lo_addr(_TouchS+6), W10
	CALL	NewDesign_driver_OnEvent
;NewDesign_driver.c,2808 :: 		}
L_end_Process_TP_Down:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of NewDesign_driver_Process_TP_Down

NewDesign_driver_Process_TP_TagChange:

;NewDesign_driver.c,2810 :: 		static void Process_TP_TagChange() {
;NewDesign_driver.c,2812 :: 		if (CurrentScreen->Active)
	PUSH	W10
	MOV	#88, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	CP0.B	[W0]
	BRA NZ	L_NewDesign_driver_Process_TP_TagChange1025
	GOTO	L_NewDesign_driver_Process_TP_TagChange459
L_NewDesign_driver_Process_TP_TagChange1025:
;NewDesign_driver.c,2813 :: 		ProcessEvent(CurrentScreen->OnTagChange);
	MOV	#94, W1
	MOV	#lo_addr(_CurrentScreen), W0
	ADD	W1, [W0], W0
	MOV	[W0], W10
	CALL	NewDesign_driver_ProcessEvent
L_NewDesign_driver_Process_TP_TagChange459:
;NewDesign_driver.c,2814 :: 		}
L_end_Process_TP_TagChange:
	POP	W10
	RETURN
; end of NewDesign_driver_Process_TP_TagChange

_ProcessVTFTStack:
	LNK	#6

;NewDesign_driver.c,2816 :: 		void ProcessVTFTStack() {
;NewDesign_driver.c,2820 :: 		oldTag = TouchS.Tag;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_TouchS+1), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;NewDesign_driver.c,2822 :: 		if (FT800_Touch_GetTagXY(&X, &Y) == 1) {
	ADD	W14, #4, W1
	ADD	W14, #2, W0
	MOV	W1, W11
	MOV	W0, W10
	CALL	_FT800_Touch_GetTagXY
	CP.B	W0, #1
	BRA Z	L__ProcessVTFTStack1027
	GOTO	L_ProcessVTFTStack460
L__ProcessVTFTStack1027:
;NewDesign_driver.c,2823 :: 		FT800_Touch_GetTag(&Tag);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Touch_GetTag
;NewDesign_driver.c,2825 :: 		TouchS.Tag = Tag;
	MOV	#lo_addr(_TouchS+1), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2826 :: 		TouchS.X = X;
	MOV	[W14+2], W0
	MOV	W0, _TouchS+2
;NewDesign_driver.c,2827 :: 		TouchS.Y = Y;
	MOV	[W14+4], W0
	MOV	W0, _TouchS+4
;NewDesign_driver.c,2829 :: 		if (!TouchS.Pressed) {
	MOV	#lo_addr(_TouchS), W0
	CP0.B	[W0]
	BRA Z	L__ProcessVTFTStack1028
	GOTO	L_ProcessVTFTStack461
L__ProcessVTFTStack1028:
;NewDesign_driver.c,2830 :: 		TouchS.Pressed = 1;
	MOV	#lo_addr(_TouchS), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2831 :: 		Process_TP_Down();
	CALL	NewDesign_driver_Process_TP_Down
;NewDesign_driver.c,2832 :: 		}
L_ProcessVTFTStack461:
;NewDesign_driver.c,2834 :: 		Process_TP_Press();
	CALL	NewDesign_driver_Process_TP_Press
;NewDesign_driver.c,2835 :: 		}
	GOTO	L_ProcessVTFTStack462
L_ProcessVTFTStack460:
;NewDesign_driver.c,2836 :: 		else if (TouchS.Pressed) {
	MOV	#lo_addr(_TouchS), W0
	CP0.B	[W0]
	BRA NZ	L__ProcessVTFTStack1029
	GOTO	L_ProcessVTFTStack463
L__ProcessVTFTStack1029:
;NewDesign_driver.c,2837 :: 		Process_TP_Up();
	CALL	NewDesign_driver_Process_TP_Up
;NewDesign_driver.c,2839 :: 		TouchS.Tag = 0;
	MOV	#lo_addr(_TouchS+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2840 :: 		TouchS.X   = X;
	MOV	[W14+2], W0
	MOV	W0, _TouchS+2
;NewDesign_driver.c,2841 :: 		TouchS.Y   = Y;
	MOV	[W14+4], W0
	MOV	W0, _TouchS+4
;NewDesign_driver.c,2843 :: 		TouchS.Pressed = 0;
	MOV	#lo_addr(_TouchS), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2844 :: 		}
L_ProcessVTFTStack463:
L_ProcessVTFTStack462:
;NewDesign_driver.c,2846 :: 		if (oldTag != TouchS.Tag)
	MOV.B	[W14+1], W1
	MOV	#lo_addr(_TouchS+1), W0
	CP.B	W1, [W0]
	BRA NZ	L__ProcessVTFTStack1030
	GOTO	L_ProcessVTFTStack464
L__ProcessVTFTStack1030:
;NewDesign_driver.c,2847 :: 		Process_TP_TagChange();
	CALL	NewDesign_driver_Process_TP_TagChange
L_ProcessVTFTStack464:
;NewDesign_driver.c,2848 :: 		}
L_end_ProcessVTFTStack:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _ProcessVTFTStack

NewDesign_driver_InitObjects:

;NewDesign_driver.c,2850 :: 		static void InitObjects() {
;NewDesign_driver.c,2852 :: 		SplashScreen.Color                = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _SplashScreen
;NewDesign_driver.c,2853 :: 		SplashScreen.Width                = 480;
	MOV	#480, W0
	MOV	W0, _SplashScreen+2
;NewDesign_driver.c,2854 :: 		SplashScreen.Height               = 272;
	MOV	#272, W0
	MOV	W0, _SplashScreen+4
;NewDesign_driver.c,2855 :: 		SplashScreen.ObjectsCount         = 4;
	MOV	#lo_addr(_SplashScreen+6), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2856 :: 		SplashScreen.BoxesCount           = 0;
	MOV	#lo_addr(_SplashScreen+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2857 :: 		SplashScreen.Boxes                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+8
	MOV	W1, _SplashScreen+10
;NewDesign_driver.c,2858 :: 		SplashScreen.CBoxesCount          = 0;
	MOV	#lo_addr(_SplashScreen+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2859 :: 		SplashScreen.CBoxes               = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+14
	MOV	W1, _SplashScreen+16
;NewDesign_driver.c,2860 :: 		SplashScreen.Boxes_RoundCount     = 0;
	MOV	#lo_addr(_SplashScreen+18), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2861 :: 		SplashScreen.Boxes_Round          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+20
	MOV	W1, _SplashScreen+22
;NewDesign_driver.c,2862 :: 		SplashScreen.CBoxes_RoundCount    = 0;
	MOV	#lo_addr(_SplashScreen+24), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2863 :: 		SplashScreen.CBoxes_Round         = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+26
	MOV	W1, _SplashScreen+28
;NewDesign_driver.c,2864 :: 		SplashScreen.LinesCount           = 0;
	MOV	#lo_addr(_SplashScreen+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2865 :: 		SplashScreen.Lines                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+32
	MOV	W1, _SplashScreen+34
;NewDesign_driver.c,2866 :: 		SplashScreen.EveGaugesCount       = 0;
	MOV	#lo_addr(_SplashScreen+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2867 :: 		SplashScreen.EveGauges            = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+38
	MOV	W1, _SplashScreen+40
;NewDesign_driver.c,2868 :: 		SplashScreen.EveKeysCount         = 0;
	MOV	#lo_addr(_SplashScreen+42), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2869 :: 		SplashScreen.EveKeys              = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+44
	MOV	W1, _SplashScreen+46
;NewDesign_driver.c,2870 :: 		SplashScreen.EveProgressBarsCount = 1;
	MOV	#lo_addr(_SplashScreen+48), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2871 :: 		SplashScreen.EveProgressBars      = SplashScreen_EveProgressBars;
	MOV	#lo_addr(_SplashScreen_EveProgressBars), W0
	MOV	#higher_addr(_SplashScreen_EveProgressBars), W1
	MOV	W0, _SplashScreen+50
	MOV	W1, _SplashScreen+52
;NewDesign_driver.c,2872 :: 		SplashScreen.EveTogglesCount      = 0;
	MOV	#lo_addr(_SplashScreen+54), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2873 :: 		SplashScreen.EveToggles           = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+56
	MOV	W1, _SplashScreen+58
;NewDesign_driver.c,2874 :: 		SplashScreen.EveButtonsCount      = 1;
	MOV	#lo_addr(_SplashScreen+60), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2875 :: 		SplashScreen.EveButtons           = SplashScreen_EveButtons;
	MOV	#lo_addr(_SplashScreen_EveButtons), W0
	MOV	#higher_addr(_SplashScreen_EveButtons), W1
	MOV	W0, _SplashScreen+62
	MOV	W1, _SplashScreen+64
;NewDesign_driver.c,2876 :: 		SplashScreen.EveTextsCount        = 1;
	MOV	#lo_addr(_SplashScreen+66), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2877 :: 		SplashScreen.EveTexts             = SplashScreen_EveTexts;
	MOV	#lo_addr(_SplashScreen_EveTexts), W0
	MOV	#higher_addr(_SplashScreen_EveTexts), W1
	MOV	W0, _SplashScreen+68
	MOV	W1, _SplashScreen+70
;NewDesign_driver.c,2878 :: 		SplashScreen.CEveTextsCount       = 1;
	MOV	#lo_addr(_SplashScreen+72), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2879 :: 		SplashScreen.CEveTexts            = SplashScreen_CEveTexts;
	MOV	#lo_addr(_SplashScreen_CEveTexts), W0
	MOV	#higher_addr(_SplashScreen_CEveTexts), W1
	MOV	W0, _SplashScreen+74
	MOV	W1, _SplashScreen+76
;NewDesign_driver.c,2880 :: 		SplashScreen.CEveNumbersCount     = 0;
	MOV	#lo_addr(_SplashScreen+78), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2881 :: 		SplashScreen.CEveNumbers          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+80
	MOV	W1, _SplashScreen+82
;NewDesign_driver.c,2882 :: 		SplashScreen.DynResStart          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SplashScreen+84
	MOV	W1, _SplashScreen+86
;NewDesign_driver.c,2883 :: 		SplashScreen.Active               = 0;
	MOV	#lo_addr(_SplashScreen+88), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2884 :: 		SplashScreen.SniffObjectEvents    = 0;
	MOV	#lo_addr(_SplashScreen+89), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2885 :: 		SplashScreen.OnUp                 = 0;
	CLR	W0
	MOV	W0, _SplashScreen+90
;NewDesign_driver.c,2886 :: 		SplashScreen.OnDown               = 0;
	CLR	W0
	MOV	W0, _SplashScreen+92
;NewDesign_driver.c,2887 :: 		SplashScreen.OnTagChange          = 0;
	CLR	W0
	MOV	W0, _SplashScreen+94
;NewDesign_driver.c,2888 :: 		SplashScreen.OnPress              = 0;
	CLR	W0
	MOV	W0, _SplashScreen+96
;NewDesign_driver.c,2891 :: 		SamplingScreen.Color                = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _SamplingScreen
;NewDesign_driver.c,2892 :: 		SamplingScreen.Width                = 480;
	MOV	#480, W0
	MOV	W0, _SamplingScreen+2
;NewDesign_driver.c,2893 :: 		SamplingScreen.Height               = 272;
	MOV	#272, W0
	MOV	W0, _SamplingScreen+4
;NewDesign_driver.c,2894 :: 		SamplingScreen.ObjectsCount         = 27;
	MOV	#lo_addr(_SamplingScreen+6), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2895 :: 		SamplingScreen.BoxesCount           = 0;
	MOV	#lo_addr(_SamplingScreen+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2896 :: 		SamplingScreen.Boxes                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+8
	MOV	W1, _SamplingScreen+10
;NewDesign_driver.c,2897 :: 		SamplingScreen.CBoxesCount          = 0;
	MOV	#lo_addr(_SamplingScreen+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2898 :: 		SamplingScreen.CBoxes               = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+14
	MOV	W1, _SamplingScreen+16
;NewDesign_driver.c,2899 :: 		SamplingScreen.Boxes_RoundCount     = 2;
	MOV	#lo_addr(_SamplingScreen+18), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2900 :: 		SamplingScreen.Boxes_Round          = SamplingScreen_Boxes_Round;
	MOV	#lo_addr(_SamplingScreen_Boxes_Round), W0
	MOV	#higher_addr(_SamplingScreen_Boxes_Round), W1
	MOV	W0, _SamplingScreen+20
	MOV	W1, _SamplingScreen+22
;NewDesign_driver.c,2901 :: 		SamplingScreen.CBoxes_RoundCount    = 2;
	MOV	#lo_addr(_SamplingScreen+24), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2902 :: 		SamplingScreen.CBoxes_Round         = SamplingScreen_CBoxes_Round;
	MOV	#lo_addr(_SamplingScreen_CBoxes_Round), W0
	MOV	#higher_addr(_SamplingScreen_CBoxes_Round), W1
	MOV	W0, _SamplingScreen+26
	MOV	W1, _SamplingScreen+28
;NewDesign_driver.c,2903 :: 		SamplingScreen.LinesCount           = 0;
	MOV	#lo_addr(_SamplingScreen+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2904 :: 		SamplingScreen.Lines                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+32
	MOV	W1, _SamplingScreen+34
;NewDesign_driver.c,2905 :: 		SamplingScreen.EveGaugesCount       = 0;
	MOV	#lo_addr(_SamplingScreen+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2906 :: 		SamplingScreen.EveGauges            = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+38
	MOV	W1, _SamplingScreen+40
;NewDesign_driver.c,2907 :: 		SamplingScreen.EveKeysCount         = 0;
	MOV	#lo_addr(_SamplingScreen+42), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2908 :: 		SamplingScreen.EveKeys              = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+44
	MOV	W1, _SamplingScreen+46
;NewDesign_driver.c,2909 :: 		SamplingScreen.EveProgressBarsCount = 0;
	MOV	#lo_addr(_SamplingScreen+48), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2910 :: 		SamplingScreen.EveProgressBars      = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+50
	MOV	W1, _SamplingScreen+52
;NewDesign_driver.c,2911 :: 		SamplingScreen.EveTogglesCount      = 0;
	MOV	#lo_addr(_SamplingScreen+54), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2912 :: 		SamplingScreen.EveToggles           = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+56
	MOV	W1, _SamplingScreen+58
;NewDesign_driver.c,2913 :: 		SamplingScreen.EveButtonsCount      = 8;
	MOV	#lo_addr(_SamplingScreen+60), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2914 :: 		SamplingScreen.EveButtons           = SamplingScreen_EveButtons;
	MOV	#lo_addr(_SamplingScreen_EveButtons), W0
	MOV	#higher_addr(_SamplingScreen_EveButtons), W1
	MOV	W0, _SamplingScreen+62
	MOV	W1, _SamplingScreen+64
;NewDesign_driver.c,2915 :: 		SamplingScreen.EveTextsCount        = 9;
	MOV	#lo_addr(_SamplingScreen+66), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2916 :: 		SamplingScreen.EveTexts             = SamplingScreen_EveTexts;
	MOV	#lo_addr(_SamplingScreen_EveTexts), W0
	MOV	#higher_addr(_SamplingScreen_EveTexts), W1
	MOV	W0, _SamplingScreen+68
	MOV	W1, _SamplingScreen+70
;NewDesign_driver.c,2917 :: 		SamplingScreen.CEveTextsCount       = 6;
	MOV	#lo_addr(_SamplingScreen+72), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2918 :: 		SamplingScreen.CEveTexts            = SamplingScreen_CEveTexts;
	MOV	#lo_addr(_SamplingScreen_CEveTexts), W0
	MOV	#higher_addr(_SamplingScreen_CEveTexts), W1
	MOV	W0, _SamplingScreen+74
	MOV	W1, _SamplingScreen+76
;NewDesign_driver.c,2919 :: 		SamplingScreen.CEveNumbersCount     = 0;
	MOV	#lo_addr(_SamplingScreen+78), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2920 :: 		SamplingScreen.CEveNumbers          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+80
	MOV	W1, _SamplingScreen+82
;NewDesign_driver.c,2921 :: 		SamplingScreen.DynResStart          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SamplingScreen+84
	MOV	W1, _SamplingScreen+86
;NewDesign_driver.c,2922 :: 		SamplingScreen.Active               = 0;
	MOV	#lo_addr(_SamplingScreen+88), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2923 :: 		SamplingScreen.SniffObjectEvents    = 0;
	MOV	#lo_addr(_SamplingScreen+89), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2924 :: 		SamplingScreen.OnUp                 = 0;
	CLR	W0
	MOV	W0, _SamplingScreen+90
;NewDesign_driver.c,2925 :: 		SamplingScreen.OnDown               = 0;
	CLR	W0
	MOV	W0, _SamplingScreen+92
;NewDesign_driver.c,2926 :: 		SamplingScreen.OnTagChange          = 0;
	CLR	W0
	MOV	W0, _SamplingScreen+94
;NewDesign_driver.c,2927 :: 		SamplingScreen.OnPress              = 0;
	CLR	W0
	MOV	W0, _SamplingScreen+96
;NewDesign_driver.c,2930 :: 		ProfilingScreen.Color                = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _ProfilingScreen
;NewDesign_driver.c,2931 :: 		ProfilingScreen.Width                = 480;
	MOV	#480, W0
	MOV	W0, _ProfilingScreen+2
;NewDesign_driver.c,2932 :: 		ProfilingScreen.Height               = 272;
	MOV	#272, W0
	MOV	W0, _ProfilingScreen+4
;NewDesign_driver.c,2933 :: 		ProfilingScreen.ObjectsCount         = 73;
	MOV	#lo_addr(_ProfilingScreen+6), W1
	MOV.B	#73, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2934 :: 		ProfilingScreen.BoxesCount           = 1;
	MOV	#lo_addr(_ProfilingScreen+7), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2935 :: 		ProfilingScreen.Boxes                = ProfilingScreen_Boxes;
	MOV	#lo_addr(_ProfilingScreen_Boxes), W0
	MOV	#higher_addr(_ProfilingScreen_Boxes), W1
	MOV	W0, _ProfilingScreen+8
	MOV	W1, _ProfilingScreen+10
;NewDesign_driver.c,2936 :: 		ProfilingScreen.CBoxesCount          = 1;
	MOV	#lo_addr(_ProfilingScreen+12), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2937 :: 		ProfilingScreen.CBoxes               = ProfilingScreen_CBoxes;
	MOV	#lo_addr(_ProfilingScreen_CBoxes), W0
	MOV	#higher_addr(_ProfilingScreen_CBoxes), W1
	MOV	W0, _ProfilingScreen+14
	MOV	W1, _ProfilingScreen+16
;NewDesign_driver.c,2938 :: 		ProfilingScreen.Boxes_RoundCount     = 0;
	MOV	#lo_addr(_ProfilingScreen+18), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2939 :: 		ProfilingScreen.Boxes_Round          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ProfilingScreen+20
	MOV	W1, _ProfilingScreen+22
;NewDesign_driver.c,2940 :: 		ProfilingScreen.CBoxes_RoundCount    = 1;
	MOV	#lo_addr(_ProfilingScreen+24), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2941 :: 		ProfilingScreen.CBoxes_Round         = ProfilingScreen_CBoxes_Round;
	MOV	#lo_addr(_ProfilingScreen_CBoxes_Round), W0
	MOV	#higher_addr(_ProfilingScreen_CBoxes_Round), W1
	MOV	W0, _ProfilingScreen+26
	MOV	W1, _ProfilingScreen+28
;NewDesign_driver.c,2942 :: 		ProfilingScreen.LinesCount           = 50;
	MOV	#lo_addr(_ProfilingScreen+30), W1
	MOV.B	#50, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2943 :: 		ProfilingScreen.Lines                = ProfilingScreen_Lines;
	MOV	#lo_addr(_ProfilingScreen_Lines), W0
	MOV	#higher_addr(_ProfilingScreen_Lines), W1
	MOV	W0, _ProfilingScreen+32
	MOV	W1, _ProfilingScreen+34
;NewDesign_driver.c,2944 :: 		ProfilingScreen.EveGaugesCount       = 1;
	MOV	#lo_addr(_ProfilingScreen+36), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2945 :: 		ProfilingScreen.EveGauges            = ProfilingScreen_EveGauges;
	MOV	#lo_addr(_ProfilingScreen_EveGauges), W0
	MOV	#higher_addr(_ProfilingScreen_EveGauges), W1
	MOV	W0, _ProfilingScreen+38
	MOV	W1, _ProfilingScreen+40
;NewDesign_driver.c,2946 :: 		ProfilingScreen.EveKeysCount         = 0;
	MOV	#lo_addr(_ProfilingScreen+42), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2947 :: 		ProfilingScreen.EveKeys              = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ProfilingScreen+44
	MOV	W1, _ProfilingScreen+46
;NewDesign_driver.c,2948 :: 		ProfilingScreen.EveProgressBarsCount = 0;
	MOV	#lo_addr(_ProfilingScreen+48), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2949 :: 		ProfilingScreen.EveProgressBars      = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ProfilingScreen+50
	MOV	W1, _ProfilingScreen+52
;NewDesign_driver.c,2950 :: 		ProfilingScreen.EveTogglesCount      = 1;
	MOV	#lo_addr(_ProfilingScreen+54), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2951 :: 		ProfilingScreen.EveToggles           = ProfilingScreen_EveToggles;
	MOV	#lo_addr(_ProfilingScreen_EveToggles), W0
	MOV	#higher_addr(_ProfilingScreen_EveToggles), W1
	MOV	W0, _ProfilingScreen+56
	MOV	W1, _ProfilingScreen+58
;NewDesign_driver.c,2952 :: 		ProfilingScreen.EveButtonsCount      = 7;
	MOV	#lo_addr(_ProfilingScreen+60), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2953 :: 		ProfilingScreen.EveButtons           = ProfilingScreen_EveButtons;
	MOV	#lo_addr(_ProfilingScreen_EveButtons), W0
	MOV	#higher_addr(_ProfilingScreen_EveButtons), W1
	MOV	W0, _ProfilingScreen+62
	MOV	W1, _ProfilingScreen+64
;NewDesign_driver.c,2954 :: 		ProfilingScreen.EveTextsCount        = 4;
	MOV	#lo_addr(_ProfilingScreen+66), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2955 :: 		ProfilingScreen.EveTexts             = ProfilingScreen_EveTexts;
	MOV	#lo_addr(_ProfilingScreen_EveTexts), W0
	MOV	#higher_addr(_ProfilingScreen_EveTexts), W1
	MOV	W0, _ProfilingScreen+68
	MOV	W1, _ProfilingScreen+70
;NewDesign_driver.c,2956 :: 		ProfilingScreen.CEveTextsCount       = 4;
	MOV	#lo_addr(_ProfilingScreen+72), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2957 :: 		ProfilingScreen.CEveTexts            = ProfilingScreen_CEveTexts;
	MOV	#lo_addr(_ProfilingScreen_CEveTexts), W0
	MOV	#higher_addr(_ProfilingScreen_CEveTexts), W1
	MOV	W0, _ProfilingScreen+74
	MOV	W1, _ProfilingScreen+76
;NewDesign_driver.c,2958 :: 		ProfilingScreen.CEveNumbersCount     = 3;
	MOV	#lo_addr(_ProfilingScreen+78), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2959 :: 		ProfilingScreen.CEveNumbers          = ProfilingScreen_CEveNumbers;
	MOV	#lo_addr(_ProfilingScreen_CEveNumbers), W0
	MOV	#higher_addr(_ProfilingScreen_CEveNumbers), W1
	MOV	W0, _ProfilingScreen+80
	MOV	W1, _ProfilingScreen+82
;NewDesign_driver.c,2960 :: 		ProfilingScreen.DynResStart          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ProfilingScreen+84
	MOV	W1, _ProfilingScreen+86
;NewDesign_driver.c,2961 :: 		ProfilingScreen.Active               = 1;
	MOV	#lo_addr(_ProfilingScreen+88), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2962 :: 		ProfilingScreen.SniffObjectEvents    = 0;
	MOV	#lo_addr(_ProfilingScreen+89), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2963 :: 		ProfilingScreen.OnUp                 = 0;
	CLR	W0
	MOV	W0, _ProfilingScreen+90
;NewDesign_driver.c,2964 :: 		ProfilingScreen.OnDown               = 0;
	CLR	W0
	MOV	W0, _ProfilingScreen+92
;NewDesign_driver.c,2965 :: 		ProfilingScreen.OnTagChange          = 0;
	CLR	W0
	MOV	W0, _ProfilingScreen+94
;NewDesign_driver.c,2966 :: 		ProfilingScreen.OnPress              = 0;
	CLR	W0
	MOV	W0, _ProfilingScreen+96
;NewDesign_driver.c,2969 :: 		SettingScreen.Color                = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _SettingScreen
;NewDesign_driver.c,2970 :: 		SettingScreen.Width                = 480;
	MOV	#480, W0
	MOV	W0, _SettingScreen+2
;NewDesign_driver.c,2971 :: 		SettingScreen.Height               = 272;
	MOV	#272, W0
	MOV	W0, _SettingScreen+4
;NewDesign_driver.c,2972 :: 		SettingScreen.ObjectsCount         = 13;
	MOV	#lo_addr(_SettingScreen+6), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2973 :: 		SettingScreen.BoxesCount           = 0;
	MOV	#lo_addr(_SettingScreen+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2974 :: 		SettingScreen.Boxes                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+8
	MOV	W1, _SettingScreen+10
;NewDesign_driver.c,2975 :: 		SettingScreen.CBoxesCount          = 0;
	MOV	#lo_addr(_SettingScreen+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2976 :: 		SettingScreen.CBoxes               = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+14
	MOV	W1, _SettingScreen+16
;NewDesign_driver.c,2977 :: 		SettingScreen.Boxes_RoundCount     = 0;
	MOV	#lo_addr(_SettingScreen+18), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2978 :: 		SettingScreen.Boxes_Round          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+20
	MOV	W1, _SettingScreen+22
;NewDesign_driver.c,2979 :: 		SettingScreen.CBoxes_RoundCount    = 2;
	MOV	#lo_addr(_SettingScreen+24), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2980 :: 		SettingScreen.CBoxes_Round         = SettingScreen_CBoxes_Round;
	MOV	#lo_addr(_SettingScreen_CBoxes_Round), W0
	MOV	#higher_addr(_SettingScreen_CBoxes_Round), W1
	MOV	W0, _SettingScreen+26
	MOV	W1, _SettingScreen+28
;NewDesign_driver.c,2981 :: 		SettingScreen.LinesCount           = 0;
	MOV	#lo_addr(_SettingScreen+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2982 :: 		SettingScreen.Lines                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+32
	MOV	W1, _SettingScreen+34
;NewDesign_driver.c,2983 :: 		SettingScreen.EveGaugesCount       = 0;
	MOV	#lo_addr(_SettingScreen+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2984 :: 		SettingScreen.EveGauges            = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+38
	MOV	W1, _SettingScreen+40
;NewDesign_driver.c,2985 :: 		SettingScreen.EveKeysCount         = 4;
	MOV	#lo_addr(_SettingScreen+42), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2986 :: 		SettingScreen.EveKeys              = SettingScreen_EveKeys;
	MOV	#lo_addr(_SettingScreen_EveKeys), W0
	MOV	#higher_addr(_SettingScreen_EveKeys), W1
	MOV	W0, _SettingScreen+44
	MOV	W1, _SettingScreen+46
;NewDesign_driver.c,2987 :: 		SettingScreen.EveProgressBarsCount = 0;
	MOV	#lo_addr(_SettingScreen+48), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2988 :: 		SettingScreen.EveProgressBars      = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+50
	MOV	W1, _SettingScreen+52
;NewDesign_driver.c,2989 :: 		SettingScreen.EveTogglesCount      = 0;
	MOV	#lo_addr(_SettingScreen+54), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2990 :: 		SettingScreen.EveToggles           = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+56
	MOV	W1, _SettingScreen+58
;NewDesign_driver.c,2991 :: 		SettingScreen.EveButtonsCount      = 6;
	MOV	#lo_addr(_SettingScreen+60), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2992 :: 		SettingScreen.EveButtons           = SettingScreen_EveButtons;
	MOV	#lo_addr(_SettingScreen_EveButtons), W0
	MOV	#higher_addr(_SettingScreen_EveButtons), W1
	MOV	W0, _SettingScreen+62
	MOV	W1, _SettingScreen+64
;NewDesign_driver.c,2993 :: 		SettingScreen.EveTextsCount        = 0;
	MOV	#lo_addr(_SettingScreen+66), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2994 :: 		SettingScreen.EveTexts             = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+68
	MOV	W1, _SettingScreen+70
;NewDesign_driver.c,2995 :: 		SettingScreen.CEveTextsCount       = 1;
	MOV	#lo_addr(_SettingScreen+72), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2996 :: 		SettingScreen.CEveTexts            = SettingScreen_CEveTexts;
	MOV	#lo_addr(_SettingScreen_CEveTexts), W0
	MOV	#higher_addr(_SettingScreen_CEveTexts), W1
	MOV	W0, _SettingScreen+74
	MOV	W1, _SettingScreen+76
;NewDesign_driver.c,2997 :: 		SettingScreen.CEveNumbersCount     = 0;
	MOV	#lo_addr(_SettingScreen+78), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,2998 :: 		SettingScreen.CEveNumbers          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+80
	MOV	W1, _SettingScreen+82
;NewDesign_driver.c,2999 :: 		SettingScreen.DynResStart          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SettingScreen+84
	MOV	W1, _SettingScreen+86
;NewDesign_driver.c,3000 :: 		SettingScreen.Active               = 1;
	MOV	#lo_addr(_SettingScreen+88), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3001 :: 		SettingScreen.SniffObjectEvents    = 1;
	MOV	#lo_addr(_SettingScreen+89), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3002 :: 		SettingScreen.OnUp                 = 0;
	CLR	W0
	MOV	W0, _SettingScreen+90
;NewDesign_driver.c,3003 :: 		SettingScreen.OnDown               = 0;
	CLR	W0
	MOV	W0, _SettingScreen+92
;NewDesign_driver.c,3004 :: 		SettingScreen.OnTagChange          = &SettingScreen_OnTagChange;
	MOV	#lo_addr(_SettingScreen_OnTagChange), W0
	MOV	W0, _SettingScreen+94
;NewDesign_driver.c,3005 :: 		SettingScreen.OnPress              = 0;
	CLR	W0
	MOV	W0, _SettingScreen+96
;NewDesign_driver.c,3007 :: 		SettingScreen_OnTagChange.Action       = SettingScreenOnTagChange;
	MOV	#lo_addr(_SettingScreenOnTagChange), W0
	MOV	W0, _SettingScreen_OnTagChange
;NewDesign_driver.c,3008 :: 		SettingScreen_OnTagChange.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_SettingScreen_OnTagChange+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3009 :: 		SettingScreen_OnTagChange.Sound.Effect = 0;
	MOV	#lo_addr(_SettingScreen_OnTagChange+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3010 :: 		SettingScreen_OnTagChange.Sound.Pitch  = 0;
	MOV	#lo_addr(_SettingScreen_OnTagChange+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3011 :: 		SettingScreen_OnTagChange.Sound.Volume = 0;
	MOV	#lo_addr(_SettingScreen_OnTagChange+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3014 :: 		SummaryScreen.Color                = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _SummaryScreen
;NewDesign_driver.c,3015 :: 		SummaryScreen.Width                = 480;
	MOV	#480, W0
	MOV	W0, _SummaryScreen+2
;NewDesign_driver.c,3016 :: 		SummaryScreen.Height               = 272;
	MOV	#272, W0
	MOV	W0, _SummaryScreen+4
;NewDesign_driver.c,3017 :: 		SummaryScreen.ObjectsCount         = 25;
	MOV	#lo_addr(_SummaryScreen+6), W1
	MOV.B	#25, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3018 :: 		SummaryScreen.BoxesCount           = 0;
	MOV	#lo_addr(_SummaryScreen+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3019 :: 		SummaryScreen.Boxes                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+8
	MOV	W1, _SummaryScreen+10
;NewDesign_driver.c,3020 :: 		SummaryScreen.CBoxesCount          = 0;
	MOV	#lo_addr(_SummaryScreen+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3021 :: 		SummaryScreen.CBoxes               = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+14
	MOV	W1, _SummaryScreen+16
;NewDesign_driver.c,3022 :: 		SummaryScreen.Boxes_RoundCount     = 1;
	MOV	#lo_addr(_SummaryScreen+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3023 :: 		SummaryScreen.Boxes_Round          = SummaryScreen_Boxes_Round;
	MOV	#lo_addr(_SummaryScreen_Boxes_Round), W0
	MOV	#higher_addr(_SummaryScreen_Boxes_Round), W1
	MOV	W0, _SummaryScreen+20
	MOV	W1, _SummaryScreen+22
;NewDesign_driver.c,3024 :: 		SummaryScreen.CBoxes_RoundCount    = 2;
	MOV	#lo_addr(_SummaryScreen+24), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3025 :: 		SummaryScreen.CBoxes_Round         = SummaryScreen_CBoxes_Round;
	MOV	#lo_addr(_SummaryScreen_CBoxes_Round), W0
	MOV	#higher_addr(_SummaryScreen_CBoxes_Round), W1
	MOV	W0, _SummaryScreen+26
	MOV	W1, _SummaryScreen+28
;NewDesign_driver.c,3026 :: 		SummaryScreen.LinesCount           = 0;
	MOV	#lo_addr(_SummaryScreen+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3027 :: 		SummaryScreen.Lines                = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+32
	MOV	W1, _SummaryScreen+34
;NewDesign_driver.c,3028 :: 		SummaryScreen.EveGaugesCount       = 0;
	MOV	#lo_addr(_SummaryScreen+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3029 :: 		SummaryScreen.EveGauges            = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+38
	MOV	W1, _SummaryScreen+40
;NewDesign_driver.c,3030 :: 		SummaryScreen.EveKeysCount         = 0;
	MOV	#lo_addr(_SummaryScreen+42), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3031 :: 		SummaryScreen.EveKeys              = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+44
	MOV	W1, _SummaryScreen+46
;NewDesign_driver.c,3032 :: 		SummaryScreen.EveProgressBarsCount = 0;
	MOV	#lo_addr(_SummaryScreen+48), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3033 :: 		SummaryScreen.EveProgressBars      = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+50
	MOV	W1, _SummaryScreen+52
;NewDesign_driver.c,3034 :: 		SummaryScreen.EveTogglesCount      = 0;
	MOV	#lo_addr(_SummaryScreen+54), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3035 :: 		SummaryScreen.EveToggles           = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+56
	MOV	W1, _SummaryScreen+58
;NewDesign_driver.c,3036 :: 		SummaryScreen.EveButtonsCount      = 4;
	MOV	#lo_addr(_SummaryScreen+60), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3037 :: 		SummaryScreen.EveButtons           = SummaryScreen_EveButtons;
	MOV	#lo_addr(_SummaryScreen_EveButtons), W0
	MOV	#higher_addr(_SummaryScreen_EveButtons), W1
	MOV	W0, _SummaryScreen+62
	MOV	W1, _SummaryScreen+64
;NewDesign_driver.c,3038 :: 		SummaryScreen.EveTextsCount        = 13;
	MOV	#lo_addr(_SummaryScreen+66), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3039 :: 		SummaryScreen.EveTexts             = SummaryScreen_EveTexts;
	MOV	#lo_addr(_SummaryScreen_EveTexts), W0
	MOV	#higher_addr(_SummaryScreen_EveTexts), W1
	MOV	W0, _SummaryScreen+68
	MOV	W1, _SummaryScreen+70
;NewDesign_driver.c,3040 :: 		SummaryScreen.CEveTextsCount       = 5;
	MOV	#lo_addr(_SummaryScreen+72), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3041 :: 		SummaryScreen.CEveTexts            = SummaryScreen_CEveTexts;
	MOV	#lo_addr(_SummaryScreen_CEveTexts), W0
	MOV	#higher_addr(_SummaryScreen_CEveTexts), W1
	MOV	W0, _SummaryScreen+74
	MOV	W1, _SummaryScreen+76
;NewDesign_driver.c,3042 :: 		SummaryScreen.CEveNumbersCount     = 0;
	MOV	#lo_addr(_SummaryScreen+78), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3043 :: 		SummaryScreen.CEveNumbers          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+80
	MOV	W1, _SummaryScreen+82
;NewDesign_driver.c,3044 :: 		SummaryScreen.DynResStart          = 0;
	CLR	W0
	CLR	W1
	MOV	W0, _SummaryScreen+84
	MOV	W1, _SummaryScreen+86
;NewDesign_driver.c,3045 :: 		SummaryScreen.Active               = 0;
	MOV	#lo_addr(_SummaryScreen+88), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3046 :: 		SummaryScreen.SniffObjectEvents    = 0;
	MOV	#lo_addr(_SummaryScreen+89), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3047 :: 		SummaryScreen.OnUp                 = 0;
	CLR	W0
	MOV	W0, _SummaryScreen+90
;NewDesign_driver.c,3048 :: 		SummaryScreen.OnDown               = 0;
	CLR	W0
	MOV	W0, _SummaryScreen+92
;NewDesign_driver.c,3049 :: 		SummaryScreen.OnTagChange          = 0;
	CLR	W0
	MOV	W0, _SummaryScreen+94
;NewDesign_driver.c,3050 :: 		SummaryScreen.OnPress              = 0;
	CLR	W0
	MOV	W0, _SummaryScreen+96
;NewDesign_driver.c,3052 :: 		EveButtonSplashInit.OwnerScreen   = &SplashScreen;
	MOV	#lo_addr(_SplashScreen), W0
	MOV	W0, _EveButtonSplashInit
;NewDesign_driver.c,3053 :: 		EveButtonSplashInit.Order         = 1;
	MOV	#lo_addr(_EveButtonSplashInit+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3054 :: 		EveButtonSplashInit.Visible       = 1;
	MOV	#lo_addr(_EveButtonSplashInit+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3055 :: 		EveButtonSplashInit.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSplashInit+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3056 :: 		EveButtonSplashInit.Tag           = 255;
	MOV	#lo_addr(_EveButtonSplashInit+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3057 :: 		EveButtonSplashInit.Left          = 150;
	MOV	#150, W0
	MOV	W0, _EveButtonSplashInit+6
;NewDesign_driver.c,3058 :: 		EveButtonSplashInit.Top           = 185;
	MOV	#185, W0
	MOV	W0, _EveButtonSplashInit+8
;NewDesign_driver.c,3059 :: 		EveButtonSplashInit.Width         = 170;
	MOV	#170, W0
	MOV	W0, _EveButtonSplashInit+10
;NewDesign_driver.c,3060 :: 		EveButtonSplashInit.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonSplashInit+12
;NewDesign_driver.c,3061 :: 		EveButtonSplashInit.Color         = 0x0335;
	MOV	#821, W0
	MOV	W0, _EveButtonSplashInit+14
;NewDesign_driver.c,3062 :: 		EveButtonSplashInit.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSplashInit+16
;NewDesign_driver.c,3063 :: 		EveButtonSplashInit.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSplashInit+18
;NewDesign_driver.c,3064 :: 		EveButtonSplashInit.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSplashInit+20
;NewDesign_driver.c,3065 :: 		EveButtonSplashInit.Caption       = EveButtonSplashInit_Caption;
	MOV	#lo_addr(_EveButtonSplashInit_Caption), W0
	MOV	W0, _EveButtonSplashInit+22
;NewDesign_driver.c,3066 :: 		EveButtonSplashInit.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSplashInit+24
	MOV	W1, _EveButtonSplashInit+26
;NewDesign_driver.c,3067 :: 		EveButtonSplashInit.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSplashInit+28
;NewDesign_driver.c,3068 :: 		EveButtonSplashInit.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSplashInit+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3069 :: 		EveButtonSplashInit.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSplashInit+32
	MOV	W1, _EveButtonSplashInit+34
;NewDesign_driver.c,3070 :: 		EveButtonSplashInit.Flat          = 0;
	MOV	#lo_addr(_EveButtonSplashInit+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3071 :: 		EveButtonSplashInit.Active        = 1;
	MOV	#lo_addr(_EveButtonSplashInit+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3072 :: 		EveButtonSplashInit.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSplashInit+38
;NewDesign_driver.c,3073 :: 		EveButtonSplashInit.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSplashInit+40
;NewDesign_driver.c,3074 :: 		EveButtonSplashInit.OnClick       = &EveButtonSplashInit_OnClick;
	MOV	#lo_addr(_EveButtonSplashInit_OnClick), W0
	MOV	W0, _EveButtonSplashInit+42
;NewDesign_driver.c,3075 :: 		EveButtonSplashInit.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSplashInit+44
;NewDesign_driver.c,3077 :: 		EveButtonSplashInit_OnClick.Action       = EveButtonSplashInitOnClick;
	MOV	#lo_addr(_EveButtonSplashInitOnClick), W0
	MOV	W0, _EveButtonSplashInit_OnClick
;NewDesign_driver.c,3078 :: 		EveButtonSplashInit_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSplashInit_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3079 :: 		EveButtonSplashInit_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSplashInit_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3080 :: 		EveButtonSplashInit_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSplashInit_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3081 :: 		EveButtonSplashInit_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSplashInit_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3083 :: 		EveTextSplashScreenStatus.OwnerScreen = &SplashScreen;
	MOV	#lo_addr(_SplashScreen), W0
	MOV	W0, _EveTextSplashScreenStatus
;NewDesign_driver.c,3084 :: 		EveTextSplashScreenStatus.Order       = 2;
	MOV	#lo_addr(_EveTextSplashScreenStatus+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3085 :: 		EveTextSplashScreenStatus.Visible     = 0;
	MOV	#lo_addr(_EveTextSplashScreenStatus+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3086 :: 		EveTextSplashScreenStatus.Opacity     = 255;
	MOV	#lo_addr(_EveTextSplashScreenStatus+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3087 :: 		EveTextSplashScreenStatus.Tag         = 255;
	MOV	#lo_addr(_EveTextSplashScreenStatus+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3088 :: 		EveTextSplashScreenStatus.Left        = 196;
	MOV	#196, W0
	MOV	W0, _EveTextSplashScreenStatus+6
;NewDesign_driver.c,3089 :: 		EveTextSplashScreenStatus.Top         = 162;
	MOV	#162, W0
	MOV	W0, _EveTextSplashScreenStatus+8
;NewDesign_driver.c,3090 :: 		EveTextSplashScreenStatus.Width       = 68;
	MOV	#68, W0
	MOV	W0, _EveTextSplashScreenStatus+10
;NewDesign_driver.c,3091 :: 		EveTextSplashScreenStatus.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveTextSplashScreenStatus+12
;NewDesign_driver.c,3092 :: 		EveTextSplashScreenStatus.Caption     = EveTextSplashScreenStatus_Caption;
	MOV	#lo_addr(_EveTextSplashScreenStatus_Caption), W0
	MOV	W0, _EveTextSplashScreenStatus+14
;NewDesign_driver.c,3093 :: 		EveTextSplashScreenStatus.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSplashScreenStatus+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3094 :: 		EveTextSplashScreenStatus.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveTextSplashScreenStatus+18
	MOV	W1, _EveTextSplashScreenStatus+20
;NewDesign_driver.c,3095 :: 		EveTextSplashScreenStatus.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSplashScreenStatus+22
;NewDesign_driver.c,3096 :: 		EveTextSplashScreenStatus.FontHandle  = 26;
	MOV	#lo_addr(_EveTextSplashScreenStatus+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3097 :: 		EveTextSplashScreenStatus.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSplashScreenStatus+26
	MOV	W1, _EveTextSplashScreenStatus+28
;NewDesign_driver.c,3098 :: 		EveTextSplashScreenStatus.Active      = 0;
	MOV	#lo_addr(_EveTextSplashScreenStatus+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3099 :: 		EveTextSplashScreenStatus.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSplashScreenStatus+32
;NewDesign_driver.c,3100 :: 		EveTextSplashScreenStatus.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSplashScreenStatus+34
;NewDesign_driver.c,3101 :: 		EveTextSplashScreenStatus.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSplashScreenStatus+36
;NewDesign_driver.c,3102 :: 		EveTextSplashScreenStatus.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSplashScreenStatus+38
;NewDesign_driver.c,3104 :: 		EveProgressBar1.OwnerScreen      = &SplashScreen;
	MOV	#lo_addr(_SplashScreen), W0
	MOV	W0, _EveProgressBar1
;NewDesign_driver.c,3105 :: 		EveProgressBar1.Order            = 3;
	MOV	#lo_addr(_EveProgressBar1+2), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3106 :: 		EveProgressBar1.Visible          = 0;
	MOV	#lo_addr(_EveProgressBar1+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3107 :: 		EveProgressBar1.Opacity          = 255;
	MOV	#lo_addr(_EveProgressBar1+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3108 :: 		EveProgressBar1.Tag              = 255;
	MOV	#lo_addr(_EveProgressBar1+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3109 :: 		EveProgressBar1.Left             = 34;
	MOV	#34, W0
	MOV	W0, _EveProgressBar1+6
;NewDesign_driver.c,3110 :: 		EveProgressBar1.Top              = 211;
	MOV	#211, W0
	MOV	W0, _EveProgressBar1+8
;NewDesign_driver.c,3111 :: 		EveProgressBar1.Width            = 404;
	MOV	#404, W0
	MOV	W0, _EveProgressBar1+10
;NewDesign_driver.c,3112 :: 		EveProgressBar1.Height           = 26;
	MOV	#26, W0
	MOV	W0, _EveProgressBar1+12
;NewDesign_driver.c,3113 :: 		EveProgressBar1.Background_Color = 0x0000;
	CLR	W0
	MOV	W0, _EveProgressBar1+14
;NewDesign_driver.c,3114 :: 		EveProgressBar1.Color            = 0x65BC;
	MOV	#26044, W0
	MOV	W0, _EveProgressBar1+16
;NewDesign_driver.c,3115 :: 		EveProgressBar1.Value            = 0;
	CLR	W0
	MOV	W0, _EveProgressBar1+18
;NewDesign_driver.c,3116 :: 		EveProgressBar1.Range            = 100;
	MOV	#100, W0
	MOV	W0, _EveProgressBar1+20
;NewDesign_driver.c,3117 :: 		EveProgressBar1.Flat             = 0;
	MOV	#lo_addr(_EveProgressBar1+22), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3119 :: 		EveTextEncoderSamp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextEncoderSamp
;NewDesign_driver.c,3120 :: 		EveTextEncoderSamp.Order       = 8;
	MOV	#lo_addr(_EveTextEncoderSamp+2), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3121 :: 		EveTextEncoderSamp.Visible     = 1;
	MOV	#lo_addr(_EveTextEncoderSamp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3122 :: 		EveTextEncoderSamp.Opacity     = 255;
	MOV	#lo_addr(_EveTextEncoderSamp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3123 :: 		EveTextEncoderSamp.Tag         = 255;
	MOV	#lo_addr(_EveTextEncoderSamp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3124 :: 		EveTextEncoderSamp.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextEncoderSamp+6
;NewDesign_driver.c,3125 :: 		EveTextEncoderSamp.Top         = 12;
	MOV	#12, W0
	MOV	W0, _EveTextEncoderSamp+8
;NewDesign_driver.c,3126 :: 		EveTextEncoderSamp.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextEncoderSamp+10
;NewDesign_driver.c,3127 :: 		EveTextEncoderSamp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextEncoderSamp+12
;NewDesign_driver.c,3128 :: 		EveTextEncoderSamp.Caption     = EveTextEncoderSamp_Caption;
	MOV	#lo_addr(_EveTextEncoderSamp_Caption), W0
	MOV	W0, _EveTextEncoderSamp+14
;NewDesign_driver.c,3129 :: 		EveTextEncoderSamp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextEncoderSamp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3130 :: 		EveTextEncoderSamp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextEncoderSamp+18
	MOV	W1, _EveTextEncoderSamp+20
;NewDesign_driver.c,3131 :: 		EveTextEncoderSamp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextEncoderSamp+22
;NewDesign_driver.c,3132 :: 		EveTextEncoderSamp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextEncoderSamp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3133 :: 		EveTextEncoderSamp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextEncoderSamp+26
	MOV	W1, _EveTextEncoderSamp+28
;NewDesign_driver.c,3134 :: 		EveTextEncoderSamp.Active      = 1;
	MOV	#lo_addr(_EveTextEncoderSamp+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3135 :: 		EveTextEncoderSamp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextEncoderSamp+32
;NewDesign_driver.c,3136 :: 		EveTextEncoderSamp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextEncoderSamp+34
;NewDesign_driver.c,3137 :: 		EveTextEncoderSamp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextEncoderSamp+36
;NewDesign_driver.c,3138 :: 		EveTextEncoderSamp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextEncoderSamp+38
;NewDesign_driver.c,3140 :: 		EveTextLaserSmp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextLaserSmp
;NewDesign_driver.c,3141 :: 		EveTextLaserSmp.Order       = 9;
	MOV	#lo_addr(_EveTextLaserSmp+2), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3142 :: 		EveTextLaserSmp.Visible     = 1;
	MOV	#lo_addr(_EveTextLaserSmp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3143 :: 		EveTextLaserSmp.Opacity     = 255;
	MOV	#lo_addr(_EveTextLaserSmp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3144 :: 		EveTextLaserSmp.Tag         = 255;
	MOV	#lo_addr(_EveTextLaserSmp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3145 :: 		EveTextLaserSmp.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextLaserSmp+6
;NewDesign_driver.c,3146 :: 		EveTextLaserSmp.Top         = 36;
	MOV	#36, W0
	MOV	W0, _EveTextLaserSmp+8
;NewDesign_driver.c,3147 :: 		EveTextLaserSmp.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextLaserSmp+10
;NewDesign_driver.c,3148 :: 		EveTextLaserSmp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextLaserSmp+12
;NewDesign_driver.c,3149 :: 		EveTextLaserSmp.Caption     = EveTextLaserSmp_Caption;
	MOV	#lo_addr(_EveTextLaserSmp_Caption), W0
	MOV	W0, _EveTextLaserSmp+14
;NewDesign_driver.c,3150 :: 		EveTextLaserSmp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextLaserSmp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3151 :: 		EveTextLaserSmp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextLaserSmp+18
	MOV	W1, _EveTextLaserSmp+20
;NewDesign_driver.c,3152 :: 		EveTextLaserSmp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextLaserSmp+22
;NewDesign_driver.c,3153 :: 		EveTextLaserSmp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextLaserSmp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3154 :: 		EveTextLaserSmp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextLaserSmp+26
	MOV	W1, _EveTextLaserSmp+28
;NewDesign_driver.c,3155 :: 		EveTextLaserSmp.Active      = 1;
	MOV	#lo_addr(_EveTextLaserSmp+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3156 :: 		EveTextLaserSmp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextLaserSmp+32
;NewDesign_driver.c,3157 :: 		EveTextLaserSmp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextLaserSmp+34
;NewDesign_driver.c,3158 :: 		EveTextLaserSmp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextLaserSmp+36
;NewDesign_driver.c,3159 :: 		EveTextLaserSmp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextLaserSmp+38
;NewDesign_driver.c,3161 :: 		EveTextPitchSmp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextPitchSmp
;NewDesign_driver.c,3162 :: 		EveTextPitchSmp.Order       = 10;
	MOV	#lo_addr(_EveTextPitchSmp+2), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3163 :: 		EveTextPitchSmp.Visible     = 1;
	MOV	#lo_addr(_EveTextPitchSmp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3164 :: 		EveTextPitchSmp.Opacity     = 255;
	MOV	#lo_addr(_EveTextPitchSmp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3165 :: 		EveTextPitchSmp.Tag         = 255;
	MOV	#lo_addr(_EveTextPitchSmp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3166 :: 		EveTextPitchSmp.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextPitchSmp+6
;NewDesign_driver.c,3167 :: 		EveTextPitchSmp.Top         = 64;
	MOV	#64, W0
	MOV	W0, _EveTextPitchSmp+8
;NewDesign_driver.c,3168 :: 		EveTextPitchSmp.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextPitchSmp+10
;NewDesign_driver.c,3169 :: 		EveTextPitchSmp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextPitchSmp+12
;NewDesign_driver.c,3170 :: 		EveTextPitchSmp.Caption     = EveTextPitchSmp_Caption;
	MOV	#lo_addr(_EveTextPitchSmp_Caption), W0
	MOV	W0, _EveTextPitchSmp+14
;NewDesign_driver.c,3171 :: 		EveTextPitchSmp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextPitchSmp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3172 :: 		EveTextPitchSmp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextPitchSmp+18
	MOV	W1, _EveTextPitchSmp+20
;NewDesign_driver.c,3173 :: 		EveTextPitchSmp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextPitchSmp+22
;NewDesign_driver.c,3174 :: 		EveTextPitchSmp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextPitchSmp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3175 :: 		EveTextPitchSmp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextPitchSmp+26
	MOV	W1, _EveTextPitchSmp+28
;NewDesign_driver.c,3176 :: 		EveTextPitchSmp.Active      = 1;
	MOV	#lo_addr(_EveTextPitchSmp+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3177 :: 		EveTextPitchSmp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextPitchSmp+32
;NewDesign_driver.c,3178 :: 		EveTextPitchSmp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextPitchSmp+34
;NewDesign_driver.c,3179 :: 		EveTextPitchSmp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextPitchSmp+36
;NewDesign_driver.c,3180 :: 		EveTextPitchSmp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextPitchSmp+38
;NewDesign_driver.c,3182 :: 		EveTextGPSSmp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextGPSSmp
;NewDesign_driver.c,3183 :: 		EveTextGPSSmp.Order       = 11;
	MOV	#lo_addr(_EveTextGPSSmp+2), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3184 :: 		EveTextGPSSmp.Visible     = 1;
	MOV	#lo_addr(_EveTextGPSSmp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3185 :: 		EveTextGPSSmp.Opacity     = 255;
	MOV	#lo_addr(_EveTextGPSSmp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3186 :: 		EveTextGPSSmp.Tag         = 255;
	MOV	#lo_addr(_EveTextGPSSmp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3187 :: 		EveTextGPSSmp.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextGPSSmp+6
;NewDesign_driver.c,3188 :: 		EveTextGPSSmp.Top         = 117;
	MOV	#117, W0
	MOV	W0, _EveTextGPSSmp+8
;NewDesign_driver.c,3189 :: 		EveTextGPSSmp.Width       = 62;
	MOV	#62, W0
	MOV	W0, _EveTextGPSSmp+10
;NewDesign_driver.c,3190 :: 		EveTextGPSSmp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextGPSSmp+12
;NewDesign_driver.c,3191 :: 		EveTextGPSSmp.Caption     = EveTextGPSSmp_Caption;
	MOV	#lo_addr(_EveTextGPSSmp_Caption), W0
	MOV	W0, _EveTextGPSSmp+14
;NewDesign_driver.c,3192 :: 		EveTextGPSSmp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextGPSSmp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3193 :: 		EveTextGPSSmp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextGPSSmp+18
	MOV	W1, _EveTextGPSSmp+20
;NewDesign_driver.c,3194 :: 		EveTextGPSSmp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextGPSSmp+22
;NewDesign_driver.c,3195 :: 		EveTextGPSSmp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextGPSSmp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3196 :: 		EveTextGPSSmp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextGPSSmp+26
	MOV	W1, _EveTextGPSSmp+28
;NewDesign_driver.c,3197 :: 		EveTextGPSSmp.Active      = 0;
	MOV	#lo_addr(_EveTextGPSSmp+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3198 :: 		EveTextGPSSmp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextGPSSmp+32
;NewDesign_driver.c,3199 :: 		EveTextGPSSmp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextGPSSmp+34
;NewDesign_driver.c,3200 :: 		EveTextGPSSmp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextGPSSmp+36
;NewDesign_driver.c,3201 :: 		EveTextGPSSmp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextGPSSmp+38
;NewDesign_driver.c,3203 :: 		EveTextSDSmp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextSDSmp
;NewDesign_driver.c,3204 :: 		EveTextSDSmp.Order       = 12;
	MOV	#lo_addr(_EveTextSDSmp+2), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3205 :: 		EveTextSDSmp.Visible     = 1;
	MOV	#lo_addr(_EveTextSDSmp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3206 :: 		EveTextSDSmp.Opacity     = 255;
	MOV	#lo_addr(_EveTextSDSmp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3207 :: 		EveTextSDSmp.Tag         = 255;
	MOV	#lo_addr(_EveTextSDSmp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3208 :: 		EveTextSDSmp.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextSDSmp+6
;NewDesign_driver.c,3209 :: 		EveTextSDSmp.Top         = 142;
	MOV	#142, W0
	MOV	W0, _EveTextSDSmp+8
;NewDesign_driver.c,3210 :: 		EveTextSDSmp.Width       = 4;
	MOV	#4, W0
	MOV	W0, _EveTextSDSmp+10
;NewDesign_driver.c,3211 :: 		EveTextSDSmp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSDSmp+12
;NewDesign_driver.c,3212 :: 		EveTextSDSmp.Caption     = EveTextSDSmp_Caption;
	MOV	#lo_addr(_EveTextSDSmp_Caption), W0
	MOV	W0, _EveTextSDSmp+14
;NewDesign_driver.c,3213 :: 		EveTextSDSmp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSDSmp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3214 :: 		EveTextSDSmp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSDSmp+18
	MOV	W1, _EveTextSDSmp+20
;NewDesign_driver.c,3215 :: 		EveTextSDSmp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSDSmp+22
;NewDesign_driver.c,3216 :: 		EveTextSDSmp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSDSmp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3217 :: 		EveTextSDSmp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSDSmp+26
	MOV	W1, _EveTextSDSmp+28
;NewDesign_driver.c,3218 :: 		EveTextSDSmp.Active      = 1;
	MOV	#lo_addr(_EveTextSDSmp+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3219 :: 		EveTextSDSmp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSDSmp+32
;NewDesign_driver.c,3220 :: 		EveTextSDSmp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSDSmp+34
;NewDesign_driver.c,3221 :: 		EveTextSDSmp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSDSmp+36
;NewDesign_driver.c,3222 :: 		EveTextSDSmp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSDSmp+38
;NewDesign_driver.c,3224 :: 		EveTextRollSmp.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextRollSmp
;NewDesign_driver.c,3225 :: 		EveTextRollSmp.Order       = 13;
	MOV	#lo_addr(_EveTextRollSmp+2), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3226 :: 		EveTextRollSmp.Visible     = 1;
	MOV	#lo_addr(_EveTextRollSmp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3227 :: 		EveTextRollSmp.Opacity     = 255;
	MOV	#lo_addr(_EveTextRollSmp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3228 :: 		EveTextRollSmp.Tag         = 255;
	MOV	#lo_addr(_EveTextRollSmp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3229 :: 		EveTextRollSmp.Left        = 354;
	MOV	#354, W0
	MOV	W0, _EveTextRollSmp+6
;NewDesign_driver.c,3230 :: 		EveTextRollSmp.Top         = 66;
	MOV	#66, W0
	MOV	W0, _EveTextRollSmp+8
;NewDesign_driver.c,3231 :: 		EveTextRollSmp.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextRollSmp+10
;NewDesign_driver.c,3232 :: 		EveTextRollSmp.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextRollSmp+12
;NewDesign_driver.c,3233 :: 		EveTextRollSmp.Caption     = EveTextRollSmp_Caption;
	MOV	#lo_addr(_EveTextRollSmp_Caption), W0
	MOV	W0, _EveTextRollSmp+14
;NewDesign_driver.c,3234 :: 		EveTextRollSmp.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextRollSmp+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3235 :: 		EveTextRollSmp.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextRollSmp+18
	MOV	W1, _EveTextRollSmp+20
;NewDesign_driver.c,3236 :: 		EveTextRollSmp.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextRollSmp+22
;NewDesign_driver.c,3237 :: 		EveTextRollSmp.FontHandle  = 27;
	MOV	#lo_addr(_EveTextRollSmp+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3238 :: 		EveTextRollSmp.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextRollSmp+26
	MOV	W1, _EveTextRollSmp+28
;NewDesign_driver.c,3239 :: 		EveTextRollSmp.Active      = 1;
	MOV	#lo_addr(_EveTextRollSmp+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3240 :: 		EveTextRollSmp.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextRollSmp+32
;NewDesign_driver.c,3241 :: 		EveTextRollSmp.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextRollSmp+34
;NewDesign_driver.c,3242 :: 		EveTextRollSmp.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextRollSmp+36
;NewDesign_driver.c,3243 :: 		EveTextRollSmp.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextRollSmp+38
;NewDesign_driver.c,3245 :: 		EveTextAccx.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextAccx
;NewDesign_driver.c,3246 :: 		EveTextAccx.Order       = 14;
	MOV	#lo_addr(_EveTextAccx+2), W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3247 :: 		EveTextAccx.Visible     = 1;
	MOV	#lo_addr(_EveTextAccx+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3248 :: 		EveTextAccx.Opacity     = 255;
	MOV	#lo_addr(_EveTextAccx+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3249 :: 		EveTextAccx.Tag         = 255;
	MOV	#lo_addr(_EveTextAccx+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3250 :: 		EveTextAccx.Left        = 190;
	MOV	#190, W0
	MOV	W0, _EveTextAccx+6
;NewDesign_driver.c,3251 :: 		EveTextAccx.Top         = 91;
	MOV	#91, W0
	MOV	W0, _EveTextAccx+8
;NewDesign_driver.c,3252 :: 		EveTextAccx.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextAccx+10
;NewDesign_driver.c,3253 :: 		EveTextAccx.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextAccx+12
;NewDesign_driver.c,3254 :: 		EveTextAccx.Caption     = EveTextAccx_Caption;
	MOV	#lo_addr(_EveTextAccx_Caption), W0
	MOV	W0, _EveTextAccx+14
;NewDesign_driver.c,3255 :: 		EveTextAccx.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextAccx+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3256 :: 		EveTextAccx.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextAccx+18
	MOV	W1, _EveTextAccx+20
;NewDesign_driver.c,3257 :: 		EveTextAccx.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextAccx+22
;NewDesign_driver.c,3258 :: 		EveTextAccx.FontHandle  = 27;
	MOV	#lo_addr(_EveTextAccx+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3259 :: 		EveTextAccx.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextAccx+26
	MOV	W1, _EveTextAccx+28
;NewDesign_driver.c,3260 :: 		EveTextAccx.Active      = 1;
	MOV	#lo_addr(_EveTextAccx+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3261 :: 		EveTextAccx.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextAccx+32
;NewDesign_driver.c,3262 :: 		EveTextAccx.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextAccx+34
;NewDesign_driver.c,3263 :: 		EveTextAccx.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextAccx+36
;NewDesign_driver.c,3264 :: 		EveTextAccx.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextAccx+38
;NewDesign_driver.c,3266 :: 		EveTextAccy.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextAccy
;NewDesign_driver.c,3267 :: 		EveTextAccy.Order       = 15;
	MOV	#lo_addr(_EveTextAccy+2), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3268 :: 		EveTextAccy.Visible     = 1;
	MOV	#lo_addr(_EveTextAccy+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3269 :: 		EveTextAccy.Opacity     = 255;
	MOV	#lo_addr(_EveTextAccy+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3270 :: 		EveTextAccy.Tag         = 255;
	MOV	#lo_addr(_EveTextAccy+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3271 :: 		EveTextAccy.Left        = 306;
	MOV	#306, W0
	MOV	W0, _EveTextAccy+6
;NewDesign_driver.c,3272 :: 		EveTextAccy.Top         = 93;
	MOV	#93, W0
	MOV	W0, _EveTextAccy+8
;NewDesign_driver.c,3273 :: 		EveTextAccy.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextAccy+10
;NewDesign_driver.c,3274 :: 		EveTextAccy.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextAccy+12
;NewDesign_driver.c,3275 :: 		EveTextAccy.Caption     = EveTextAccy_Caption;
	MOV	#lo_addr(_EveTextAccy_Caption), W0
	MOV	W0, _EveTextAccy+14
;NewDesign_driver.c,3276 :: 		EveTextAccy.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextAccy+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3277 :: 		EveTextAccy.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextAccy+18
	MOV	W1, _EveTextAccy+20
;NewDesign_driver.c,3278 :: 		EveTextAccy.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextAccy+22
;NewDesign_driver.c,3279 :: 		EveTextAccy.FontHandle  = 27;
	MOV	#lo_addr(_EveTextAccy+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3280 :: 		EveTextAccy.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextAccy+26
	MOV	W1, _EveTextAccy+28
;NewDesign_driver.c,3281 :: 		EveTextAccy.Active      = 1;
	MOV	#lo_addr(_EveTextAccy+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3282 :: 		EveTextAccy.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextAccy+32
;NewDesign_driver.c,3283 :: 		EveTextAccy.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextAccy+34
;NewDesign_driver.c,3284 :: 		EveTextAccy.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextAccy+36
;NewDesign_driver.c,3285 :: 		EveTextAccy.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextAccy+38
;NewDesign_driver.c,3287 :: 		EveTextAccz.OwnerScreen = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveTextAccz
;NewDesign_driver.c,3288 :: 		EveTextAccz.Order       = 16;
	MOV	#lo_addr(_EveTextAccz+2), W1
	MOV.B	#16, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3289 :: 		EveTextAccz.Visible     = 1;
	MOV	#lo_addr(_EveTextAccz+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3290 :: 		EveTextAccz.Opacity     = 255;
	MOV	#lo_addr(_EveTextAccz+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3291 :: 		EveTextAccz.Tag         = 255;
	MOV	#lo_addr(_EveTextAccz+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3292 :: 		EveTextAccz.Left        = 401;
	MOV	#401, W0
	MOV	W0, _EveTextAccz+6
;NewDesign_driver.c,3293 :: 		EveTextAccz.Top         = 94;
	MOV	#94, W0
	MOV	W0, _EveTextAccz+8
;NewDesign_driver.c,3294 :: 		EveTextAccz.Width       = 45;
	MOV	#45, W0
	MOV	W0, _EveTextAccz+10
;NewDesign_driver.c,3295 :: 		EveTextAccz.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextAccz+12
;NewDesign_driver.c,3296 :: 		EveTextAccz.Caption     = EveTextAccz_Caption;
	MOV	#lo_addr(_EveTextAccz_Caption), W0
	MOV	W0, _EveTextAccz+14
;NewDesign_driver.c,3297 :: 		EveTextAccz.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextAccz+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3298 :: 		EveTextAccz.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextAccz+18
	MOV	W1, _EveTextAccz+20
;NewDesign_driver.c,3299 :: 		EveTextAccz.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextAccz+22
;NewDesign_driver.c,3300 :: 		EveTextAccz.FontHandle  = 27;
	MOV	#lo_addr(_EveTextAccz+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3301 :: 		EveTextAccz.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextAccz+26
	MOV	W1, _EveTextAccz+28
;NewDesign_driver.c,3302 :: 		EveTextAccz.Active      = 1;
	MOV	#lo_addr(_EveTextAccz+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3303 :: 		EveTextAccz.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextAccz+32
;NewDesign_driver.c,3304 :: 		EveTextAccz.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextAccz+34
;NewDesign_driver.c,3305 :: 		EveTextAccz.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextAccz+36
;NewDesign_driver.c,3306 :: 		EveTextAccz.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextAccz+38
;NewDesign_driver.c,3308 :: 		BoxRound7.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _BoxRound7
;NewDesign_driver.c,3309 :: 		BoxRound7.Order         = 17;
	MOV	#lo_addr(_BoxRound7+2), W1
	MOV.B	#17, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3310 :: 		BoxRound7.Visible       = 0;
	MOV	#lo_addr(_BoxRound7+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3311 :: 		BoxRound7.Opacity       = 255;
	MOV	#lo_addr(_BoxRound7+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3312 :: 		BoxRound7.Tag           = 255;
	MOV	#lo_addr(_BoxRound7+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3313 :: 		BoxRound7.Left          = 6;
	MOV	#6, W0
	MOV	W0, _BoxRound7+6
;NewDesign_driver.c,3314 :: 		BoxRound7.Top           = 187;
	MOV	#187, W0
	MOV	W0, _BoxRound7+8
;NewDesign_driver.c,3315 :: 		BoxRound7.Width         = 470;
	MOV	#470, W0
	MOV	W0, _BoxRound7+10
;NewDesign_driver.c,3316 :: 		BoxRound7.Height        = 81;
	MOV	#81, W0
	MOV	W0, _BoxRound7+12
;NewDesign_driver.c,3317 :: 		BoxRound7.Pen_Width     = 1;
	MOV	#lo_addr(_BoxRound7+14), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3318 :: 		BoxRound7.Pen_Color     = 0x0000;
	CLR	W0
	MOV	W0, _BoxRound7+16
;NewDesign_driver.c,3319 :: 		BoxRound7.Color         = 0xC618;
	MOV	#50712, W0
	MOV	W0, _BoxRound7+18
;NewDesign_driver.c,3320 :: 		BoxRound7.Press_Color   = 0xE71C;
	MOV	#59164, W0
	MOV	W0, _BoxRound7+20
;NewDesign_driver.c,3321 :: 		BoxRound7.Corner_Radius = 3;
	MOV	#lo_addr(_BoxRound7+22), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3322 :: 		BoxRound7.Active        = 0;
	MOV	#lo_addr(_BoxRound7+23), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3323 :: 		BoxRound7.OnUp          = 0;
	CLR	W0
	MOV	W0, _BoxRound7+24
;NewDesign_driver.c,3324 :: 		BoxRound7.OnDown        = 0;
	CLR	W0
	MOV	W0, _BoxRound7+26
;NewDesign_driver.c,3325 :: 		BoxRound7.OnClick       = 0;
	CLR	W0
	MOV	W0, _BoxRound7+28
;NewDesign_driver.c,3326 :: 		BoxRound7.OnPress       = 0;
	CLR	W0
	MOV	W0, _BoxRound7+30
;NewDesign_driver.c,3328 :: 		EveButtonsmpJogRear.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonsmpJogRear
;NewDesign_driver.c,3329 :: 		EveButtonsmpJogRear.Order         = 18;
	MOV	#lo_addr(_EveButtonsmpJogRear+2), W1
	MOV.B	#18, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3330 :: 		EveButtonsmpJogRear.Visible       = 0;
	MOV	#lo_addr(_EveButtonsmpJogRear+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3331 :: 		EveButtonsmpJogRear.Opacity       = 255;
	MOV	#lo_addr(_EveButtonsmpJogRear+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3332 :: 		EveButtonsmpJogRear.Tag           = 255;
	MOV	#lo_addr(_EveButtonsmpJogRear+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3333 :: 		EveButtonsmpJogRear.Left          = 16;
	MOV	#16, W0
	MOV	W0, _EveButtonsmpJogRear+6
;NewDesign_driver.c,3334 :: 		EveButtonsmpJogRear.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonsmpJogRear+8
;NewDesign_driver.c,3335 :: 		EveButtonsmpJogRear.Width         = 121;
	MOV	#121, W0
	MOV	W0, _EveButtonsmpJogRear+10
;NewDesign_driver.c,3336 :: 		EveButtonsmpJogRear.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonsmpJogRear+12
;NewDesign_driver.c,3337 :: 		EveButtonsmpJogRear.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpJogRear+14
;NewDesign_driver.c,3338 :: 		EveButtonsmpJogRear.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpJogRear+16
;NewDesign_driver.c,3339 :: 		EveButtonsmpJogRear.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpJogRear+18
;NewDesign_driver.c,3340 :: 		EveButtonsmpJogRear.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpJogRear+20
;NewDesign_driver.c,3341 :: 		EveButtonsmpJogRear.Caption       = EveButtonsmpJogRear_Caption;
	MOV	#lo_addr(_EveButtonsmpJogRear_Caption), W0
	MOV	W0, _EveButtonsmpJogRear+22
;NewDesign_driver.c,3342 :: 		EveButtonsmpJogRear.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonsmpJogRear+24
	MOV	W1, _EveButtonsmpJogRear+26
;NewDesign_driver.c,3343 :: 		EveButtonsmpJogRear.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonsmpJogRear+28
;NewDesign_driver.c,3344 :: 		EveButtonsmpJogRear.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonsmpJogRear+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3345 :: 		EveButtonsmpJogRear.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonsmpJogRear+32
	MOV	W1, _EveButtonsmpJogRear+34
;NewDesign_driver.c,3346 :: 		EveButtonsmpJogRear.Flat          = 0;
	MOV	#lo_addr(_EveButtonsmpJogRear+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3347 :: 		EveButtonsmpJogRear.Active        = 0;
	MOV	#lo_addr(_EveButtonsmpJogRear+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3348 :: 		EveButtonsmpJogRear.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogRear+38
;NewDesign_driver.c,3349 :: 		EveButtonsmpJogRear.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogRear+40
;NewDesign_driver.c,3350 :: 		EveButtonsmpJogRear.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogRear+42
;NewDesign_driver.c,3351 :: 		EveButtonsmpJogRear.OnPress       = &EveButtonsmpJogRear_OnPress;
	MOV	#lo_addr(_EveButtonsmpJogRear_OnPress), W0
	MOV	W0, _EveButtonsmpJogRear+44
;NewDesign_driver.c,3353 :: 		EveButtonsmpJogRear_OnPress.Action       = EveButtonsmpJogRearOnPress;
	MOV	#lo_addr(_EveButtonsmpJogRearOnPress), W0
	MOV	W0, _EveButtonsmpJogRear_OnPress
;NewDesign_driver.c,3354 :: 		EveButtonsmpJogRear_OnPress.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonsmpJogRear_OnPress+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3355 :: 		EveButtonsmpJogRear_OnPress.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonsmpJogRear_OnPress+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3356 :: 		EveButtonsmpJogRear_OnPress.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonsmpJogRear_OnPress+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3357 :: 		EveButtonsmpJogRear_OnPress.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonsmpJogRear_OnPress+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3359 :: 		EveButtonsmpJogFront.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonsmpJogFront
;NewDesign_driver.c,3360 :: 		EveButtonsmpJogFront.Order         = 19;
	MOV	#lo_addr(_EveButtonsmpJogFront+2), W1
	MOV.B	#19, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3361 :: 		EveButtonsmpJogFront.Visible       = 0;
	MOV	#lo_addr(_EveButtonsmpJogFront+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3362 :: 		EveButtonsmpJogFront.Opacity       = 255;
	MOV	#lo_addr(_EveButtonsmpJogFront+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3363 :: 		EveButtonsmpJogFront.Tag           = 255;
	MOV	#lo_addr(_EveButtonsmpJogFront+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3364 :: 		EveButtonsmpJogFront.Left          = 143;
	MOV	#143, W0
	MOV	W0, _EveButtonsmpJogFront+6
;NewDesign_driver.c,3365 :: 		EveButtonsmpJogFront.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonsmpJogFront+8
;NewDesign_driver.c,3366 :: 		EveButtonsmpJogFront.Width         = 136;
	MOV	#136, W0
	MOV	W0, _EveButtonsmpJogFront+10
;NewDesign_driver.c,3367 :: 		EveButtonsmpJogFront.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonsmpJogFront+12
;NewDesign_driver.c,3368 :: 		EveButtonsmpJogFront.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpJogFront+14
;NewDesign_driver.c,3369 :: 		EveButtonsmpJogFront.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpJogFront+16
;NewDesign_driver.c,3370 :: 		EveButtonsmpJogFront.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpJogFront+18
;NewDesign_driver.c,3371 :: 		EveButtonsmpJogFront.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpJogFront+20
;NewDesign_driver.c,3372 :: 		EveButtonsmpJogFront.Caption       = EveButtonsmpJogFront_Caption;
	MOV	#lo_addr(_EveButtonsmpJogFront_Caption), W0
	MOV	W0, _EveButtonsmpJogFront+22
;NewDesign_driver.c,3373 :: 		EveButtonsmpJogFront.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonsmpJogFront+24
	MOV	W1, _EveButtonsmpJogFront+26
;NewDesign_driver.c,3374 :: 		EveButtonsmpJogFront.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonsmpJogFront+28
;NewDesign_driver.c,3375 :: 		EveButtonsmpJogFront.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonsmpJogFront+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3376 :: 		EveButtonsmpJogFront.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonsmpJogFront+32
	MOV	W1, _EveButtonsmpJogFront+34
;NewDesign_driver.c,3377 :: 		EveButtonsmpJogFront.Flat          = 0;
	MOV	#lo_addr(_EveButtonsmpJogFront+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3378 :: 		EveButtonsmpJogFront.Active        = 0;
	MOV	#lo_addr(_EveButtonsmpJogFront+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3379 :: 		EveButtonsmpJogFront.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogFront+38
;NewDesign_driver.c,3380 :: 		EveButtonsmpJogFront.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogFront+40
;NewDesign_driver.c,3381 :: 		EveButtonsmpJogFront.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpJogFront+42
;NewDesign_driver.c,3382 :: 		EveButtonsmpJogFront.OnPress       = &EveButtonsmpJogFront_OnPress;
	MOV	#lo_addr(_EveButtonsmpJogFront_OnPress), W0
	MOV	W0, _EveButtonsmpJogFront+44
;NewDesign_driver.c,3384 :: 		EveButtonsmpJogFront_OnPress.Action       = EveButtonsmpJogFrontOnPress;
	MOV	#lo_addr(_EveButtonsmpJogFrontOnPress), W0
	MOV	W0, _EveButtonsmpJogFront_OnPress
;NewDesign_driver.c,3385 :: 		EveButtonsmpJogFront_OnPress.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonsmpJogFront_OnPress+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3386 :: 		EveButtonsmpJogFront_OnPress.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonsmpJogFront_OnPress+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3387 :: 		EveButtonsmpJogFront_OnPress.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonsmpJogFront_OnPress+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3388 :: 		EveButtonsmpJogFront_OnPress.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonsmpJogFront_OnPress+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3390 :: 		EveButtonsmpBack.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonsmpBack
;NewDesign_driver.c,3391 :: 		EveButtonsmpBack.Order         = 20;
	MOV	#lo_addr(_EveButtonsmpBack+2), W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3392 :: 		EveButtonsmpBack.Visible       = 0;
	MOV	#lo_addr(_EveButtonsmpBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3393 :: 		EveButtonsmpBack.Opacity       = 255;
	MOV	#lo_addr(_EveButtonsmpBack+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3394 :: 		EveButtonsmpBack.Tag           = 255;
	MOV	#lo_addr(_EveButtonsmpBack+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3395 :: 		EveButtonsmpBack.Left          = 308;
	MOV	#308, W0
	MOV	W0, _EveButtonsmpBack+6
;NewDesign_driver.c,3396 :: 		EveButtonsmpBack.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonsmpBack+8
;NewDesign_driver.c,3397 :: 		EveButtonsmpBack.Width         = 163;
	MOV	#163, W0
	MOV	W0, _EveButtonsmpBack+10
;NewDesign_driver.c,3398 :: 		EveButtonsmpBack.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonsmpBack+12
;NewDesign_driver.c,3399 :: 		EveButtonsmpBack.Color         = 0x9824;
	MOV	#38948, W0
	MOV	W0, _EveButtonsmpBack+14
;NewDesign_driver.c,3400 :: 		EveButtonsmpBack.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpBack+16
;NewDesign_driver.c,3401 :: 		EveButtonsmpBack.ColorTo       = 0xF434;
	MOV	#62516, W0
	MOV	W0, _EveButtonsmpBack+18
;NewDesign_driver.c,3402 :: 		EveButtonsmpBack.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpBack+20
;NewDesign_driver.c,3403 :: 		EveButtonsmpBack.Caption       = EveButtonsmpBack_Caption;
	MOV	#lo_addr(_EveButtonsmpBack_Caption), W0
	MOV	W0, _EveButtonsmpBack+22
;NewDesign_driver.c,3404 :: 		EveButtonsmpBack.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonsmpBack+24
	MOV	W1, _EveButtonsmpBack+26
;NewDesign_driver.c,3405 :: 		EveButtonsmpBack.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonsmpBack+28
;NewDesign_driver.c,3406 :: 		EveButtonsmpBack.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonsmpBack+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3407 :: 		EveButtonsmpBack.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonsmpBack+32
	MOV	W1, _EveButtonsmpBack+34
;NewDesign_driver.c,3408 :: 		EveButtonsmpBack.Flat          = 0;
	MOV	#lo_addr(_EveButtonsmpBack+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3409 :: 		EveButtonsmpBack.Active        = 0;
	MOV	#lo_addr(_EveButtonsmpBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3410 :: 		EveButtonsmpBack.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpBack+38
;NewDesign_driver.c,3411 :: 		EveButtonsmpBack.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpBack+40
;NewDesign_driver.c,3412 :: 		EveButtonsmpBack.OnClick       = &EveButtonsmpBack_OnClick;
	MOV	#lo_addr(_EveButtonsmpBack_OnClick), W0
	MOV	W0, _EveButtonsmpBack+42
;NewDesign_driver.c,3413 :: 		EveButtonsmpBack.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpBack+44
;NewDesign_driver.c,3415 :: 		EveButtonsmpBack_OnClick.Action       = EveButtonsmpBackOnClick;
	MOV	#lo_addr(_EveButtonsmpBackOnClick), W0
	MOV	W0, _EveButtonsmpBack_OnClick
;NewDesign_driver.c,3416 :: 		EveButtonsmpBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonsmpBack_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3417 :: 		EveButtonsmpBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonsmpBack_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3418 :: 		EveButtonsmpBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonsmpBack_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3419 :: 		EveButtonsmpBack_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonsmpBack_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3421 :: 		BoxRound8.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _BoxRound8
;NewDesign_driver.c,3422 :: 		BoxRound8.Order         = 21;
	MOV	#lo_addr(_BoxRound8+2), W1
	MOV.B	#21, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3423 :: 		BoxRound8.Visible       = 1;
	MOV	#lo_addr(_BoxRound8+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3424 :: 		BoxRound8.Opacity       = 255;
	MOV	#lo_addr(_BoxRound8+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3425 :: 		BoxRound8.Tag           = 255;
	MOV	#lo_addr(_BoxRound8+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3426 :: 		BoxRound8.Left          = 6;
	MOV	#6, W0
	MOV	W0, _BoxRound8+6
;NewDesign_driver.c,3427 :: 		BoxRound8.Top           = 187;
	MOV	#187, W0
	MOV	W0, _BoxRound8+8
;NewDesign_driver.c,3428 :: 		BoxRound8.Width         = 470;
	MOV	#470, W0
	MOV	W0, _BoxRound8+10
;NewDesign_driver.c,3429 :: 		BoxRound8.Height        = 81;
	MOV	#81, W0
	MOV	W0, _BoxRound8+12
;NewDesign_driver.c,3430 :: 		BoxRound8.Pen_Width     = 1;
	MOV	#lo_addr(_BoxRound8+14), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3431 :: 		BoxRound8.Pen_Color     = 0x0000;
	CLR	W0
	MOV	W0, _BoxRound8+16
;NewDesign_driver.c,3432 :: 		BoxRound8.Color         = 0xC618;
	MOV	#50712, W0
	MOV	W0, _BoxRound8+18
;NewDesign_driver.c,3433 :: 		BoxRound8.Press_Color   = 0xE71C;
	MOV	#59164, W0
	MOV	W0, _BoxRound8+20
;NewDesign_driver.c,3434 :: 		BoxRound8.Corner_Radius = 3;
	MOV	#lo_addr(_BoxRound8+22), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3435 :: 		BoxRound8.Active        = 0;
	MOV	#lo_addr(_BoxRound8+23), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3436 :: 		BoxRound8.OnUp          = 0;
	CLR	W0
	MOV	W0, _BoxRound8+24
;NewDesign_driver.c,3437 :: 		BoxRound8.OnDown        = 0;
	CLR	W0
	MOV	W0, _BoxRound8+26
;NewDesign_driver.c,3438 :: 		BoxRound8.OnClick       = 0;
	CLR	W0
	MOV	W0, _BoxRound8+28
;NewDesign_driver.c,3439 :: 		BoxRound8.OnPress       = 0;
	CLR	W0
	MOV	W0, _BoxRound8+30
;NewDesign_driver.c,3441 :: 		EveButtonSmpStartSampling.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonSmpStartSampling
;NewDesign_driver.c,3442 :: 		EveButtonSmpStartSampling.Order         = 22;
	MOV	#lo_addr(_EveButtonSmpStartSampling+2), W1
	MOV.B	#22, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3443 :: 		EveButtonSmpStartSampling.Visible       = 1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3444 :: 		EveButtonSmpStartSampling.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSmpStartSampling+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3445 :: 		EveButtonSmpStartSampling.Tag           = 255;
	MOV	#lo_addr(_EveButtonSmpStartSampling+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3446 :: 		EveButtonSmpStartSampling.Left          = 16;
	MOV	#16, W0
	MOV	W0, _EveButtonSmpStartSampling+6
;NewDesign_driver.c,3447 :: 		EveButtonSmpStartSampling.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonSmpStartSampling+8
;NewDesign_driver.c,3448 :: 		EveButtonSmpStartSampling.Width         = 121;
	MOV	#121, W0
	MOV	W0, _EveButtonSmpStartSampling+10
;NewDesign_driver.c,3449 :: 		EveButtonSmpStartSampling.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonSmpStartSampling+12
;NewDesign_driver.c,3450 :: 		EveButtonSmpStartSampling.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpStartSampling+14
;NewDesign_driver.c,3451 :: 		EveButtonSmpStartSampling.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpStartSampling+16
;NewDesign_driver.c,3452 :: 		EveButtonSmpStartSampling.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpStartSampling+18
;NewDesign_driver.c,3453 :: 		EveButtonSmpStartSampling.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpStartSampling+20
;NewDesign_driver.c,3454 :: 		EveButtonSmpStartSampling.Caption       = EveButtonSmpStartSampling_Caption;
	MOV	#lo_addr(_EveButtonSmpStartSampling_Caption), W0
	MOV	W0, _EveButtonSmpStartSampling+22
;NewDesign_driver.c,3455 :: 		EveButtonSmpStartSampling.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSmpStartSampling+24
	MOV	W1, _EveButtonSmpStartSampling+26
;NewDesign_driver.c,3456 :: 		EveButtonSmpStartSampling.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSmpStartSampling+28
;NewDesign_driver.c,3457 :: 		EveButtonSmpStartSampling.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSmpStartSampling+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3458 :: 		EveButtonSmpStartSampling.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSmpStartSampling+32
	MOV	W1, _EveButtonSmpStartSampling+34
;NewDesign_driver.c,3459 :: 		EveButtonSmpStartSampling.Flat          = 0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3460 :: 		EveButtonSmpStartSampling.Active        = 1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3461 :: 		EveButtonSmpStartSampling.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStartSampling+38
;NewDesign_driver.c,3462 :: 		EveButtonSmpStartSampling.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStartSampling+40
;NewDesign_driver.c,3463 :: 		EveButtonSmpStartSampling.OnClick       = &EveButtonSmpStartSampling_OnClick;
	MOV	#lo_addr(_EveButtonSmpStartSampling_OnClick), W0
	MOV	W0, _EveButtonSmpStartSampling+42
;NewDesign_driver.c,3464 :: 		EveButtonSmpStartSampling.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStartSampling+44
;NewDesign_driver.c,3466 :: 		EveButtonSmpStartSampling_OnClick.Action       = EveButtonSmpStartSamplingOnClick;
	MOV	#lo_addr(_EveButtonSmpStartSamplingOnClick), W0
	MOV	W0, _EveButtonSmpStartSampling_OnClick
;NewDesign_driver.c,3467 :: 		EveButtonSmpStartSampling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSmpStartSampling_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3468 :: 		EveButtonSmpStartSampling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSmpStartSampling_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3469 :: 		EveButtonSmpStartSampling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSmpStartSampling_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3470 :: 		EveButtonSmpStartSampling_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSmpStartSampling_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3472 :: 		EveButtonSmpStopSampling.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonSmpStopSampling
;NewDesign_driver.c,3473 :: 		EveButtonSmpStopSampling.Order         = 23;
	MOV	#lo_addr(_EveButtonSmpStopSampling+2), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3474 :: 		EveButtonSmpStopSampling.Visible       = 0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3475 :: 		EveButtonSmpStopSampling.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSmpStopSampling+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3476 :: 		EveButtonSmpStopSampling.Tag           = 255;
	MOV	#lo_addr(_EveButtonSmpStopSampling+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3477 :: 		EveButtonSmpStopSampling.Left          = 16;
	MOV	#16, W0
	MOV	W0, _EveButtonSmpStopSampling+6
;NewDesign_driver.c,3478 :: 		EveButtonSmpStopSampling.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonSmpStopSampling+8
;NewDesign_driver.c,3479 :: 		EveButtonSmpStopSampling.Width         = 121;
	MOV	#121, W0
	MOV	W0, _EveButtonSmpStopSampling+10
;NewDesign_driver.c,3480 :: 		EveButtonSmpStopSampling.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonSmpStopSampling+12
;NewDesign_driver.c,3481 :: 		EveButtonSmpStopSampling.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpStopSampling+14
;NewDesign_driver.c,3482 :: 		EveButtonSmpStopSampling.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpStopSampling+16
;NewDesign_driver.c,3483 :: 		EveButtonSmpStopSampling.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpStopSampling+18
;NewDesign_driver.c,3484 :: 		EveButtonSmpStopSampling.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpStopSampling+20
;NewDesign_driver.c,3485 :: 		EveButtonSmpStopSampling.Caption       = EveButtonSmpStopSampling_Caption;
	MOV	#lo_addr(_EveButtonSmpStopSampling_Caption), W0
	MOV	W0, _EveButtonSmpStopSampling+22
;NewDesign_driver.c,3486 :: 		EveButtonSmpStopSampling.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSmpStopSampling+24
	MOV	W1, _EveButtonSmpStopSampling+26
;NewDesign_driver.c,3487 :: 		EveButtonSmpStopSampling.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSmpStopSampling+28
;NewDesign_driver.c,3488 :: 		EveButtonSmpStopSampling.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSmpStopSampling+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3489 :: 		EveButtonSmpStopSampling.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSmpStopSampling+32
	MOV	W1, _EveButtonSmpStopSampling+34
;NewDesign_driver.c,3490 :: 		EveButtonSmpStopSampling.Flat          = 0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3491 :: 		EveButtonSmpStopSampling.Active        = 0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3492 :: 		EveButtonSmpStopSampling.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStopSampling+38
;NewDesign_driver.c,3493 :: 		EveButtonSmpStopSampling.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStopSampling+40
;NewDesign_driver.c,3494 :: 		EveButtonSmpStopSampling.OnClick       = &EveButtonSmpStopSampling_OnClick;
	MOV	#lo_addr(_EveButtonSmpStopSampling_OnClick), W0
	MOV	W0, _EveButtonSmpStopSampling+42
;NewDesign_driver.c,3495 :: 		EveButtonSmpStopSampling.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpStopSampling+44
;NewDesign_driver.c,3497 :: 		EveButtonSmpStopSampling_OnClick.Action       = EveButtonSmpStopSamplingOnClick;
	MOV	#lo_addr(_EveButtonSmpStopSamplingOnClick), W0
	MOV	W0, _EveButtonSmpStopSampling_OnClick
;NewDesign_driver.c,3498 :: 		EveButtonSmpStopSampling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSmpStopSampling_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3499 :: 		EveButtonSmpStopSampling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSmpStopSampling_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3500 :: 		EveButtonSmpStopSampling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSmpStopSampling_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3501 :: 		EveButtonSmpStopSampling_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSmpStopSampling_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3503 :: 		EveButtonSmpConfigureMotor.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonSmpConfigureMotor
;NewDesign_driver.c,3504 :: 		EveButtonSmpConfigureMotor.Order         = 24;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+2), W1
	MOV.B	#24, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3505 :: 		EveButtonSmpConfigureMotor.Visible       = 1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3506 :: 		EveButtonSmpConfigureMotor.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3507 :: 		EveButtonSmpConfigureMotor.Tag           = 255;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3508 :: 		EveButtonSmpConfigureMotor.Left          = 143;
	MOV	#143, W0
	MOV	W0, _EveButtonSmpConfigureMotor+6
;NewDesign_driver.c,3509 :: 		EveButtonSmpConfigureMotor.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonSmpConfigureMotor+8
;NewDesign_driver.c,3510 :: 		EveButtonSmpConfigureMotor.Width         = 136;
	MOV	#136, W0
	MOV	W0, _EveButtonSmpConfigureMotor+10
;NewDesign_driver.c,3511 :: 		EveButtonSmpConfigureMotor.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonSmpConfigureMotor+12
;NewDesign_driver.c,3512 :: 		EveButtonSmpConfigureMotor.Color         = 0xA865;
	MOV	#43109, W0
	MOV	W0, _EveButtonSmpConfigureMotor+14
;NewDesign_driver.c,3513 :: 		EveButtonSmpConfigureMotor.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpConfigureMotor+16
;NewDesign_driver.c,3514 :: 		EveButtonSmpConfigureMotor.ColorTo       = 0xF3B5;
	MOV	#62389, W0
	MOV	W0, _EveButtonSmpConfigureMotor+18
;NewDesign_driver.c,3515 :: 		EveButtonSmpConfigureMotor.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpConfigureMotor+20
;NewDesign_driver.c,3516 :: 		EveButtonSmpConfigureMotor.Caption       = EveButtonSmpConfigureMotor_Caption;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_Caption), W0
	MOV	W0, _EveButtonSmpConfigureMotor+22
;NewDesign_driver.c,3517 :: 		EveButtonSmpConfigureMotor.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSmpConfigureMotor+24
	MOV	W1, _EveButtonSmpConfigureMotor+26
;NewDesign_driver.c,3518 :: 		EveButtonSmpConfigureMotor.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSmpConfigureMotor+28
;NewDesign_driver.c,3519 :: 		EveButtonSmpConfigureMotor.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3520 :: 		EveButtonSmpConfigureMotor.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSmpConfigureMotor+32
	MOV	W1, _EveButtonSmpConfigureMotor+34
;NewDesign_driver.c,3521 :: 		EveButtonSmpConfigureMotor.Flat          = 0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3522 :: 		EveButtonSmpConfigureMotor.Active        = 1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3523 :: 		EveButtonSmpConfigureMotor.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpConfigureMotor+38
;NewDesign_driver.c,3524 :: 		EveButtonSmpConfigureMotor.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpConfigureMotor+40
;NewDesign_driver.c,3525 :: 		EveButtonSmpConfigureMotor.OnClick       = &EveButtonSmpConfigureMotor_OnClick;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_OnClick), W0
	MOV	W0, _EveButtonSmpConfigureMotor+42
;NewDesign_driver.c,3526 :: 		EveButtonSmpConfigureMotor.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpConfigureMotor+44
;NewDesign_driver.c,3528 :: 		EveButtonSmpConfigureMotor_OnClick.Action       = EveButtonSmpConfigureMotorOnClick;
	MOV	#lo_addr(_EveButtonSmpConfigureMotorOnClick), W0
	MOV	W0, _EveButtonSmpConfigureMotor_OnClick
;NewDesign_driver.c,3529 :: 		EveButtonSmpConfigureMotor_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3530 :: 		EveButtonSmpConfigureMotor_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3531 :: 		EveButtonSmpConfigureMotor_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3532 :: 		EveButtonSmpConfigureMotor_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3534 :: 		EveButtonSmpGotoProf.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonSmpGotoProf
;NewDesign_driver.c,3535 :: 		EveButtonSmpGotoProf.Order         = 25;
	MOV	#lo_addr(_EveButtonSmpGotoProf+2), W1
	MOV.B	#25, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3536 :: 		EveButtonSmpGotoProf.Visible       = 1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3537 :: 		EveButtonSmpGotoProf.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSmpGotoProf+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3538 :: 		EveButtonSmpGotoProf.Tag           = 255;
	MOV	#lo_addr(_EveButtonSmpGotoProf+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3539 :: 		EveButtonSmpGotoProf.Left          = 308;
	MOV	#308, W0
	MOV	W0, _EveButtonSmpGotoProf+6
;NewDesign_driver.c,3540 :: 		EveButtonSmpGotoProf.Top           = 192;
	MOV	#192, W0
	MOV	W0, _EveButtonSmpGotoProf+8
;NewDesign_driver.c,3541 :: 		EveButtonSmpGotoProf.Width         = 163;
	MOV	#163, W0
	MOV	W0, _EveButtonSmpGotoProf+10
;NewDesign_driver.c,3542 :: 		EveButtonSmpGotoProf.Height        = 69;
	MOV	#69, W0
	MOV	W0, _EveButtonSmpGotoProf+12
;NewDesign_driver.c,3543 :: 		EveButtonSmpGotoProf.Color         = 0x14A7;
	MOV	#5287, W0
	MOV	W0, _EveButtonSmpGotoProf+14
;NewDesign_driver.c,3544 :: 		EveButtonSmpGotoProf.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSmpGotoProf+16
;NewDesign_driver.c,3545 :: 		EveButtonSmpGotoProf.ColorTo       = 0x8FB7;
	MOV	#36791, W0
	MOV	W0, _EveButtonSmpGotoProf+18
;NewDesign_driver.c,3546 :: 		EveButtonSmpGotoProf.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSmpGotoProf+20
;NewDesign_driver.c,3547 :: 		EveButtonSmpGotoProf.Caption       = EveButtonSmpGotoProf_Caption;
	MOV	#lo_addr(_EveButtonSmpGotoProf_Caption), W0
	MOV	W0, _EveButtonSmpGotoProf+22
;NewDesign_driver.c,3548 :: 		EveButtonSmpGotoProf.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSmpGotoProf+24
	MOV	W1, _EveButtonSmpGotoProf+26
;NewDesign_driver.c,3549 :: 		EveButtonSmpGotoProf.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSmpGotoProf+28
;NewDesign_driver.c,3550 :: 		EveButtonSmpGotoProf.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSmpGotoProf+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3551 :: 		EveButtonSmpGotoProf.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSmpGotoProf+32
	MOV	W1, _EveButtonSmpGotoProf+34
;NewDesign_driver.c,3552 :: 		EveButtonSmpGotoProf.Flat          = 0;
	MOV	#lo_addr(_EveButtonSmpGotoProf+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3553 :: 		EveButtonSmpGotoProf.Active        = 1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3554 :: 		EveButtonSmpGotoProf.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpGotoProf+38
;NewDesign_driver.c,3555 :: 		EveButtonSmpGotoProf.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpGotoProf+40
;NewDesign_driver.c,3556 :: 		EveButtonSmpGotoProf.OnClick       = &EveButtonSmpGotoProf_OnClick;
	MOV	#lo_addr(_EveButtonSmpGotoProf_OnClick), W0
	MOV	W0, _EveButtonSmpGotoProf+42
;NewDesign_driver.c,3557 :: 		EveButtonSmpGotoProf.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSmpGotoProf+44
;NewDesign_driver.c,3559 :: 		EveButtonSmpGotoProf_OnClick.Action       = EveButtonSmpGotoProfOnClick;
	MOV	#lo_addr(_EveButtonSmpGotoProfOnClick), W0
	MOV	W0, _EveButtonSmpGotoProf_OnClick
;NewDesign_driver.c,3560 :: 		EveButtonSmpGotoProf_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSmpGotoProf_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3561 :: 		EveButtonSmpGotoProf_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSmpGotoProf_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3562 :: 		EveButtonSmpGotoProf_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSmpGotoProf_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3563 :: 		EveButtonSmpGotoProf_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSmpGotoProf_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3565 :: 		EveButtonsmpResetInc.OwnerScreen   = &SamplingScreen;
	MOV	#lo_addr(_SamplingScreen), W0
	MOV	W0, _EveButtonsmpResetInc
;NewDesign_driver.c,3566 :: 		EveButtonsmpResetInc.Order         = 26;
	MOV	#lo_addr(_EveButtonsmpResetInc+2), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3567 :: 		EveButtonsmpResetInc.Visible       = 0;
	MOV	#lo_addr(_EveButtonsmpResetInc+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3568 :: 		EveButtonsmpResetInc.Opacity       = 255;
	MOV	#lo_addr(_EveButtonsmpResetInc+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3569 :: 		EveButtonsmpResetInc.Tag           = 255;
	MOV	#lo_addr(_EveButtonsmpResetInc+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3570 :: 		EveButtonsmpResetInc.Left          = 332;
	MOV	#332, W0
	MOV	W0, _EveButtonsmpResetInc+6
;NewDesign_driver.c,3571 :: 		EveButtonsmpResetInc.Top           = 8;
	MOV	#8, W0
	MOV	W0, _EveButtonsmpResetInc+8
;NewDesign_driver.c,3572 :: 		EveButtonsmpResetInc.Width         = 136;
	MOV	#136, W0
	MOV	W0, _EveButtonsmpResetInc+10
;NewDesign_driver.c,3573 :: 		EveButtonsmpResetInc.Height        = 53;
	MOV	#53, W0
	MOV	W0, _EveButtonsmpResetInc+12
;NewDesign_driver.c,3574 :: 		EveButtonsmpResetInc.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpResetInc+14
;NewDesign_driver.c,3575 :: 		EveButtonsmpResetInc.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpResetInc+16
;NewDesign_driver.c,3576 :: 		EveButtonsmpResetInc.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonsmpResetInc+18
;NewDesign_driver.c,3577 :: 		EveButtonsmpResetInc.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonsmpResetInc+20
;NewDesign_driver.c,3578 :: 		EveButtonsmpResetInc.Caption       = EveButtonsmpResetInc_Caption;
	MOV	#lo_addr(_EveButtonsmpResetInc_Caption), W0
	MOV	W0, _EveButtonsmpResetInc+22
;NewDesign_driver.c,3579 :: 		EveButtonsmpResetInc.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonsmpResetInc+24
	MOV	W1, _EveButtonsmpResetInc+26
;NewDesign_driver.c,3580 :: 		EveButtonsmpResetInc.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonsmpResetInc+28
;NewDesign_driver.c,3581 :: 		EveButtonsmpResetInc.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonsmpResetInc+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3582 :: 		EveButtonsmpResetInc.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonsmpResetInc+32
	MOV	W1, _EveButtonsmpResetInc+34
;NewDesign_driver.c,3583 :: 		EveButtonsmpResetInc.Flat          = 0;
	MOV	#lo_addr(_EveButtonsmpResetInc+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3584 :: 		EveButtonsmpResetInc.Active        = 0;
	MOV	#lo_addr(_EveButtonsmpResetInc+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3585 :: 		EveButtonsmpResetInc.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpResetInc+38
;NewDesign_driver.c,3586 :: 		EveButtonsmpResetInc.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpResetInc+40
;NewDesign_driver.c,3587 :: 		EveButtonsmpResetInc.OnClick       = &EveButtonsmpResetInc_OnClick;
	MOV	#lo_addr(_EveButtonsmpResetInc_OnClick), W0
	MOV	W0, _EveButtonsmpResetInc+42
;NewDesign_driver.c,3588 :: 		EveButtonsmpResetInc.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonsmpResetInc+44
;NewDesign_driver.c,3590 :: 		EveButtonsmpResetInc_OnClick.Action       = EveButtonsmpResetIncOnClick;
	MOV	#lo_addr(_EveButtonsmpResetIncOnClick), W0
	MOV	W0, _EveButtonsmpResetInc_OnClick
;NewDesign_driver.c,3591 :: 		EveButtonsmpResetInc_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonsmpResetInc_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3592 :: 		EveButtonsmpResetInc_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonsmpResetInc_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3593 :: 		EveButtonsmpResetInc_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonsmpResetInc_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3594 :: 		EveButtonsmpResetInc_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonsmpResetInc_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3596 :: 		EveGaugeProfSpeed.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveGaugeProfSpeed
;NewDesign_driver.c,3597 :: 		EveGaugeProfSpeed.Order         = 6;
	MOV	#lo_addr(_EveGaugeProfSpeed+2), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3598 :: 		EveGaugeProfSpeed.Visible       = 1;
	MOV	#lo_addr(_EveGaugeProfSpeed+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3599 :: 		EveGaugeProfSpeed.Opacity       = 255;
	MOV	#lo_addr(_EveGaugeProfSpeed+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3600 :: 		EveGaugeProfSpeed.Tag           = 255;
	MOV	#lo_addr(_EveGaugeProfSpeed+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3601 :: 		EveGaugeProfSpeed.Left          = 280;
	MOV	#280, W0
	MOV	W0, _EveGaugeProfSpeed+6
;NewDesign_driver.c,3602 :: 		EveGaugeProfSpeed.Top           = 45;
	MOV	#45, W0
	MOV	W0, _EveGaugeProfSpeed+8
;NewDesign_driver.c,3603 :: 		EveGaugeProfSpeed.Radius        = 40;
	MOV	#40, W0
	MOV	W0, _EveGaugeProfSpeed+10
;NewDesign_driver.c,3604 :: 		EveGaugeProfSpeed.Pen_Width     = 1;
	MOV	#lo_addr(_EveGaugeProfSpeed+12), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3605 :: 		EveGaugeProfSpeed.Pen_Color     = 0x0000;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+14
;NewDesign_driver.c,3606 :: 		EveGaugeProfSpeed.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveGaugeProfSpeed+16
;NewDesign_driver.c,3607 :: 		EveGaugeProfSpeed.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveGaugeProfSpeed+18
;NewDesign_driver.c,3608 :: 		EveGaugeProfSpeed.Major         = 10;
	MOV	#lo_addr(_EveGaugeProfSpeed+20), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3609 :: 		EveGaugeProfSpeed.Minor         = 5;
	MOV	#lo_addr(_EveGaugeProfSpeed+21), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3610 :: 		EveGaugeProfSpeed.Value         = 0;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+22
;NewDesign_driver.c,3611 :: 		EveGaugeProfSpeed.Range         = 100;
	MOV	#100, W0
	MOV	W0, _EveGaugeProfSpeed+24
;NewDesign_driver.c,3612 :: 		EveGaugeProfSpeed.Flat          = 0;
	MOV	#lo_addr(_EveGaugeProfSpeed+26), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3613 :: 		EveGaugeProfSpeed.NoBackground  = 0;
	MOV	#lo_addr(_EveGaugeProfSpeed+27), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3614 :: 		EveGaugeProfSpeed.NoPointer     = 0;
	MOV	#lo_addr(_EveGaugeProfSpeed+28), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3615 :: 		EveGaugeProfSpeed.TicksVisible  = 1;
	MOV	#lo_addr(_EveGaugeProfSpeed+29), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3616 :: 		EveGaugeProfSpeed.Active        = 0;
	MOV	#lo_addr(_EveGaugeProfSpeed+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3617 :: 		EveGaugeProfSpeed.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+32
;NewDesign_driver.c,3618 :: 		EveGaugeProfSpeed.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+34
;NewDesign_driver.c,3619 :: 		EveGaugeProfSpeed.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+36
;NewDesign_driver.c,3620 :: 		EveGaugeProfSpeed.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveGaugeProfSpeed+38
;NewDesign_driver.c,3622 :: 		EveToggleProfMode.OwnerScreen      = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveToggleProfMode
;NewDesign_driver.c,3623 :: 		EveToggleProfMode.Order            = 8;
	MOV	#lo_addr(_EveToggleProfMode+2), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3624 :: 		EveToggleProfMode.Visible          = 1;
	MOV	#lo_addr(_EveToggleProfMode+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3625 :: 		EveToggleProfMode.Opacity          = 255;
	MOV	#lo_addr(_EveToggleProfMode+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3626 :: 		EveToggleProfMode.Tag              = 255;
	MOV	#lo_addr(_EveToggleProfMode+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3627 :: 		EveToggleProfMode.Left             = 381;
	MOV	#381, W0
	MOV	W0, _EveToggleProfMode+6
;NewDesign_driver.c,3628 :: 		EveToggleProfMode.Top              = 26;
	MOV	#26, W0
	MOV	W0, _EveToggleProfMode+8
;NewDesign_driver.c,3629 :: 		EveToggleProfMode.Width            = 76;
	MOV	#76, W0
	MOV	W0, _EveToggleProfMode+10
;NewDesign_driver.c,3630 :: 		EveToggleProfMode.Height           = 18;
	MOV	#18, W0
	MOV	W0, _EveToggleProfMode+12
;NewDesign_driver.c,3631 :: 		EveToggleProfMode.Pen_Width        = 1;
	MOV	#lo_addr(_EveToggleProfMode+14), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3632 :: 		EveToggleProfMode.Pen_Color        = 0x0000;
	CLR	W0
	MOV	W0, _EveToggleProfMode+16
;NewDesign_driver.c,3633 :: 		EveToggleProfMode.Background_Color = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveToggleProfMode+18
;NewDesign_driver.c,3634 :: 		EveToggleProfMode.Color            = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveToggleProfMode+20
;NewDesign_driver.c,3635 :: 		EveToggleProfMode.Press_Color      = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveToggleProfMode+22
;NewDesign_driver.c,3636 :: 		EveToggleProfMode.StateOFF_Caption = EveToggleProfMode_StateOFF_Caption;
	MOV	#lo_addr(_EveToggleProfMode_StateOFF_Caption), W0
	MOV	W0, _EveToggleProfMode+24
;NewDesign_driver.c,3637 :: 		EveToggleProfMode.StateON_Caption  = EveToggleProfMode_StateON_Caption;
	MOV	#lo_addr(_EveToggleProfMode_StateON_Caption), W0
	MOV	W0, _EveToggleProfMode+26
;NewDesign_driver.c,3638 :: 		EveToggleProfMode.FontName         = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveToggleProfMode+28
	MOV	W1, _EveToggleProfMode+30
;NewDesign_driver.c,3639 :: 		EveToggleProfMode.Font_Color       = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveToggleProfMode+32
;NewDesign_driver.c,3640 :: 		EveToggleProfMode.FontHandle       = 26;
	MOV	#lo_addr(_EveToggleProfMode+34), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3641 :: 		EveToggleProfMode.Source           = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveToggleProfMode+36
	MOV	W1, _EveToggleProfMode+38
;NewDesign_driver.c,3642 :: 		EveToggleProfMode.State            = 0;
	CLR	W0
	MOV	W0, _EveToggleProfMode+40
;NewDesign_driver.c,3643 :: 		EveToggleProfMode.Flat             = 0;
	MOV	#lo_addr(_EveToggleProfMode+42), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3644 :: 		EveToggleProfMode.Active           = 1;
	MOV	#lo_addr(_EveToggleProfMode+43), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3645 :: 		EveToggleProfMode.OnUp             = 0;
	CLR	W0
	MOV	W0, _EveToggleProfMode+44
;NewDesign_driver.c,3646 :: 		EveToggleProfMode.OnDown           = 0;
	CLR	W0
	MOV	W0, _EveToggleProfMode+46
;NewDesign_driver.c,3647 :: 		EveToggleProfMode.OnClick          = &EveToggleProfMode_OnClick;
	MOV	#lo_addr(_EveToggleProfMode_OnClick), W0
	MOV	W0, _EveToggleProfMode+48
;NewDesign_driver.c,3648 :: 		EveToggleProfMode.OnPress          = 0;
	CLR	W0
	MOV	W0, _EveToggleProfMode+50
;NewDesign_driver.c,3650 :: 		EveToggleProfMode_OnClick.Action       = EveToggleProfModeOnClick;
	MOV	#lo_addr(_EveToggleProfModeOnClick), W0
	MOV	W0, _EveToggleProfMode_OnClick
;NewDesign_driver.c,3651 :: 		EveToggleProfMode_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveToggleProfMode_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3652 :: 		EveToggleProfMode_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveToggleProfMode_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3653 :: 		EveToggleProfMode_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveToggleProfMode_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3654 :: 		EveToggleProfMode_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveToggleProfMode_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3656 :: 		EveButtonProfStartProfiling.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfStartProfiling
;NewDesign_driver.c,3657 :: 		EveButtonProfStartProfiling.Order         = 10;
	MOV	#lo_addr(_EveButtonProfStartProfiling+2), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3658 :: 		EveButtonProfStartProfiling.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3659 :: 		EveButtonProfStartProfiling.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfStartProfiling+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3660 :: 		EveButtonProfStartProfiling.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfStartProfiling+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3661 :: 		EveButtonProfStartProfiling.Left          = 274;
	MOV	#274, W0
	MOV	W0, _EveButtonProfStartProfiling+6
;NewDesign_driver.c,3662 :: 		EveButtonProfStartProfiling.Top           = 210;
	MOV	#210, W0
	MOV	W0, _EveButtonProfStartProfiling+8
;NewDesign_driver.c,3663 :: 		EveButtonProfStartProfiling.Width         = 203;
	MOV	#203, W0
	MOV	W0, _EveButtonProfStartProfiling+10
;NewDesign_driver.c,3664 :: 		EveButtonProfStartProfiling.Height        = 53;
	MOV	#53, W0
	MOV	W0, _EveButtonProfStartProfiling+12
;NewDesign_driver.c,3665 :: 		EveButtonProfStartProfiling.Color         = 0x0C20;
	MOV	#3104, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_driver.c,3666 :: 		EveButtonProfStartProfiling.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfStartProfiling+16
;NewDesign_driver.c,3667 :: 		EveButtonProfStartProfiling.ColorTo       = 0x7757;
	MOV	#30551, W0
	MOV	W0, _EveButtonProfStartProfiling+18
;NewDesign_driver.c,3668 :: 		EveButtonProfStartProfiling.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfStartProfiling+20
;NewDesign_driver.c,3669 :: 		EveButtonProfStartProfiling.Caption       = EveButtonProfStartProfiling_Caption;
	MOV	#lo_addr(_EveButtonProfStartProfiling_Caption), W0
	MOV	W0, _EveButtonProfStartProfiling+22
;NewDesign_driver.c,3670 :: 		EveButtonProfStartProfiling.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfStartProfiling+24
	MOV	W1, _EveButtonProfStartProfiling+26
;NewDesign_driver.c,3671 :: 		EveButtonProfStartProfiling.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfStartProfiling+28
;NewDesign_driver.c,3672 :: 		EveButtonProfStartProfiling.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfStartProfiling+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3673 :: 		EveButtonProfStartProfiling.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfStartProfiling+32
	MOV	W1, _EveButtonProfStartProfiling+34
;NewDesign_driver.c,3674 :: 		EveButtonProfStartProfiling.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3675 :: 		EveButtonProfStartProfiling.Active        = 1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3676 :: 		EveButtonProfStartProfiling.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStartProfiling+38
;NewDesign_driver.c,3677 :: 		EveButtonProfStartProfiling.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStartProfiling+40
;NewDesign_driver.c,3678 :: 		EveButtonProfStartProfiling.OnClick       = &EveButtonProfStartProfiling_OnClick;
	MOV	#lo_addr(_EveButtonProfStartProfiling_OnClick), W0
	MOV	W0, _EveButtonProfStartProfiling+42
;NewDesign_driver.c,3679 :: 		EveButtonProfStartProfiling.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStartProfiling+44
;NewDesign_driver.c,3681 :: 		EveButtonProfStartProfiling_OnClick.Action       = EveButtonProfStartProfilingOnClick;
	MOV	#lo_addr(_EveButtonProfStartProfilingOnClick), W0
	MOV	W0, _EveButtonProfStartProfiling_OnClick
;NewDesign_driver.c,3682 :: 		EveButtonProfStartProfiling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfStartProfiling_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3683 :: 		EveButtonProfStartProfiling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfStartProfiling_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3684 :: 		EveButtonProfStartProfiling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfStartProfiling_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3685 :: 		EveButtonProfStartProfiling_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfStartProfiling_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3687 :: 		EveButtonProfStopProfiling.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfStopProfiling
;NewDesign_driver.c,3688 :: 		EveButtonProfStopProfiling.Order         = 11;
	MOV	#lo_addr(_EveButtonProfStopProfiling+2), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3689 :: 		EveButtonProfStopProfiling.Visible       = 0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3690 :: 		EveButtonProfStopProfiling.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfStopProfiling+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3691 :: 		EveButtonProfStopProfiling.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfStopProfiling+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3692 :: 		EveButtonProfStopProfiling.Left          = 274;
	MOV	#274, W0
	MOV	W0, _EveButtonProfStopProfiling+6
;NewDesign_driver.c,3693 :: 		EveButtonProfStopProfiling.Top           = 210;
	MOV	#210, W0
	MOV	W0, _EveButtonProfStopProfiling+8
;NewDesign_driver.c,3694 :: 		EveButtonProfStopProfiling.Width         = 203;
	MOV	#203, W0
	MOV	W0, _EveButtonProfStopProfiling+10
;NewDesign_driver.c,3695 :: 		EveButtonProfStopProfiling.Height        = 53;
	MOV	#53, W0
	MOV	W0, _EveButtonProfStopProfiling+12
;NewDesign_driver.c,3696 :: 		EveButtonProfStopProfiling.Color         = 0xC000;
	MOV	#49152, W0
	MOV	W0, _EveButtonProfStopProfiling+14
;NewDesign_driver.c,3697 :: 		EveButtonProfStopProfiling.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfStopProfiling+16
;NewDesign_driver.c,3698 :: 		EveButtonProfStopProfiling.ColorTo       = 0xEB73;
	MOV	#60275, W0
	MOV	W0, _EveButtonProfStopProfiling+18
;NewDesign_driver.c,3699 :: 		EveButtonProfStopProfiling.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfStopProfiling+20
;NewDesign_driver.c,3700 :: 		EveButtonProfStopProfiling.Caption       = EveButtonProfStopProfiling_Caption;
	MOV	#lo_addr(_EveButtonProfStopProfiling_Caption), W0
	MOV	W0, _EveButtonProfStopProfiling+22
;NewDesign_driver.c,3701 :: 		EveButtonProfStopProfiling.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfStopProfiling+24
	MOV	W1, _EveButtonProfStopProfiling+26
;NewDesign_driver.c,3702 :: 		EveButtonProfStopProfiling.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfStopProfiling+28
;NewDesign_driver.c,3703 :: 		EveButtonProfStopProfiling.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfStopProfiling+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3704 :: 		EveButtonProfStopProfiling.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfStopProfiling+32
	MOV	W1, _EveButtonProfStopProfiling+34
;NewDesign_driver.c,3705 :: 		EveButtonProfStopProfiling.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3706 :: 		EveButtonProfStopProfiling.Active        = 0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3707 :: 		EveButtonProfStopProfiling.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStopProfiling+38
;NewDesign_driver.c,3708 :: 		EveButtonProfStopProfiling.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStopProfiling+40
;NewDesign_driver.c,3709 :: 		EveButtonProfStopProfiling.OnClick       = &EveButtonProfStopProfiling_OnClick;
	MOV	#lo_addr(_EveButtonProfStopProfiling_OnClick), W0
	MOV	W0, _EveButtonProfStopProfiling+42
;NewDesign_driver.c,3710 :: 		EveButtonProfStopProfiling.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfStopProfiling+44
;NewDesign_driver.c,3712 :: 		EveButtonProfStopProfiling_OnClick.Action       = EveButtonProfStopProfilingOnClick;
	MOV	#lo_addr(_EveButtonProfStopProfilingOnClick), W0
	MOV	W0, _EveButtonProfStopProfiling_OnClick
;NewDesign_driver.c,3713 :: 		EveButtonProfStopProfiling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfStopProfiling_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3714 :: 		EveButtonProfStopProfiling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfStopProfiling_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3715 :: 		EveButtonProfStopProfiling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfStopProfiling_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3716 :: 		EveButtonProfStopProfiling_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfStopProfiling_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3718 :: 		Line1.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line1
;NewDesign_driver.c,3719 :: 		Line1.Order          = 12;
	MOV	#lo_addr(_Line1+2), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3720 :: 		Line1.Visible        = 0;
	MOV	#lo_addr(_Line1+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3721 :: 		Line1.Opacity        = 255;
	MOV	#lo_addr(_Line1+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3722 :: 		Line1.Tag            = 255;
	MOV	#lo_addr(_Line1+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3723 :: 		Line1.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line1+6
;NewDesign_driver.c,3724 :: 		Line1.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line1+8
;NewDesign_driver.c,3725 :: 		Line1.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line1+10
;NewDesign_driver.c,3726 :: 		Line1.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line1+12
;NewDesign_driver.c,3727 :: 		Line1.Pen_Width      = 3;
	MOV	#lo_addr(_Line1+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3728 :: 		Line1.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line1+16
;NewDesign_driver.c,3730 :: 		Line2.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line2
;NewDesign_driver.c,3731 :: 		Line2.Order          = 13;
	MOV	#lo_addr(_Line2+2), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3732 :: 		Line2.Visible        = 0;
	MOV	#lo_addr(_Line2+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3733 :: 		Line2.Opacity        = 255;
	MOV	#lo_addr(_Line2+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3734 :: 		Line2.Tag            = 255;
	MOV	#lo_addr(_Line2+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3735 :: 		Line2.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line2+6
;NewDesign_driver.c,3736 :: 		Line2.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line2+8
;NewDesign_driver.c,3737 :: 		Line2.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line2+10
;NewDesign_driver.c,3738 :: 		Line2.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line2+12
;NewDesign_driver.c,3739 :: 		Line2.Pen_Width      = 3;
	MOV	#lo_addr(_Line2+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3740 :: 		Line2.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line2+16
;NewDesign_driver.c,3742 :: 		Line3.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line3
;NewDesign_driver.c,3743 :: 		Line3.Order          = 14;
	MOV	#lo_addr(_Line3+2), W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3744 :: 		Line3.Visible        = 0;
	MOV	#lo_addr(_Line3+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3745 :: 		Line3.Opacity        = 255;
	MOV	#lo_addr(_Line3+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3746 :: 		Line3.Tag            = 255;
	MOV	#lo_addr(_Line3+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3747 :: 		Line3.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line3+6
;NewDesign_driver.c,3748 :: 		Line3.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line3+8
;NewDesign_driver.c,3749 :: 		Line3.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line3+10
;NewDesign_driver.c,3750 :: 		Line3.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line3+12
;NewDesign_driver.c,3751 :: 		Line3.Pen_Width      = 3;
	MOV	#lo_addr(_Line3+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3752 :: 		Line3.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line3+16
;NewDesign_driver.c,3754 :: 		Line4.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line4
;NewDesign_driver.c,3755 :: 		Line4.Order          = 15;
	MOV	#lo_addr(_Line4+2), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3756 :: 		Line4.Visible        = 0;
	MOV	#lo_addr(_Line4+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3757 :: 		Line4.Opacity        = 255;
	MOV	#lo_addr(_Line4+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3758 :: 		Line4.Tag            = 255;
	MOV	#lo_addr(_Line4+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3759 :: 		Line4.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line4+6
;NewDesign_driver.c,3760 :: 		Line4.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line4+8
;NewDesign_driver.c,3761 :: 		Line4.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line4+10
;NewDesign_driver.c,3762 :: 		Line4.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line4+12
;NewDesign_driver.c,3763 :: 		Line4.Pen_Width      = 3;
	MOV	#lo_addr(_Line4+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3764 :: 		Line4.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line4+16
;NewDesign_driver.c,3766 :: 		Line5.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line5
;NewDesign_driver.c,3767 :: 		Line5.Order          = 16;
	MOV	#lo_addr(_Line5+2), W1
	MOV.B	#16, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3768 :: 		Line5.Visible        = 0;
	MOV	#lo_addr(_Line5+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3769 :: 		Line5.Opacity        = 255;
	MOV	#lo_addr(_Line5+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3770 :: 		Line5.Tag            = 255;
	MOV	#lo_addr(_Line5+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3771 :: 		Line5.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line5+6
;NewDesign_driver.c,3772 :: 		Line5.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line5+8
;NewDesign_driver.c,3773 :: 		Line5.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line5+10
;NewDesign_driver.c,3774 :: 		Line5.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line5+12
;NewDesign_driver.c,3775 :: 		Line5.Pen_Width      = 3;
	MOV	#lo_addr(_Line5+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3776 :: 		Line5.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line5+16
;NewDesign_driver.c,3778 :: 		Line6.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line6
;NewDesign_driver.c,3779 :: 		Line6.Order          = 17;
	MOV	#lo_addr(_Line6+2), W1
	MOV.B	#17, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3780 :: 		Line6.Visible        = 0;
	MOV	#lo_addr(_Line6+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3781 :: 		Line6.Opacity        = 255;
	MOV	#lo_addr(_Line6+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3782 :: 		Line6.Tag            = 255;
	MOV	#lo_addr(_Line6+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3783 :: 		Line6.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line6+6
;NewDesign_driver.c,3784 :: 		Line6.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line6+8
;NewDesign_driver.c,3785 :: 		Line6.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line6+10
;NewDesign_driver.c,3786 :: 		Line6.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line6+12
;NewDesign_driver.c,3787 :: 		Line6.Pen_Width      = 3;
	MOV	#lo_addr(_Line6+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3788 :: 		Line6.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line6+16
;NewDesign_driver.c,3790 :: 		Line7.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line7
;NewDesign_driver.c,3791 :: 		Line7.Order          = 18;
	MOV	#lo_addr(_Line7+2), W1
	MOV.B	#18, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3792 :: 		Line7.Visible        = 0;
	MOV	#lo_addr(_Line7+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3793 :: 		Line7.Opacity        = 255;
	MOV	#lo_addr(_Line7+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3794 :: 		Line7.Tag            = 255;
	MOV	#lo_addr(_Line7+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3795 :: 		Line7.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line7+6
;NewDesign_driver.c,3796 :: 		Line7.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line7+8
;NewDesign_driver.c,3797 :: 		Line7.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line7+10
;NewDesign_driver.c,3798 :: 		Line7.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line7+12
;NewDesign_driver.c,3799 :: 		Line7.Pen_Width      = 3;
	MOV	#lo_addr(_Line7+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3800 :: 		Line7.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line7+16
;NewDesign_driver.c,3802 :: 		Line8.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line8
;NewDesign_driver.c,3803 :: 		Line8.Order          = 19;
	MOV	#lo_addr(_Line8+2), W1
	MOV.B	#19, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3804 :: 		Line8.Visible        = 0;
	MOV	#lo_addr(_Line8+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3805 :: 		Line8.Opacity        = 255;
	MOV	#lo_addr(_Line8+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3806 :: 		Line8.Tag            = 255;
	MOV	#lo_addr(_Line8+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3807 :: 		Line8.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line8+6
;NewDesign_driver.c,3808 :: 		Line8.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line8+8
;NewDesign_driver.c,3809 :: 		Line8.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line8+10
;NewDesign_driver.c,3810 :: 		Line8.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line8+12
;NewDesign_driver.c,3811 :: 		Line8.Pen_Width      = 3;
	MOV	#lo_addr(_Line8+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3812 :: 		Line8.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line8+16
;NewDesign_driver.c,3814 :: 		Line9.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line9
;NewDesign_driver.c,3815 :: 		Line9.Order          = 20;
	MOV	#lo_addr(_Line9+2), W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3816 :: 		Line9.Visible        = 0;
	MOV	#lo_addr(_Line9+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3817 :: 		Line9.Opacity        = 255;
	MOV	#lo_addr(_Line9+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3818 :: 		Line9.Tag            = 255;
	MOV	#lo_addr(_Line9+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3819 :: 		Line9.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line9+6
;NewDesign_driver.c,3820 :: 		Line9.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line9+8
;NewDesign_driver.c,3821 :: 		Line9.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line9+10
;NewDesign_driver.c,3822 :: 		Line9.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line9+12
;NewDesign_driver.c,3823 :: 		Line9.Pen_Width      = 3;
	MOV	#lo_addr(_Line9+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3824 :: 		Line9.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line9+16
;NewDesign_driver.c,3826 :: 		Line10.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line10
;NewDesign_driver.c,3827 :: 		Line10.Order          = 21;
	MOV	#lo_addr(_Line10+2), W1
	MOV.B	#21, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3828 :: 		Line10.Visible        = 0;
	MOV	#lo_addr(_Line10+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3829 :: 		Line10.Opacity        = 255;
	MOV	#lo_addr(_Line10+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3830 :: 		Line10.Tag            = 255;
	MOV	#lo_addr(_Line10+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3831 :: 		Line10.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line10+6
;NewDesign_driver.c,3832 :: 		Line10.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line10+8
;NewDesign_driver.c,3833 :: 		Line10.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line10+10
;NewDesign_driver.c,3834 :: 		Line10.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line10+12
;NewDesign_driver.c,3835 :: 		Line10.Pen_Width      = 3;
	MOV	#lo_addr(_Line10+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3836 :: 		Line10.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line10+16
;NewDesign_driver.c,3838 :: 		Line11.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line11
;NewDesign_driver.c,3839 :: 		Line11.Order          = 22;
	MOV	#lo_addr(_Line11+2), W1
	MOV.B	#22, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3840 :: 		Line11.Visible        = 0;
	MOV	#lo_addr(_Line11+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3841 :: 		Line11.Opacity        = 255;
	MOV	#lo_addr(_Line11+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3842 :: 		Line11.Tag            = 255;
	MOV	#lo_addr(_Line11+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3843 :: 		Line11.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line11+6
;NewDesign_driver.c,3844 :: 		Line11.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line11+8
;NewDesign_driver.c,3845 :: 		Line11.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line11+10
;NewDesign_driver.c,3846 :: 		Line11.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line11+12
;NewDesign_driver.c,3847 :: 		Line11.Pen_Width      = 3;
	MOV	#lo_addr(_Line11+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3848 :: 		Line11.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line11+16
;NewDesign_driver.c,3850 :: 		Line12.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line12
;NewDesign_driver.c,3851 :: 		Line12.Order          = 23;
	MOV	#lo_addr(_Line12+2), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3852 :: 		Line12.Visible        = 0;
	MOV	#lo_addr(_Line12+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3853 :: 		Line12.Opacity        = 255;
	MOV	#lo_addr(_Line12+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3854 :: 		Line12.Tag            = 255;
	MOV	#lo_addr(_Line12+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3855 :: 		Line12.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line12+6
;NewDesign_driver.c,3856 :: 		Line12.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line12+8
;NewDesign_driver.c,3857 :: 		Line12.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line12+10
;NewDesign_driver.c,3858 :: 		Line12.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line12+12
;NewDesign_driver.c,3859 :: 		Line12.Pen_Width      = 3;
	MOV	#lo_addr(_Line12+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3860 :: 		Line12.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line12+16
;NewDesign_driver.c,3862 :: 		Line13.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line13
;NewDesign_driver.c,3863 :: 		Line13.Order          = 24;
	MOV	#lo_addr(_Line13+2), W1
	MOV.B	#24, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3864 :: 		Line13.Visible        = 0;
	MOV	#lo_addr(_Line13+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3865 :: 		Line13.Opacity        = 255;
	MOV	#lo_addr(_Line13+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3866 :: 		Line13.Tag            = 255;
	MOV	#lo_addr(_Line13+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3867 :: 		Line13.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line13+6
;NewDesign_driver.c,3868 :: 		Line13.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line13+8
;NewDesign_driver.c,3869 :: 		Line13.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line13+10
;NewDesign_driver.c,3870 :: 		Line13.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line13+12
;NewDesign_driver.c,3871 :: 		Line13.Pen_Width      = 3;
	MOV	#lo_addr(_Line13+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3872 :: 		Line13.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line13+16
;NewDesign_driver.c,3874 :: 		Line14.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line14
;NewDesign_driver.c,3875 :: 		Line14.Order          = 25;
	MOV	#lo_addr(_Line14+2), W1
	MOV.B	#25, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3876 :: 		Line14.Visible        = 0;
	MOV	#lo_addr(_Line14+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3877 :: 		Line14.Opacity        = 255;
	MOV	#lo_addr(_Line14+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3878 :: 		Line14.Tag            = 255;
	MOV	#lo_addr(_Line14+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3879 :: 		Line14.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line14+6
;NewDesign_driver.c,3880 :: 		Line14.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line14+8
;NewDesign_driver.c,3881 :: 		Line14.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line14+10
;NewDesign_driver.c,3882 :: 		Line14.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line14+12
;NewDesign_driver.c,3883 :: 		Line14.Pen_Width      = 3;
	MOV	#lo_addr(_Line14+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3884 :: 		Line14.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line14+16
;NewDesign_driver.c,3886 :: 		Line15.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line15
;NewDesign_driver.c,3887 :: 		Line15.Order          = 26;
	MOV	#lo_addr(_Line15+2), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3888 :: 		Line15.Visible        = 0;
	MOV	#lo_addr(_Line15+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3889 :: 		Line15.Opacity        = 255;
	MOV	#lo_addr(_Line15+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3890 :: 		Line15.Tag            = 255;
	MOV	#lo_addr(_Line15+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3891 :: 		Line15.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line15+6
;NewDesign_driver.c,3892 :: 		Line15.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line15+8
;NewDesign_driver.c,3893 :: 		Line15.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line15+10
;NewDesign_driver.c,3894 :: 		Line15.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line15+12
;NewDesign_driver.c,3895 :: 		Line15.Pen_Width      = 3;
	MOV	#lo_addr(_Line15+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3896 :: 		Line15.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line15+16
;NewDesign_driver.c,3898 :: 		Line16.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line16
;NewDesign_driver.c,3899 :: 		Line16.Order          = 27;
	MOV	#lo_addr(_Line16+2), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3900 :: 		Line16.Visible        = 0;
	MOV	#lo_addr(_Line16+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3901 :: 		Line16.Opacity        = 255;
	MOV	#lo_addr(_Line16+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3902 :: 		Line16.Tag            = 255;
	MOV	#lo_addr(_Line16+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3903 :: 		Line16.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line16+6
;NewDesign_driver.c,3904 :: 		Line16.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line16+8
;NewDesign_driver.c,3905 :: 		Line16.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line16+10
;NewDesign_driver.c,3906 :: 		Line16.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line16+12
;NewDesign_driver.c,3907 :: 		Line16.Pen_Width      = 3;
	MOV	#lo_addr(_Line16+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3908 :: 		Line16.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line16+16
;NewDesign_driver.c,3910 :: 		Line17.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line17
;NewDesign_driver.c,3911 :: 		Line17.Order          = 28;
	MOV	#lo_addr(_Line17+2), W1
	MOV.B	#28, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3912 :: 		Line17.Visible        = 0;
	MOV	#lo_addr(_Line17+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3913 :: 		Line17.Opacity        = 255;
	MOV	#lo_addr(_Line17+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3914 :: 		Line17.Tag            = 255;
	MOV	#lo_addr(_Line17+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3915 :: 		Line17.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line17+6
;NewDesign_driver.c,3916 :: 		Line17.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line17+8
;NewDesign_driver.c,3917 :: 		Line17.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line17+10
;NewDesign_driver.c,3918 :: 		Line17.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line17+12
;NewDesign_driver.c,3919 :: 		Line17.Pen_Width      = 3;
	MOV	#lo_addr(_Line17+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3920 :: 		Line17.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line17+16
;NewDesign_driver.c,3922 :: 		Line18.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line18
;NewDesign_driver.c,3923 :: 		Line18.Order          = 29;
	MOV	#lo_addr(_Line18+2), W1
	MOV.B	#29, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3924 :: 		Line18.Visible        = 0;
	MOV	#lo_addr(_Line18+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3925 :: 		Line18.Opacity        = 255;
	MOV	#lo_addr(_Line18+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3926 :: 		Line18.Tag            = 255;
	MOV	#lo_addr(_Line18+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3927 :: 		Line18.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line18+6
;NewDesign_driver.c,3928 :: 		Line18.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line18+8
;NewDesign_driver.c,3929 :: 		Line18.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line18+10
;NewDesign_driver.c,3930 :: 		Line18.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line18+12
;NewDesign_driver.c,3931 :: 		Line18.Pen_Width      = 3;
	MOV	#lo_addr(_Line18+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3932 :: 		Line18.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line18+16
;NewDesign_driver.c,3934 :: 		Line19.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line19
;NewDesign_driver.c,3935 :: 		Line19.Order          = 30;
	MOV	#lo_addr(_Line19+2), W1
	MOV.B	#30, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3936 :: 		Line19.Visible        = 0;
	MOV	#lo_addr(_Line19+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3937 :: 		Line19.Opacity        = 255;
	MOV	#lo_addr(_Line19+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3938 :: 		Line19.Tag            = 255;
	MOV	#lo_addr(_Line19+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3939 :: 		Line19.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line19+6
;NewDesign_driver.c,3940 :: 		Line19.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line19+8
;NewDesign_driver.c,3941 :: 		Line19.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line19+10
;NewDesign_driver.c,3942 :: 		Line19.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line19+12
;NewDesign_driver.c,3943 :: 		Line19.Pen_Width      = 3;
	MOV	#lo_addr(_Line19+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3944 :: 		Line19.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line19+16
;NewDesign_driver.c,3946 :: 		Line20.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line20
;NewDesign_driver.c,3947 :: 		Line20.Order          = 31;
	MOV	#lo_addr(_Line20+2), W1
	MOV.B	#31, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3948 :: 		Line20.Visible        = 0;
	MOV	#lo_addr(_Line20+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3949 :: 		Line20.Opacity        = 255;
	MOV	#lo_addr(_Line20+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3950 :: 		Line20.Tag            = 255;
	MOV	#lo_addr(_Line20+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3951 :: 		Line20.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line20+6
;NewDesign_driver.c,3952 :: 		Line20.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line20+8
;NewDesign_driver.c,3953 :: 		Line20.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line20+10
;NewDesign_driver.c,3954 :: 		Line20.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line20+12
;NewDesign_driver.c,3955 :: 		Line20.Pen_Width      = 3;
	MOV	#lo_addr(_Line20+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3956 :: 		Line20.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line20+16
;NewDesign_driver.c,3958 :: 		Line21.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line21
;NewDesign_driver.c,3959 :: 		Line21.Order          = 32;
	MOV	#lo_addr(_Line21+2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3960 :: 		Line21.Visible        = 0;
	MOV	#lo_addr(_Line21+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3961 :: 		Line21.Opacity        = 255;
	MOV	#lo_addr(_Line21+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3962 :: 		Line21.Tag            = 255;
	MOV	#lo_addr(_Line21+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3963 :: 		Line21.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line21+6
;NewDesign_driver.c,3964 :: 		Line21.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line21+8
;NewDesign_driver.c,3965 :: 		Line21.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line21+10
;NewDesign_driver.c,3966 :: 		Line21.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line21+12
;NewDesign_driver.c,3967 :: 		Line21.Pen_Width      = 3;
	MOV	#lo_addr(_Line21+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3968 :: 		Line21.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line21+16
;NewDesign_driver.c,3970 :: 		Line22.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line22
;NewDesign_driver.c,3971 :: 		Line22.Order          = 33;
	MOV	#lo_addr(_Line22+2), W1
	MOV.B	#33, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3972 :: 		Line22.Visible        = 0;
	MOV	#lo_addr(_Line22+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3973 :: 		Line22.Opacity        = 255;
	MOV	#lo_addr(_Line22+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3974 :: 		Line22.Tag            = 255;
	MOV	#lo_addr(_Line22+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3975 :: 		Line22.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line22+6
;NewDesign_driver.c,3976 :: 		Line22.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line22+8
;NewDesign_driver.c,3977 :: 		Line22.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line22+10
;NewDesign_driver.c,3978 :: 		Line22.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line22+12
;NewDesign_driver.c,3979 :: 		Line22.Pen_Width      = 3;
	MOV	#lo_addr(_Line22+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3980 :: 		Line22.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line22+16
;NewDesign_driver.c,3982 :: 		Line23.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line23
;NewDesign_driver.c,3983 :: 		Line23.Order          = 34;
	MOV	#lo_addr(_Line23+2), W1
	MOV.B	#34, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3984 :: 		Line23.Visible        = 0;
	MOV	#lo_addr(_Line23+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3985 :: 		Line23.Opacity        = 255;
	MOV	#lo_addr(_Line23+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3986 :: 		Line23.Tag            = 255;
	MOV	#lo_addr(_Line23+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3987 :: 		Line23.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line23+6
;NewDesign_driver.c,3988 :: 		Line23.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line23+8
;NewDesign_driver.c,3989 :: 		Line23.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line23+10
;NewDesign_driver.c,3990 :: 		Line23.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line23+12
;NewDesign_driver.c,3991 :: 		Line23.Pen_Width      = 3;
	MOV	#lo_addr(_Line23+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3992 :: 		Line23.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line23+16
;NewDesign_driver.c,3994 :: 		Line24.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line24
;NewDesign_driver.c,3995 :: 		Line24.Order          = 35;
	MOV	#lo_addr(_Line24+2), W1
	MOV.B	#35, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3996 :: 		Line24.Visible        = 0;
	MOV	#lo_addr(_Line24+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3997 :: 		Line24.Opacity        = 255;
	MOV	#lo_addr(_Line24+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3998 :: 		Line24.Tag            = 255;
	MOV	#lo_addr(_Line24+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,3999 :: 		Line24.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line24+6
;NewDesign_driver.c,4000 :: 		Line24.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line24+8
;NewDesign_driver.c,4001 :: 		Line24.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line24+10
;NewDesign_driver.c,4002 :: 		Line24.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line24+12
;NewDesign_driver.c,4003 :: 		Line24.Pen_Width      = 3;
	MOV	#lo_addr(_Line24+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4004 :: 		Line24.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line24+16
;NewDesign_driver.c,4006 :: 		Line25.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line25
;NewDesign_driver.c,4007 :: 		Line25.Order          = 36;
	MOV	#lo_addr(_Line25+2), W1
	MOV.B	#36, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4008 :: 		Line25.Visible        = 0;
	MOV	#lo_addr(_Line25+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4009 :: 		Line25.Opacity        = 255;
	MOV	#lo_addr(_Line25+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4010 :: 		Line25.Tag            = 255;
	MOV	#lo_addr(_Line25+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4011 :: 		Line25.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line25+6
;NewDesign_driver.c,4012 :: 		Line25.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line25+8
;NewDesign_driver.c,4013 :: 		Line25.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line25+10
;NewDesign_driver.c,4014 :: 		Line25.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line25+12
;NewDesign_driver.c,4015 :: 		Line25.Pen_Width      = 3;
	MOV	#lo_addr(_Line25+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4016 :: 		Line25.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line25+16
;NewDesign_driver.c,4018 :: 		Line26.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line26
;NewDesign_driver.c,4019 :: 		Line26.Order          = 37;
	MOV	#lo_addr(_Line26+2), W1
	MOV.B	#37, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4020 :: 		Line26.Visible        = 0;
	MOV	#lo_addr(_Line26+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4021 :: 		Line26.Opacity        = 255;
	MOV	#lo_addr(_Line26+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4022 :: 		Line26.Tag            = 255;
	MOV	#lo_addr(_Line26+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4023 :: 		Line26.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line26+6
;NewDesign_driver.c,4024 :: 		Line26.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line26+8
;NewDesign_driver.c,4025 :: 		Line26.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line26+10
;NewDesign_driver.c,4026 :: 		Line26.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line26+12
;NewDesign_driver.c,4027 :: 		Line26.Pen_Width      = 3;
	MOV	#lo_addr(_Line26+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4028 :: 		Line26.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line26+16
;NewDesign_driver.c,4030 :: 		Line27.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line27
;NewDesign_driver.c,4031 :: 		Line27.Order          = 38;
	MOV	#lo_addr(_Line27+2), W1
	MOV.B	#38, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4032 :: 		Line27.Visible        = 0;
	MOV	#lo_addr(_Line27+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4033 :: 		Line27.Opacity        = 255;
	MOV	#lo_addr(_Line27+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4034 :: 		Line27.Tag            = 255;
	MOV	#lo_addr(_Line27+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4035 :: 		Line27.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line27+6
;NewDesign_driver.c,4036 :: 		Line27.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line27+8
;NewDesign_driver.c,4037 :: 		Line27.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line27+10
;NewDesign_driver.c,4038 :: 		Line27.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line27+12
;NewDesign_driver.c,4039 :: 		Line27.Pen_Width      = 3;
	MOV	#lo_addr(_Line27+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4040 :: 		Line27.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line27+16
;NewDesign_driver.c,4042 :: 		Line28.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line28
;NewDesign_driver.c,4043 :: 		Line28.Order          = 39;
	MOV	#lo_addr(_Line28+2), W1
	MOV.B	#39, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4044 :: 		Line28.Visible        = 0;
	MOV	#lo_addr(_Line28+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4045 :: 		Line28.Opacity        = 255;
	MOV	#lo_addr(_Line28+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4046 :: 		Line28.Tag            = 255;
	MOV	#lo_addr(_Line28+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4047 :: 		Line28.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line28+6
;NewDesign_driver.c,4048 :: 		Line28.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line28+8
;NewDesign_driver.c,4049 :: 		Line28.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line28+10
;NewDesign_driver.c,4050 :: 		Line28.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line28+12
;NewDesign_driver.c,4051 :: 		Line28.Pen_Width      = 3;
	MOV	#lo_addr(_Line28+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4052 :: 		Line28.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line28+16
;NewDesign_driver.c,4054 :: 		Line29.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line29
;NewDesign_driver.c,4055 :: 		Line29.Order          = 40;
	MOV	#lo_addr(_Line29+2), W1
	MOV.B	#40, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4056 :: 		Line29.Visible        = 0;
	MOV	#lo_addr(_Line29+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4057 :: 		Line29.Opacity        = 255;
	MOV	#lo_addr(_Line29+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4058 :: 		Line29.Tag            = 255;
	MOV	#lo_addr(_Line29+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4059 :: 		Line29.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line29+6
;NewDesign_driver.c,4060 :: 		Line29.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line29+8
;NewDesign_driver.c,4061 :: 		Line29.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line29+10
;NewDesign_driver.c,4062 :: 		Line29.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line29+12
;NewDesign_driver.c,4063 :: 		Line29.Pen_Width      = 3;
	MOV	#lo_addr(_Line29+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4064 :: 		Line29.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line29+16
;NewDesign_driver.c,4066 :: 		Line30.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line30
;NewDesign_driver.c,4067 :: 		Line30.Order          = 41;
	MOV	#lo_addr(_Line30+2), W1
	MOV.B	#41, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4068 :: 		Line30.Visible        = 0;
	MOV	#lo_addr(_Line30+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4069 :: 		Line30.Opacity        = 255;
	MOV	#lo_addr(_Line30+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4070 :: 		Line30.Tag            = 255;
	MOV	#lo_addr(_Line30+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4071 :: 		Line30.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line30+6
;NewDesign_driver.c,4072 :: 		Line30.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line30+8
;NewDesign_driver.c,4073 :: 		Line30.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line30+10
;NewDesign_driver.c,4074 :: 		Line30.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line30+12
;NewDesign_driver.c,4075 :: 		Line30.Pen_Width      = 3;
	MOV	#lo_addr(_Line30+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4076 :: 		Line30.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line30+16
;NewDesign_driver.c,4078 :: 		Line31.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line31
;NewDesign_driver.c,4079 :: 		Line31.Order          = 42;
	MOV	#lo_addr(_Line31+2), W1
	MOV.B	#42, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4080 :: 		Line31.Visible        = 0;
	MOV	#lo_addr(_Line31+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4081 :: 		Line31.Opacity        = 255;
	MOV	#lo_addr(_Line31+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4082 :: 		Line31.Tag            = 255;
	MOV	#lo_addr(_Line31+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4083 :: 		Line31.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line31+6
;NewDesign_driver.c,4084 :: 		Line31.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line31+8
;NewDesign_driver.c,4085 :: 		Line31.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line31+10
;NewDesign_driver.c,4086 :: 		Line31.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line31+12
;NewDesign_driver.c,4087 :: 		Line31.Pen_Width      = 3;
	MOV	#lo_addr(_Line31+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4088 :: 		Line31.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line31+16
;NewDesign_driver.c,4090 :: 		Line32.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line32
;NewDesign_driver.c,4091 :: 		Line32.Order          = 43;
	MOV	#lo_addr(_Line32+2), W1
	MOV.B	#43, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4092 :: 		Line32.Visible        = 0;
	MOV	#lo_addr(_Line32+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4093 :: 		Line32.Opacity        = 255;
	MOV	#lo_addr(_Line32+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4094 :: 		Line32.Tag            = 255;
	MOV	#lo_addr(_Line32+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4095 :: 		Line32.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line32+6
;NewDesign_driver.c,4096 :: 		Line32.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line32+8
;NewDesign_driver.c,4097 :: 		Line32.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line32+10
;NewDesign_driver.c,4098 :: 		Line32.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line32+12
;NewDesign_driver.c,4099 :: 		Line32.Pen_Width      = 3;
	MOV	#lo_addr(_Line32+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4100 :: 		Line32.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line32+16
;NewDesign_driver.c,4102 :: 		Line33.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line33
;NewDesign_driver.c,4103 :: 		Line33.Order          = 44;
	MOV	#lo_addr(_Line33+2), W1
	MOV.B	#44, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4104 :: 		Line33.Visible        = 0;
	MOV	#lo_addr(_Line33+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4105 :: 		Line33.Opacity        = 255;
	MOV	#lo_addr(_Line33+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4106 :: 		Line33.Tag            = 255;
	MOV	#lo_addr(_Line33+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4107 :: 		Line33.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line33+6
;NewDesign_driver.c,4108 :: 		Line33.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line33+8
;NewDesign_driver.c,4109 :: 		Line33.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line33+10
;NewDesign_driver.c,4110 :: 		Line33.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line33+12
;NewDesign_driver.c,4111 :: 		Line33.Pen_Width      = 3;
	MOV	#lo_addr(_Line33+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4112 :: 		Line33.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line33+16
;NewDesign_driver.c,4114 :: 		Line34.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line34
;NewDesign_driver.c,4115 :: 		Line34.Order          = 45;
	MOV	#lo_addr(_Line34+2), W1
	MOV.B	#45, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4116 :: 		Line34.Visible        = 0;
	MOV	#lo_addr(_Line34+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4117 :: 		Line34.Opacity        = 255;
	MOV	#lo_addr(_Line34+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4118 :: 		Line34.Tag            = 255;
	MOV	#lo_addr(_Line34+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4119 :: 		Line34.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line34+6
;NewDesign_driver.c,4120 :: 		Line34.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line34+8
;NewDesign_driver.c,4121 :: 		Line34.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line34+10
;NewDesign_driver.c,4122 :: 		Line34.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line34+12
;NewDesign_driver.c,4123 :: 		Line34.Pen_Width      = 3;
	MOV	#lo_addr(_Line34+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4124 :: 		Line34.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line34+16
;NewDesign_driver.c,4126 :: 		Line35.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line35
;NewDesign_driver.c,4127 :: 		Line35.Order          = 46;
	MOV	#lo_addr(_Line35+2), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4128 :: 		Line35.Visible        = 0;
	MOV	#lo_addr(_Line35+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4129 :: 		Line35.Opacity        = 255;
	MOV	#lo_addr(_Line35+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4130 :: 		Line35.Tag            = 255;
	MOV	#lo_addr(_Line35+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4131 :: 		Line35.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line35+6
;NewDesign_driver.c,4132 :: 		Line35.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line35+8
;NewDesign_driver.c,4133 :: 		Line35.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line35+10
;NewDesign_driver.c,4134 :: 		Line35.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line35+12
;NewDesign_driver.c,4135 :: 		Line35.Pen_Width      = 3;
	MOV	#lo_addr(_Line35+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4136 :: 		Line35.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line35+16
;NewDesign_driver.c,4138 :: 		Line36.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line36
;NewDesign_driver.c,4139 :: 		Line36.Order          = 47;
	MOV	#lo_addr(_Line36+2), W1
	MOV.B	#47, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4140 :: 		Line36.Visible        = 0;
	MOV	#lo_addr(_Line36+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4141 :: 		Line36.Opacity        = 255;
	MOV	#lo_addr(_Line36+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4142 :: 		Line36.Tag            = 255;
	MOV	#lo_addr(_Line36+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4143 :: 		Line36.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line36+6
;NewDesign_driver.c,4144 :: 		Line36.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line36+8
;NewDesign_driver.c,4145 :: 		Line36.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line36+10
;NewDesign_driver.c,4146 :: 		Line36.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line36+12
;NewDesign_driver.c,4147 :: 		Line36.Pen_Width      = 3;
	MOV	#lo_addr(_Line36+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4148 :: 		Line36.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line36+16
;NewDesign_driver.c,4150 :: 		Line37.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line37
;NewDesign_driver.c,4151 :: 		Line37.Order          = 48;
	MOV	#lo_addr(_Line37+2), W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4152 :: 		Line37.Visible        = 0;
	MOV	#lo_addr(_Line37+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4153 :: 		Line37.Opacity        = 255;
	MOV	#lo_addr(_Line37+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4154 :: 		Line37.Tag            = 255;
	MOV	#lo_addr(_Line37+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4155 :: 		Line37.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line37+6
;NewDesign_driver.c,4156 :: 		Line37.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line37+8
;NewDesign_driver.c,4157 :: 		Line37.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line37+10
;NewDesign_driver.c,4158 :: 		Line37.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line37+12
;NewDesign_driver.c,4159 :: 		Line37.Pen_Width      = 3;
	MOV	#lo_addr(_Line37+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4160 :: 		Line37.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line37+16
;NewDesign_driver.c,4162 :: 		Line38.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line38
;NewDesign_driver.c,4163 :: 		Line38.Order          = 49;
	MOV	#lo_addr(_Line38+2), W1
	MOV.B	#49, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4164 :: 		Line38.Visible        = 0;
	MOV	#lo_addr(_Line38+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4165 :: 		Line38.Opacity        = 255;
	MOV	#lo_addr(_Line38+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4166 :: 		Line38.Tag            = 255;
	MOV	#lo_addr(_Line38+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4167 :: 		Line38.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line38+6
;NewDesign_driver.c,4168 :: 		Line38.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line38+8
;NewDesign_driver.c,4169 :: 		Line38.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line38+10
;NewDesign_driver.c,4170 :: 		Line38.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line38+12
;NewDesign_driver.c,4171 :: 		Line38.Pen_Width      = 3;
	MOV	#lo_addr(_Line38+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4172 :: 		Line38.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line38+16
;NewDesign_driver.c,4174 :: 		Line39.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line39
;NewDesign_driver.c,4175 :: 		Line39.Order          = 50;
	MOV	#lo_addr(_Line39+2), W1
	MOV.B	#50, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4176 :: 		Line39.Visible        = 0;
	MOV	#lo_addr(_Line39+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4177 :: 		Line39.Opacity        = 255;
	MOV	#lo_addr(_Line39+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4178 :: 		Line39.Tag            = 255;
	MOV	#lo_addr(_Line39+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4179 :: 		Line39.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line39+6
;NewDesign_driver.c,4180 :: 		Line39.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line39+8
;NewDesign_driver.c,4181 :: 		Line39.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line39+10
;NewDesign_driver.c,4182 :: 		Line39.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line39+12
;NewDesign_driver.c,4183 :: 		Line39.Pen_Width      = 3;
	MOV	#lo_addr(_Line39+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4184 :: 		Line39.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line39+16
;NewDesign_driver.c,4186 :: 		Line40.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line40
;NewDesign_driver.c,4187 :: 		Line40.Order          = 51;
	MOV	#lo_addr(_Line40+2), W1
	MOV.B	#51, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4188 :: 		Line40.Visible        = 0;
	MOV	#lo_addr(_Line40+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4189 :: 		Line40.Opacity        = 255;
	MOV	#lo_addr(_Line40+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4190 :: 		Line40.Tag            = 255;
	MOV	#lo_addr(_Line40+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4191 :: 		Line40.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line40+6
;NewDesign_driver.c,4192 :: 		Line40.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line40+8
;NewDesign_driver.c,4193 :: 		Line40.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line40+10
;NewDesign_driver.c,4194 :: 		Line40.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line40+12
;NewDesign_driver.c,4195 :: 		Line40.Pen_Width      = 3;
	MOV	#lo_addr(_Line40+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4196 :: 		Line40.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line40+16
;NewDesign_driver.c,4198 :: 		Line41.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line41
;NewDesign_driver.c,4199 :: 		Line41.Order          = 52;
	MOV	#lo_addr(_Line41+2), W1
	MOV.B	#52, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4200 :: 		Line41.Visible        = 0;
	MOV	#lo_addr(_Line41+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4201 :: 		Line41.Opacity        = 255;
	MOV	#lo_addr(_Line41+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4202 :: 		Line41.Tag            = 255;
	MOV	#lo_addr(_Line41+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4203 :: 		Line41.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line41+6
;NewDesign_driver.c,4204 :: 		Line41.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line41+8
;NewDesign_driver.c,4205 :: 		Line41.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line41+10
;NewDesign_driver.c,4206 :: 		Line41.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line41+12
;NewDesign_driver.c,4207 :: 		Line41.Pen_Width      = 3;
	MOV	#lo_addr(_Line41+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4208 :: 		Line41.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line41+16
;NewDesign_driver.c,4210 :: 		Line42.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line42
;NewDesign_driver.c,4211 :: 		Line42.Order          = 53;
	MOV	#lo_addr(_Line42+2), W1
	MOV.B	#53, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4212 :: 		Line42.Visible        = 0;
	MOV	#lo_addr(_Line42+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4213 :: 		Line42.Opacity        = 255;
	MOV	#lo_addr(_Line42+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4214 :: 		Line42.Tag            = 255;
	MOV	#lo_addr(_Line42+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4215 :: 		Line42.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line42+6
;NewDesign_driver.c,4216 :: 		Line42.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line42+8
;NewDesign_driver.c,4217 :: 		Line42.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line42+10
;NewDesign_driver.c,4218 :: 		Line42.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line42+12
;NewDesign_driver.c,4219 :: 		Line42.Pen_Width      = 3;
	MOV	#lo_addr(_Line42+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4220 :: 		Line42.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line42+16
;NewDesign_driver.c,4222 :: 		Line43.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line43
;NewDesign_driver.c,4223 :: 		Line43.Order          = 54;
	MOV	#lo_addr(_Line43+2), W1
	MOV.B	#54, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4224 :: 		Line43.Visible        = 0;
	MOV	#lo_addr(_Line43+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4225 :: 		Line43.Opacity        = 255;
	MOV	#lo_addr(_Line43+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4226 :: 		Line43.Tag            = 255;
	MOV	#lo_addr(_Line43+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4227 :: 		Line43.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line43+6
;NewDesign_driver.c,4228 :: 		Line43.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line43+8
;NewDesign_driver.c,4229 :: 		Line43.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line43+10
;NewDesign_driver.c,4230 :: 		Line43.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line43+12
;NewDesign_driver.c,4231 :: 		Line43.Pen_Width      = 3;
	MOV	#lo_addr(_Line43+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4232 :: 		Line43.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line43+16
;NewDesign_driver.c,4234 :: 		Line44.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line44
;NewDesign_driver.c,4235 :: 		Line44.Order          = 55;
	MOV	#lo_addr(_Line44+2), W1
	MOV.B	#55, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4236 :: 		Line44.Visible        = 0;
	MOV	#lo_addr(_Line44+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4237 :: 		Line44.Opacity        = 255;
	MOV	#lo_addr(_Line44+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4238 :: 		Line44.Tag            = 255;
	MOV	#lo_addr(_Line44+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4239 :: 		Line44.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line44+6
;NewDesign_driver.c,4240 :: 		Line44.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line44+8
;NewDesign_driver.c,4241 :: 		Line44.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line44+10
;NewDesign_driver.c,4242 :: 		Line44.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line44+12
;NewDesign_driver.c,4243 :: 		Line44.Pen_Width      = 3;
	MOV	#lo_addr(_Line44+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4244 :: 		Line44.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line44+16
;NewDesign_driver.c,4246 :: 		Line45.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line45
;NewDesign_driver.c,4247 :: 		Line45.Order          = 56;
	MOV	#lo_addr(_Line45+2), W1
	MOV.B	#56, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4248 :: 		Line45.Visible        = 0;
	MOV	#lo_addr(_Line45+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4249 :: 		Line45.Opacity        = 255;
	MOV	#lo_addr(_Line45+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4250 :: 		Line45.Tag            = 255;
	MOV	#lo_addr(_Line45+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4251 :: 		Line45.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line45+6
;NewDesign_driver.c,4252 :: 		Line45.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line45+8
;NewDesign_driver.c,4253 :: 		Line45.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line45+10
;NewDesign_driver.c,4254 :: 		Line45.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line45+12
;NewDesign_driver.c,4255 :: 		Line45.Pen_Width      = 3;
	MOV	#lo_addr(_Line45+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4256 :: 		Line45.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line45+16
;NewDesign_driver.c,4258 :: 		Line46.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line46
;NewDesign_driver.c,4259 :: 		Line46.Order          = 57;
	MOV	#lo_addr(_Line46+2), W1
	MOV.B	#57, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4260 :: 		Line46.Visible        = 0;
	MOV	#lo_addr(_Line46+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4261 :: 		Line46.Opacity        = 255;
	MOV	#lo_addr(_Line46+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4262 :: 		Line46.Tag            = 255;
	MOV	#lo_addr(_Line46+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4263 :: 		Line46.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line46+6
;NewDesign_driver.c,4264 :: 		Line46.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line46+8
;NewDesign_driver.c,4265 :: 		Line46.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line46+10
;NewDesign_driver.c,4266 :: 		Line46.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line46+12
;NewDesign_driver.c,4267 :: 		Line46.Pen_Width      = 3;
	MOV	#lo_addr(_Line46+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4268 :: 		Line46.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line46+16
;NewDesign_driver.c,4270 :: 		Line47.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line47
;NewDesign_driver.c,4271 :: 		Line47.Order          = 58;
	MOV	#lo_addr(_Line47+2), W1
	MOV.B	#58, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4272 :: 		Line47.Visible        = 0;
	MOV	#lo_addr(_Line47+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4273 :: 		Line47.Opacity        = 255;
	MOV	#lo_addr(_Line47+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4274 :: 		Line47.Tag            = 255;
	MOV	#lo_addr(_Line47+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4275 :: 		Line47.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line47+6
;NewDesign_driver.c,4276 :: 		Line47.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line47+8
;NewDesign_driver.c,4277 :: 		Line47.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line47+10
;NewDesign_driver.c,4278 :: 		Line47.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line47+12
;NewDesign_driver.c,4279 :: 		Line47.Pen_Width      = 3;
	MOV	#lo_addr(_Line47+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4280 :: 		Line47.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line47+16
;NewDesign_driver.c,4282 :: 		Line48.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line48
;NewDesign_driver.c,4283 :: 		Line48.Order          = 59;
	MOV	#lo_addr(_Line48+2), W1
	MOV.B	#59, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4284 :: 		Line48.Visible        = 0;
	MOV	#lo_addr(_Line48+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4285 :: 		Line48.Opacity        = 255;
	MOV	#lo_addr(_Line48+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4286 :: 		Line48.Tag            = 255;
	MOV	#lo_addr(_Line48+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4287 :: 		Line48.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line48+6
;NewDesign_driver.c,4288 :: 		Line48.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line48+8
;NewDesign_driver.c,4289 :: 		Line48.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line48+10
;NewDesign_driver.c,4290 :: 		Line48.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line48+12
;NewDesign_driver.c,4291 :: 		Line48.Pen_Width      = 3;
	MOV	#lo_addr(_Line48+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4292 :: 		Line48.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line48+16
;NewDesign_driver.c,4294 :: 		Line49.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line49
;NewDesign_driver.c,4295 :: 		Line49.Order          = 60;
	MOV	#lo_addr(_Line49+2), W1
	MOV.B	#60, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4296 :: 		Line49.Visible        = 0;
	MOV	#lo_addr(_Line49+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4297 :: 		Line49.Opacity        = 255;
	MOV	#lo_addr(_Line49+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4298 :: 		Line49.Tag            = 255;
	MOV	#lo_addr(_Line49+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4299 :: 		Line49.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line49+6
;NewDesign_driver.c,4300 :: 		Line49.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line49+8
;NewDesign_driver.c,4301 :: 		Line49.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line49+10
;NewDesign_driver.c,4302 :: 		Line49.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line49+12
;NewDesign_driver.c,4303 :: 		Line49.Pen_Width      = 3;
	MOV	#lo_addr(_Line49+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4304 :: 		Line49.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line49+16
;NewDesign_driver.c,4306 :: 		Line50.OwnerScreen    = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _Line50
;NewDesign_driver.c,4307 :: 		Line50.Order          = 61;
	MOV	#lo_addr(_Line50+2), W1
	MOV.B	#61, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4308 :: 		Line50.Visible        = 0;
	MOV	#lo_addr(_Line50+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4309 :: 		Line50.Opacity        = 255;
	MOV	#lo_addr(_Line50+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4310 :: 		Line50.Tag            = 255;
	MOV	#lo_addr(_Line50+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4311 :: 		Line50.First_Point_X  = 40;
	MOV	#40, W0
	MOV	W0, _Line50+6
;NewDesign_driver.c,4312 :: 		Line50.First_Point_Y  = 32;
	MOV	#32, W0
	MOV	W0, _Line50+8
;NewDesign_driver.c,4313 :: 		Line50.Second_Point_X = 50;
	MOV	#50, W0
	MOV	W0, _Line50+10
;NewDesign_driver.c,4314 :: 		Line50.Second_Point_Y = 32;
	MOV	#32, W0
	MOV	W0, _Line50+12
;NewDesign_driver.c,4315 :: 		Line50.Pen_Width      = 3;
	MOV	#lo_addr(_Line50+14), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4316 :: 		Line50.Pen_Color      = 0x1515;
	MOV	#5397, W0
	MOV	W0, _Line50+16
;NewDesign_driver.c,4318 :: 		EveText1.OwnerScreen = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveText1
;NewDesign_driver.c,4319 :: 		EveText1.Order       = 62;
	MOV	#lo_addr(_EveText1+2), W1
	MOV.B	#62, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4320 :: 		EveText1.Visible     = 1;
	MOV	#lo_addr(_EveText1+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4321 :: 		EveText1.Opacity     = 255;
	MOV	#lo_addr(_EveText1+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4322 :: 		EveText1.Tag         = 255;
	MOV	#lo_addr(_EveText1+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4323 :: 		EveText1.Left        = 370;
	MOV	#370, W0
	MOV	W0, _EveText1+6
;NewDesign_driver.c,4324 :: 		EveText1.Top         = 56;
	MOV	#56, W0
	MOV	W0, _EveText1+8
;NewDesign_driver.c,4325 :: 		EveText1.Width       = 83;
	MOV	#83, W0
	MOV	W0, _EveText1+10
;NewDesign_driver.c,4326 :: 		EveText1.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText1+12
;NewDesign_driver.c,4327 :: 		EveText1.Caption     = EveText1_Caption;
	MOV	#lo_addr(_EveText1_Caption), W0
	MOV	W0, _EveText1+14
;NewDesign_driver.c,4328 :: 		EveText1.TextAlign   = taNone;
	MOV	#lo_addr(_EveText1+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4329 :: 		EveText1.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText1+18
	MOV	W1, _EveText1+20
;NewDesign_driver.c,4330 :: 		EveText1.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText1+22
;NewDesign_driver.c,4331 :: 		EveText1.FontHandle  = 26;
	MOV	#lo_addr(_EveText1+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4332 :: 		EveText1.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText1+26
	MOV	W1, _EveText1+28
;NewDesign_driver.c,4333 :: 		EveText1.Active      = 1;
	MOV	#lo_addr(_EveText1+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4334 :: 		EveText1.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText1+32
;NewDesign_driver.c,4335 :: 		EveText1.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText1+34
;NewDesign_driver.c,4336 :: 		EveText1.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText1+36
;NewDesign_driver.c,4337 :: 		EveText1.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText1+38
;NewDesign_driver.c,4339 :: 		EveButtonProfCreateFile.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfCreateFile
;NewDesign_driver.c,4340 :: 		EveButtonProfCreateFile.Order         = 63;
	MOV	#lo_addr(_EveButtonProfCreateFile+2), W1
	MOV.B	#63, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4341 :: 		EveButtonProfCreateFile.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfCreateFile+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4342 :: 		EveButtonProfCreateFile.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfCreateFile+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4343 :: 		EveButtonProfCreateFile.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfCreateFile+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4344 :: 		EveButtonProfCreateFile.Left          = 274;
	MOV	#274, W0
	MOV	W0, _EveButtonProfCreateFile+6
;NewDesign_driver.c,4345 :: 		EveButtonProfCreateFile.Top           = 135;
	MOV	#135, W0
	MOV	W0, _EveButtonProfCreateFile+8
;NewDesign_driver.c,4346 :: 		EveButtonProfCreateFile.Width         = 200;
	MOV	#200, W0
	MOV	W0, _EveButtonProfCreateFile+10
;NewDesign_driver.c,4347 :: 		EveButtonProfCreateFile.Height        = 48;
	MOV	#48, W0
	MOV	W0, _EveButtonProfCreateFile+12
;NewDesign_driver.c,4348 :: 		EveButtonProfCreateFile.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfCreateFile+14
;NewDesign_driver.c,4349 :: 		EveButtonProfCreateFile.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfCreateFile+16
;NewDesign_driver.c,4350 :: 		EveButtonProfCreateFile.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfCreateFile+18
;NewDesign_driver.c,4351 :: 		EveButtonProfCreateFile.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfCreateFile+20
;NewDesign_driver.c,4352 :: 		EveButtonProfCreateFile.Caption       = EveButtonProfCreateFile_Caption;
	MOV	#lo_addr(_EveButtonProfCreateFile_Caption), W0
	MOV	W0, _EveButtonProfCreateFile+22
;NewDesign_driver.c,4353 :: 		EveButtonProfCreateFile.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfCreateFile+24
	MOV	W1, _EveButtonProfCreateFile+26
;NewDesign_driver.c,4354 :: 		EveButtonProfCreateFile.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfCreateFile+28
;NewDesign_driver.c,4355 :: 		EveButtonProfCreateFile.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfCreateFile+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4356 :: 		EveButtonProfCreateFile.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfCreateFile+32
	MOV	W1, _EveButtonProfCreateFile+34
;NewDesign_driver.c,4357 :: 		EveButtonProfCreateFile.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfCreateFile+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4358 :: 		EveButtonProfCreateFile.Active        = 1;
	MOV	#lo_addr(_EveButtonProfCreateFile+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4359 :: 		EveButtonProfCreateFile.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfCreateFile+38
;NewDesign_driver.c,4360 :: 		EveButtonProfCreateFile.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfCreateFile+40
;NewDesign_driver.c,4361 :: 		EveButtonProfCreateFile.OnClick       = &EveButtonProfCreateFile_OnClick;
	MOV	#lo_addr(_EveButtonProfCreateFile_OnClick), W0
	MOV	W0, _EveButtonProfCreateFile+42
;NewDesign_driver.c,4362 :: 		EveButtonProfCreateFile.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfCreateFile+44
;NewDesign_driver.c,4364 :: 		EveButtonProfCreateFile_OnClick.Action       = EveButtonProfCreateFileOnClick;
	MOV	#lo_addr(_EveButtonProfCreateFileOnClick), W0
	MOV	W0, _EveButtonProfCreateFile_OnClick
;NewDesign_driver.c,4365 :: 		EveButtonProfCreateFile_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfCreateFile_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4366 :: 		EveButtonProfCreateFile_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfCreateFile_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4367 :: 		EveButtonProfCreateFile_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfCreateFile_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4368 :: 		EveButtonProfCreateFile_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfCreateFile_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4370 :: 		EveTextProfFileName.OwnerScreen = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveTextProfFileName
;NewDesign_driver.c,4371 :: 		EveTextProfFileName.Order       = 64;
	MOV	#lo_addr(_EveTextProfFileName+2), W1
	MOV.B	#64, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4372 :: 		EveTextProfFileName.Visible     = 1;
	MOV	#lo_addr(_EveTextProfFileName+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4373 :: 		EveTextProfFileName.Opacity     = 255;
	MOV	#lo_addr(_EveTextProfFileName+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4374 :: 		EveTextProfFileName.Tag         = 255;
	MOV	#lo_addr(_EveTextProfFileName+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4375 :: 		EveTextProfFileName.Left        = 383;
	MOV	#383, W0
	MOV	W0, _EveTextProfFileName+6
;NewDesign_driver.c,4376 :: 		EveTextProfFileName.Top         = 78;
	MOV	#78, W0
	MOV	W0, _EveTextProfFileName+8
;NewDesign_driver.c,4377 :: 		EveTextProfFileName.Width       = 27;
	MOV	#27, W0
	MOV	W0, _EveTextProfFileName+10
;NewDesign_driver.c,4378 :: 		EveTextProfFileName.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveTextProfFileName+12
;NewDesign_driver.c,4379 :: 		EveTextProfFileName.Caption     = EveTextProfFileName_Caption;
	MOV	#lo_addr(_EveTextProfFileName_Caption), W0
	MOV	W0, _EveTextProfFileName+14
;NewDesign_driver.c,4380 :: 		EveTextProfFileName.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextProfFileName+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4381 :: 		EveTextProfFileName.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveTextProfFileName+18
	MOV	W1, _EveTextProfFileName+20
;NewDesign_driver.c,4382 :: 		EveTextProfFileName.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextProfFileName+22
;NewDesign_driver.c,4383 :: 		EveTextProfFileName.FontHandle  = 26;
	MOV	#lo_addr(_EveTextProfFileName+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4384 :: 		EveTextProfFileName.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextProfFileName+26
	MOV	W1, _EveTextProfFileName+28
;NewDesign_driver.c,4385 :: 		EveTextProfFileName.Active      = 0;
	MOV	#lo_addr(_EveTextProfFileName+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4386 :: 		EveTextProfFileName.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextProfFileName+32
;NewDesign_driver.c,4387 :: 		EveTextProfFileName.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextProfFileName+34
;NewDesign_driver.c,4388 :: 		EveTextProfFileName.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextProfFileName+36
;NewDesign_driver.c,4389 :: 		EveTextProfFileName.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextProfFileName+38
;NewDesign_driver.c,4391 :: 		EveButtonProfRough1.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfRough1
;NewDesign_driver.c,4392 :: 		EveButtonProfRough1.Order         = 66;
	MOV	#lo_addr(_EveButtonProfRough1+2), W1
	MOV.B	#66, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4393 :: 		EveButtonProfRough1.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfRough1+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4394 :: 		EveButtonProfRough1.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfRough1+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4395 :: 		EveButtonProfRough1.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfRough1+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4396 :: 		EveButtonProfRough1.Left          = 10;
	MOV	#10, W0
	MOV	W0, _EveButtonProfRough1+6
;NewDesign_driver.c,4397 :: 		EveButtonProfRough1.Top           = 165;
	MOV	#165, W0
	MOV	W0, _EveButtonProfRough1+8
;NewDesign_driver.c,4398 :: 		EveButtonProfRough1.Width         = 100;
	MOV	#100, W0
	MOV	W0, _EveButtonProfRough1+10
;NewDesign_driver.c,4399 :: 		EveButtonProfRough1.Height        = 44;
	MOV	#44, W0
	MOV	W0, _EveButtonProfRough1+12
;NewDesign_driver.c,4400 :: 		EveButtonProfRough1.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough1+14
;NewDesign_driver.c,4401 :: 		EveButtonProfRough1.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough1+16
;NewDesign_driver.c,4402 :: 		EveButtonProfRough1.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough1+18
;NewDesign_driver.c,4403 :: 		EveButtonProfRough1.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough1+20
;NewDesign_driver.c,4404 :: 		EveButtonProfRough1.Caption       = EveButtonProfRough1_Caption;
	MOV	#lo_addr(_EveButtonProfRough1_Caption), W0
	MOV	W0, _EveButtonProfRough1+22
;NewDesign_driver.c,4405 :: 		EveButtonProfRough1.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfRough1+24
	MOV	W1, _EveButtonProfRough1+26
;NewDesign_driver.c,4406 :: 		EveButtonProfRough1.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfRough1+28
;NewDesign_driver.c,4407 :: 		EveButtonProfRough1.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfRough1+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4408 :: 		EveButtonProfRough1.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfRough1+32
	MOV	W1, _EveButtonProfRough1+34
;NewDesign_driver.c,4409 :: 		EveButtonProfRough1.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfRough1+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4410 :: 		EveButtonProfRough1.Active        = 1;
	MOV	#lo_addr(_EveButtonProfRough1+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4411 :: 		EveButtonProfRough1.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough1+38
;NewDesign_driver.c,4412 :: 		EveButtonProfRough1.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough1+40
;NewDesign_driver.c,4413 :: 		EveButtonProfRough1.OnClick       = &EveButtonProfRough1_OnClick;
	MOV	#lo_addr(_EveButtonProfRough1_OnClick), W0
	MOV	W0, _EveButtonProfRough1+42
;NewDesign_driver.c,4414 :: 		EveButtonProfRough1.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough1+44
;NewDesign_driver.c,4416 :: 		EveButtonProfRough1_OnClick.Action       = EveButtonProfRough1OnClick;
	MOV	#lo_addr(_EveButtonProfRough1OnClick), W0
	MOV	W0, _EveButtonProfRough1_OnClick
;NewDesign_driver.c,4417 :: 		EveButtonProfRough1_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfRough1_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4418 :: 		EveButtonProfRough1_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfRough1_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4419 :: 		EveButtonProfRough1_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfRough1_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4420 :: 		EveButtonProfRough1_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfRough1_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4422 :: 		EveButtonProfRough2.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfRough2
;NewDesign_driver.c,4423 :: 		EveButtonProfRough2.Order         = 67;
	MOV	#lo_addr(_EveButtonProfRough2+2), W1
	MOV.B	#67, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4424 :: 		EveButtonProfRough2.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfRough2+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4425 :: 		EveButtonProfRough2.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfRough2+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4426 :: 		EveButtonProfRough2.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfRough2+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4427 :: 		EveButtonProfRough2.Left          = 135;
	MOV	#135, W0
	MOV	W0, _EveButtonProfRough2+6
;NewDesign_driver.c,4428 :: 		EveButtonProfRough2.Top           = 165;
	MOV	#165, W0
	MOV	W0, _EveButtonProfRough2+8
;NewDesign_driver.c,4429 :: 		EveButtonProfRough2.Width         = 100;
	MOV	#100, W0
	MOV	W0, _EveButtonProfRough2+10
;NewDesign_driver.c,4430 :: 		EveButtonProfRough2.Height        = 44;
	MOV	#44, W0
	MOV	W0, _EveButtonProfRough2+12
;NewDesign_driver.c,4431 :: 		EveButtonProfRough2.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough2+14
;NewDesign_driver.c,4432 :: 		EveButtonProfRough2.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough2+16
;NewDesign_driver.c,4433 :: 		EveButtonProfRough2.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough2+18
;NewDesign_driver.c,4434 :: 		EveButtonProfRough2.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough2+20
;NewDesign_driver.c,4435 :: 		EveButtonProfRough2.Caption       = EveButtonProfRough2_Caption;
	MOV	#lo_addr(_EveButtonProfRough2_Caption), W0
	MOV	W0, _EveButtonProfRough2+22
;NewDesign_driver.c,4436 :: 		EveButtonProfRough2.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfRough2+24
	MOV	W1, _EveButtonProfRough2+26
;NewDesign_driver.c,4437 :: 		EveButtonProfRough2.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfRough2+28
;NewDesign_driver.c,4438 :: 		EveButtonProfRough2.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfRough2+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4439 :: 		EveButtonProfRough2.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfRough2+32
	MOV	W1, _EveButtonProfRough2+34
;NewDesign_driver.c,4440 :: 		EveButtonProfRough2.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfRough2+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4441 :: 		EveButtonProfRough2.Active        = 1;
	MOV	#lo_addr(_EveButtonProfRough2+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4442 :: 		EveButtonProfRough2.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough2+38
;NewDesign_driver.c,4443 :: 		EveButtonProfRough2.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough2+40
;NewDesign_driver.c,4444 :: 		EveButtonProfRough2.OnClick       = &EveButtonProfRough2_OnClick;
	MOV	#lo_addr(_EveButtonProfRough2_OnClick), W0
	MOV	W0, _EveButtonProfRough2+42
;NewDesign_driver.c,4445 :: 		EveButtonProfRough2.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough2+44
;NewDesign_driver.c,4447 :: 		EveButtonProfRough2_OnClick.Action       = EveButtonProfRough2OnClick;
	MOV	#lo_addr(_EveButtonProfRough2OnClick), W0
	MOV	W0, _EveButtonProfRough2_OnClick
;NewDesign_driver.c,4448 :: 		EveButtonProfRough2_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfRough2_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4449 :: 		EveButtonProfRough2_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfRough2_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4450 :: 		EveButtonProfRough2_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfRough2_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4451 :: 		EveButtonProfRough2_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfRough2_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4453 :: 		EveButtonProfRough3.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfRough3
;NewDesign_driver.c,4454 :: 		EveButtonProfRough3.Order         = 68;
	MOV	#lo_addr(_EveButtonProfRough3+2), W1
	MOV.B	#68, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4455 :: 		EveButtonProfRough3.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfRough3+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4456 :: 		EveButtonProfRough3.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfRough3+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4457 :: 		EveButtonProfRough3.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfRough3+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4458 :: 		EveButtonProfRough3.Left          = 10;
	MOV	#10, W0
	MOV	W0, _EveButtonProfRough3+6
;NewDesign_driver.c,4459 :: 		EveButtonProfRough3.Top           = 220;
	MOV	#220, W0
	MOV	W0, _EveButtonProfRough3+8
;NewDesign_driver.c,4460 :: 		EveButtonProfRough3.Width         = 100;
	MOV	#100, W0
	MOV	W0, _EveButtonProfRough3+10
;NewDesign_driver.c,4461 :: 		EveButtonProfRough3.Height        = 44;
	MOV	#44, W0
	MOV	W0, _EveButtonProfRough3+12
;NewDesign_driver.c,4462 :: 		EveButtonProfRough3.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough3+14
;NewDesign_driver.c,4463 :: 		EveButtonProfRough3.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough3+16
;NewDesign_driver.c,4464 :: 		EveButtonProfRough3.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough3+18
;NewDesign_driver.c,4465 :: 		EveButtonProfRough3.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough3+20
;NewDesign_driver.c,4466 :: 		EveButtonProfRough3.Caption       = EveButtonProfRough3_Caption;
	MOV	#lo_addr(_EveButtonProfRough3_Caption), W0
	MOV	W0, _EveButtonProfRough3+22
;NewDesign_driver.c,4467 :: 		EveButtonProfRough3.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfRough3+24
	MOV	W1, _EveButtonProfRough3+26
;NewDesign_driver.c,4468 :: 		EveButtonProfRough3.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfRough3+28
;NewDesign_driver.c,4469 :: 		EveButtonProfRough3.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfRough3+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4470 :: 		EveButtonProfRough3.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfRough3+32
	MOV	W1, _EveButtonProfRough3+34
;NewDesign_driver.c,4471 :: 		EveButtonProfRough3.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfRough3+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4472 :: 		EveButtonProfRough3.Active        = 1;
	MOV	#lo_addr(_EveButtonProfRough3+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4473 :: 		EveButtonProfRough3.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough3+38
;NewDesign_driver.c,4474 :: 		EveButtonProfRough3.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough3+40
;NewDesign_driver.c,4475 :: 		EveButtonProfRough3.OnClick       = &EveButtonProfRough3_OnClick;
	MOV	#lo_addr(_EveButtonProfRough3_OnClick), W0
	MOV	W0, _EveButtonProfRough3+42
;NewDesign_driver.c,4476 :: 		EveButtonProfRough3.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough3+44
;NewDesign_driver.c,4478 :: 		EveButtonProfRough3_OnClick.Action       = EveButtonProfRough3OnClick;
	MOV	#lo_addr(_EveButtonProfRough3OnClick), W0
	MOV	W0, _EveButtonProfRough3_OnClick
;NewDesign_driver.c,4479 :: 		EveButtonProfRough3_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfRough3_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4480 :: 		EveButtonProfRough3_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfRough3_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4481 :: 		EveButtonProfRough3_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfRough3_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4482 :: 		EveButtonProfRough3_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfRough3_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4484 :: 		EveButtonProfRough4.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveButtonProfRough4
;NewDesign_driver.c,4485 :: 		EveButtonProfRough4.Order         = 69;
	MOV	#lo_addr(_EveButtonProfRough4+2), W1
	MOV.B	#69, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4486 :: 		EveButtonProfRough4.Visible       = 1;
	MOV	#lo_addr(_EveButtonProfRough4+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4487 :: 		EveButtonProfRough4.Opacity       = 255;
	MOV	#lo_addr(_EveButtonProfRough4+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4488 :: 		EveButtonProfRough4.Tag           = 255;
	MOV	#lo_addr(_EveButtonProfRough4+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4489 :: 		EveButtonProfRough4.Left          = 135;
	MOV	#135, W0
	MOV	W0, _EveButtonProfRough4+6
;NewDesign_driver.c,4490 :: 		EveButtonProfRough4.Top           = 220;
	MOV	#220, W0
	MOV	W0, _EveButtonProfRough4+8
;NewDesign_driver.c,4491 :: 		EveButtonProfRough4.Width         = 100;
	MOV	#100, W0
	MOV	W0, _EveButtonProfRough4+10
;NewDesign_driver.c,4492 :: 		EveButtonProfRough4.Height        = 44;
	MOV	#44, W0
	MOV	W0, _EveButtonProfRough4+12
;NewDesign_driver.c,4493 :: 		EveButtonProfRough4.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough4+14
;NewDesign_driver.c,4494 :: 		EveButtonProfRough4.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough4+16
;NewDesign_driver.c,4495 :: 		EveButtonProfRough4.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonProfRough4+18
;NewDesign_driver.c,4496 :: 		EveButtonProfRough4.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonProfRough4+20
;NewDesign_driver.c,4497 :: 		EveButtonProfRough4.Caption       = EveButtonProfRough4_Caption;
	MOV	#lo_addr(_EveButtonProfRough4_Caption), W0
	MOV	W0, _EveButtonProfRough4+22
;NewDesign_driver.c,4498 :: 		EveButtonProfRough4.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonProfRough4+24
	MOV	W1, _EveButtonProfRough4+26
;NewDesign_driver.c,4499 :: 		EveButtonProfRough4.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonProfRough4+28
;NewDesign_driver.c,4500 :: 		EveButtonProfRough4.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonProfRough4+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4501 :: 		EveButtonProfRough4.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonProfRough4+32
	MOV	W1, _EveButtonProfRough4+34
;NewDesign_driver.c,4502 :: 		EveButtonProfRough4.Flat          = 0;
	MOV	#lo_addr(_EveButtonProfRough4+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4503 :: 		EveButtonProfRough4.Active        = 1;
	MOV	#lo_addr(_EveButtonProfRough4+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4504 :: 		EveButtonProfRough4.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough4+38
;NewDesign_driver.c,4505 :: 		EveButtonProfRough4.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough4+40
;NewDesign_driver.c,4506 :: 		EveButtonProfRough4.OnClick       = &EveButtonProfRough4_OnClick;
	MOV	#lo_addr(_EveButtonProfRough4_OnClick), W0
	MOV	W0, _EveButtonProfRough4+42
;NewDesign_driver.c,4507 :: 		EveButtonProfRough4.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonProfRough4+44
;NewDesign_driver.c,4509 :: 		EveButtonProfRough4_OnClick.Action       = EveButtonProfRough4OnClick;
	MOV	#lo_addr(_EveButtonProfRough4OnClick), W0
	MOV	W0, _EveButtonProfRough4_OnClick
;NewDesign_driver.c,4510 :: 		EveButtonProfRough4_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonProfRough4_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4511 :: 		EveButtonProfRough4_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonProfRough4_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4512 :: 		EveButtonProfRough4_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonProfRough4_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4513 :: 		EveButtonProfRough4_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonProfRough4_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4515 :: 		EveText18.OwnerScreen = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveText18
;NewDesign_driver.c,4516 :: 		EveText18.Order       = 70;
	MOV	#lo_addr(_EveText18+2), W1
	MOV.B	#70, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4517 :: 		EveText18.Visible     = 1;
	MOV	#lo_addr(_EveText18+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4518 :: 		EveText18.Opacity     = 255;
	MOV	#lo_addr(_EveText18+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4519 :: 		EveText18.Tag         = 255;
	MOV	#lo_addr(_EveText18+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4520 :: 		EveText18.Left        = 10;
	MOV	#10, W0
	MOV	W0, _EveText18+6
;NewDesign_driver.c,4521 :: 		EveText18.Top         = 135;
	MOV	#135, W0
	MOV	W0, _EveText18+8
;NewDesign_driver.c,4522 :: 		EveText18.Width       = 97;
	MOV	#97, W0
	MOV	W0, _EveText18+10
;NewDesign_driver.c,4523 :: 		EveText18.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveText18+12
;NewDesign_driver.c,4524 :: 		EveText18.Caption     = EveText18_Caption;
	MOV	#lo_addr(_EveText18_Caption), W0
	MOV	W0, _EveText18+14
;NewDesign_driver.c,4525 :: 		EveText18.TextAlign   = taNone;
	MOV	#lo_addr(_EveText18+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4526 :: 		EveText18.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveText18+18
	MOV	W1, _EveText18+20
;NewDesign_driver.c,4527 :: 		EveText18.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText18+22
;NewDesign_driver.c,4528 :: 		EveText18.FontHandle  = 27;
	MOV	#lo_addr(_EveText18+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4529 :: 		EveText18.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText18+26
	MOV	W1, _EveText18+28
;NewDesign_driver.c,4530 :: 		EveText18.Active      = 1;
	MOV	#lo_addr(_EveText18+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4531 :: 		EveText18.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText18+32
;NewDesign_driver.c,4532 :: 		EveText18.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText18+34
;NewDesign_driver.c,4533 :: 		EveText18.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText18+36
;NewDesign_driver.c,4534 :: 		EveText18.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText18+38
;NewDesign_driver.c,4536 :: 		BoxProfWaitingForCam.OwnerScreen   = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _BoxProfWaitingForCam
;NewDesign_driver.c,4537 :: 		BoxProfWaitingForCam.Order         = 71;
	MOV	#lo_addr(_BoxProfWaitingForCam+2), W1
	MOV.B	#71, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4538 :: 		BoxProfWaitingForCam.Visible       = 0;
	MOV	#lo_addr(_BoxProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4539 :: 		BoxProfWaitingForCam.Opacity       = 196;
	MOV	#lo_addr(_BoxProfWaitingForCam+4), W1
	MOV.B	#196, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4540 :: 		BoxProfWaitingForCam.Tag           = 255;
	MOV	#lo_addr(_BoxProfWaitingForCam+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4541 :: 		BoxProfWaitingForCam.Left          = 2;
	MOV	#2, W0
	MOV	W0, _BoxProfWaitingForCam+6
;NewDesign_driver.c,4542 :: 		BoxProfWaitingForCam.Top           = 4;
	MOV	#4, W0
	MOV	W0, _BoxProfWaitingForCam+8
;NewDesign_driver.c,4543 :: 		BoxProfWaitingForCam.Width         = 476;
	MOV	#476, W0
	MOV	W0, _BoxProfWaitingForCam+10
;NewDesign_driver.c,4544 :: 		BoxProfWaitingForCam.Height        = 266;
	MOV	#266, W0
	MOV	W0, _BoxProfWaitingForCam+12
;NewDesign_driver.c,4545 :: 		BoxProfWaitingForCam.Pen_Width     = 1;
	MOV	#lo_addr(_BoxProfWaitingForCam+14), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4546 :: 		BoxProfWaitingForCam.Pen_Color     = 0x0000;
	CLR	W0
	MOV	W0, _BoxProfWaitingForCam+16
;NewDesign_driver.c,4547 :: 		BoxProfWaitingForCam.Color         = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _BoxProfWaitingForCam+18
;NewDesign_driver.c,4548 :: 		BoxProfWaitingForCam.Press_Color   = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _BoxProfWaitingForCam+20
;NewDesign_driver.c,4549 :: 		BoxProfWaitingForCam.ColorTo       = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _BoxProfWaitingForCam+22
;NewDesign_driver.c,4550 :: 		BoxProfWaitingForCam.Press_ColorTo = 0xC618;
	MOV	#50712, W0
	MOV	W0, _BoxProfWaitingForCam+24
;NewDesign_driver.c,4551 :: 		BoxProfWaitingForCam.Gradient      = _FT800_BRUSH_GR_NONE;
	MOV	#lo_addr(_BoxProfWaitingForCam+26), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4552 :: 		BoxProfWaitingForCam.Active        = 0;
	MOV	#lo_addr(_BoxProfWaitingForCam+27), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4553 :: 		BoxProfWaitingForCam.OnUp          = 0;
	CLR	W0
	MOV	W0, _BoxProfWaitingForCam+28
;NewDesign_driver.c,4554 :: 		BoxProfWaitingForCam.OnDown        = 0;
	CLR	W0
	MOV	W0, _BoxProfWaitingForCam+30
;NewDesign_driver.c,4555 :: 		BoxProfWaitingForCam.OnClick       = 0;
	CLR	W0
	MOV	W0, _BoxProfWaitingForCam+32
;NewDesign_driver.c,4556 :: 		BoxProfWaitingForCam.OnPress       = 0;
	CLR	W0
	MOV	W0, _BoxProfWaitingForCam+34
;NewDesign_driver.c,4558 :: 		EveTextProfWaitingForCam.OwnerScreen = &ProfilingScreen;
	MOV	#lo_addr(_ProfilingScreen), W0
	MOV	W0, _EveTextProfWaitingForCam
;NewDesign_driver.c,4559 :: 		EveTextProfWaitingForCam.Order       = 72;
	MOV	#lo_addr(_EveTextProfWaitingForCam+2), W1
	MOV.B	#72, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4560 :: 		EveTextProfWaitingForCam.Visible     = 0;
	MOV	#lo_addr(_EveTextProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4561 :: 		EveTextProfWaitingForCam.Opacity     = 255;
	MOV	#lo_addr(_EveTextProfWaitingForCam+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4562 :: 		EveTextProfWaitingForCam.Tag         = 255;
	MOV	#lo_addr(_EveTextProfWaitingForCam+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4563 :: 		EveTextProfWaitingForCam.Left        = 106;
	MOV	#106, W0
	MOV	W0, _EveTextProfWaitingForCam+6
;NewDesign_driver.c,4564 :: 		EveTextProfWaitingForCam.Top         = 75;
	MOV	#75, W0
	MOV	W0, _EveTextProfWaitingForCam+8
;NewDesign_driver.c,4565 :: 		EveTextProfWaitingForCam.Width       = 265;
	MOV	#265, W0
	MOV	W0, _EveTextProfWaitingForCam+10
;NewDesign_driver.c,4566 :: 		EveTextProfWaitingForCam.Height      = 25;
	MOV	#25, W0
	MOV	W0, _EveTextProfWaitingForCam+12
;NewDesign_driver.c,4567 :: 		EveTextProfWaitingForCam.Caption     = EveTextProfWaitingForCam_Caption;
	MOV	#lo_addr(_EveTextProfWaitingForCam_Caption), W0
	MOV	W0, _EveTextProfWaitingForCam+14
;NewDesign_driver.c,4568 :: 		EveTextProfWaitingForCam.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextProfWaitingForCam+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4569 :: 		EveTextProfWaitingForCam.FontName    = 29;
	MOV	#29, W0
	MOV	#0, W1
	MOV	W0, _EveTextProfWaitingForCam+18
	MOV	W1, _EveTextProfWaitingForCam+20
;NewDesign_driver.c,4570 :: 		EveTextProfWaitingForCam.Font_Color  = 0x047F;
	MOV	#1151, W0
	MOV	W0, _EveTextProfWaitingForCam+22
;NewDesign_driver.c,4571 :: 		EveTextProfWaitingForCam.FontHandle  = 29;
	MOV	#lo_addr(_EveTextProfWaitingForCam+24), W1
	MOV.B	#29, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4572 :: 		EveTextProfWaitingForCam.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextProfWaitingForCam+26
	MOV	W1, _EveTextProfWaitingForCam+28
;NewDesign_driver.c,4573 :: 		EveTextProfWaitingForCam.Active      = 0;
	MOV	#lo_addr(_EveTextProfWaitingForCam+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4574 :: 		EveTextProfWaitingForCam.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextProfWaitingForCam+32
;NewDesign_driver.c,4575 :: 		EveTextProfWaitingForCam.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextProfWaitingForCam+34
;NewDesign_driver.c,4576 :: 		EveTextProfWaitingForCam.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextProfWaitingForCam+36
;NewDesign_driver.c,4577 :: 		EveTextProfWaitingForCam.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextProfWaitingForCam+38
;NewDesign_driver.c,4579 :: 		EveButtonFNfilename.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNfilename
;NewDesign_driver.c,4580 :: 		EveButtonFNfilename.Order         = 0;
	MOV	#lo_addr(_EveButtonFNfilename+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4581 :: 		EveButtonFNfilename.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNfilename+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4582 :: 		EveButtonFNfilename.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNfilename+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4583 :: 		EveButtonFNfilename.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNfilename+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4584 :: 		EveButtonFNfilename.Left          = 310;
	MOV	#310, W0
	MOV	W0, _EveButtonFNfilename+6
;NewDesign_driver.c,4585 :: 		EveButtonFNfilename.Top           = 4;
	MOV	#4, W0
	MOV	W0, _EveButtonFNfilename+8
;NewDesign_driver.c,4586 :: 		EveButtonFNfilename.Width         = 108;
	MOV	#108, W0
	MOV	W0, _EveButtonFNfilename+10
;NewDesign_driver.c,4587 :: 		EveButtonFNfilename.Height        = 26;
	MOV	#26, W0
	MOV	W0, _EveButtonFNfilename+12
;NewDesign_driver.c,4588 :: 		EveButtonFNfilename.Color         = 0xD6BA;
	MOV	#54970, W0
	MOV	W0, _EveButtonFNfilename+14
;NewDesign_driver.c,4589 :: 		EveButtonFNfilename.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNfilename+16
;NewDesign_driver.c,4590 :: 		EveButtonFNfilename.ColorTo       = 0xC618;
	MOV	#50712, W0
	MOV	W0, _EveButtonFNfilename+18
;NewDesign_driver.c,4591 :: 		EveButtonFNfilename.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNfilename+20
;NewDesign_driver.c,4592 :: 		EveButtonFNfilename.Caption       = EveButtonFNfilename_Caption;
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W0
	MOV	W0, _EveButtonFNfilename+22
;NewDesign_driver.c,4593 :: 		EveButtonFNfilename.FontName      = 28;
	MOV	#28, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNfilename+24
	MOV	W1, _EveButtonFNfilename+26
;NewDesign_driver.c,4594 :: 		EveButtonFNfilename.Font_Color    = 0x0000;
	CLR	W0
	MOV	W0, _EveButtonFNfilename+28
;NewDesign_driver.c,4595 :: 		EveButtonFNfilename.FontHandle    = 28;
	MOV	#lo_addr(_EveButtonFNfilename+30), W1
	MOV.B	#28, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4596 :: 		EveButtonFNfilename.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNfilename+32
	MOV	W1, _EveButtonFNfilename+34
;NewDesign_driver.c,4597 :: 		EveButtonFNfilename.Flat          = 1;
	MOV	#lo_addr(_EveButtonFNfilename+36), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4598 :: 		EveButtonFNfilename.Active        = 0;
	MOV	#lo_addr(_EveButtonFNfilename+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4599 :: 		EveButtonFNfilename.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNfilename+38
;NewDesign_driver.c,4600 :: 		EveButtonFNfilename.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNfilename+40
;NewDesign_driver.c,4601 :: 		EveButtonFNfilename.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNfilename+42
;NewDesign_driver.c,4602 :: 		EveButtonFNfilename.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNfilename+44
;NewDesign_driver.c,4604 :: 		EveKeys1.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveKeys1
;NewDesign_driver.c,4605 :: 		EveKeys1.Order         = 2;
	MOV	#lo_addr(_EveKeys1+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4606 :: 		EveKeys1.Visible       = 1;
	MOV	#lo_addr(_EveKeys1+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4607 :: 		EveKeys1.Opacity       = 255;
	MOV	#lo_addr(_EveKeys1+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4608 :: 		EveKeys1.Tag           = 255;
	MOV	#lo_addr(_EveKeys1+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4609 :: 		EveKeys1.Left          = 9;
	MOV	#9, W0
	MOV	W0, _EveKeys1+6
;NewDesign_driver.c,4610 :: 		EveKeys1.Top           = 93;
	MOV	#93, W0
	MOV	W0, _EveKeys1+8
;NewDesign_driver.c,4611 :: 		EveKeys1.Width         = 463;
	MOV	#463, W0
	MOV	W0, _EveKeys1+10
;NewDesign_driver.c,4612 :: 		EveKeys1.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveKeys1+12
;NewDesign_driver.c,4613 :: 		EveKeys1.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys1+14
;NewDesign_driver.c,4614 :: 		EveKeys1.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys1+16
;NewDesign_driver.c,4615 :: 		EveKeys1.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys1+18
;NewDesign_driver.c,4616 :: 		EveKeys1.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys1+20
;NewDesign_driver.c,4617 :: 		EveKeys1.Caption       = EveKeys1_Caption;
	MOV	#lo_addr(_EveKeys1_Caption), W0
	MOV	W0, _EveKeys1+22
;NewDesign_driver.c,4618 :: 		EveKeys1.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveKeys1+24
	MOV	W1, _EveKeys1+26
;NewDesign_driver.c,4619 :: 		EveKeys1.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveKeys1+28
;NewDesign_driver.c,4620 :: 		EveKeys1.FontHandle    = 27;
	MOV	#lo_addr(_EveKeys1+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4621 :: 		EveKeys1.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveKeys1+32
	MOV	W1, _EveKeys1+34
;NewDesign_driver.c,4622 :: 		EveKeys1.Flat          = 0;
	MOV	#lo_addr(_EveKeys1+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4623 :: 		EveKeys1.AutoSize      = 0;
	MOV	#lo_addr(_EveKeys1+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4624 :: 		EveKeys1.Active        = 1;
	MOV	#lo_addr(_EveKeys1+38), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4625 :: 		EveKeys1.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveKeys1+40
;NewDesign_driver.c,4626 :: 		EveKeys1.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveKeys1+42
;NewDesign_driver.c,4627 :: 		EveKeys1.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveKeys1+44
;NewDesign_driver.c,4628 :: 		EveKeys1.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveKeys1+46
;NewDesign_driver.c,4630 :: 		EveKeys2.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveKeys2
;NewDesign_driver.c,4631 :: 		EveKeys2.Order         = 3;
	MOV	#lo_addr(_EveKeys2+2), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4632 :: 		EveKeys2.Visible       = 1;
	MOV	#lo_addr(_EveKeys2+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4633 :: 		EveKeys2.Opacity       = 255;
	MOV	#lo_addr(_EveKeys2+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4634 :: 		EveKeys2.Tag           = 255;
	MOV	#lo_addr(_EveKeys2+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4635 :: 		EveKeys2.Left          = 9;
	MOV	#9, W0
	MOV	W0, _EveKeys2+6
;NewDesign_driver.c,4636 :: 		EveKeys2.Top           = 136;
	MOV	#136, W0
	MOV	W0, _EveKeys2+8
;NewDesign_driver.c,4637 :: 		EveKeys2.Width         = 464;
	MOV	#464, W0
	MOV	W0, _EveKeys2+10
;NewDesign_driver.c,4638 :: 		EveKeys2.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveKeys2+12
;NewDesign_driver.c,4639 :: 		EveKeys2.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys2+14
;NewDesign_driver.c,4640 :: 		EveKeys2.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys2+16
;NewDesign_driver.c,4641 :: 		EveKeys2.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys2+18
;NewDesign_driver.c,4642 :: 		EveKeys2.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys2+20
;NewDesign_driver.c,4643 :: 		EveKeys2.Caption       = EveKeys2_Caption;
	MOV	#lo_addr(_EveKeys2_Caption), W0
	MOV	W0, _EveKeys2+22
;NewDesign_driver.c,4644 :: 		EveKeys2.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveKeys2+24
	MOV	W1, _EveKeys2+26
;NewDesign_driver.c,4645 :: 		EveKeys2.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveKeys2+28
;NewDesign_driver.c,4646 :: 		EveKeys2.FontHandle    = 27;
	MOV	#lo_addr(_EveKeys2+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4647 :: 		EveKeys2.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveKeys2+32
	MOV	W1, _EveKeys2+34
;NewDesign_driver.c,4648 :: 		EveKeys2.Flat          = 0;
	MOV	#lo_addr(_EveKeys2+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4649 :: 		EveKeys2.AutoSize      = 0;
	MOV	#lo_addr(_EveKeys2+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4650 :: 		EveKeys2.Active        = 1;
	MOV	#lo_addr(_EveKeys2+38), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4651 :: 		EveKeys2.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveKeys2+40
;NewDesign_driver.c,4652 :: 		EveKeys2.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveKeys2+42
;NewDesign_driver.c,4653 :: 		EveKeys2.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveKeys2+44
;NewDesign_driver.c,4654 :: 		EveKeys2.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveKeys2+46
;NewDesign_driver.c,4656 :: 		EveKeys3.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveKeys3
;NewDesign_driver.c,4657 :: 		EveKeys3.Order         = 4;
	MOV	#lo_addr(_EveKeys3+2), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4658 :: 		EveKeys3.Visible       = 1;
	MOV	#lo_addr(_EveKeys3+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4659 :: 		EveKeys3.Opacity       = 255;
	MOV	#lo_addr(_EveKeys3+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4660 :: 		EveKeys3.Tag           = 255;
	MOV	#lo_addr(_EveKeys3+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4661 :: 		EveKeys3.Left          = 9;
	MOV	#9, W0
	MOV	W0, _EveKeys3+6
;NewDesign_driver.c,4662 :: 		EveKeys3.Top           = 179;
	MOV	#179, W0
	MOV	W0, _EveKeys3+8
;NewDesign_driver.c,4663 :: 		EveKeys3.Width         = 464;
	MOV	#464, W0
	MOV	W0, _EveKeys3+10
;NewDesign_driver.c,4664 :: 		EveKeys3.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveKeys3+12
;NewDesign_driver.c,4665 :: 		EveKeys3.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys3+14
;NewDesign_driver.c,4666 :: 		EveKeys3.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys3+16
;NewDesign_driver.c,4667 :: 		EveKeys3.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys3+18
;NewDesign_driver.c,4668 :: 		EveKeys3.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys3+20
;NewDesign_driver.c,4669 :: 		EveKeys3.Caption       = EveKeys3_Caption;
	MOV	#lo_addr(_EveKeys3_Caption), W0
	MOV	W0, _EveKeys3+22
;NewDesign_driver.c,4670 :: 		EveKeys3.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveKeys3+24
	MOV	W1, _EveKeys3+26
;NewDesign_driver.c,4671 :: 		EveKeys3.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveKeys3+28
;NewDesign_driver.c,4672 :: 		EveKeys3.FontHandle    = 27;
	MOV	#lo_addr(_EveKeys3+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4673 :: 		EveKeys3.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveKeys3+32
	MOV	W1, _EveKeys3+34
;NewDesign_driver.c,4674 :: 		EveKeys3.Flat          = 0;
	MOV	#lo_addr(_EveKeys3+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4675 :: 		EveKeys3.AutoSize      = 0;
	MOV	#lo_addr(_EveKeys3+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4676 :: 		EveKeys3.Active        = 1;
	MOV	#lo_addr(_EveKeys3+38), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4677 :: 		EveKeys3.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveKeys3+40
;NewDesign_driver.c,4678 :: 		EveKeys3.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveKeys3+42
;NewDesign_driver.c,4679 :: 		EveKeys3.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveKeys3+44
;NewDesign_driver.c,4680 :: 		EveKeys3.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveKeys3+46
;NewDesign_driver.c,4682 :: 		EveKeys4.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveKeys4
;NewDesign_driver.c,4683 :: 		EveKeys4.Order         = 5;
	MOV	#lo_addr(_EveKeys4+2), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4684 :: 		EveKeys4.Visible       = 1;
	MOV	#lo_addr(_EveKeys4+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4685 :: 		EveKeys4.Opacity       = 255;
	MOV	#lo_addr(_EveKeys4+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4686 :: 		EveKeys4.Tag           = 255;
	MOV	#lo_addr(_EveKeys4+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4687 :: 		EveKeys4.Left          = 62;
	MOV	#62, W0
	MOV	W0, _EveKeys4+6
;NewDesign_driver.c,4688 :: 		EveKeys4.Top           = 222;
	MOV	#222, W0
	MOV	W0, _EveKeys4+8
;NewDesign_driver.c,4689 :: 		EveKeys4.Width         = 410;
	MOV	#410, W0
	MOV	W0, _EveKeys4+10
;NewDesign_driver.c,4690 :: 		EveKeys4.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveKeys4+12
;NewDesign_driver.c,4691 :: 		EveKeys4.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys4+14
;NewDesign_driver.c,4692 :: 		EveKeys4.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys4+16
;NewDesign_driver.c,4693 :: 		EveKeys4.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveKeys4+18
;NewDesign_driver.c,4694 :: 		EveKeys4.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveKeys4+20
;NewDesign_driver.c,4695 :: 		EveKeys4.Caption       = EveKeys4_Caption;
	MOV	#lo_addr(_EveKeys4_Caption), W0
	MOV	W0, _EveKeys4+22
;NewDesign_driver.c,4696 :: 		EveKeys4.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveKeys4+24
	MOV	W1, _EveKeys4+26
;NewDesign_driver.c,4697 :: 		EveKeys4.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveKeys4+28
;NewDesign_driver.c,4698 :: 		EveKeys4.FontHandle    = 27;
	MOV	#lo_addr(_EveKeys4+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4699 :: 		EveKeys4.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveKeys4+32
	MOV	W1, _EveKeys4+34
;NewDesign_driver.c,4700 :: 		EveKeys4.Flat          = 0;
	MOV	#lo_addr(_EveKeys4+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4701 :: 		EveKeys4.AutoSize      = 0;
	MOV	#lo_addr(_EveKeys4+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4702 :: 		EveKeys4.Active        = 1;
	MOV	#lo_addr(_EveKeys4+38), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4703 :: 		EveKeys4.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveKeys4+40
;NewDesign_driver.c,4704 :: 		EveKeys4.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveKeys4+42
;NewDesign_driver.c,4705 :: 		EveKeys4.OnClick       = 0;
	CLR	W0
	MOV	W0, _EveKeys4+44
;NewDesign_driver.c,4706 :: 		EveKeys4.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveKeys4+46
;NewDesign_driver.c,4708 :: 		EveButtonFNBackspace.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNBackspace
;NewDesign_driver.c,4709 :: 		EveButtonFNBackspace.Order         = 8;
	MOV	#lo_addr(_EveButtonFNBackspace+2), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4710 :: 		EveButtonFNBackspace.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNBackspace+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4711 :: 		EveButtonFNBackspace.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNBackspace+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4712 :: 		EveButtonFNBackspace.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNBackspace+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4713 :: 		EveButtonFNBackspace.Left          = 10;
	MOV	#10, W0
	MOV	W0, _EveButtonFNBackspace+6
;NewDesign_driver.c,4714 :: 		EveButtonFNBackspace.Top           = 38;
	MOV	#38, W0
	MOV	W0, _EveButtonFNBackspace+8
;NewDesign_driver.c,4715 :: 		EveButtonFNBackspace.Width         = 102;
	MOV	#102, W0
	MOV	W0, _EveButtonFNBackspace+10
;NewDesign_driver.c,4716 :: 		EveButtonFNBackspace.Height        = 39;
	MOV	#39, W0
	MOV	W0, _EveButtonFNBackspace+12
;NewDesign_driver.c,4717 :: 		EveButtonFNBackspace.Color         = 0x4AEC;
	MOV	#19180, W0
	MOV	W0, _EveButtonFNBackspace+14
;NewDesign_driver.c,4718 :: 		EveButtonFNBackspace.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNBackspace+16
;NewDesign_driver.c,4719 :: 		EveButtonFNBackspace.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNBackspace+18
;NewDesign_driver.c,4720 :: 		EveButtonFNBackspace.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNBackspace+20
;NewDesign_driver.c,4721 :: 		EveButtonFNBackspace.Caption       = EveButtonFNBackspace_Caption;
	MOV	#lo_addr(_EveButtonFNBackspace_Caption), W0
	MOV	W0, _EveButtonFNBackspace+22
;NewDesign_driver.c,4722 :: 		EveButtonFNBackspace.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNBackspace+24
	MOV	W1, _EveButtonFNBackspace+26
;NewDesign_driver.c,4723 :: 		EveButtonFNBackspace.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonFNBackspace+28
;NewDesign_driver.c,4724 :: 		EveButtonFNBackspace.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonFNBackspace+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4725 :: 		EveButtonFNBackspace.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNBackspace+32
	MOV	W1, _EveButtonFNBackspace+34
;NewDesign_driver.c,4726 :: 		EveButtonFNBackspace.Flat          = 0;
	MOV	#lo_addr(_EveButtonFNBackspace+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4727 :: 		EveButtonFNBackspace.Active        = 1;
	MOV	#lo_addr(_EveButtonFNBackspace+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4728 :: 		EveButtonFNBackspace.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNBackspace+38
;NewDesign_driver.c,4729 :: 		EveButtonFNBackspace.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNBackspace+40
;NewDesign_driver.c,4730 :: 		EveButtonFNBackspace.OnClick       = &EveButtonFNBackspace_OnClick;
	MOV	#lo_addr(_EveButtonFNBackspace_OnClick), W0
	MOV	W0, _EveButtonFNBackspace+42
;NewDesign_driver.c,4731 :: 		EveButtonFNBackspace.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNBackspace+44
;NewDesign_driver.c,4733 :: 		EveButtonFNBackspace_OnClick.Action       = EveButtonFNBackspaceOnClick;
	MOV	#lo_addr(_EveButtonFNBackspaceOnClick), W0
	MOV	W0, _EveButtonFNBackspace_OnClick
;NewDesign_driver.c,4734 :: 		EveButtonFNBackspace_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonFNBackspace_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4735 :: 		EveButtonFNBackspace_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonFNBackspace_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4736 :: 		EveButtonFNBackspace_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonFNBackspace_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4737 :: 		EveButtonFNBackspace_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonFNBackspace_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4739 :: 		EveButtonFNClear.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNClear
;NewDesign_driver.c,4740 :: 		EveButtonFNClear.Order         = 9;
	MOV	#lo_addr(_EveButtonFNClear+2), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4741 :: 		EveButtonFNClear.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNClear+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4742 :: 		EveButtonFNClear.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNClear+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4743 :: 		EveButtonFNClear.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNClear+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4744 :: 		EveButtonFNClear.Left          = 118;
	MOV	#118, W0
	MOV	W0, _EveButtonFNClear+6
;NewDesign_driver.c,4745 :: 		EveButtonFNClear.Top           = 38;
	MOV	#38, W0
	MOV	W0, _EveButtonFNClear+8
;NewDesign_driver.c,4746 :: 		EveButtonFNClear.Width         = 104;
	MOV	#104, W0
	MOV	W0, _EveButtonFNClear+10
;NewDesign_driver.c,4747 :: 		EveButtonFNClear.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveButtonFNClear+12
;NewDesign_driver.c,4748 :: 		EveButtonFNClear.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNClear+14
;NewDesign_driver.c,4749 :: 		EveButtonFNClear.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNClear+16
;NewDesign_driver.c,4750 :: 		EveButtonFNClear.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNClear+18
;NewDesign_driver.c,4751 :: 		EveButtonFNClear.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNClear+20
;NewDesign_driver.c,4752 :: 		EveButtonFNClear.Caption       = EveButtonFNClear_Caption;
	MOV	#lo_addr(_EveButtonFNClear_Caption), W0
	MOV	W0, _EveButtonFNClear+22
;NewDesign_driver.c,4753 :: 		EveButtonFNClear.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNClear+24
	MOV	W1, _EveButtonFNClear+26
;NewDesign_driver.c,4754 :: 		EveButtonFNClear.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonFNClear+28
;NewDesign_driver.c,4755 :: 		EveButtonFNClear.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonFNClear+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4756 :: 		EveButtonFNClear.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNClear+32
	MOV	W1, _EveButtonFNClear+34
;NewDesign_driver.c,4757 :: 		EveButtonFNClear.Flat          = 0;
	MOV	#lo_addr(_EveButtonFNClear+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4758 :: 		EveButtonFNClear.Active        = 1;
	MOV	#lo_addr(_EveButtonFNClear+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4759 :: 		EveButtonFNClear.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNClear+38
;NewDesign_driver.c,4760 :: 		EveButtonFNClear.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNClear+40
;NewDesign_driver.c,4761 :: 		EveButtonFNClear.OnClick       = &EveButtonFNClear_OnClick;
	MOV	#lo_addr(_EveButtonFNClear_OnClick), W0
	MOV	W0, _EveButtonFNClear+42
;NewDesign_driver.c,4762 :: 		EveButtonFNClear.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNClear+44
;NewDesign_driver.c,4764 :: 		EveButtonFNClear_OnClick.Action       = EveButtonFNClearOnClick;
	MOV	#lo_addr(_EveButtonFNClearOnClick), W0
	MOV	W0, _EveButtonFNClear_OnClick
;NewDesign_driver.c,4765 :: 		EveButtonFNClear_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonFNClear_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4766 :: 		EveButtonFNClear_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonFNClear_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4767 :: 		EveButtonFNClear_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonFNClear_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4768 :: 		EveButtonFNClear_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonFNClear_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4770 :: 		EveButtonFNConfirm.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNConfirm
;NewDesign_driver.c,4771 :: 		EveButtonFNConfirm.Order         = 10;
	MOV	#lo_addr(_EveButtonFNConfirm+2), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4772 :: 		EveButtonFNConfirm.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNConfirm+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4773 :: 		EveButtonFNConfirm.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNConfirm+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4774 :: 		EveButtonFNConfirm.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNConfirm+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4775 :: 		EveButtonFNConfirm.Left          = 358;
	MOV	#358, W0
	MOV	W0, _EveButtonFNConfirm+6
;NewDesign_driver.c,4776 :: 		EveButtonFNConfirm.Top           = 38;
	MOV	#38, W0
	MOV	W0, _EveButtonFNConfirm+8
;NewDesign_driver.c,4777 :: 		EveButtonFNConfirm.Width         = 108;
	MOV	#108, W0
	MOV	W0, _EveButtonFNConfirm+10
;NewDesign_driver.c,4778 :: 		EveButtonFNConfirm.Height        = 38;
	MOV	#38, W0
	MOV	W0, _EveButtonFNConfirm+12
;NewDesign_driver.c,4779 :: 		EveButtonFNConfirm.Color         = 0x0583;
	MOV	#1411, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_driver.c,4780 :: 		EveButtonFNConfirm.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNConfirm+16
;NewDesign_driver.c,4781 :: 		EveButtonFNConfirm.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNConfirm+18
;NewDesign_driver.c,4782 :: 		EveButtonFNConfirm.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNConfirm+20
;NewDesign_driver.c,4783 :: 		EveButtonFNConfirm.Caption       = EveButtonFNConfirm_Caption;
	MOV	#lo_addr(_EveButtonFNConfirm_Caption), W0
	MOV	W0, _EveButtonFNConfirm+22
;NewDesign_driver.c,4784 :: 		EveButtonFNConfirm.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNConfirm+24
	MOV	W1, _EveButtonFNConfirm+26
;NewDesign_driver.c,4785 :: 		EveButtonFNConfirm.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonFNConfirm+28
;NewDesign_driver.c,4786 :: 		EveButtonFNConfirm.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonFNConfirm+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4787 :: 		EveButtonFNConfirm.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNConfirm+32
	MOV	W1, _EveButtonFNConfirm+34
;NewDesign_driver.c,4788 :: 		EveButtonFNConfirm.Flat          = 0;
	MOV	#lo_addr(_EveButtonFNConfirm+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4789 :: 		EveButtonFNConfirm.Active        = 1;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4790 :: 		EveButtonFNConfirm.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNConfirm+38
;NewDesign_driver.c,4791 :: 		EveButtonFNConfirm.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNConfirm+40
;NewDesign_driver.c,4792 :: 		EveButtonFNConfirm.OnClick       = &EveButtonFNConfirm_OnClick;
	MOV	#lo_addr(_EveButtonFNConfirm_OnClick), W0
	MOV	W0, _EveButtonFNConfirm+42
;NewDesign_driver.c,4793 :: 		EveButtonFNConfirm.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNConfirm+44
;NewDesign_driver.c,4795 :: 		EveButtonFNConfirm_OnClick.Action       = EveButtonFNConfirmOnClick;
	MOV	#lo_addr(_EveButtonFNConfirmOnClick), W0
	MOV	W0, _EveButtonFNConfirm_OnClick
;NewDesign_driver.c,4796 :: 		EveButtonFNConfirm_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonFNConfirm_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4797 :: 		EveButtonFNConfirm_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonFNConfirm_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4798 :: 		EveButtonFNConfirm_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonFNConfirm_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4799 :: 		EveButtonFNConfirm_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonFNConfirm_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4801 :: 		EveButtonFNGoBack.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNGoBack
;NewDesign_driver.c,4802 :: 		EveButtonFNGoBack.Order         = 11;
	MOV	#lo_addr(_EveButtonFNGoBack+2), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4803 :: 		EveButtonFNGoBack.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNGoBack+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4804 :: 		EveButtonFNGoBack.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNGoBack+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4805 :: 		EveButtonFNGoBack.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNGoBack+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4806 :: 		EveButtonFNGoBack.Left          = 232;
	MOV	#232, W0
	MOV	W0, _EveButtonFNGoBack+6
;NewDesign_driver.c,4807 :: 		EveButtonFNGoBack.Top           = 38;
	MOV	#38, W0
	MOV	W0, _EveButtonFNGoBack+8
;NewDesign_driver.c,4808 :: 		EveButtonFNGoBack.Width         = 118;
	MOV	#118, W0
	MOV	W0, _EveButtonFNGoBack+10
;NewDesign_driver.c,4809 :: 		EveButtonFNGoBack.Height        = 40;
	MOV	#40, W0
	MOV	W0, _EveButtonFNGoBack+12
;NewDesign_driver.c,4810 :: 		EveButtonFNGoBack.Color         = 0xB003;
	MOV	#45059, W0
	MOV	W0, _EveButtonFNGoBack+14
;NewDesign_driver.c,4811 :: 		EveButtonFNGoBack.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNGoBack+16
;NewDesign_driver.c,4812 :: 		EveButtonFNGoBack.ColorTo       = 0xF432;
	MOV	#62514, W0
	MOV	W0, _EveButtonFNGoBack+18
;NewDesign_driver.c,4813 :: 		EveButtonFNGoBack.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNGoBack+20
;NewDesign_driver.c,4814 :: 		EveButtonFNGoBack.Caption       = EveButtonFNGoBack_Caption;
	MOV	#lo_addr(_EveButtonFNGoBack_Caption), W0
	MOV	W0, _EveButtonFNGoBack+22
;NewDesign_driver.c,4815 :: 		EveButtonFNGoBack.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNGoBack+24
	MOV	W1, _EveButtonFNGoBack+26
;NewDesign_driver.c,4816 :: 		EveButtonFNGoBack.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonFNGoBack+28
;NewDesign_driver.c,4817 :: 		EveButtonFNGoBack.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonFNGoBack+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4818 :: 		EveButtonFNGoBack.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNGoBack+32
	MOV	W1, _EveButtonFNGoBack+34
;NewDesign_driver.c,4819 :: 		EveButtonFNGoBack.Flat          = 0;
	MOV	#lo_addr(_EveButtonFNGoBack+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4820 :: 		EveButtonFNGoBack.Active        = 1;
	MOV	#lo_addr(_EveButtonFNGoBack+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4821 :: 		EveButtonFNGoBack.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNGoBack+38
;NewDesign_driver.c,4822 :: 		EveButtonFNGoBack.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNGoBack+40
;NewDesign_driver.c,4823 :: 		EveButtonFNGoBack.OnClick       = &EveButtonFNGoBack_OnClick;
	MOV	#lo_addr(_EveButtonFNGoBack_OnClick), W0
	MOV	W0, _EveButtonFNGoBack+42
;NewDesign_driver.c,4824 :: 		EveButtonFNGoBack.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNGoBack+44
;NewDesign_driver.c,4826 :: 		EveButtonFNGoBack_OnClick.Action       = EveButtonFNGoBackOnClick;
	MOV	#lo_addr(_EveButtonFNGoBackOnClick), W0
	MOV	W0, _EveButtonFNGoBack_OnClick
;NewDesign_driver.c,4827 :: 		EveButtonFNGoBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonFNGoBack_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4828 :: 		EveButtonFNGoBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonFNGoBack_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4829 :: 		EveButtonFNGoBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonFNGoBack_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4830 :: 		EveButtonFNGoBack_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonFNGoBack_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4832 :: 		EveButtonFNShift.OwnerScreen   = &SettingScreen;
	MOV	#lo_addr(_SettingScreen), W0
	MOV	W0, _EveButtonFNShift
;NewDesign_driver.c,4833 :: 		EveButtonFNShift.Order         = 12;
	MOV	#lo_addr(_EveButtonFNShift+2), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4834 :: 		EveButtonFNShift.Visible       = 1;
	MOV	#lo_addr(_EveButtonFNShift+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4835 :: 		EveButtonFNShift.Opacity       = 255;
	MOV	#lo_addr(_EveButtonFNShift+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4836 :: 		EveButtonFNShift.Tag           = 255;
	MOV	#lo_addr(_EveButtonFNShift+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4837 :: 		EveButtonFNShift.Left          = 10;
	MOV	#10, W0
	MOV	W0, _EveButtonFNShift+6
;NewDesign_driver.c,4838 :: 		EveButtonFNShift.Top           = 222;
	MOV	#222, W0
	MOV	W0, _EveButtonFNShift+8
;NewDesign_driver.c,4839 :: 		EveButtonFNShift.Width         = 48;
	MOV	#48, W0
	MOV	W0, _EveButtonFNShift+10
;NewDesign_driver.c,4840 :: 		EveButtonFNShift.Height        = 39;
	MOV	#39, W0
	MOV	W0, _EveButtonFNShift+12
;NewDesign_driver.c,4841 :: 		EveButtonFNShift.Color         = 0x042B;
	MOV	#1067, W0
	MOV	W0, _EveButtonFNShift+14
;NewDesign_driver.c,4842 :: 		EveButtonFNShift.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonFNShift+16
;NewDesign_driver.c,4843 :: 		EveButtonFNShift.ColorTo       = 0x87BA;
	MOV	#34746, W0
	MOV	W0, _EveButtonFNShift+18
;NewDesign_driver.c,4844 :: 		EveButtonFNShift.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonFNShift+20
;NewDesign_driver.c,4845 :: 		EveButtonFNShift.Caption       = EveButtonFNShift_Caption;
	MOV	#lo_addr(_EveButtonFNShift_Caption), W0
	MOV	W0, _EveButtonFNShift+22
;NewDesign_driver.c,4846 :: 		EveButtonFNShift.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonFNShift+24
	MOV	W1, _EveButtonFNShift+26
;NewDesign_driver.c,4847 :: 		EveButtonFNShift.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonFNShift+28
;NewDesign_driver.c,4848 :: 		EveButtonFNShift.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonFNShift+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4849 :: 		EveButtonFNShift.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonFNShift+32
	MOV	W1, _EveButtonFNShift+34
;NewDesign_driver.c,4850 :: 		EveButtonFNShift.Flat          = 0;
	MOV	#lo_addr(_EveButtonFNShift+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4851 :: 		EveButtonFNShift.Active        = 1;
	MOV	#lo_addr(_EveButtonFNShift+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4852 :: 		EveButtonFNShift.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonFNShift+38
;NewDesign_driver.c,4853 :: 		EveButtonFNShift.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonFNShift+40
;NewDesign_driver.c,4854 :: 		EveButtonFNShift.OnClick       = &EveButtonFNShift_OnClick;
	MOV	#lo_addr(_EveButtonFNShift_OnClick), W0
	MOV	W0, _EveButtonFNShift+42
;NewDesign_driver.c,4855 :: 		EveButtonFNShift.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonFNShift+44
;NewDesign_driver.c,4857 :: 		EveButtonFNShift_OnClick.Action       = EveButtonFNShiftOnClick;
	MOV	#lo_addr(_EveButtonFNShiftOnClick), W0
	MOV	W0, _EveButtonFNShift_OnClick
;NewDesign_driver.c,4858 :: 		EveButtonFNShift_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonFNShift_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4859 :: 		EveButtonFNShift_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonFNShift_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4860 :: 		EveButtonFNShift_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonFNShift_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4861 :: 		EveButtonFNShift_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonFNShift_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4863 :: 		EveButtonSUNewRun.OwnerScreen   = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveButtonSUNewRun
;NewDesign_driver.c,4864 :: 		EveButtonSUNewRun.Order         = 7;
	MOV	#lo_addr(_EveButtonSUNewRun+2), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4865 :: 		EveButtonSUNewRun.Visible       = 1;
	MOV	#lo_addr(_EveButtonSUNewRun+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4866 :: 		EveButtonSUNewRun.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSUNewRun+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4867 :: 		EveButtonSUNewRun.Tag           = 255;
	MOV	#lo_addr(_EveButtonSUNewRun+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4868 :: 		EveButtonSUNewRun.Left          = 337;
	MOV	#337, W0
	MOV	W0, _EveButtonSUNewRun+6
;NewDesign_driver.c,4869 :: 		EveButtonSUNewRun.Top           = 198;
	MOV	#198, W0
	MOV	W0, _EveButtonSUNewRun+8
;NewDesign_driver.c,4870 :: 		EveButtonSUNewRun.Width         = 122;
	MOV	#122, W0
	MOV	W0, _EveButtonSUNewRun+10
;NewDesign_driver.c,4871 :: 		EveButtonSUNewRun.Height        = 52;
	MOV	#52, W0
	MOV	W0, _EveButtonSUNewRun+12
;NewDesign_driver.c,4872 :: 		EveButtonSUNewRun.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUNewRun+14
;NewDesign_driver.c,4873 :: 		EveButtonSUNewRun.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUNewRun+16
;NewDesign_driver.c,4874 :: 		EveButtonSUNewRun.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUNewRun+18
;NewDesign_driver.c,4875 :: 		EveButtonSUNewRun.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUNewRun+20
;NewDesign_driver.c,4876 :: 		EveButtonSUNewRun.Caption       = EveButtonSUNewRun_Caption;
	MOV	#lo_addr(_EveButtonSUNewRun_Caption), W0
	MOV	W0, _EveButtonSUNewRun+22
;NewDesign_driver.c,4877 :: 		EveButtonSUNewRun.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSUNewRun+24
	MOV	W1, _EveButtonSUNewRun+26
;NewDesign_driver.c,4878 :: 		EveButtonSUNewRun.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSUNewRun+28
;NewDesign_driver.c,4879 :: 		EveButtonSUNewRun.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSUNewRun+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4880 :: 		EveButtonSUNewRun.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSUNewRun+32
	MOV	W1, _EveButtonSUNewRun+34
;NewDesign_driver.c,4881 :: 		EveButtonSUNewRun.Flat          = 0;
	MOV	#lo_addr(_EveButtonSUNewRun+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4882 :: 		EveButtonSUNewRun.Active        = 1;
	MOV	#lo_addr(_EveButtonSUNewRun+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4883 :: 		EveButtonSUNewRun.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSUNewRun+38
;NewDesign_driver.c,4884 :: 		EveButtonSUNewRun.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSUNewRun+40
;NewDesign_driver.c,4885 :: 		EveButtonSUNewRun.OnClick       = &EveButtonSUNewRun_OnClick;
	MOV	#lo_addr(_EveButtonSUNewRun_OnClick), W0
	MOV	W0, _EveButtonSUNewRun+42
;NewDesign_driver.c,4886 :: 		EveButtonSUNewRun.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSUNewRun+44
;NewDesign_driver.c,4888 :: 		EveButtonSUNewRun_OnClick.Action       = EveButtonSUNewRunOnClick;
	MOV	#lo_addr(_EveButtonSUNewRunOnClick), W0
	MOV	W0, _EveButtonSUNewRun_OnClick
;NewDesign_driver.c,4889 :: 		EveButtonSUNewRun_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSUNewRun_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4890 :: 		EveButtonSUNewRun_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSUNewRun_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4891 :: 		EveButtonSUNewRun_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSUNewRun_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4892 :: 		EveButtonSUNewRun_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSUNewRun_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4894 :: 		EveButtonSUHelp.OwnerScreen   = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveButtonSUHelp
;NewDesign_driver.c,4895 :: 		EveButtonSUHelp.Order         = 8;
	MOV	#lo_addr(_EveButtonSUHelp+2), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4896 :: 		EveButtonSUHelp.Visible       = 1;
	MOV	#lo_addr(_EveButtonSUHelp+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4897 :: 		EveButtonSUHelp.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSUHelp+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4898 :: 		EveButtonSUHelp.Tag           = 255;
	MOV	#lo_addr(_EveButtonSUHelp+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4899 :: 		EveButtonSUHelp.Left          = 337;
	MOV	#337, W0
	MOV	W0, _EveButtonSUHelp+6
;NewDesign_driver.c,4900 :: 		EveButtonSUHelp.Top           = 142;
	MOV	#142, W0
	MOV	W0, _EveButtonSUHelp+8
;NewDesign_driver.c,4901 :: 		EveButtonSUHelp.Width         = 122;
	MOV	#122, W0
	MOV	W0, _EveButtonSUHelp+10
;NewDesign_driver.c,4902 :: 		EveButtonSUHelp.Height        = 52;
	MOV	#52, W0
	MOV	W0, _EveButtonSUHelp+12
;NewDesign_driver.c,4903 :: 		EveButtonSUHelp.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUHelp+14
;NewDesign_driver.c,4904 :: 		EveButtonSUHelp.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUHelp+16
;NewDesign_driver.c,4905 :: 		EveButtonSUHelp.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUHelp+18
;NewDesign_driver.c,4906 :: 		EveButtonSUHelp.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUHelp+20
;NewDesign_driver.c,4907 :: 		EveButtonSUHelp.Caption       = EveButtonSUHelp_Caption;
	MOV	#lo_addr(_EveButtonSUHelp_Caption), W0
	MOV	W0, _EveButtonSUHelp+22
;NewDesign_driver.c,4908 :: 		EveButtonSUHelp.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSUHelp+24
	MOV	W1, _EveButtonSUHelp+26
;NewDesign_driver.c,4909 :: 		EveButtonSUHelp.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSUHelp+28
;NewDesign_driver.c,4910 :: 		EveButtonSUHelp.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSUHelp+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4911 :: 		EveButtonSUHelp.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSUHelp+32
	MOV	W1, _EveButtonSUHelp+34
;NewDesign_driver.c,4912 :: 		EveButtonSUHelp.Flat          = 0;
	MOV	#lo_addr(_EveButtonSUHelp+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4913 :: 		EveButtonSUHelp.Active        = 1;
	MOV	#lo_addr(_EveButtonSUHelp+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4914 :: 		EveButtonSUHelp.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSUHelp+38
;NewDesign_driver.c,4915 :: 		EveButtonSUHelp.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSUHelp+40
;NewDesign_driver.c,4916 :: 		EveButtonSUHelp.OnClick       = &EveButtonSUHelp_OnClick;
	MOV	#lo_addr(_EveButtonSUHelp_OnClick), W0
	MOV	W0, _EveButtonSUHelp+42
;NewDesign_driver.c,4917 :: 		EveButtonSUHelp.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSUHelp+44
;NewDesign_driver.c,4919 :: 		EveButtonSUHelp_OnClick.Action       = EveButtonSUHelpOnClick;
	MOV	#lo_addr(_EveButtonSUHelpOnClick), W0
	MOV	W0, _EveButtonSUHelp_OnClick
;NewDesign_driver.c,4920 :: 		EveButtonSUHelp_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSUHelp_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4921 :: 		EveButtonSUHelp_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSUHelp_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4922 :: 		EveButtonSUHelp_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSUHelp_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4923 :: 		EveButtonSUHelp_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSUHelp_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4925 :: 		EveButtonSUAbout.OwnerScreen   = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveButtonSUAbout
;NewDesign_driver.c,4926 :: 		EveButtonSUAbout.Order         = 9;
	MOV	#lo_addr(_EveButtonSUAbout+2), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4927 :: 		EveButtonSUAbout.Visible       = 1;
	MOV	#lo_addr(_EveButtonSUAbout+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4928 :: 		EveButtonSUAbout.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSUAbout+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4929 :: 		EveButtonSUAbout.Tag           = 255;
	MOV	#lo_addr(_EveButtonSUAbout+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4930 :: 		EveButtonSUAbout.Left          = 337;
	MOV	#337, W0
	MOV	W0, _EveButtonSUAbout+6
;NewDesign_driver.c,4931 :: 		EveButtonSUAbout.Top           = 80;
	MOV	#80, W0
	MOV	W0, _EveButtonSUAbout+8
;NewDesign_driver.c,4932 :: 		EveButtonSUAbout.Width         = 122;
	MOV	#122, W0
	MOV	W0, _EveButtonSUAbout+10
;NewDesign_driver.c,4933 :: 		EveButtonSUAbout.Height        = 57;
	MOV	#57, W0
	MOV	W0, _EveButtonSUAbout+12
;NewDesign_driver.c,4934 :: 		EveButtonSUAbout.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUAbout+14
;NewDesign_driver.c,4935 :: 		EveButtonSUAbout.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUAbout+16
;NewDesign_driver.c,4936 :: 		EveButtonSUAbout.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUAbout+18
;NewDesign_driver.c,4937 :: 		EveButtonSUAbout.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUAbout+20
;NewDesign_driver.c,4938 :: 		EveButtonSUAbout.Caption       = EveButtonSUAbout_Caption;
	MOV	#lo_addr(_EveButtonSUAbout_Caption), W0
	MOV	W0, _EveButtonSUAbout+22
;NewDesign_driver.c,4939 :: 		EveButtonSUAbout.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSUAbout+24
	MOV	W1, _EveButtonSUAbout+26
;NewDesign_driver.c,4940 :: 		EveButtonSUAbout.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSUAbout+28
;NewDesign_driver.c,4941 :: 		EveButtonSUAbout.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSUAbout+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4942 :: 		EveButtonSUAbout.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSUAbout+32
	MOV	W1, _EveButtonSUAbout+34
;NewDesign_driver.c,4943 :: 		EveButtonSUAbout.Flat          = 0;
	MOV	#lo_addr(_EveButtonSUAbout+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4944 :: 		EveButtonSUAbout.Active        = 1;
	MOV	#lo_addr(_EveButtonSUAbout+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4945 :: 		EveButtonSUAbout.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSUAbout+38
;NewDesign_driver.c,4946 :: 		EveButtonSUAbout.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSUAbout+40
;NewDesign_driver.c,4947 :: 		EveButtonSUAbout.OnClick       = &EveButtonSUAbout_OnClick;
	MOV	#lo_addr(_EveButtonSUAbout_OnClick), W0
	MOV	W0, _EveButtonSUAbout+42
;NewDesign_driver.c,4948 :: 		EveButtonSUAbout.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSUAbout+44
;NewDesign_driver.c,4950 :: 		EveButtonSUAbout_OnClick.Action       = EveButtonSUAboutOnClick;
	MOV	#lo_addr(_EveButtonSUAboutOnClick), W0
	MOV	W0, _EveButtonSUAbout_OnClick
;NewDesign_driver.c,4951 :: 		EveButtonSUAbout_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSUAbout_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4952 :: 		EveButtonSUAbout_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSUAbout_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4953 :: 		EveButtonSUAbout_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSUAbout_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4954 :: 		EveButtonSUAbout_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSUAbout_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4956 :: 		EveTextSUtime.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveTextSUtime
;NewDesign_driver.c,4957 :: 		EveTextSUtime.Order       = 10;
	MOV	#lo_addr(_EveTextSUtime+2), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4958 :: 		EveTextSUtime.Visible     = 1;
	MOV	#lo_addr(_EveTextSUtime+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4959 :: 		EveTextSUtime.Opacity     = 255;
	MOV	#lo_addr(_EveTextSUtime+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4960 :: 		EveTextSUtime.Tag         = 255;
	MOV	#lo_addr(_EveTextSUtime+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4961 :: 		EveTextSUtime.Left        = 216;
	MOV	#216, W0
	MOV	W0, _EveTextSUtime+6
;NewDesign_driver.c,4962 :: 		EveTextSUtime.Top         = 39;
	MOV	#39, W0
	MOV	W0, _EveTextSUtime+8
;NewDesign_driver.c,4963 :: 		EveTextSUtime.Width       = 8;
	MOV	#8, W0
	MOV	W0, _EveTextSUtime+10
;NewDesign_driver.c,4964 :: 		EveTextSUtime.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSUtime+12
;NewDesign_driver.c,4965 :: 		EveTextSUtime.Caption     = EveTextSUtime_Caption;
	MOV	#lo_addr(_EveTextSUtime_Caption), W0
	MOV	W0, _EveTextSUtime+14
;NewDesign_driver.c,4966 :: 		EveTextSUtime.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSUtime+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4967 :: 		EveTextSUtime.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSUtime+18
	MOV	W1, _EveTextSUtime+20
;NewDesign_driver.c,4968 :: 		EveTextSUtime.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSUtime+22
;NewDesign_driver.c,4969 :: 		EveTextSUtime.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSUtime+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4970 :: 		EveTextSUtime.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSUtime+26
	MOV	W1, _EveTextSUtime+28
;NewDesign_driver.c,4971 :: 		EveTextSUtime.Active      = 1;
	MOV	#lo_addr(_EveTextSUtime+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4972 :: 		EveTextSUtime.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSUtime+32
;NewDesign_driver.c,4973 :: 		EveTextSUtime.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSUtime+34
;NewDesign_driver.c,4974 :: 		EveTextSUtime.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSUtime+36
;NewDesign_driver.c,4975 :: 		EveTextSUtime.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSUtime+38
;NewDesign_driver.c,4977 :: 		EveTextSUdistance.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveTextSUdistance
;NewDesign_driver.c,4978 :: 		EveTextSUdistance.Order       = 11;
	MOV	#lo_addr(_EveTextSUdistance+2), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4979 :: 		EveTextSUdistance.Visible     = 1;
	MOV	#lo_addr(_EveTextSUdistance+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4980 :: 		EveTextSUdistance.Opacity     = 255;
	MOV	#lo_addr(_EveTextSUdistance+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4981 :: 		EveTextSUdistance.Tag         = 255;
	MOV	#lo_addr(_EveTextSUdistance+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4982 :: 		EveTextSUdistance.Left        = 216;
	MOV	#216, W0
	MOV	W0, _EveTextSUdistance+6
;NewDesign_driver.c,4983 :: 		EveTextSUdistance.Top         = 80;
	MOV	#80, W0
	MOV	W0, _EveTextSUdistance+8
;NewDesign_driver.c,4984 :: 		EveTextSUdistance.Width       = 8;
	MOV	#8, W0
	MOV	W0, _EveTextSUdistance+10
;NewDesign_driver.c,4985 :: 		EveTextSUdistance.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSUdistance+12
;NewDesign_driver.c,4986 :: 		EveTextSUdistance.Caption     = EveTextSUdistance_Caption;
	MOV	#lo_addr(_EveTextSUdistance_Caption), W0
	MOV	W0, _EveTextSUdistance+14
;NewDesign_driver.c,4987 :: 		EveTextSUdistance.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSUdistance+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4988 :: 		EveTextSUdistance.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSUdistance+18
	MOV	W1, _EveTextSUdistance+20
;NewDesign_driver.c,4989 :: 		EveTextSUdistance.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSUdistance+22
;NewDesign_driver.c,4990 :: 		EveTextSUdistance.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSUdistance+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4991 :: 		EveTextSUdistance.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSUdistance+26
	MOV	W1, _EveTextSUdistance+28
;NewDesign_driver.c,4992 :: 		EveTextSUdistance.Active      = 1;
	MOV	#lo_addr(_EveTextSUdistance+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,4993 :: 		EveTextSUdistance.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSUdistance+32
;NewDesign_driver.c,4994 :: 		EveTextSUdistance.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSUdistance+34
;NewDesign_driver.c,4995 :: 		EveTextSUdistance.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSUdistance+36
;NewDesign_driver.c,4996 :: 		EveTextSUdistance.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSUdistance+38
;NewDesign_driver.c,4998 :: 		EveTextSUSpeed.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveTextSUSpeed
;NewDesign_driver.c,4999 :: 		EveTextSUSpeed.Order       = 12;
	MOV	#lo_addr(_EveTextSUSpeed+2), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5000 :: 		EveTextSUSpeed.Visible     = 1;
	MOV	#lo_addr(_EveTextSUSpeed+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5001 :: 		EveTextSUSpeed.Opacity     = 255;
	MOV	#lo_addr(_EveTextSUSpeed+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5002 :: 		EveTextSUSpeed.Tag         = 255;
	MOV	#lo_addr(_EveTextSUSpeed+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5003 :: 		EveTextSUSpeed.Left        = 159;
	MOV	#159, W0
	MOV	W0, _EveTextSUSpeed+6
;NewDesign_driver.c,5004 :: 		EveTextSUSpeed.Top         = 166;
	MOV	#166, W0
	MOV	W0, _EveTextSUSpeed+8
;NewDesign_driver.c,5005 :: 		EveTextSUSpeed.Width       = 8;
	MOV	#8, W0
	MOV	W0, _EveTextSUSpeed+10
;NewDesign_driver.c,5006 :: 		EveTextSUSpeed.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSUSpeed+12
;NewDesign_driver.c,5007 :: 		EveTextSUSpeed.Caption     = EveTextSUSpeed_Caption;
	MOV	#lo_addr(_EveTextSUSpeed_Caption), W0
	MOV	W0, _EveTextSUSpeed+14
;NewDesign_driver.c,5008 :: 		EveTextSUSpeed.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSUSpeed+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5009 :: 		EveTextSUSpeed.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSUSpeed+18
	MOV	W1, _EveTextSUSpeed+20
;NewDesign_driver.c,5010 :: 		EveTextSUSpeed.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSUSpeed+22
;NewDesign_driver.c,5011 :: 		EveTextSUSpeed.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSUSpeed+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5012 :: 		EveTextSUSpeed.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSUSpeed+26
	MOV	W1, _EveTextSUSpeed+28
;NewDesign_driver.c,5013 :: 		EveTextSUSpeed.Active      = 1;
	MOV	#lo_addr(_EveTextSUSpeed+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5014 :: 		EveTextSUSpeed.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSUSpeed+32
;NewDesign_driver.c,5015 :: 		EveTextSUSpeed.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSUSpeed+34
;NewDesign_driver.c,5016 :: 		EveTextSUSpeed.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSUSpeed+36
;NewDesign_driver.c,5017 :: 		EveTextSUSpeed.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSUSpeed+38
;NewDesign_driver.c,5019 :: 		EveTextSUFilename.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveTextSUFilename
;NewDesign_driver.c,5020 :: 		EveTextSUFilename.Order       = 13;
	MOV	#lo_addr(_EveTextSUFilename+2), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5021 :: 		EveTextSUFilename.Visible     = 1;
	MOV	#lo_addr(_EveTextSUFilename+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5022 :: 		EveTextSUFilename.Opacity     = 255;
	MOV	#lo_addr(_EveTextSUFilename+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5023 :: 		EveTextSUFilename.Tag         = 255;
	MOV	#lo_addr(_EveTextSUFilename+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5024 :: 		EveTextSUFilename.Left        = 158;
	MOV	#158, W0
	MOV	W0, _EveTextSUFilename+6
;NewDesign_driver.c,5025 :: 		EveTextSUFilename.Top         = 125;
	MOV	#125, W0
	MOV	W0, _EveTextSUFilename+8
;NewDesign_driver.c,5026 :: 		EveTextSUFilename.Width       = 32;
	MOV	#32, W0
	MOV	W0, _EveTextSUFilename+10
;NewDesign_driver.c,5027 :: 		EveTextSUFilename.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSUFilename+12
;NewDesign_driver.c,5028 :: 		EveTextSUFilename.Caption     = EveTextSUFilename_Caption;
	MOV	#lo_addr(_EveTextSUFilename_Caption), W0
	MOV	W0, _EveTextSUFilename+14
;NewDesign_driver.c,5029 :: 		EveTextSUFilename.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSUFilename+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5030 :: 		EveTextSUFilename.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSUFilename+18
	MOV	W1, _EveTextSUFilename+20
;NewDesign_driver.c,5031 :: 		EveTextSUFilename.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSUFilename+22
;NewDesign_driver.c,5032 :: 		EveTextSUFilename.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSUFilename+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5033 :: 		EveTextSUFilename.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSUFilename+26
	MOV	W1, _EveTextSUFilename+28
;NewDesign_driver.c,5034 :: 		EveTextSUFilename.Active      = 1;
	MOV	#lo_addr(_EveTextSUFilename+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5035 :: 		EveTextSUFilename.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSUFilename+32
;NewDesign_driver.c,5036 :: 		EveTextSUFilename.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSUFilename+34
;NewDesign_driver.c,5037 :: 		EveTextSUFilename.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSUFilename+36
;NewDesign_driver.c,5038 :: 		EveTextSUFilename.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSUFilename+38
;NewDesign_driver.c,5040 :: 		EveTextSUAverageSpeed.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveTextSUAverageSpeed
;NewDesign_driver.c,5041 :: 		EveTextSUAverageSpeed.Order       = 14;
	MOV	#lo_addr(_EveTextSUAverageSpeed+2), W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5042 :: 		EveTextSUAverageSpeed.Visible     = 1;
	MOV	#lo_addr(_EveTextSUAverageSpeed+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5043 :: 		EveTextSUAverageSpeed.Opacity     = 255;
	MOV	#lo_addr(_EveTextSUAverageSpeed+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5044 :: 		EveTextSUAverageSpeed.Tag         = 255;
	MOV	#lo_addr(_EveTextSUAverageSpeed+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5045 :: 		EveTextSUAverageSpeed.Left        = 202;
	MOV	#202, W0
	MOV	W0, _EveTextSUAverageSpeed+6
;NewDesign_driver.c,5046 :: 		EveTextSUAverageSpeed.Top         = 208;
	MOV	#208, W0
	MOV	W0, _EveTextSUAverageSpeed+8
;NewDesign_driver.c,5047 :: 		EveTextSUAverageSpeed.Width       = 8;
	MOV	#8, W0
	MOV	W0, _EveTextSUAverageSpeed+10
;NewDesign_driver.c,5048 :: 		EveTextSUAverageSpeed.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveTextSUAverageSpeed+12
;NewDesign_driver.c,5049 :: 		EveTextSUAverageSpeed.Caption     = EveTextSUAverageSpeed_Caption;
	MOV	#lo_addr(_EveTextSUAverageSpeed_Caption), W0
	MOV	W0, _EveTextSUAverageSpeed+14
;NewDesign_driver.c,5050 :: 		EveTextSUAverageSpeed.TextAlign   = taNone;
	MOV	#lo_addr(_EveTextSUAverageSpeed+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5051 :: 		EveTextSUAverageSpeed.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveTextSUAverageSpeed+18
	MOV	W1, _EveTextSUAverageSpeed+20
;NewDesign_driver.c,5052 :: 		EveTextSUAverageSpeed.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveTextSUAverageSpeed+22
;NewDesign_driver.c,5053 :: 		EveTextSUAverageSpeed.FontHandle  = 27;
	MOV	#lo_addr(_EveTextSUAverageSpeed+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5054 :: 		EveTextSUAverageSpeed.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveTextSUAverageSpeed+26
	MOV	W1, _EveTextSUAverageSpeed+28
;NewDesign_driver.c,5055 :: 		EveTextSUAverageSpeed.Active      = 1;
	MOV	#lo_addr(_EveTextSUAverageSpeed+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5056 :: 		EveTextSUAverageSpeed.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveTextSUAverageSpeed+32
;NewDesign_driver.c,5057 :: 		EveTextSUAverageSpeed.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveTextSUAverageSpeed+34
;NewDesign_driver.c,5058 :: 		EveTextSUAverageSpeed.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveTextSUAverageSpeed+36
;NewDesign_driver.c,5059 :: 		EveTextSUAverageSpeed.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveTextSUAverageSpeed+38
;NewDesign_driver.c,5061 :: 		EveText8.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText8
;NewDesign_driver.c,5062 :: 		EveText8.Order       = 15;
	MOV	#lo_addr(_EveText8+2), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5063 :: 		EveText8.Visible     = 1;
	MOV	#lo_addr(_EveText8+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5064 :: 		EveText8.Opacity     = 255;
	MOV	#lo_addr(_EveText8+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5065 :: 		EveText8.Tag         = 255;
	MOV	#lo_addr(_EveText8+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5066 :: 		EveText8.Left        = 16;
	MOV	#16, W0
	MOV	W0, _EveText8+6
;NewDesign_driver.c,5067 :: 		EveText8.Top         = 166;
	MOV	#166, W0
	MOV	W0, _EveText8+8
;NewDesign_driver.c,5068 :: 		EveText8.Width       = 71;
	MOV	#71, W0
	MOV	W0, _EveText8+10
;NewDesign_driver.c,5069 :: 		EveText8.Height      = 17;
	MOV	#17, W0
	MOV	W0, _EveText8+12
;NewDesign_driver.c,5070 :: 		EveText8.Caption     = EveText8_Caption;
	MOV	#lo_addr(_EveText8_Caption), W0
	MOV	W0, _EveText8+14
;NewDesign_driver.c,5071 :: 		EveText8.TextAlign   = taNone;
	MOV	#lo_addr(_EveText8+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5072 :: 		EveText8.FontName    = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveText8+18
	MOV	W1, _EveText8+20
;NewDesign_driver.c,5073 :: 		EveText8.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText8+22
;NewDesign_driver.c,5074 :: 		EveText8.FontHandle  = 27;
	MOV	#lo_addr(_EveText8+24), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5075 :: 		EveText8.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText8+26
	MOV	W1, _EveText8+28
;NewDesign_driver.c,5076 :: 		EveText8.Active      = 1;
	MOV	#lo_addr(_EveText8+30), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5077 :: 		EveText8.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText8+32
;NewDesign_driver.c,5078 :: 		EveText8.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText8+34
;NewDesign_driver.c,5079 :: 		EveText8.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText8+36
;NewDesign_driver.c,5080 :: 		EveText8.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText8+38
;NewDesign_driver.c,5082 :: 		BoxRound6.OwnerScreen   = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _BoxRound6
;NewDesign_driver.c,5083 :: 		BoxRound6.Order         = 16;
	MOV	#lo_addr(_BoxRound6+2), W1
	MOV.B	#16, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5084 :: 		BoxRound6.Visible       = 0;
	MOV	#lo_addr(_BoxRound6+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5085 :: 		BoxRound6.Opacity       = 239;
	MOV	#lo_addr(_BoxRound6+4), W1
	MOV.B	#239, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5086 :: 		BoxRound6.Tag           = 255;
	MOV	#lo_addr(_BoxRound6+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5087 :: 		BoxRound6.Left          = 28;
	MOV	#28, W0
	MOV	W0, _BoxRound6+6
;NewDesign_driver.c,5088 :: 		BoxRound6.Top           = 14;
	MOV	#14, W0
	MOV	W0, _BoxRound6+8
;NewDesign_driver.c,5089 :: 		BoxRound6.Width         = 420;
	MOV	#420, W0
	MOV	W0, _BoxRound6+10
;NewDesign_driver.c,5090 :: 		BoxRound6.Height        = 241;
	MOV	#241, W0
	MOV	W0, _BoxRound6+12
;NewDesign_driver.c,5091 :: 		BoxRound6.Pen_Width     = 1;
	MOV	#lo_addr(_BoxRound6+14), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5092 :: 		BoxRound6.Pen_Color     = 0x0000;
	CLR	W0
	MOV	W0, _BoxRound6+16
;NewDesign_driver.c,5093 :: 		BoxRound6.Color         = 0xC618;
	MOV	#50712, W0
	MOV	W0, _BoxRound6+18
;NewDesign_driver.c,5094 :: 		BoxRound6.Press_Color   = 0xE71C;
	MOV	#59164, W0
	MOV	W0, _BoxRound6+20
;NewDesign_driver.c,5095 :: 		BoxRound6.Corner_Radius = 3;
	MOV	#lo_addr(_BoxRound6+22), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5096 :: 		BoxRound6.Active        = 0;
	MOV	#lo_addr(_BoxRound6+23), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5097 :: 		BoxRound6.OnUp          = 0;
	CLR	W0
	MOV	W0, _BoxRound6+24
;NewDesign_driver.c,5098 :: 		BoxRound6.OnDown        = 0;
	CLR	W0
	MOV	W0, _BoxRound6+26
;NewDesign_driver.c,5099 :: 		BoxRound6.OnClick       = 0;
	CLR	W0
	MOV	W0, _BoxRound6+28
;NewDesign_driver.c,5100 :: 		BoxRound6.OnPress       = 0;
	CLR	W0
	MOV	W0, _BoxRound6+30
;NewDesign_driver.c,5102 :: 		EveText9.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText9
;NewDesign_driver.c,5103 :: 		EveText9.Order       = 17;
	MOV	#lo_addr(_EveText9+2), W1
	MOV.B	#17, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5104 :: 		EveText9.Visible     = 0;
	MOV	#lo_addr(_EveText9+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5105 :: 		EveText9.Opacity     = 255;
	MOV	#lo_addr(_EveText9+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5106 :: 		EveText9.Tag         = 255;
	MOV	#lo_addr(_EveText9+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5107 :: 		EveText9.Left        = 42;
	MOV	#42, W0
	MOV	W0, _EveText9+6
;NewDesign_driver.c,5108 :: 		EveText9.Top         = 20;
	MOV	#20, W0
	MOV	W0, _EveText9+8
;NewDesign_driver.c,5109 :: 		EveText9.Width       = 57;
	MOV	#57, W0
	MOV	W0, _EveText9+10
;NewDesign_driver.c,5110 :: 		EveText9.Height      = 21;
	MOV	#21, W0
	MOV	W0, _EveText9+12
;NewDesign_driver.c,5111 :: 		EveText9.Caption     = EveText9_Caption;
	MOV	#lo_addr(_EveText9_Caption), W0
	MOV	W0, _EveText9+14
;NewDesign_driver.c,5112 :: 		EveText9.TextAlign   = taNone;
	MOV	#lo_addr(_EveText9+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5113 :: 		EveText9.FontName    = 28;
	MOV	#28, W0
	MOV	#0, W1
	MOV	W0, _EveText9+18
	MOV	W1, _EveText9+20
;NewDesign_driver.c,5114 :: 		EveText9.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText9+22
;NewDesign_driver.c,5115 :: 		EveText9.FontHandle  = 28;
	MOV	#lo_addr(_EveText9+24), W1
	MOV.B	#28, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5116 :: 		EveText9.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText9+26
	MOV	W1, _EveText9+28
;NewDesign_driver.c,5117 :: 		EveText9.Active      = 0;
	MOV	#lo_addr(_EveText9+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5118 :: 		EveText9.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText9+32
;NewDesign_driver.c,5119 :: 		EveText9.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText9+34
;NewDesign_driver.c,5120 :: 		EveText9.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText9+36
;NewDesign_driver.c,5121 :: 		EveText9.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText9+38
;NewDesign_driver.c,5123 :: 		EveText11.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText11
;NewDesign_driver.c,5124 :: 		EveText11.Order       = 18;
	MOV	#lo_addr(_EveText11+2), W1
	MOV.B	#18, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5125 :: 		EveText11.Visible     = 0;
	MOV	#lo_addr(_EveText11+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5126 :: 		EveText11.Opacity     = 255;
	MOV	#lo_addr(_EveText11+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5127 :: 		EveText11.Tag         = 255;
	MOV	#lo_addr(_EveText11+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5128 :: 		EveText11.Left        = 60;
	MOV	#60, W0
	MOV	W0, _EveText11+6
;NewDesign_driver.c,5129 :: 		EveText11.Top         = 52;
	MOV	#52, W0
	MOV	W0, _EveText11+8
;NewDesign_driver.c,5130 :: 		EveText11.Width       = 286;
	MOV	#286, W0
	MOV	W0, _EveText11+10
;NewDesign_driver.c,5131 :: 		EveText11.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText11+12
;NewDesign_driver.c,5132 :: 		EveText11.Caption     = EveText11_Caption;
	MOV	#lo_addr(_EveText11_Caption), W0
	MOV	W0, _EveText11+14
;NewDesign_driver.c,5133 :: 		EveText11.TextAlign   = taNone;
	MOV	#lo_addr(_EveText11+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5134 :: 		EveText11.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText11+18
	MOV	W1, _EveText11+20
;NewDesign_driver.c,5135 :: 		EveText11.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText11+22
;NewDesign_driver.c,5136 :: 		EveText11.FontHandle  = 26;
	MOV	#lo_addr(_EveText11+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5137 :: 		EveText11.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText11+26
	MOV	W1, _EveText11+28
;NewDesign_driver.c,5138 :: 		EveText11.Active      = 0;
	MOV	#lo_addr(_EveText11+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5139 :: 		EveText11.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText11+32
;NewDesign_driver.c,5140 :: 		EveText11.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText11+34
;NewDesign_driver.c,5141 :: 		EveText11.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText11+36
;NewDesign_driver.c,5142 :: 		EveText11.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText11+38
;NewDesign_driver.c,5144 :: 		EveText13.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText13
;NewDesign_driver.c,5145 :: 		EveText13.Order       = 19;
	MOV	#lo_addr(_EveText13+2), W1
	MOV.B	#19, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5146 :: 		EveText13.Visible     = 0;
	MOV	#lo_addr(_EveText13+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5147 :: 		EveText13.Opacity     = 255;
	MOV	#lo_addr(_EveText13+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5148 :: 		EveText13.Tag         = 255;
	MOV	#lo_addr(_EveText13+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5149 :: 		EveText13.Left        = 60;
	MOV	#60, W0
	MOV	W0, _EveText13+6
;NewDesign_driver.c,5150 :: 		EveText13.Top         = 78;
	MOV	#78, W0
	MOV	W0, _EveText13+8
;NewDesign_driver.c,5151 :: 		EveText13.Width       = 228;
	MOV	#228, W0
	MOV	W0, _EveText13+10
;NewDesign_driver.c,5152 :: 		EveText13.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText13+12
;NewDesign_driver.c,5153 :: 		EveText13.Caption     = EveText13_Caption;
	MOV	#lo_addr(_EveText13_Caption), W0
	MOV	W0, _EveText13+14
;NewDesign_driver.c,5154 :: 		EveText13.TextAlign   = taNone;
	MOV	#lo_addr(_EveText13+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5155 :: 		EveText13.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText13+18
	MOV	W1, _EveText13+20
;NewDesign_driver.c,5156 :: 		EveText13.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText13+22
;NewDesign_driver.c,5157 :: 		EveText13.FontHandle  = 26;
	MOV	#lo_addr(_EveText13+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5158 :: 		EveText13.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText13+26
	MOV	W1, _EveText13+28
;NewDesign_driver.c,5159 :: 		EveText13.Active      = 0;
	MOV	#lo_addr(_EveText13+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5160 :: 		EveText13.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText13+32
;NewDesign_driver.c,5161 :: 		EveText13.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText13+34
;NewDesign_driver.c,5162 :: 		EveText13.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText13+36
;NewDesign_driver.c,5163 :: 		EveText13.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText13+38
;NewDesign_driver.c,5165 :: 		EveText14.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText14
;NewDesign_driver.c,5166 :: 		EveText14.Order       = 20;
	MOV	#lo_addr(_EveText14+2), W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5167 :: 		EveText14.Visible     = 0;
	MOV	#lo_addr(_EveText14+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5168 :: 		EveText14.Opacity     = 255;
	MOV	#lo_addr(_EveText14+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5169 :: 		EveText14.Tag         = 255;
	MOV	#lo_addr(_EveText14+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5170 :: 		EveText14.Left        = 62;
	MOV	#62, W0
	MOV	W0, _EveText14+6
;NewDesign_driver.c,5171 :: 		EveText14.Top         = 142;
	MOV	#142, W0
	MOV	W0, _EveText14+8
;NewDesign_driver.c,5172 :: 		EveText14.Width       = 208;
	MOV	#208, W0
	MOV	W0, _EveText14+10
;NewDesign_driver.c,5173 :: 		EveText14.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText14+12
;NewDesign_driver.c,5174 :: 		EveText14.Caption     = EveText14_Caption;
	MOV	#lo_addr(_EveText14_Caption), W0
	MOV	W0, _EveText14+14
;NewDesign_driver.c,5175 :: 		EveText14.TextAlign   = taNone;
	MOV	#lo_addr(_EveText14+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5176 :: 		EveText14.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText14+18
	MOV	W1, _EveText14+20
;NewDesign_driver.c,5177 :: 		EveText14.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText14+22
;NewDesign_driver.c,5178 :: 		EveText14.FontHandle  = 26;
	MOV	#lo_addr(_EveText14+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5179 :: 		EveText14.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText14+26
	MOV	W1, _EveText14+28
;NewDesign_driver.c,5180 :: 		EveText14.Active      = 0;
	MOV	#lo_addr(_EveText14+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5181 :: 		EveText14.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText14+32
;NewDesign_driver.c,5182 :: 		EveText14.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText14+34
;NewDesign_driver.c,5183 :: 		EveText14.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText14+36
;NewDesign_driver.c,5184 :: 		EveText14.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText14+38
;NewDesign_driver.c,5186 :: 		EveText15.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText15
;NewDesign_driver.c,5187 :: 		EveText15.Order       = 21;
	MOV	#lo_addr(_EveText15+2), W1
	MOV.B	#21, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5188 :: 		EveText15.Visible     = 0;
	MOV	#lo_addr(_EveText15+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5189 :: 		EveText15.Opacity     = 255;
	MOV	#lo_addr(_EveText15+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5190 :: 		EveText15.Tag         = 255;
	MOV	#lo_addr(_EveText15+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5191 :: 		EveText15.Left        = 62;
	MOV	#62, W0
	MOV	W0, _EveText15+6
;NewDesign_driver.c,5192 :: 		EveText15.Top         = 124;
	MOV	#124, W0
	MOV	W0, _EveText15+8
;NewDesign_driver.c,5193 :: 		EveText15.Width       = 120;
	MOV	#120, W0
	MOV	W0, _EveText15+10
;NewDesign_driver.c,5194 :: 		EveText15.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText15+12
;NewDesign_driver.c,5195 :: 		EveText15.Caption     = EveText15_Caption;
	MOV	#lo_addr(_EveText15_Caption), W0
	MOV	W0, _EveText15+14
;NewDesign_driver.c,5196 :: 		EveText15.TextAlign   = taNone;
	MOV	#lo_addr(_EveText15+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5197 :: 		EveText15.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText15+18
	MOV	W1, _EveText15+20
;NewDesign_driver.c,5198 :: 		EveText15.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText15+22
;NewDesign_driver.c,5199 :: 		EveText15.FontHandle  = 26;
	MOV	#lo_addr(_EveText15+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5200 :: 		EveText15.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText15+26
	MOV	W1, _EveText15+28
;NewDesign_driver.c,5201 :: 		EveText15.Active      = 0;
	MOV	#lo_addr(_EveText15+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5202 :: 		EveText15.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText15+32
;NewDesign_driver.c,5203 :: 		EveText15.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText15+34
;NewDesign_driver.c,5204 :: 		EveText15.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText15+36
;NewDesign_driver.c,5205 :: 		EveText15.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText15+38
;NewDesign_driver.c,5207 :: 		EveText16.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText16
;NewDesign_driver.c,5208 :: 		EveText16.Order       = 22;
	MOV	#lo_addr(_EveText16+2), W1
	MOV.B	#22, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5209 :: 		EveText16.Visible     = 0;
	MOV	#lo_addr(_EveText16+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5210 :: 		EveText16.Opacity     = 255;
	MOV	#lo_addr(_EveText16+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5211 :: 		EveText16.Tag         = 255;
	MOV	#lo_addr(_EveText16+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5212 :: 		EveText16.Left        = 62;
	MOV	#62, W0
	MOV	W0, _EveText16+6
;NewDesign_driver.c,5213 :: 		EveText16.Top         = 160;
	MOV	#160, W0
	MOV	W0, _EveText16+8
;NewDesign_driver.c,5214 :: 		EveText16.Width       = 93;
	MOV	#93, W0
	MOV	W0, _EveText16+10
;NewDesign_driver.c,5215 :: 		EveText16.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText16+12
;NewDesign_driver.c,5216 :: 		EveText16.Caption     = EveText16_Caption;
	MOV	#lo_addr(_EveText16_Caption), W0
	MOV	W0, _EveText16+14
;NewDesign_driver.c,5217 :: 		EveText16.TextAlign   = taNone;
	MOV	#lo_addr(_EveText16+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5218 :: 		EveText16.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText16+18
	MOV	W1, _EveText16+20
;NewDesign_driver.c,5219 :: 		EveText16.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText16+22
;NewDesign_driver.c,5220 :: 		EveText16.FontHandle  = 26;
	MOV	#lo_addr(_EveText16+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5221 :: 		EveText16.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText16+26
	MOV	W1, _EveText16+28
;NewDesign_driver.c,5222 :: 		EveText16.Active      = 0;
	MOV	#lo_addr(_EveText16+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5223 :: 		EveText16.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText16+32
;NewDesign_driver.c,5224 :: 		EveText16.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText16+34
;NewDesign_driver.c,5225 :: 		EveText16.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText16+36
;NewDesign_driver.c,5226 :: 		EveText16.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText16+38
;NewDesign_driver.c,5228 :: 		EveText17.OwnerScreen = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveText17
;NewDesign_driver.c,5229 :: 		EveText17.Order       = 23;
	MOV	#lo_addr(_EveText17+2), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5230 :: 		EveText17.Visible     = 0;
	MOV	#lo_addr(_EveText17+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5231 :: 		EveText17.Opacity     = 255;
	MOV	#lo_addr(_EveText17+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5232 :: 		EveText17.Tag         = 255;
	MOV	#lo_addr(_EveText17+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5233 :: 		EveText17.Left        = 62;
	MOV	#62, W0
	MOV	W0, _EveText17+6
;NewDesign_driver.c,5234 :: 		EveText17.Top         = 192;
	MOV	#192, W0
	MOV	W0, _EveText17+8
;NewDesign_driver.c,5235 :: 		EveText17.Width       = 185;
	MOV	#185, W0
	MOV	W0, _EveText17+10
;NewDesign_driver.c,5236 :: 		EveText17.Height      = 15;
	MOV	#15, W0
	MOV	W0, _EveText17+12
;NewDesign_driver.c,5237 :: 		EveText17.Caption     = EveText17_Caption;
	MOV	#lo_addr(_EveText17_Caption), W0
	MOV	W0, _EveText17+14
;NewDesign_driver.c,5238 :: 		EveText17.TextAlign   = taNone;
	MOV	#lo_addr(_EveText17+16), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5239 :: 		EveText17.FontName    = 26;
	MOV	#26, W0
	MOV	#0, W1
	MOV	W0, _EveText17+18
	MOV	W1, _EveText17+20
;NewDesign_driver.c,5240 :: 		EveText17.Font_Color  = 0x0148;
	MOV	#328, W0
	MOV	W0, _EveText17+22
;NewDesign_driver.c,5241 :: 		EveText17.FontHandle  = 26;
	MOV	#lo_addr(_EveText17+24), W1
	MOV.B	#26, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5242 :: 		EveText17.Source      = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveText17+26
	MOV	W1, _EveText17+28
;NewDesign_driver.c,5243 :: 		EveText17.Active      = 0;
	MOV	#lo_addr(_EveText17+30), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5244 :: 		EveText17.OnUp        = 0;
	CLR	W0
	MOV	W0, _EveText17+32
;NewDesign_driver.c,5245 :: 		EveText17.OnDown      = 0;
	CLR	W0
	MOV	W0, _EveText17+34
;NewDesign_driver.c,5246 :: 		EveText17.OnClick     = 0;
	CLR	W0
	MOV	W0, _EveText17+36
;NewDesign_driver.c,5247 :: 		EveText17.OnPress     = 0;
	CLR	W0
	MOV	W0, _EveText17+38
;NewDesign_driver.c,5249 :: 		EveButtonSUBack.OwnerScreen   = &SummaryScreen;
	MOV	#lo_addr(_SummaryScreen), W0
	MOV	W0, _EveButtonSUBack
;NewDesign_driver.c,5250 :: 		EveButtonSUBack.Order         = 24;
	MOV	#lo_addr(_EveButtonSUBack+2), W1
	MOV.B	#24, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5251 :: 		EveButtonSUBack.Visible       = 0;
	MOV	#lo_addr(_EveButtonSUBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5252 :: 		EveButtonSUBack.Opacity       = 255;
	MOV	#lo_addr(_EveButtonSUBack+4), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5253 :: 		EveButtonSUBack.Tag           = 255;
	MOV	#lo_addr(_EveButtonSUBack+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5254 :: 		EveButtonSUBack.Left          = 340;
	MOV	#340, W0
	MOV	W0, _EveButtonSUBack+6
;NewDesign_driver.c,5255 :: 		EveButtonSUBack.Top           = 214;
	MOV	#214, W0
	MOV	W0, _EveButtonSUBack+8
;NewDesign_driver.c,5256 :: 		EveButtonSUBack.Width         = 96;
	MOV	#96, W0
	MOV	W0, _EveButtonSUBack+10
;NewDesign_driver.c,5257 :: 		EveButtonSUBack.Height        = 35;
	MOV	#35, W0
	MOV	W0, _EveButtonSUBack+12
;NewDesign_driver.c,5258 :: 		EveButtonSUBack.Color         = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUBack+14
;NewDesign_driver.c,5259 :: 		EveButtonSUBack.Press_Color   = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUBack+16
;NewDesign_driver.c,5260 :: 		EveButtonSUBack.ColorTo       = 0x7E3F;
	MOV	#32319, W0
	MOV	W0, _EveButtonSUBack+18
;NewDesign_driver.c,5261 :: 		EveButtonSUBack.Press_ColorTo = 0x03DA;
	MOV	#986, W0
	MOV	W0, _EveButtonSUBack+20
;NewDesign_driver.c,5262 :: 		EveButtonSUBack.Caption       = EveButtonSUBack_Caption;
	MOV	#lo_addr(_EveButtonSUBack_Caption), W0
	MOV	W0, _EveButtonSUBack+22
;NewDesign_driver.c,5263 :: 		EveButtonSUBack.FontName      = 27;
	MOV	#27, W0
	MOV	#0, W1
	MOV	W0, _EveButtonSUBack+24
	MOV	W1, _EveButtonSUBack+26
;NewDesign_driver.c,5264 :: 		EveButtonSUBack.Font_Color    = 0xFFFF;
	MOV	#65535, W0
	MOV	W0, _EveButtonSUBack+28
;NewDesign_driver.c,5265 :: 		EveButtonSUBack.FontHandle    = 27;
	MOV	#lo_addr(_EveButtonSUBack+30), W1
	MOV.B	#27, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5266 :: 		EveButtonSUBack.Source        = -1UL;
	MOV	#65535, W0
	MOV	#65535, W1
	MOV	W0, _EveButtonSUBack+32
	MOV	W1, _EveButtonSUBack+34
;NewDesign_driver.c,5267 :: 		EveButtonSUBack.Flat          = 0;
	MOV	#lo_addr(_EveButtonSUBack+36), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5268 :: 		EveButtonSUBack.Active        = 0;
	MOV	#lo_addr(_EveButtonSUBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5269 :: 		EveButtonSUBack.OnUp          = 0;
	CLR	W0
	MOV	W0, _EveButtonSUBack+38
;NewDesign_driver.c,5270 :: 		EveButtonSUBack.OnDown        = 0;
	CLR	W0
	MOV	W0, _EveButtonSUBack+40
;NewDesign_driver.c,5271 :: 		EveButtonSUBack.OnClick       = &EveButtonSUBack_OnClick;
	MOV	#lo_addr(_EveButtonSUBack_OnClick), W0
	MOV	W0, _EveButtonSUBack+42
;NewDesign_driver.c,5272 :: 		EveButtonSUBack.OnPress       = 0;
	CLR	W0
	MOV	W0, _EveButtonSUBack+44
;NewDesign_driver.c,5274 :: 		EveButtonSUBack_OnClick.Action       = EveButtonSUBackOnClick;
	MOV	#lo_addr(_EveButtonSUBackOnClick), W0
	MOV	W0, _EveButtonSUBack_OnClick
;NewDesign_driver.c,5275 :: 		EveButtonSUBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
	MOV	#lo_addr(_EveButtonSUBack_OnClick+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5276 :: 		EveButtonSUBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
	MOV	#lo_addr(_EveButtonSUBack_OnClick+3), W1
	MOV.B	#65, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5277 :: 		EveButtonSUBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
	MOV	#lo_addr(_EveButtonSUBack_OnClick+4), W1
	MOV.B	#81, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5278 :: 		EveButtonSUBack_OnClick.Sound.Volume = 255;
	MOV	#lo_addr(_EveButtonSUBack_OnClick+5), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;NewDesign_driver.c,5280 :: 		}
L_end_InitObjects:
	RETURN
; end of NewDesign_driver_InitObjects

_Init_MCU:

;NewDesign_driver.c,5282 :: 		void Init_MCU() {
;NewDesign_driver.c,5283 :: 		PLLFBD = 68;            // PLL multiplier M=70
	MOV	#68, W0
	MOV	WREG, PLLFBD
;NewDesign_driver.c,5284 :: 		CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;NewDesign_driver.c,5286 :: 		ANSELA = 0x00;          // Convert all I/O pins to digital
	CLR	ANSELA
;NewDesign_driver.c,5287 :: 		ANSELB = 0x00;
	CLR	ANSELB
;NewDesign_driver.c,5288 :: 		}
L_end_Init_MCU:
	RETURN
; end of _Init_MCU

_InitVTFTStack:
	LNK	#84

;NewDesign_driver.c,5290 :: 		void InitVTFTStack() {
;NewDesign_driver.c,5302 :: 		Init_MCU();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_Init_MCU
;NewDesign_driver.c,5307 :: 		_SPI_PRESCALE_PRI_4,     // sec. prescaler = _SPI_PRESCALE_SEC_1
	MOV	#2, W13
;NewDesign_driver.c,5306 :: 		_SPI_PRESCALE_SEC_2,     // data_mode      = _SPI_8_BIT
	MOV	#24, W12
;NewDesign_driver.c,5305 :: 		_SPI_8_BIT,              // master_mode    = _SPI_MASTER
	CLR	W11
;NewDesign_driver.c,5304 :: 		SPI1_Init_Advanced(_SPI_MASTER,             // Initialize SPI1 module
	MOV	#32, W10
;NewDesign_driver.c,5311 :: 		_SPI_IDLE_2_ACTIVE);     // clock_idle     = _SPI_CLK_IDLE_HIGH
	MOV	#256, W0
	PUSH	W0
;NewDesign_driver.c,5310 :: 		_SPI_CLK_IDLE_LOW,       // data_sample    = _SPI_DATA_SAMPLE_END
	CLR	W0
	PUSH	W0
;NewDesign_driver.c,5309 :: 		_SPI_DATA_SAMPLE_MIDDLE, // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
	CLR	W0
	PUSH	W0
;NewDesign_driver.c,5308 :: 		_SPI_SS_DISABLE,         // pri. prescaler = _SPI_PRESCALE_PRI_4
	CLR	W0
	PUSH	W0
;NewDesign_driver.c,5311 :: 		_SPI_IDLE_2_ACTIVE);     // clock_idle     = _SPI_CLK_IDLE_HIGH
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;NewDesign_driver.c,5314 :: 		FT800_Init();
	CALL	_FT800_Init
;NewDesign_driver.c,5317 :: 		FT800_Core_ClockSource(_FT800_CLK_SOURCE_EXTERNAL);
	MOV.B	#4, W10
	CALL	_FT800_Core_ClockSource
;NewDesign_driver.c,5318 :: 		FT800_Core_ClockPLL(_FT800_CLK_PLL_48MHz);
	MOV.B	#34, W10
	CALL	_FT800_Core_ClockPLL
;NewDesign_driver.c,5321 :: 		cfg.Display = VTFT_FT800_CONFIG_DISPLAY;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_DISPLAY), W0
	REPEAT	#41
	MOV	[W0++], [W1++]
;NewDesign_driver.c,5322 :: 		FT800_Display_SetConfig(&cfg.Display);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Display_SetConfig
;NewDesign_driver.c,5324 :: 		cfg.PWM = VTFT_FT800_CONFIG_PWM;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_PWM), W0
	REPEAT	#1
	MOV	[W0++], [W1++]
;NewDesign_driver.c,5325 :: 		FT800_PWM_SetConfig(&cfg.PWM);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_PWM_SetConfig
;NewDesign_driver.c,5327 :: 		cfg.GPIO = VTFT_FT800_CONFIG_GPIO;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_GPIO), W0
	REPEAT	#1
	MOV.B	[W0++], [W1++]
;NewDesign_driver.c,5328 :: 		FT800_GPIO_SetConfig(&cfg.GPIO);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_GPIO_SetConfig
;NewDesign_driver.c,5330 :: 		cfg.Audio = VTFT_FT800_CONFIG_AUDIO;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_AUDIO), W0
	REPEAT	#6
	MOV	[W0++], [W1++]
;NewDesign_driver.c,5331 :: 		FT800_Audio_SetConfig(&cfg.Audio);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Audio_SetConfig
;NewDesign_driver.c,5333 :: 		cfg.Sound = VTFT_FT800_CONFIG_SOUND;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_SOUND), W0
	REPEAT	#3
	MOV.B	[W0++], [W1++]
;NewDesign_driver.c,5334 :: 		FT800_Sound_SetConfig(&cfg.Sound);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Sound_SetConfig
;NewDesign_driver.c,5336 :: 		cfg.Interrupt = VTFT_FT800_CONFIG_INTERRUPT;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_INTERRUPT), W0
	REPEAT	#2
	MOV.B	[W0++], [W1++]
;NewDesign_driver.c,5337 :: 		FT800_Interrupt_SetConfig(&cfg.Interrupt);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Interrupt_SetConfig
;NewDesign_driver.c,5339 :: 		cfg.Touch = VTFT_FT800_CONFIG_TOUCH;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_TOUCH), W0
	REPEAT	#11
	MOV	[W0++], [W1++]
;NewDesign_driver.c,5340 :: 		FT800_Touch_SetConfig(&cfg.Touch);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Touch_SetConfig
;NewDesign_driver.c,5342 :: 		cfg.TTransform = VTFT_FT800_CONFIG_TOUCHTRANSFORM;
	ADD	W14, #0, W1
	MOV	#lo_addr(_VTFT_FT800_CONFIG_TOUCHTRANSFORM), W0
	REPEAT	#11
	MOV	[W0++], [W1++]
;NewDesign_driver.c,5343 :: 		FT800_TouchTransform_SetConfig(&cfg.TTransform);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_TouchTransform_SetConfig
;NewDesign_driver.c,5346 :: 		InitObjects();
	CALL	NewDesign_driver_InitObjects
;NewDesign_driver.c,5349 :: 		DrawScreen(&SplashScreen);
	MOV	#lo_addr(_SplashScreen), W10
	CALL	_DrawScreen
;NewDesign_driver.c,5350 :: 		}
L_end_InitVTFTStack:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _InitVTFTStack

NewDesign_driver____?ag:

L_end_NewDesign_driver___?ag:
	RETURN
; end of NewDesign_driver____?ag
