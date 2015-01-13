
_LEDIndicator:

;bufferchip.c,2 :: 		void LEDIndicator(){
;bufferchip.c,3 :: 		LATA.B1=1;
	BSET	LATA, #1
;bufferchip.c,4 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_LEDIndicator0:
	DEC	W7
	BRA NZ	L_LEDIndicator0
	DEC	W8
	BRA NZ	L_LEDIndicator0
	NOP
	NOP
	NOP
;bufferchip.c,5 :: 		LATA.B1=0;
	BCLR	LATA, #1
;bufferchip.c,6 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_LEDIndicator2:
	DEC	W7
	BRA NZ	L_LEDIndicator2
	DEC	W8
	BRA NZ	L_LEDIndicator2
	NOP
	NOP
	NOP
;bufferchip.c,7 :: 		}
L_end_LEDIndicator:
	RETURN
; end of _LEDIndicator

_mappins:

;bufferchip.c,9 :: 		void mappins(){
;bufferchip.c,10 :: 		TRISB.B4=0;//U1TX
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	TRISB, #4
;bufferchip.c,11 :: 		TRISA.B4=1;//U1RX
	BSET	TRISA, #4
;bufferchip.c,13 :: 		TRISB.B12=1;//SDI2
	BSET	TRISB, #12
;bufferchip.c,14 :: 		TRISB.B11=0;//SDO2
	BCLR	TRISB, #11
;bufferchip.c,15 :: 		TRISB.B10=1;//SCK2IN
	BSET	TRISB, #10
;bufferchip.c,17 :: 		TRISA.B1 = 0; //LED
	BCLR	TRISA, #1
;bufferchip.c,18 :: 		LATA.B1=1;
	BSET	LATA, #1
;bufferchip.c,20 :: 		PPS_Mapping(20,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping
;bufferchip.c,21 :: 		PPS_Mapping(36,_OUTPUT,_U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#36, W10
	CALL	_PPS_Mapping
;bufferchip.c,23 :: 		PPS_Mapping(44,_INPUT,_SDI2IN);
	MOV.B	#16, W12
	MOV.B	#1, W11
	MOV.B	#44, W10
	CALL	_PPS_Mapping
;bufferchip.c,24 :: 		PPS_Mapping(43,_OUTPUT,_SDO2);
	MOV.B	#8, W12
	CLR	W11
	MOV.B	#43, W10
	CALL	_PPS_Mapping
;bufferchip.c,25 :: 		PPS_Mapping(42,_INPUT,_SCK2IN);
	MOV.B	#17, W12
	MOV.B	#1, W11
	MOV.B	#42, W10
	CALL	_PPS_Mapping
;bufferchip.c,27 :: 		}
L_end_mappins:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _mappins

_initSPICommunication:

;bufferchip.c,28 :: 		void initSPICommunication(){//SPI2 to smp
;bufferchip.c,32 :: 		_SPI_PRESCALE_PRI_4,
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#2, W13
;bufferchip.c,31 :: 		_SPI_PRESCALE_SEC_2,
	MOV	#24, W12
;bufferchip.c,30 :: 		_SPI_8_BIT,
	CLR	W11
;bufferchip.c,29 :: 		SPI2_Init_Advanced(_SPI_SLAVE,
	CLR	W10
;bufferchip.c,36 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;bufferchip.c,35 :: 		_SPI_CLK_IDLE_LOW,
	CLR	W0
	PUSH	W0
;bufferchip.c,34 :: 		_SPI_DATA_SAMPLE_MIDDLE,
	CLR	W0
	PUSH	W0
;bufferchip.c,33 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;bufferchip.c,36 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;bufferchip.c,37 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;bufferchip.c,38 :: 		IPC8.B6=1;
	BSET	IPC8, #6
;bufferchip.c,39 :: 		IPC8.B5=1;
	BSET	IPC8, #5
;bufferchip.c,40 :: 		IPC8.B4=0;
	BCLR	IPC8, #4
;bufferchip.c,41 :: 		SPI2STAT.B4=0;
	BCLR	SPI2STAT, #4
;bufferchip.c,42 :: 		SPI2STAT.B3=0;
	BCLR	SPI2STAT, #3
;bufferchip.c,43 :: 		SPI2STAT.B2=1;
	BSET	SPI2STAT, #2
;bufferchip.c,44 :: 		IEC2.B1=1;
	BSET	IEC2, #1
;bufferchip.c,46 :: 		}
L_end_initSPICommunication:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initSPICommunication

_Spiinterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;bufferchip.c,47 :: 		void Spiinterrupt() iv IVT_ADDR_SPI2INTERRUPT{//(4laz4enc3t)*8+10
;bufferchip.c,49 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;bufferchip.c,50 :: 		tem=SPI2BUF;
; tem start address is: 4 (W2)
	MOV	SPI2BUF, W2
;bufferchip.c,53 :: 		if(startListeningFlag){
	MOV	#lo_addr(_startListeningFlag), W0
	CP0	[W0]
	BRA NZ	L__Spiinterrupt111
	GOTO	L_Spiinterrupt4
L__Spiinterrupt111:
;bufferchip.c,55 :: 		SDbuff[SDPTR++]=tem;
	MOV	#lo_addr(_SDBuff), W1
	MOV	#lo_addr(_SDPTR), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; tem end address is: 4 (W2)
	MOV	_SDPTR, W0
	INC	W0
	MOV	W0, _SDPTR
;bufferchip.c,56 :: 		if(SDPTR<=5112){
	MOV	_SDPTR, W1
	MOV	#5112, W0
	CP	W1, W0
	BRA LEU	L__Spiinterrupt112
	GOTO	L_Spiinterrupt5
L__Spiinterrupt112:
;bufferchip.c,57 :: 		if(SDPTR<=2552){
	MOV	_SDPTR, W1
	MOV	#2552, W0
	CP	W1, W0
	BRA LEU	L__Spiinterrupt113
	GOTO	L_Spiinterrupt6
L__Spiinterrupt113:
;bufferchip.c,58 :: 		if(SDPTR==504){SDPTR=512;dataReadyflag1=1;}  //load to ten buffers
	MOV	_SDPTR, W1
	MOV	#504, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt114
	GOTO	L_Spiinterrupt7
L__Spiinterrupt114:
	MOV	#512, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag1
	GOTO	L_Spiinterrupt8
L_Spiinterrupt7:
;bufferchip.c,59 :: 		else if(SDPTR==1016){SDPTR=1024;dataReadyflag2=1;}
	MOV	_SDPTR, W1
	MOV	#1016, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt115
	GOTO	L_Spiinterrupt9
L__Spiinterrupt115:
	MOV	#1024, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag2
	GOTO	L_Spiinterrupt10
L_Spiinterrupt9:
;bufferchip.c,60 :: 		else if(SDPTR==1528){SDPTR=1536;dataReadyflag3=1;}
	MOV	_SDPTR, W1
	MOV	#1528, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt116
	GOTO	L_Spiinterrupt11
L__Spiinterrupt116:
	MOV	#1536, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag3
	GOTO	L_Spiinterrupt12
L_Spiinterrupt11:
;bufferchip.c,61 :: 		else if(SDPTR==2040){SDPTR=2048;dataReadyflag4=1;}
	MOV	_SDPTR, W1
	MOV	#2040, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt117
	GOTO	L_Spiinterrupt13
L__Spiinterrupt117:
	MOV	#2048, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag4
	GOTO	L_Spiinterrupt14
L_Spiinterrupt13:
;bufferchip.c,62 :: 		else if(SDPTR==2552){SDPTR=2560;dataReadyflag5=1;}
	MOV	_SDPTR, W1
	MOV	#2552, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt118
	GOTO	L_Spiinterrupt15
L__Spiinterrupt118:
	MOV	#2560, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag5
L_Spiinterrupt15:
L_Spiinterrupt14:
L_Spiinterrupt12:
L_Spiinterrupt10:
L_Spiinterrupt8:
;bufferchip.c,64 :: 		}
	GOTO	L_Spiinterrupt16
L_Spiinterrupt6:
;bufferchip.c,66 :: 		if(SDPTR==3064){SDPTR=3072;dataReadyflag6=1;}
	MOV	_SDPTR, W1
	MOV	#3064, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt119
	GOTO	L_Spiinterrupt17
L__Spiinterrupt119:
	MOV	#3072, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag6
	GOTO	L_Spiinterrupt18
L_Spiinterrupt17:
;bufferchip.c,67 :: 		else if(SDPTR==3576){SDPTR=3584;dataReadyflag7=1;}
	MOV	_SDPTR, W1
	MOV	#3576, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt120
	GOTO	L_Spiinterrupt19
L__Spiinterrupt120:
	MOV	#3584, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag7
	GOTO	L_Spiinterrupt20
L_Spiinterrupt19:
;bufferchip.c,68 :: 		else if(SDPTR==4088){SDPTR=4096;dataReadyflag8=1;}
	MOV	_SDPTR, W1
	MOV	#4088, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt121
	GOTO	L_Spiinterrupt21
L__Spiinterrupt121:
	MOV	#4096, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag8
	GOTO	L_Spiinterrupt22
L_Spiinterrupt21:
;bufferchip.c,69 :: 		else if(SDPTR==4600){SDPTR=4608;dataReadyflag9=1;}
	MOV	_SDPTR, W1
	MOV	#4600, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt122
	GOTO	L_Spiinterrupt23
L__Spiinterrupt122:
	MOV	#4608, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag9
	GOTO	L_Spiinterrupt24
L_Spiinterrupt23:
;bufferchip.c,70 :: 		else if(SDPTR==5112){SDPTR=5120;dataReadyflag10=1;}
	MOV	_SDPTR, W1
	MOV	#5112, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt123
	GOTO	L_Spiinterrupt25
L__Spiinterrupt123:
	MOV	#5120, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag10
L_Spiinterrupt25:
L_Spiinterrupt24:
L_Spiinterrupt22:
L_Spiinterrupt20:
L_Spiinterrupt18:
;bufferchip.c,71 :: 		}
L_Spiinterrupt16:
;bufferchip.c,73 :: 		}
	GOTO	L_Spiinterrupt26
L_Spiinterrupt5:
;bufferchip.c,75 :: 		if(SDPTR<=7672){
	MOV	_SDPTR, W1
	MOV	#7672, W0
	CP	W1, W0
	BRA LEU	L__Spiinterrupt124
	GOTO	L_Spiinterrupt27
L__Spiinterrupt124:
;bufferchip.c,76 :: 		if(SDPTR==5624){SDPTR=5632;dataReadyflag11=1;}
	MOV	_SDPTR, W1
	MOV	#5624, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt125
	GOTO	L_Spiinterrupt28
L__Spiinterrupt125:
	MOV	#5632, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag11
	GOTO	L_Spiinterrupt29
L_Spiinterrupt28:
;bufferchip.c,77 :: 		else if(SDPTR==6136){SDPTR=6144;dataReadyflag12=1;}
	MOV	_SDPTR, W1
	MOV	#6136, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt126
	GOTO	L_Spiinterrupt30
L__Spiinterrupt126:
	MOV	#6144, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag12
	GOTO	L_Spiinterrupt31
L_Spiinterrupt30:
;bufferchip.c,78 :: 		else if(SDPTR==6648){SDPTR=6656;dataReadyflag13=1;}
	MOV	_SDPTR, W1
	MOV	#6648, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt127
	GOTO	L_Spiinterrupt32
L__Spiinterrupt127:
	MOV	#6656, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag13
	GOTO	L_Spiinterrupt33
L_Spiinterrupt32:
;bufferchip.c,79 :: 		else if(SDPTR==7160){SDPTR=7168;dataReadyflag14=1;}
	MOV	_SDPTR, W1
	MOV	#7160, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt128
	GOTO	L_Spiinterrupt34
L__Spiinterrupt128:
	MOV	#7168, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag14
	GOTO	L_Spiinterrupt35
L_Spiinterrupt34:
;bufferchip.c,80 :: 		else if(SDPTR==7672){SDPTR=7680;dataReadyflag15=1;}
	MOV	_SDPTR, W1
	MOV	#7672, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt129
	GOTO	L_Spiinterrupt36
L__Spiinterrupt129:
	MOV	#7680, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag15
L_Spiinterrupt36:
L_Spiinterrupt35:
L_Spiinterrupt33:
L_Spiinterrupt31:
L_Spiinterrupt29:
;bufferchip.c,81 :: 		}
	GOTO	L_Spiinterrupt37
L_Spiinterrupt27:
;bufferchip.c,83 :: 		if(SDPTR==8184){SDPTR=8192;dataReadyflag16=1;}
	MOV	_SDPTR, W1
	MOV	#8184, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt130
	GOTO	L_Spiinterrupt38
L__Spiinterrupt130:
	MOV	#8192, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag16
	GOTO	L_Spiinterrupt39
L_Spiinterrupt38:
;bufferchip.c,84 :: 		else if(SDPTR==8696){SDPTR=8704;dataReadyflag17=1;}
	MOV	_SDPTR, W1
	MOV	#8696, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt131
	GOTO	L_Spiinterrupt40
L__Spiinterrupt131:
	MOV	#8704, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag17
	GOTO	L_Spiinterrupt41
L_Spiinterrupt40:
;bufferchip.c,85 :: 		else if(SDPTR==9208){SDPTR=9216;dataReadyflag18=1;}
	MOV	_SDPTR, W1
	MOV	#9208, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt132
	GOTO	L_Spiinterrupt42
L__Spiinterrupt132:
	MOV	#9216, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag18
	GOTO	L_Spiinterrupt43
L_Spiinterrupt42:
;bufferchip.c,86 :: 		else if(SDPTR==9720){SDPTR=9728;dataReadyflag19=1;}
	MOV	_SDPTR, W1
	MOV	#9720, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt133
	GOTO	L_Spiinterrupt44
L__Spiinterrupt133:
	MOV	#9728, W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag19
	GOTO	L_Spiinterrupt45
L_Spiinterrupt44:
;bufferchip.c,87 :: 		else if(SDPTR==10232){SDPTR=0;dataReadyflag20=1;}
	MOV	_SDPTR, W1
	MOV	#10232, W0
	CP	W1, W0
	BRA Z	L__Spiinterrupt134
	GOTO	L_Spiinterrupt46
L__Spiinterrupt134:
	CLR	W0
	MOV	W0, _SDPTR
	MOV	#1, W0
	MOV	W0, _dataReadyflag20
L_Spiinterrupt46:
L_Spiinterrupt45:
L_Spiinterrupt43:
L_Spiinterrupt41:
L_Spiinterrupt39:
;bufferchip.c,88 :: 		}
L_Spiinterrupt37:
;bufferchip.c,90 :: 		}
L_Spiinterrupt26:
;bufferchip.c,103 :: 		}
L_Spiinterrupt4:
;bufferchip.c,105 :: 		}
L_end_Spiinterrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _Spiinterrupt

_initUARTCommunication:

;bufferchip.c,106 :: 		void initUARTCommunication(){//UART1 to smp
;bufferchip.c,107 :: 		UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	CLR	W12
	MOV	#4096, W10
	MOV	#14, W11
	MOV	#1, W0
	PUSH	W0
	CALL	_UART1_Init_Advanced
	SUB	#2, W15
;bufferchip.c,108 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initUARTCommunication47:
	DEC	W7
	BRA NZ	L_initUARTCommunication47
	DEC	W8
	BRA NZ	L_initUARTCommunication47
;bufferchip.c,109 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;bufferchip.c,110 :: 		U1STA.OERR=0;
	BCLR	U1STA, #1
;bufferchip.c,111 :: 		IPC2.B14=1;
	BSET	IPC2, #14
;bufferchip.c,112 :: 		IPC2.B13=0;
	BCLR	IPC2, #13
;bufferchip.c,113 :: 		IPC2.B12=0;
	BCLR	IPC2, #12
;bufferchip.c,114 :: 		IEC0.B11=1;
	BSET	IEC0, #11
;bufferchip.c,115 :: 		}
L_end_initUARTCommunication:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initUARTCommunication

_U1interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;bufferchip.c,116 :: 		void U1interrupt() iv IVT_ADDR_U1RXINTERRUPT{
;bufferchip.c,118 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;bufferchip.c,119 :: 		temp=U1RXREG;
; temp start address is: 4 (W2)
	MOV	U1RXREG, W2
;bufferchip.c,121 :: 		if(nameStart){
	MOV	#lo_addr(_nameStart), W0
	CP0	[W0]
	BRA NZ	L__U1interrupt137
	GOTO	L_U1interrupt49
L__U1interrupt137:
;bufferchip.c,122 :: 		newFileName[newFileNamePtr++]=temp;
	MOV	#lo_addr(_newFileName), W1
	MOV	#lo_addr(_newFileNamePtr), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
	MOV	_newFileNamePtr, W0
	INC	W0
	MOV	W0, _newFileNamePtr
;bufferchip.c,123 :: 		if(temp==0x00){
	CP.B	W2, #0
	BRA Z	L__U1interrupt138
	GOTO	L_U1interrupt50
L__U1interrupt138:
; temp end address is: 4 (W2)
;bufferchip.c,124 :: 		newfileFlag=1;
	MOV	#1, W0
	MOV	W0, _newFileflag
;bufferchip.c,125 :: 		newFileNamePtr=0;
	CLR	W0
	MOV	W0, _newFileNamePtr
;bufferchip.c,126 :: 		nameStart=0;
	CLR	W0
	MOV	W0, _nameStart
;bufferchip.c,127 :: 		}
L_U1interrupt50:
;bufferchip.c,128 :: 		if(newFileNamePtr==10){newFileNamePtr=0;}
	MOV	_newFileNamePtr, W0
	CP	W0, #10
	BRA Z	L__U1interrupt139
	GOTO	L_U1interrupt51
L__U1interrupt139:
	CLR	W0
	MOV	W0, _newFileNamePtr
L_U1interrupt51:
;bufferchip.c,129 :: 		}
	GOTO	L_U1interrupt52
L_U1interrupt49:
;bufferchip.c,132 :: 		if(temp==0xF3){//nameStart
; temp start address is: 4 (W2)
	MOV.B	#243, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt140
	GOTO	L_U1interrupt53
L__U1interrupt140:
; temp end address is: 4 (W2)
;bufferchip.c,133 :: 		nameStart=1;
	MOV	#1, W0
	MOV	W0, _nameStart
;bufferchip.c,134 :: 		}
	GOTO	L_U1interrupt54
L_U1interrupt53:
;bufferchip.c,135 :: 		else if(temp==0xE2){
; temp start address is: 4 (W2)
	MOV.B	#226, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt141
	GOTO	L_U1interrupt55
L__U1interrupt141:
; temp end address is: 4 (W2)
;bufferchip.c,136 :: 		stopLoggingFlag=1;
	MOV	#1, W0
	MOV	W0, _stopLoggingFlag
;bufferchip.c,137 :: 		}
	GOTO	L_U1interrupt56
L_U1interrupt55:
;bufferchip.c,138 :: 		else if(temp==0xD3){//start listening
; temp start address is: 4 (W2)
	MOV.B	#211, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt142
	GOTO	L_U1interrupt57
L__U1interrupt142:
; temp end address is: 4 (W2)
;bufferchip.c,139 :: 		startListeningFlag=1;
	MOV	#1, W0
	MOV	W0, _startListeningFlag
;bufferchip.c,140 :: 		SDPTR=0;
	CLR	W0
	MOV	W0, _SDPTR
;bufferchip.c,141 :: 		}
	GOTO	L_U1interrupt58
L_U1interrupt57:
;bufferchip.c,142 :: 		else if(temp==0xC1){
; temp start address is: 4 (W2)
	MOV.B	#193, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt143
	GOTO	L_U1interrupt59
L__U1interrupt143:
; temp end address is: 4 (W2)
;bufferchip.c,143 :: 		roughnessFlag=1;
	MOV	#1, W0
	MOV	W0, _roughnessFlag
;bufferchip.c,144 :: 		}
	GOTO	L_U1interrupt60
L_U1interrupt59:
;bufferchip.c,145 :: 		else if(temp==0xC2){
; temp start address is: 4 (W2)
	MOV.B	#194, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt144
	GOTO	L_U1interrupt61
L__U1interrupt144:
; temp end address is: 4 (W2)
;bufferchip.c,146 :: 		roughnessFlag=2;
	MOV	#2, W0
	MOV	W0, _roughnessFlag
;bufferchip.c,147 :: 		}
	GOTO	L_U1interrupt62
L_U1interrupt61:
;bufferchip.c,148 :: 		else if(temp==0xC3){
; temp start address is: 4 (W2)
	MOV.B	#195, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt145
	GOTO	L_U1interrupt63
L__U1interrupt145:
; temp end address is: 4 (W2)
;bufferchip.c,149 :: 		roughnessFlag=3;
	MOV	#3, W0
	MOV	W0, _roughnessFlag
;bufferchip.c,150 :: 		}
	GOTO	L_U1interrupt64
L_U1interrupt63:
;bufferchip.c,151 :: 		else if(temp==0xC4){
; temp start address is: 4 (W2)
	MOV.B	#196, W0
	CP.B	W2, W0
	BRA Z	L__U1interrupt146
	GOTO	L_U1interrupt65
L__U1interrupt146:
; temp end address is: 4 (W2)
;bufferchip.c,152 :: 		roughnessFlag=4;
	MOV	#4, W0
	MOV	W0, _roughnessFlag
;bufferchip.c,153 :: 		}
L_U1interrupt65:
L_U1interrupt64:
L_U1interrupt62:
L_U1interrupt60:
L_U1interrupt58:
L_U1interrupt56:
L_U1interrupt54:
;bufferchip.c,155 :: 		}
L_U1interrupt52:
;bufferchip.c,158 :: 		}
L_end_U1interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _U1interrupt

_initSD:

;bufferchip.c,159 :: 		void initSD(){
;bufferchip.c,160 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;bufferchip.c,164 :: 		_SPI_PRESCALE_PRI_16,
	MOV	#1, W13
;bufferchip.c,163 :: 		_SPI_PRESCALE_SEC_2,
	MOV	#24, W12
;bufferchip.c,162 :: 		_SPI_8_BIT,
	CLR	W11
;bufferchip.c,161 :: 		SPI1_Init_Advanced(_SPI_MASTER,
	MOV	#32, W10
;bufferchip.c,168 :: 		_SPI_ACTIVE_2_IDLE) ;
	CLR	W0
	PUSH	W0
;bufferchip.c,167 :: 		_SPI_CLK_IDLE_HIGH,
	MOV	#64, W0
	PUSH	W0
;bufferchip.c,166 :: 		_SPI_DATA_SAMPLE_END,
	MOV	#512, W0
	PUSH	W0
;bufferchip.c,165 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;bufferchip.c,168 :: 		_SPI_ACTIVE_2_IDLE) ;
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;bufferchip.c,170 :: 		while(FAT32_Init()!=0){LEDIndicator();}
L_initSD66:
	CALL	_FAT32_Init
	CP.B	W0, #0
	BRA NZ	L__initSD148
	GOTO	L_initSD67
L__initSD148:
	CALL	_LEDIndicator
	GOTO	L_initSD66
L_initSD67:
;bufferchip.c,175 :: 		_SPI_PRESCALE_PRI_1,
	MOV	#3, W13
;bufferchip.c,174 :: 		_SPI_PRESCALE_SEC_2,
	MOV	#24, W12
;bufferchip.c,173 :: 		_SPI_8_BIT,
	CLR	W11
;bufferchip.c,172 :: 		SPI1_Init_Advanced(_SPI_MASTER,     // Init SPI at higher speed
	MOV	#32, W10
;bufferchip.c,179 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;bufferchip.c,178 :: 		_SPI_CLK_IDLE_HIGH,
	MOV	#64, W0
	PUSH	W0
;bufferchip.c,177 :: 		_SPI_DATA_SAMPLE_END,
	MOV	#512, W0
	PUSH	W0
;bufferchip.c,176 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;bufferchip.c,179 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;bufferchip.c,181 :: 		for(i=0;i<10420;i++){SDBuff[i]=0x00;}//set entire buffer to 0xDD
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initSD68:
; i start address is: 4 (W2)
	MOV	#10420, W0
	CP	W2, W0
	BRA LTU	L__initSD149
	GOTO	L_initSD69
L__initSD149:
	MOV	#lo_addr(_SDBuff), W0
	ADD	W0, W2, W1
	CLR	W0
	MOV.B	W0, [W1]
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_initSD68
L_initSD69:
;bufferchip.c,182 :: 		SPI_Set_Active(SPI1_Read, SPI1_Write);
	MOV	#lo_addr(_SPI1_Write), W11
	MOV	#lo_addr(_SPI1_Read), W10
	CALL	_SPI_Set_Active
;bufferchip.c,184 :: 		}
L_end_initSD:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initSD

_initAll:

;bufferchip.c,185 :: 		void initAll(){
;bufferchip.c,186 :: 		PLLFBD = 68;            // PLL multiplier M=70
	MOV	#68, W0
	MOV	WREG, PLLFBD
;bufferchip.c,187 :: 		CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;bufferchip.c,189 :: 		ANSELA = 0x00;          // Convert all I/O pins to digital
	CLR	ANSELA
;bufferchip.c,190 :: 		ANSELB = 0x00;
	CLR	ANSELB
;bufferchip.c,191 :: 		mappins();
	CALL	_mappins
;bufferchip.c,192 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_initAll71:
	DEC	W7
	BRA NZ	L_initAll71
	DEC	W8
	BRA NZ	L_initAll71
	NOP
	NOP
;bufferchip.c,193 :: 		initUARTCommunication();
	CALL	_initUARTCommunication
;bufferchip.c,194 :: 		initSPICommunication();
	CALL	_initSPICommunication
;bufferchip.c,196 :: 		initSD();
	CALL	_initSD
;bufferchip.c,197 :: 		}
L_end_initAll:
	RETURN
; end of _initAll

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;bufferchip.c,198 :: 		void main() {
;bufferchip.c,199 :: 		unsigned int tempi=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
;bufferchip.c,202 :: 		initAll();
	CALL	_initAll
;bufferchip.c,203 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main73:
	DEC	W7
	BRA NZ	L_main73
	DEC	W8
	BRA NZ	L_main73
	NOP
	NOP
;bufferchip.c,204 :: 		fhandle = FAT32_Open("test",0x02);//write
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_bufferchip), W10
	CALL	_FAT32_Open
	MOV	#lo_addr(_fhandle), W1
	MOV.B	W0, [W1]
;bufferchip.c,205 :: 		for(tempi=0;tempi<200;tempi++){
; tempi start address is: 2 (W1)
	CLR	W1
; tempi end address is: 2 (W1)
L_main75:
; tempi start address is: 2 (W1)
	MOV	#200, W0
	CP	W1, W0
	BRA LTU	L__main152
	GOTO	L_main76
L__main152:
;bufferchip.c,206 :: 		FAT32_Write(fhandle,SDBuffPTRS[0],512);
	MOV	#lo_addr(_fhandle), W0
	PUSH	W1
	MOV	#512, W12
	MOV	_SDBuffPTRS, W11
	MOV.B	[W0], W10
	CALL	_FAT32_Write
	POP	W1
;bufferchip.c,205 :: 		for(tempi=0;tempi<200;tempi++){
	INC	W1
;bufferchip.c,207 :: 		}
; tempi end address is: 2 (W1)
	GOTO	L_main75
L_main76:
;bufferchip.c,209 :: 		FAT32_Close(fhandle);
	MOV	#lo_addr(_fhandle), W0
	MOV.B	[W0], W10
	CALL	_FAT32_Close
;bufferchip.c,210 :: 		LATA.B1=0;
	BCLR	LATA, #1
;bufferchip.c,213 :: 		while(1){
L_main78:
;bufferchip.c,214 :: 		if(newfileFlag){
	MOV	#lo_addr(_newFileflag), W0
	CP0	[W0]
	BRA NZ	L__main153
	GOTO	L_main80
L__main153:
;bufferchip.c,215 :: 		newfileFlag=0;
	CLR	W0
	MOV	W0, _newFileflag
;bufferchip.c,216 :: 		LATA.B1=1;
	BSET	LATA, #1
;bufferchip.c,221 :: 		fhandle = FAT32_Open(newFileName,0x04);
	MOV.B	#4, W11
	MOV	#lo_addr(_newFileName), W10
	CALL	_FAT32_Open
	MOV	#lo_addr(_fhandle), W1
	MOV.B	W0, [W1]
;bufferchip.c,222 :: 		if(fhandle == -1) {  // 0x04 is append
	MOV	#lo_addr(_fhandle), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__main154
	GOTO	L_main81
L__main154:
;bufferchip.c,223 :: 		LATA.B1 = 1;
	BSET	LATA, #1
;bufferchip.c,224 :: 		while(1);
L_main82:
	GOTO	L_main82
;bufferchip.c,225 :: 		}
L_main81:
;bufferchip.c,233 :: 		SDPTR=0;
	CLR	W0
	MOV	W0, _SDPTR
;bufferchip.c,234 :: 		dataReadyflag1=0;
	CLR	W0
	MOV	W0, _dataReadyflag1
;bufferchip.c,235 :: 		dataReadyflag2=0;
	CLR	W0
	MOV	W0, _dataReadyflag2
;bufferchip.c,236 :: 		LATA.B1=0;
	BCLR	LATA, #1
;bufferchip.c,237 :: 		UART1_Write(0xE7);//tell smp I am listening
	MOV	#231, W10
	CALL	_UART1_Write
;bufferchip.c,238 :: 		roughnessFlag=0;
	CLR	W0
	MOV	W0, _roughnessFlag
;bufferchip.c,239 :: 		}
L_main80:
;bufferchip.c,241 :: 		for(tempi=0;tempi<20;tempi++){
; tempi start address is: 4 (W2)
	CLR	W2
; tempi end address is: 4 (W2)
L_main84:
; tempi start address is: 4 (W2)
	CP	W2, #20
	BRA LTU	L__main155
	GOTO	L_main85
L__main155:
;bufferchip.c,242 :: 		if(*dataReadyflags[tempi]){
	SL	W2, #1, W1
	MOV	#lo_addr(_dataReadyflags), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP0	[W0]
	BRA NZ	L__main156
	GOTO	L_main87
L__main156:
;bufferchip.c,243 :: 		*dataReadyflags[tempi]=0;
	SL	W2, #1, W1
	MOV	#lo_addr(_dataReadyflags), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	CLR	W0
	MOV	W0, [W1]
;bufferchip.c,244 :: 		LATA.B1=~LATA.B1;
	BTG	LATA, #1
;bufferchip.c,245 :: 		switch (roughnessFlag){ //event trigger
	GOTO	L_main88
;bufferchip.c,246 :: 		case 0:
L_main90:
;bufferchip.c,247 :: 		*((SDBuffPTRS[tempi])+504)=0x00;
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#504, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;bufferchip.c,248 :: 		break;
	GOTO	L_main89
;bufferchip.c,249 :: 		case 1:
L_main91:
;bufferchip.c,250 :: 		*((SDBuffPTRS[tempi])+504)=0x01;
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#504, W0
	ADD	W1, W0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;bufferchip.c,251 :: 		roughnessFlag=0;
	CLR	W0
	MOV	W0, _roughnessFlag
;bufferchip.c,252 :: 		break;
	GOTO	L_main89
;bufferchip.c,253 :: 		case 2:
L_main92:
;bufferchip.c,254 :: 		*((SDBuffPTRS[tempi])+504)=0x02;
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#504, W0
	ADD	W1, W0, W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;bufferchip.c,255 :: 		roughnessFlag=0;
	CLR	W0
	MOV	W0, _roughnessFlag
;bufferchip.c,256 :: 		break;
	GOTO	L_main89
;bufferchip.c,257 :: 		case 3:
L_main93:
;bufferchip.c,258 :: 		*((SDBuffPTRS[tempi])+504)=0x03;
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#504, W0
	ADD	W1, W0, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;bufferchip.c,259 :: 		roughnessFlag=0;
	CLR	W0
	MOV	W0, _roughnessFlag
;bufferchip.c,260 :: 		break;
	GOTO	L_main89
;bufferchip.c,261 :: 		case 4:
L_main94:
;bufferchip.c,262 :: 		*((SDBuffPTRS[tempi])+504)=0x04;
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W0
	MOV	[W0], W1
	MOV	#504, W0
	ADD	W1, W0, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;bufferchip.c,263 :: 		roughnessFlag=0;
	CLR	W0
	MOV	W0, _roughnessFlag
;bufferchip.c,264 :: 		break;
	GOTO	L_main89
;bufferchip.c,265 :: 		}
L_main88:
	MOV	_roughnessFlag, W0
	CP	W0, #0
	BRA NZ	L__main157
	GOTO	L_main90
L__main157:
	MOV	_roughnessFlag, W0
	CP	W0, #1
	BRA NZ	L__main158
	GOTO	L_main91
L__main158:
	MOV	_roughnessFlag, W0
	CP	W0, #2
	BRA NZ	L__main159
	GOTO	L_main92
L__main159:
	MOV	_roughnessFlag, W0
	CP	W0, #3
	BRA NZ	L__main160
	GOTO	L_main93
L__main160:
	MOV	_roughnessFlag, W0
	CP	W0, #4
	BRA NZ	L__main161
	GOTO	L_main94
L__main161:
L_main89:
;bufferchip.c,266 :: 		if(FAT32_Write(fhandle,SDBuffPTRS[tempi],512) != 0) {
	SL	W2, #1, W1
	MOV	#lo_addr(_SDBuffPTRS), W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_fhandle), W0
	PUSH	W2
	MOV	#512, W12
	MOV	[W1], W11
	MOV.B	[W0], W10
	CALL	_FAT32_Write
	POP	W2
	CP.B	W0, #0
	BRA NZ	L__main162
	GOTO	L_main95
L__main162:
; tempi end address is: 4 (W2)
;bufferchip.c,267 :: 		LATA.B1=1;
	BSET	LATA, #1
;bufferchip.c,268 :: 		while(1);
L_main96:
	GOTO	L_main96
;bufferchip.c,269 :: 		}
L_main95:
;bufferchip.c,271 :: 		}
; tempi start address is: 4 (W2)
L_main87:
;bufferchip.c,241 :: 		for(tempi=0;tempi<20;tempi++){
	INC	W2
;bufferchip.c,272 :: 		}
; tempi end address is: 4 (W2)
	GOTO	L_main84
L_main85:
;bufferchip.c,274 :: 		if(stopLoggingFlag){
	MOV	#lo_addr(_stopLoggingFlag), W0
	CP0	[W0]
	BRA NZ	L__main163
	GOTO	L_main98
L__main163:
;bufferchip.c,275 :: 		UART1_Write(0xF3);//tell smp done logging
	MOV	#243, W10
	CALL	_UART1_Write
;bufferchip.c,276 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main99:
	DEC	W7
	BRA NZ	L_main99
	DEC	W8
	BRA NZ	L_main99
	NOP
	NOP
;bufferchip.c,277 :: 		for(tempi=0;tempi<512;tempi++){
; tempi start address is: 4 (W2)
	CLR	W2
; tempi end address is: 4 (W2)
L_main101:
; tempi start address is: 4 (W2)
	MOV	#512, W0
	CP	W2, W0
	BRA LTU	L__main164
	GOTO	L_main102
L__main164:
;bufferchip.c,278 :: 		SDbuff[tempi]=0x00;
	MOV	#lo_addr(_SDBuff), W0
	ADD	W0, W2, W1
	CLR	W0
	MOV.B	W0, [W1]
;bufferchip.c,277 :: 		for(tempi=0;tempi<512;tempi++){
	INC	W2
;bufferchip.c,279 :: 		}
; tempi end address is: 4 (W2)
	GOTO	L_main101
L_main102:
;bufferchip.c,281 :: 		if(FAT32_Write(fhandle,SDBuff,512) != 0) {
	MOV	#lo_addr(_fhandle), W0
	MOV	#512, W12
	MOV	#lo_addr(_SDBuff), W11
	MOV.B	[W0], W10
	CALL	_FAT32_Write
	CP.B	W0, #0
	BRA NZ	L__main165
	GOTO	L_main104
L__main165:
;bufferchip.c,282 :: 		LATA.B1=1;
	BSET	LATA, #1
;bufferchip.c,283 :: 		while(1);
L_main105:
	GOTO	L_main105
;bufferchip.c,284 :: 		}
L_main104:
;bufferchip.c,285 :: 		FAT32_Close(fhandle);
	MOV	#lo_addr(_fhandle), W0
	MOV.B	[W0], W10
	CALL	_FAT32_Close
;bufferchip.c,286 :: 		LATA.B1=0;
	BCLR	LATA, #1
;bufferchip.c,287 :: 		UART1_Write(0xA9);//tell smp I stopped listening and file is closed
	MOV	#169, W10
	CALL	_UART1_Write
;bufferchip.c,289 :: 		SDPTR=0;
	CLR	W0
	MOV	W0, _SDPTR
;bufferchip.c,290 :: 		dataReadyflag1=0;
	CLR	W0
	MOV	W0, _dataReadyflag1
;bufferchip.c,291 :: 		dataReadyflag2=0;
	CLR	W0
	MOV	W0, _dataReadyflag2
;bufferchip.c,292 :: 		stopLoggingFlag=0;
	CLR	W0
	MOV	W0, _stopLoggingFlag
;bufferchip.c,293 :: 		startListeningFlag=0;
	CLR	W0
	MOV	W0, _startListeningFlag
;bufferchip.c,296 :: 		}
L_main98:
;bufferchip.c,297 :: 		}
	GOTO	L_main78
;bufferchip.c,299 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
