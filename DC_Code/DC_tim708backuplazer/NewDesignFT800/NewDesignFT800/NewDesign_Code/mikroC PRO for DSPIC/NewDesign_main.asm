
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;NewDesign_main.c,24 :: 		void main() {
;NewDesign_main.c,25 :: 		InitVTFTStack();
	CALL	_InitVTFTStack
;NewDesign_main.c,26 :: 		while (1) {
L_main0:
;NewDesign_main.c,27 :: 		ProcessVTFTStack();
	CALL	_ProcessVTFTStack
;NewDesign_main.c,28 :: 		}
	GOTO	L_main0
;NewDesign_main.c,30 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
