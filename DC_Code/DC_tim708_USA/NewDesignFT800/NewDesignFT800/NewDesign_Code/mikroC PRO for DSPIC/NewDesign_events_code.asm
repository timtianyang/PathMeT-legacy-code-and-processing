
_mapPins:

;NewDesign_events_code.c,6 :: 		void mapPins(){//42startlogging    53name  E4endofname
;NewDesign_events_code.c,11 :: 		TRISB.B12=1;//SDI2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET	TRISB, #12
;NewDesign_events_code.c,12 :: 		TRISB.B11=0;//SDO2
	BCLR	TRISB, #11
;NewDesign_events_code.c,13 :: 		TRISB.B10=0;//SCK2 remove all communications between the cam chip
	BCLR	TRISB, #10
;NewDesign_events_code.c,18 :: 		TRISB.B4=0;//U1TX
	BCLR	TRISB, #4
;NewDesign_events_code.c,19 :: 		TRISA.B4=1;//U1RX
	BSET	TRISA, #4
;NewDesign_events_code.c,21 :: 		PPS_Mapping(44,_INPUT,_SDI2IN); //SPI2 to camera chip
	MOV.B	#16, W12
	MOV.B	#1, W11
	MOV.B	#44, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,22 :: 		PPS_Mapping(43,_OUTPUT,_SDO2);
	MOV.B	#8, W12
	CLR	W11
	MOV.B	#43, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,23 :: 		PPS_Mapping(42,_OUTPUT,_SCK2OUT);
	MOV.B	#9, W12
	CLR	W11
	MOV.B	#42, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,25 :: 		PPS_Mapping(36,_OUTPUT,_U1TX);  //smp
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#36, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,26 :: 		PPS_Mapping(20,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,30 :: 		}
L_end_mapPins:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _mapPins

_initCommunication:

;NewDesign_events_code.c,31 :: 		void initCommunication(){
;NewDesign_events_code.c,32 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;NewDesign_events_code.c,34 :: 		UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
	CLR	W13
	CLR	W12
	MOV	#4096, W10
	MOV	#14, W11
	MOV	#1, W0
	PUSH	W0
	CALL	_UART1_Init_Advanced
	SUB	#2, W15
;NewDesign_events_code.c,35 :: 		Delay_ms(150);
	MOV	#33, W8
	MOV	#2867, W7
L_initCommunication0:
	DEC	W7
	BRA NZ	L_initCommunication0
	DEC	W8
	BRA NZ	L_initCommunication0
;NewDesign_events_code.c,36 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,37 :: 		U1STA.OERR=0;  //reset buffer
	BCLR	U1STA, #1
;NewDesign_events_code.c,38 :: 		IPC2.B14=1;
	BSET	IPC2, #14
;NewDesign_events_code.c,39 :: 		IPC2.B13=0;
	BCLR	IPC2, #13
;NewDesign_events_code.c,40 :: 		IPC2.B12=0;
	BCLR	IPC2, #12
;NewDesign_events_code.c,42 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,43 :: 		IEC0.B11=1;//enable interrput
	BSET	IEC0, #11
;NewDesign_events_code.c,45 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initCommunication2:
	DEC	W7
	BRA NZ	L_initCommunication2
	DEC	W8
	BRA NZ	L_initCommunication2
	NOP
	NOP
;NewDesign_events_code.c,49 :: 		_SPI_PRESCALE_PRI_16,
	MOV	#1, W13
;NewDesign_events_code.c,48 :: 		_SPI_PRESCALE_SEC_8,
	CLR	W12
;NewDesign_events_code.c,47 :: 		_SPI_8_BIT,
	CLR	W11
;NewDesign_events_code.c,46 :: 		SPI2_Init_Advanced(_SPI_MASTER,//this has to be middle,low,2idle or it loses last bit
	MOV	#32, W10
;NewDesign_events_code.c,53 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,52 :: 		_SPI_CLK_IDLE_LOW,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,51 :: 		_SPI_DATA_SAMPLE_MIDDLE,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,50 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,53 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;NewDesign_events_code.c,54 :: 		SPI_Set_Active(SPI1_Read, SPI1_Write);
	MOV	#lo_addr(_SPI1_Write), W11
	MOV	#lo_addr(_SPI1_Read), W10
	CALL	_SPI_Set_Active
;NewDesign_events_code.c,55 :: 		for(i=0;i<30;i++){
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initCommunication4:
; i start address is: 4 (W2)
	CP	W2, #30
	BRA LTU	L__initCommunication140
	GOTO	L_initCommunication5
L__initCommunication140:
;NewDesign_events_code.c,56 :: 		smpbuff[i]=0x00;
	MOV	#lo_addr(_smpbuff), W0
	ADD	W0, W2, W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,55 :: 		for(i=0;i<30;i++){
	INC	W2
;NewDesign_events_code.c,57 :: 		}
; i end address is: 4 (W2)
	GOTO	L_initCommunication4
L_initCommunication5:
;NewDesign_events_code.c,59 :: 		}
L_end_initCommunication:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initCommunication

_SPI2Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;NewDesign_events_code.c,60 :: 		void SPI2Interrupt() iv IVT_ADDR_SPI2INTERRUPT{
;NewDesign_events_code.c,62 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;NewDesign_events_code.c,63 :: 		temp=SPI2BUF;
; temp start address is: 4 (W2)
	MOV	SPI2BUF, W2
;NewDesign_events_code.c,65 :: 		GPSdataReceived[GPSdataReceivedPtr++]=temp;
	MOV	#lo_addr(_GPSdataReceived), W1
	MOV	#lo_addr(_GPSdataReceivedPtr), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
	MOV	_GPSdataReceivedPtr, W0
	INC	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,66 :: 		if(temp==0x00){
	CP.B	W2, #0
	BRA Z	L__SPI2Interrupt142
	GOTO	L_SPI2Interrupt7
L__SPI2Interrupt142:
; temp end address is: 4 (W2)
;NewDesign_events_code.c,68 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,70 :: 		return;
	GOTO	L_end_SPI2Interrupt
;NewDesign_events_code.c,71 :: 		}
L_SPI2Interrupt7:
;NewDesign_events_code.c,72 :: 		if(GPSdataReceivedPtr==37){GPSdataReceivedPtr=0;GPSdataReceived[37]=0x00;}
	MOV	#37, W1
	MOV	#lo_addr(_GPSdataReceivedPtr), W0
	CP	W1, [W0]
	BRA Z	L__SPI2Interrupt143
	GOTO	L_SPI2Interrupt8
L__SPI2Interrupt143:
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
	MOV	#lo_addr(_GPSdataReceived+37), W1
	CLR	W0
	MOV.B	W0, [W1]
L_SPI2Interrupt8:
;NewDesign_events_code.c,75 :: 		}
L_end_SPI2Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _SPI2Interrupt

_smpInterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;NewDesign_events_code.c,76 :: 		void smpInterrupt() iv IVT_ADDR_U1RXINTERRUPT{//UART1 from smp chip
;NewDesign_events_code.c,77 :: 		unsigned char temp1=0;
	PUSH	W10
	PUSH	W11
;NewDesign_events_code.c,79 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,80 :: 		temp1=U1RXREG;
; temp1 start address is: 4 (W2)
	MOV	U1RXREG, W2
;NewDesign_events_code.c,82 :: 		if(temp1==0xAA){
	MOV.B	#170, W0
	CP.B	W2, W0
	BRA Z	L__smpInterrupt145
	GOTO	L_smpInterrupt9
L__smpInterrupt145:
;NewDesign_events_code.c,83 :: 		count++;
	MOV	#1, W1
	MOV	#lo_addr(smpInterrupt_count_L0), W0
	ADD	W1, [W0], [W0]
;NewDesign_events_code.c,84 :: 		if(count==8){
	MOV	smpInterrupt_count_L0, W0
	CP	W0, #8
	BRA Z	L__smpInterrupt146
	GOTO	L_smpInterrupt10
L__smpInterrupt146:
; temp1 end address is: 4 (W2)
;NewDesign_events_code.c,85 :: 		count=0;
	CLR	W0
	MOV	W0, smpInterrupt_count_L0
;NewDesign_events_code.c,86 :: 		laserplotflag=0;
	CLR	W0
	MOV	W0, _laserplotflag
;NewDesign_events_code.c,87 :: 		Incplotflag=0;
	CLR	W0
	MOV	W0, _Incplotflag
;NewDesign_events_code.c,88 :: 		handshakeBUF=1;
	MOV	#1, W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,89 :: 		return;
	GOTO	L_end_smpInterrupt
;NewDesign_events_code.c,90 :: 		}
L_smpInterrupt10:
;NewDesign_events_code.c,91 :: 		}
; temp1 start address is: 4 (W2)
	GOTO	L_smpInterrupt11
L_smpInterrupt9:
;NewDesign_events_code.c,93 :: 		count=0;
	CLR	W0
	MOV	W0, smpInterrupt_count_L0
;NewDesign_events_code.c,94 :: 		handshakeBUF=0;
	CLR	W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,95 :: 		}
L_smpInterrupt11:
;NewDesign_events_code.c,99 :: 		if(smpflag){//in sampling mode-----4laz-4enc-4pitch-4roll-6acc
	MOV	#lo_addr(_smpflag), W0
	CP0	[W0]
	BRA NZ	L__smpInterrupt147
	GOTO	L_smpInterrupt12
L__smpInterrupt147:
;NewDesign_events_code.c,100 :: 		smpbuff[smpbuffIterator++]=temp1;
	MOV	#lo_addr(_smpbuff), W1
	MOV	#lo_addr(_smpbuffIterator), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
	MOV	_smpbuffIterator, W0
	INC	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,101 :: 		if(smpbuffIterator==22){
	MOV	_smpbuffIterator, W0
	CP	W0, #22
	BRA Z	L__smpInterrupt148
	GOTO	L_smpInterrupt13
L__smpInterrupt148:
;NewDesign_events_code.c,102 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,103 :: 		smpbuffReady=1;
	MOV	#1, W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,104 :: 		}
L_smpInterrupt13:
;NewDesign_events_code.c,105 :: 		}
L_smpInterrupt12:
;NewDesign_events_code.c,106 :: 		if(loggingflag){//in logging mode-----4laz-4pitch-4roll-3t-4enc
	MOV	#lo_addr(_loggingflag), W0
	CP0	[W0]
	BRA NZ	L__smpInterrupt149
	GOTO	L_smpInterrupt14
L__smpInterrupt149:
;NewDesign_events_code.c,107 :: 		smpbuff[smpbuffIterator++]=temp1;
	MOV	#lo_addr(_smpbuff), W1
	MOV	#lo_addr(_smpbuffIterator), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; temp1 end address is: 4 (W2)
	MOV	_smpbuffIterator, W0
	INC	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,108 :: 		if(smpbuffIterator==19){
	MOV	_smpbuffIterator, W0
	CP	W0, #19
	BRA Z	L__smpInterrupt150
	GOTO	L_smpInterrupt15
L__smpInterrupt150:
;NewDesign_events_code.c,109 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,112 :: 		speed=CalculateSpeed(&smpbuff[12],&smpbuff[15]);
	MOV	#lo_addr(_smpbuff+15), W11
	MOV	#lo_addr(_smpbuff+12), W10
	CALL	_CalculateSpeed
	MOV	W0, _speed
	MOV	W1, _speed+2
;NewDesign_events_code.c,113 :: 		smpbuffReady=1;
	MOV	#1, W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,114 :: 		}
L_smpInterrupt15:
;NewDesign_events_code.c,116 :: 		}
L_smpInterrupt14:
;NewDesign_events_code.c,119 :: 		}
L_end_smpInterrupt:
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _smpInterrupt

_calculateRQEI:

;NewDesign_events_code.c,120 :: 		unsigned long calculateRQEI(unsigned char *buff){
;NewDesign_events_code.c,125 :: 		d=*buff;
; d start address is: 0 (W0)
	ZE	[W10], W0
	CLR	W1
;NewDesign_events_code.c,126 :: 		d=d<<24;
	SL	W0, #8, W7
	CLR	W6
; d end address is: 0 (W0)
;NewDesign_events_code.c,127 :: 		c=*(buff+1);
	ADD	W10, #1, W0
; c start address is: 0 (W0)
	ZE	[W0], W0
	CLR	W1
;NewDesign_events_code.c,128 :: 		c=c<<16;
	MOV	W0, W5
	CLR	W4
; c end address is: 0 (W0)
;NewDesign_events_code.c,129 :: 		b=*(buff+2);
	ADD	W10, #2, W0
; b start address is: 2 (W1)
	ZE	[W0], W1
;NewDesign_events_code.c,130 :: 		b=b<<8;
	SL	W1, #8, W0
; b end address is: 2 (W1)
;NewDesign_events_code.c,131 :: 		d=d|c|b|(*(buff+3));
	IOR	W6, W4, W2
	IOR	W7, W5, W3
	CLR	W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
	ADD	W10, #3, W0
	ZE	[W0], W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
;NewDesign_events_code.c,132 :: 		return d;
;NewDesign_events_code.c,134 :: 		}
L_end_calculateRQEI:
	RETURN
; end of _calculateRQEI

_calculateLaz:

;NewDesign_events_code.c,135 :: 		float calculateLaz(unsigned char *buff){
;NewDesign_events_code.c,136 :: 		return (((*buff)<<12)|((*(buff+1))<<8)|((*(buff+2))<<4)|((*(buff+3))))/16463f*19.5f+5f;
	MOV.B	[W10], W0
	ZE	W0, W0
	SL	W0, #12, W1
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W0
	IOR	W1, W0, W1
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #4, W0
	IOR	W1, W0, W1
	ADD	W10, #3, W0
	ZE	[W0], W0
	IOR	W1, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#40448, W2
	MOV	#18048, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16796, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16544, W3
	CALL	__AddSub_FP
;NewDesign_events_code.c,138 :: 		}
L_end_calculateLaz:
	RETURN
; end of _calculateLaz

_CalculateAngle:

;NewDesign_events_code.c,140 :: 		float CalculateAngle(unsigned char *angleBuff){
;NewDesign_events_code.c,144 :: 		a=angleBuff[0];
	MOV.B	[W10], W0
	ZE	W0, W0
	CLR	W1
	MOV	W0, CalculateAngle_a_L0
	MOV	W1, CalculateAngle_a_L0+2
;NewDesign_events_code.c,145 :: 		b=angleBuff[1];
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CLR	W1
	MOV	W0, CalculateAngle_b_L0
	MOV	W1, CalculateAngle_b_L0+2
;NewDesign_events_code.c,146 :: 		c=angleBuff[2];
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	W0, CalculateAngle_c_L0
;NewDesign_events_code.c,148 :: 		if(a!=0xff){
	MOV	#255, W1
	MOV	#0, W2
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CalculateAngle154
	GOTO	L_CalculateAngle16
L__CalculateAngle154:
;NewDesign_events_code.c,149 :: 		return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3]))/1000.0);
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	MOV.D	[W0], W4
	SL	W4, #8, W5
	CLR	W4
	MOV	#lo_addr(CalculateAngle_b_L0), W2
	MOV	[W2], W1
	CLR	W0
	IOR	W4, W0, W2
	IOR	W5, W1, W3
	MOV	CalculateAngle_c_L0, W0
	SL	W0, #8, W0
	CLR	W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
	ADD	W10, #3, W0
	ZE	[W0], W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	GOTO	L_end_CalculateAngle
;NewDesign_events_code.c,150 :: 		}
L_CalculateAngle16:
;NewDesign_events_code.c,151 :: 		else{return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3])-0xffffffff))/1000.0;}
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	MOV.D	[W0], W4
	SL	W4, #8, W5
	CLR	W4
	MOV	#lo_addr(CalculateAngle_b_L0), W2
	MOV	[W2], W1
	CLR	W0
	IOR	W4, W0, W2
	IOR	W5, W1, W3
	MOV	CalculateAngle_c_L0, W0
	SL	W0, #8, W0
	CLR	W1
	IOR	W2, W0, W4
	IOR	W3, W1, W5
	ADD	W10, #3, W0
	ZE	[W0], W2
	CLR	W3
	MOV	#65535, W0
	MOV	#65535, W1
	SUB	W2, W0, W0
	SUBB	W3, W1, W1
	IOR	W4, W0, W0
	IOR	W5, W1, W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
;NewDesign_events_code.c,152 :: 		}
L_end_CalculateAngle:
	RETURN
; end of _CalculateAngle

_CalculateAcc:

;NewDesign_events_code.c,153 :: 		float CalculateAcc(unsigned char *accBuff){
;NewDesign_events_code.c,155 :: 		temp=accBuff[0];
; temp start address is: 0 (W0)
	ZE	[W10], W0
;NewDesign_events_code.c,156 :: 		temp=temp<<8;
	SL	W0, #8, W1
; temp end address is: 0 (W0)
;NewDesign_events_code.c,157 :: 		temp=temp|accBuff[1];
	ADD	W10, #1, W0
	ZE	[W0], W0
	IOR	W1, W0, W0
;NewDesign_events_code.c,158 :: 		return  temp*0.0078;
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#38692, W2
	MOV	#15359, W3
	CALL	__Mul_FP
;NewDesign_events_code.c,159 :: 		}
L_end_CalculateAcc:
	RETURN
; end of _CalculateAcc

_calculateTime:

;NewDesign_events_code.c,161 :: 		unsigned long calculateTime(unsigned char *tBuff){
;NewDesign_events_code.c,162 :: 		return  (((unsigned long)tBuff[0])<<16)|(tBuff[1]<<8)|(tBuff[2]);
	ZE	[W10], W0
	CLR	W1
	MOV	W0, W3
	CLR	W2
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W0
	CLR	W1
	IOR	W2, W0, W2
	IOR	W3, W1, W3
	ADD	W10, #2, W0
	ZE	[W0], W0
	CLR	W1
	IOR	W2, W0, W0
	IOR	W3, W1, W1
;NewDesign_events_code.c,163 :: 		}
L_end_calculateTime:
	RETURN
; end of _calculateTime

_CalculateSpeed:
	LNK	#8

;NewDesign_events_code.c,165 :: 		float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff){//M/S
;NewDesign_events_code.c,166 :: 		float speedtemp=0;
;NewDesign_events_code.c,167 :: 		newPos=calculateRQEI(encBuff);
	PUSH	W10
	MOV	W11, W10
	CALL	_calculateRQEI
	POP	W10
	MOV	W0, _newPos
	MOV	W1, _newPos+2
;NewDesign_events_code.c,168 :: 		newT=calculateTime(tBuff);
	CALL	_calculateTime
	MOV	W0, _newT
	MOV	W1, _newT+2
;NewDesign_events_code.c,169 :: 		speedtemp=(newPos-oldPos)/cycle*1.2267;  //distance traveled in meters= ticks/(ticks/cycle)*(meters/cycle)
	MOV	_newPos, W3
	MOV	_newPos+2, W4
	MOV	#lo_addr(_oldPos), W2
	SUB	W3, [W2++], W0
	SUBB	W4, [W2--], W1
	CALL	__Long2Float
	MOV	_cycle, W2
	MOV	_cycle+2, W3
	CALL	__Div_FP
	MOV	#1153, W2
	MOV	#16285, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;NewDesign_events_code.c,170 :: 		speedtemp=speedtemp/((newT-oldT)/1000.0);
	MOV	_newT, W3
	MOV	_newT+2, W4
	MOV	#lo_addr(_oldT), W2
	SUB	W3, [W2++], W0
	SUBB	W4, [W2--], W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	[W14+4], W2
	MOV	[W14+6], W3
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	CALL	__Div_FP
;NewDesign_events_code.c,171 :: 		oldT=newT;
	MOV	_newT, W2
	MOV	_newT+2, W3
	MOV	W2, _oldT
	MOV	W3, _oldT+2
;NewDesign_events_code.c,172 :: 		oldPos=newPos;
	MOV	_newPos, W2
	MOV	_newPos+2, W3
	MOV	W2, _oldPos
	MOV	W3, _oldPos+2
;NewDesign_events_code.c,175 :: 		return speedtemp;
;NewDesign_events_code.c,176 :: 		}
L_end_CalculateSpeed:
	ULNK
	RETURN
; end of _CalculateSpeed

_Initplot:
	LNK	#0

;NewDesign_events_code.c,177 :: 		void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf){//prepare plotting routine
; Ybase start address is: 2 (W1)
	MOV	[W14-8], W1
; lineResolution start address is: 4 (W2)
	MOV	[W14-10], W2
; pf start address is: 6 (W3)
	MOV	[W14-12], W3
;NewDesign_events_code.c,178 :: 		int i=0;
;NewDesign_events_code.c,180 :: 		lines[0]->First_Point_X=Xbase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #6, W0
	MOV	W13, [W0]
;NewDesign_events_code.c,181 :: 		lines[0]->Second_Point_X=Xbase+lineResolution;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #10, W0
	ADD	W13, W2, [W0]
;NewDesign_events_code.c,182 :: 		lines[0]->First_Point_Y=Ybase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #8, W0
	MOV	W1, [W0]
;NewDesign_events_code.c,183 :: 		lines[0]->Second_Point_Y=Ybase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #12, W0
	MOV	W1, [W0]
; Ybase end address is: 2 (W1)
;NewDesign_events_code.c,185 :: 		lines[0]->visible=1;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #3, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,186 :: 		for(i=1;i<numberOfLines;i++){ //make a flat line
; i start address is: 8 (W4)
	MOV	#1, W4
; lineResolution end address is: 4 (W2)
; pf end address is: 6 (W3)
; i end address is: 8 (W4)
	MOV	W2, W5
L_Initplot18:
; i start address is: 8 (W4)
; lineResolution start address is: 10 (W5)
; pf start address is: 6 (W3)
; lineResolution start address is: 10 (W5)
; lineResolution end address is: 10 (W5)
	CP	W4, W12
	BRA LTU	L__Initplot159
	GOTO	L_Initplot19
L__Initplot159:
; lineResolution end address is: 10 (W5)
;NewDesign_events_code.c,187 :: 		lines[i]->First_Point_X=lines[i-1]->Second_Point_X;
; lineResolution start address is: 10 (W5)
	MOV	W4, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #6, W2
	SUB	W4, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #10, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,188 :: 		lines[i]->First_Point_Y=lines[i-1]->Second_Point_Y;
	MOV	W4, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W2
	SUB	W4, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,189 :: 		lines[i]->Second_Point_X=lines[i]->First_Point_X+lineResolution;
	MOV	W4, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #10, W1
	ADD	W0, #6, W0
	MOV	[W0], W0
	ADD	W0, W5, [W1]
;NewDesign_events_code.c,190 :: 		lines[i]->Second_Point_Y=lines[i]->First_Point_Y;
	MOV	W4, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W1
	ADD	W0, #8, W0
	MOV	[W0], [W1]
;NewDesign_events_code.c,191 :: 		lines[i]->visible=1;
	MOV	W4, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W10, W0, W0
	ADDC	W11, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #3, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,186 :: 		for(i=1;i<numberOfLines;i++){ //make a flat line
	INC	W4
;NewDesign_events_code.c,192 :: 		}
; lineResolution end address is: 10 (W5)
; i end address is: 8 (W4)
	GOTO	L_Initplot18
L_Initplot19:
;NewDesign_events_code.c,193 :: 		*pf=1;//set the plotflag and get ready to plot
	MOV	#1, W0
	MOV	W0, [W3]
; pf end address is: 6 (W3)
;NewDesign_events_code.c,194 :: 		DrawScreen(&ProfilingScreen);
	PUSH.D	W12
	PUSH.D	W10
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
	POP.D	W10
	POP.D	W12
;NewDesign_events_code.c,195 :: 		}
L_end_Initplot:
	ULNK
	RETURN
; end of _Initplot

_addData:
	LNK	#0

;NewDesign_events_code.c,196 :: 		void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines){//shifts plots and adds a new line
; lines start address is: 6 (W3)
	MOV	[W14-10], W3
	MOV	[W14-8], W4
;NewDesign_events_code.c,197 :: 		int i=0;
;NewDesign_events_code.c,198 :: 		if(*pf){
	MOV	[W11], W0
	CP0	W0
	BRA NZ	L__addData161
	GOTO	L_addData21
L__addData161:
;NewDesign_events_code.c,199 :: 		for(i=0;i<numberOfLines-1;i++){ //shift all lines except the last line
; i start address is: 10 (W5)
	CLR	W5
; lines end address is: 6 (W3)
; i end address is: 10 (W5)
L_addData22:
; i start address is: 10 (W5)
; lines start address is: 6 (W3)
	SUB	W13, #1, W0
	CP	W5, W0
	BRA LTU	L__addData162
	GOTO	L_addData23
L__addData162:
;NewDesign_events_code.c,200 :: 		lines[i]->First_Point_Y=lines[i+1]->First_Point_Y;
	MOV	W5, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W2
	ADD	W5, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,201 :: 		lines[i]->Second_Point_Y=lines[i+1]->Second_Point_Y;
	MOV	W5, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W2
	ADD	W5, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,199 :: 		for(i=0;i<numberOfLines-1;i++){ //shift all lines except the last line
	INC	W5
;NewDesign_events_code.c,202 :: 		}
; i end address is: 10 (W5)
	GOTO	L_addData22
L_addData23:
;NewDesign_events_code.c,203 :: 		lines[numberOfLines-1]->First_Point_Y=lines[numberOfLines-2]->Second_Point_Y;
	SUB	W13, #1, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W2
	SUB	W13, #2, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,204 :: 		lines[numberOfLines-1]->Second_Point_Y=Ybase+newData;  //new data plot
	SUB	W13, #1, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
; lines end address is: 6 (W3)
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	ADD	W12, W10, [W0]
;NewDesign_events_code.c,205 :: 		}
L_addData21:
;NewDesign_events_code.c,206 :: 		}
L_end_addData:
	ULNK
	RETURN
; end of _addData

_sendCommandToCamChip:

;NewDesign_events_code.c,207 :: 		void sendCommandToCamChip(unsigned char* name,unsigned char size){
;NewDesign_events_code.c,209 :: 		unsigned int i=0;
;NewDesign_events_code.c,212 :: 		SPI2BUF=(0x53);
	MOV	#83, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,215 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip25:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip25
	NOP
	NOP
;NewDesign_events_code.c,216 :: 		for(i=0;i<size;i++){
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_sendCommandToCamChip27:
; i start address is: 2 (W1)
	ZE	W11, W0
	CP	W1, W0
	BRA LTU	L__sendCommandToCamChip164
	GOTO	L_sendCommandToCamChip28
L__sendCommandToCamChip164:
;NewDesign_events_code.c,217 :: 		SPI2BUF=(name[i]);
	ADD	W10, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,218 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip30:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip30
	NOP
	NOP
;NewDesign_events_code.c,216 :: 		for(i=0;i<size;i++){
	INC	W1
;NewDesign_events_code.c,219 :: 		}
; i end address is: 2 (W1)
	GOTO	L_sendCommandToCamChip27
L_sendCommandToCamChip28:
;NewDesign_events_code.c,220 :: 		SPI2BUF=(0xE4);//end of name
	MOV	#228, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,221 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip32:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip32
	NOP
	NOP
;NewDesign_events_code.c,222 :: 		SPI2BUF=0x3B;//enable GPS output
	MOV	#59, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,223 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_sendCommandToCamChip34:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip34
	DEC	W8
	BRA NZ	L_sendCommandToCamChip34
	NOP
	NOP
;NewDesign_events_code.c,224 :: 		SPI2BUF=(0x43);//start logging mode
	MOV	#67, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,225 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_sendCommandToCamChip36:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip36
	DEC	W8
	BRA NZ	L_sendCommandToCamChip36
	NOP
	NOP
;NewDesign_events_code.c,227 :: 		}
L_end_sendCommandToCamChip:
	RETURN
; end of _sendCommandToCamChip

_sendNameToSamChip:

;NewDesign_events_code.c,228 :: 		void sendNameToSamChip(unsigned char* name,unsigned char size){
;NewDesign_events_code.c,229 :: 		unsigned int i=0;
;NewDesign_events_code.c,230 :: 		UART1_Write(0xE3);//start of name
	PUSH	W10
	MOV	#227, W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,231 :: 		for(i=0;i<size;i++){
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_sendNameToSamChip38:
; i start address is: 2 (W1)
	ZE	W11, W0
	CP	W1, W0
	BRA LTU	L__sendNameToSamChip166
	GOTO	L_sendNameToSamChip39
L__sendNameToSamChip166:
;NewDesign_events_code.c,232 :: 		UART1_Write(name[i]);
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,231 :: 		for(i=0;i<size;i++){
	INC	W1
;NewDesign_events_code.c,233 :: 		}
; i end address is: 2 (W1)
	GOTO	L_sendNameToSamChip38
L_sendNameToSamChip39:
;NewDesign_events_code.c,234 :: 		UART1_Write(0xB5);//end of name
	PUSH	W10
	MOV	#181, W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,235 :: 		}
L_end_sendNameToSamChip:
	RETURN
; end of _sendNameToSamChip

_checkFileName:

;NewDesign_events_code.c,237 :: 		void checkFileName(){
;NewDesign_events_code.c,238 :: 		if(strcmp(EveButtonFNfilename_Caption,oldname)==0){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_oldname), W11
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__checkFileName168
	GOTO	L_checkFileName41
L__checkFileName168:
;NewDesign_events_code.c,239 :: 		EveButtonFNConfirm.Active=0;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,240 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,241 :: 		}
	GOTO	L_checkFileName42
L_checkFileName41:
;NewDesign_events_code.c,243 :: 		EveButtonFNConfirm.Active=1;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,244 :: 		EveButtonFNConfirm.Color=0x3666;
	MOV	#13926, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,245 :: 		}
L_checkFileName42:
;NewDesign_events_code.c,246 :: 		}
L_end_checkFileName:
	POP	W11
	POP	W10
	RETURN
; end of _checkFileName

_EveButtonSmpStartSamplingOnClick:

;NewDesign_events_code.c,257 :: 		void EveButtonSmpStartSamplingOnClick() {
;NewDesign_events_code.c,258 :: 		unsigned int i=0;
	PUSH	W10
;NewDesign_events_code.c,259 :: 		unsigned int b=0;
;NewDesign_events_code.c,263 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,264 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,265 :: 		EveButtonSmpConfigureMotor.color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonSmpConfigureMotor+14
;NewDesign_events_code.c,266 :: 		EveButtonSmpConfigureMotor.active=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,269 :: 		EveButtonSmpStartSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,270 :: 		EveButtonSmpStartSampling.Active=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,271 :: 		EveButtonSmpStopSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,272 :: 		EveButtonSmpStopSampling.Active=1;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,273 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,275 :: 		smpflag=1;
	MOV	#1, W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,276 :: 		SPI2STAT.B4=0;//set interrupt mode
	BCLR	SPI2STAT, #4
;NewDesign_events_code.c,277 :: 		SPI2STAT.B3=0;
	BCLR	SPI2STAT, #3
;NewDesign_events_code.c,278 :: 		SPI2STAT.B2=1;
	BSET	SPI2STAT, #2
;NewDesign_events_code.c,279 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;NewDesign_events_code.c,280 :: 		IPC8.B6=1;
	BSET	IPC8, #6
;NewDesign_events_code.c,281 :: 		IPC8.B5=0;
	BCLR	IPC8, #5
;NewDesign_events_code.c,282 :: 		IPC8.B4=0;
	BCLR	IPC8, #4
;NewDesign_events_code.c,283 :: 		IEC2.B1=1;//enable interrupt
	BSET	IEC2, #1
;NewDesign_events_code.c,285 :: 		SPI2BUF=0x3B;//tell camchip to enale GPS output
	MOV	#59, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,286 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick43:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick43
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick43
	NOP
	NOP
;NewDesign_events_code.c,287 :: 		SPI2BUF=0x31;//tell CamChip to load buffer
	MOV	#49, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,288 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick45:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick45
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick45
	NOP
	NOP
;NewDesign_events_code.c,290 :: 		UART1_Write(0x31);
	MOV	#49, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,291 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick47:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick47
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick47
	NOP
	NOP
;NewDesign_events_code.c,292 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,293 :: 		while(smpflag){
L_EveButtonSmpStartSamplingOnClick49:
	MOV	#lo_addr(_smpflag), W0
	CP0	[W0]
	BRA NZ	L__EveButtonSmpStartSamplingOnClick170
	GOTO	L_EveButtonSmpStartSamplingOnClick50
L__EveButtonSmpStartSamplingOnClick170:
;NewDesign_events_code.c,296 :: 		for(b=0;b<33;b++){
; b start address is: 2 (W1)
	CLR	W1
; b end address is: 2 (W1)
L_EveButtonSmpStartSamplingOnClick51:
; b start address is: 2 (W1)
	MOV	#33, W0
	CP	W1, W0
	BRA LTU	L__EveButtonSmpStartSamplingOnClick171
	GOTO	L_EveButtonSmpStartSamplingOnClick52
L__EveButtonSmpStartSamplingOnClick171:
;NewDesign_events_code.c,297 :: 		SPI2BUF=0x31;//continuously ask for a byte and GPS will be updated automatically
	MOV	#49, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,298 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonSmpStartSamplingOnClick54:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick54
	NOP
	NOP
;NewDesign_events_code.c,296 :: 		for(b=0;b<33;b++){
	INC	W1
;NewDesign_events_code.c,299 :: 		}
; b end address is: 2 (W1)
	GOTO	L_EveButtonSmpStartSamplingOnClick51
L_EveButtonSmpStartSamplingOnClick52:
;NewDesign_events_code.c,300 :: 		SPI2BUF=0x32;//tell camchip reset GPS output buffptr
	MOV	#50, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,301 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,303 :: 		ProcessVTFTStack();
	CALL	_ProcessVTFTStack
;NewDesign_events_code.c,304 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#44645, W7
L_EveButtonSmpStartSamplingOnClick56:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick56
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick56
	NOP
	NOP
	NOP
	NOP
;NewDesign_events_code.c,306 :: 		GPSdataReceived[33]=0x00;
	MOV	#lo_addr(_GPSdataReceived+33), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,308 :: 		if(smpbuffReady){
	MOV	#lo_addr(_smpbuffReady), W0
	CP0	[W0]
	BRA NZ	L__EveButtonSmpStartSamplingOnClick172
	GOTO	L_EveButtonSmpStartSamplingOnClick58
L__EveButtonSmpStartSamplingOnClick172:
;NewDesign_events_code.c,309 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,314 :: 		sprintf(EveTextLaserSmp.Caption, "%.4f", calculateLaz(&smpbuff));
	MOV	#lo_addr(_smpbuff), W10
	CALL	_calculateLaz
	PUSH.D	W0
	MOV	#lo_addr(?lstr_1_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextLaserSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,315 :: 		sprintf(EveTextEncoderSamp.Caption, "%+ld",calculateRQEI(&smpbuff[4]));
	MOV	#lo_addr(_smpbuff+4), W10
	CALL	_calculateRQEI
	PUSH.D	W0
	MOV	#lo_addr(?lstr_2_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextEncoderSamp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,316 :: 		sprintf(EveTextPitchSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[8]));
	MOV	#lo_addr(_smpbuff+8), W10
	CALL	_CalculateAngle
	PUSH.D	W0
	MOV	#lo_addr(?lstr_3_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextPitchSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,317 :: 		sprintf(EveTextRollSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[12]));
	MOV	#lo_addr(_smpbuff+12), W10
	CALL	_CalculateAngle
	PUSH.D	W0
	MOV	#lo_addr(?lstr_4_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextRollSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,321 :: 		EveTextGPSSmp.Caption=GPSdataReceived+1;
	MOV	#lo_addr(_GPSdataReceived+1), W0
	MOV	W0, _EveTextGPSSmp+14
;NewDesign_events_code.c,323 :: 		sprintf(EveTextAccx_Caption, "%+.2f", CalculateAcc(&smpbuff[16]));
	MOV	#lo_addr(_smpbuff+16), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_5_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccx_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,324 :: 		sprintf(EveTextAccy_Caption, "%+.2f", CalculateAcc(&smpbuff[18]));
	MOV	#lo_addr(_smpbuff+18), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_6_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccy_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,325 :: 		sprintf(EveTextAccz_Caption, "%+.2f", CalculateAcc(&smpbuff[20]));
	MOV	#lo_addr(_smpbuff+20), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_7_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccz_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,327 :: 		UART1_Write(0x31);//continous request
	MOV	#49, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,328 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,329 :: 		}
L_EveButtonSmpStartSamplingOnClick58:
;NewDesign_events_code.c,332 :: 		}
	GOTO	L_EveButtonSmpStartSamplingOnClick49
L_EveButtonSmpStartSamplingOnClick50:
;NewDesign_events_code.c,333 :: 		EveButtonSmpStartSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,334 :: 		EveButtonSmpStartSampling.Active=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,335 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,336 :: 		EveButtonSmpStopSampling.Active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,338 :: 		SPI2BUF=0x22;  //tell came chip to stop sending GPS packets
	MOV	#34, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,341 :: 		EveButtonSmpConfigureMotor.color=0xA865;
	MOV	#43109, W0
	MOV	W0, _EveButtonSmpConfigureMotor+14
;NewDesign_events_code.c,342 :: 		EveButtonSmpConfigureMotor.active=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,343 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,344 :: 		SPI2BUF=0x2F;//tell camchip to disable GPS output
	MOV	#47, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,345 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_EveButtonSmpStartSamplingOnClick59:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick59
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick59
	NOP
	NOP
;NewDesign_events_code.c,346 :: 		IEC2.B1=0;//disable SPI2 int
	BCLR	IEC2, #1
;NewDesign_events_code.c,347 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,348 :: 		smpbuffIterator=0;//reset ptr after sampling mode is finished
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,349 :: 		smpbuffReady=0;//reset buffer ready flag
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,350 :: 		}
L_end_EveButtonSmpStartSamplingOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpStartSamplingOnClick

_EveButtonSmpStopSamplingOnClick:

;NewDesign_events_code.c,352 :: 		void EveButtonSmpStopSamplingOnClick() {
;NewDesign_events_code.c,353 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,354 :: 		smpflag=0;
	CLR	W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,356 :: 		}
L_end_EveButtonSmpStopSamplingOnClick:
	RETURN
; end of _EveButtonSmpStopSamplingOnClick

_EveButtonSplashInitOnClick:

;NewDesign_events_code.c,358 :: 		void EveButtonSplashInitOnClick() {
;NewDesign_events_code.c,359 :: 		int i=0;
	PUSH	W10
;NewDesign_events_code.c,362 :: 		EveButtonSplashInit.visible=0;
	MOV	#lo_addr(_EveButtonSplashInit+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,363 :: 		EveProgressBar1.visible=1;
	MOV	#lo_addr(_EveProgressBar1+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,364 :: 		EveTextSplashScreenStatus.visible=1;
	MOV	#lo_addr(_EveTextSplashScreenStatus+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,366 :: 		mapPins();
	CALL	_mapPins
;NewDesign_events_code.c,367 :: 		TRISB.B14=0;
	BCLR	TRISB, #14
;NewDesign_events_code.c,368 :: 		LATB.B14=0;
	BCLR	LATB, #14
;NewDesign_events_code.c,369 :: 		initCommunication();
	CALL	_initCommunication
;NewDesign_events_code.c,372 :: 		for(i=0;i<100;i++){EveProgressBar1.value=i;DrawScreen(&SplashScreen);Delay_ms(200);}
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_EveButtonSplashInitOnClick61:
; i start address is: 2 (W1)
	MOV	#100, W0
	CP	W1, W0
	BRA LT	L__EveButtonSplashInitOnClick175
	GOTO	L_EveButtonSplashInitOnClick62
L__EveButtonSplashInitOnClick175:
	MOV	W1, _EveProgressBar1+18
	PUSH	W1
	MOV	#lo_addr(_SplashScreen), W10
	CALL	_DrawScreen
	POP	W1
	MOV	#43, W8
	MOV	#47513, W7
L_EveButtonSplashInitOnClick64:
	DEC	W7
	BRA NZ	L_EveButtonSplashInitOnClick64
	DEC	W8
	BRA NZ	L_EveButtonSplashInitOnClick64
	INC	W1
; i end address is: 2 (W1)
	GOTO	L_EveButtonSplashInitOnClick61
L_EveButtonSplashInitOnClick62:
;NewDesign_events_code.c,373 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,374 :: 		}
L_end_EveButtonSplashInitOnClick:
	POP	W10
	RETURN
; end of _EveButtonSplashInitOnClick

_EveButtonSmpGotoProfOnClick:

;NewDesign_events_code.c,376 :: 		void EveButtonSmpGotoProfOnClick() {
;NewDesign_events_code.c,377 :: 		EveButtonProfStartProfiling.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,378 :: 		EveButtonProfStartProfiling.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,383 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,384 :: 		}
L_end_EveButtonSmpGotoProfOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpGotoProfOnClick

_EveButtonProfStartProfilingOnClick:
	LNK	#4

;NewDesign_events_code.c,386 :: 		void EveButtonProfStartProfilingOnClick() {
;NewDesign_events_code.c,388 :: 		unsigned char temp=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;NewDesign_events_code.c,391 :: 		strcpy(oldname,EveTextProfFileName_Caption);
	MOV	#lo_addr(_EveTextProfFileName_Caption), W11
	MOV	#lo_addr(_oldname), W10
	CALL	_strcpy
;NewDesign_events_code.c,392 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_EveButtonProfStartProfilingOnClick66:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick66
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick66
;NewDesign_events_code.c,393 :: 		smpflag=0;//not in samp mode
	CLR	W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,394 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,395 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,396 :: 		IEC2.B1=1; //Enable SPI2 Interrupt
	BSET	IEC2, #1
;NewDesign_events_code.c,398 :: 		EveButtonProfStartProfiling.visible=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,399 :: 		EveButtonProfStartProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,400 :: 		EveButtonProfStopProfiling.visible=1;
	MOV	#lo_addr(_EveButtonProfStopProfiling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,401 :: 		EveButtonProfStopProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStopProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,402 :: 		EveToggleProfMode.Active=0; //disable mode selection
	MOV	#lo_addr(_EveToggleProfMode+43), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,406 :: 		sendCommandToCamChip(EveButtonFNfilename.Caption,strlen(EveButtonFNfilename.Caption)+1);
	MOV	_EveButtonFNfilename+22, W10
	CALL	_strlen
	INC	W0
	MOV.B	W0, W11
	MOV	_EveButtonFNfilename+22, W10
	CALL	_sendCommandToCamChip
;NewDesign_events_code.c,408 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,410 :: 		sendNameToSamChip(EveButtonFNfilename_Caption,strlen(EveButtonFNfilename_Caption)+1);
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
	INC	W0
	MOV.B	W0, W11
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_sendNameToSamChip
;NewDesign_events_code.c,417 :: 		Initplot(ProfilingScreen_Lines,25,34,80,8,&laserplotflag);
	MOV	#lo_addr(_ProfilingScreen_Lines), W0
	MOV	#higher_addr(_ProfilingScreen_Lines), W1
	MOV	#34, W13
	MOV	#25, W12
	MOV.D	W0, W10
	MOV	#lo_addr(_laserplotflag), W0
	PUSH	W0
	MOV	#8, W0
	PUSH	W0
	MOV	#80, W0
	PUSH	W0
	CALL	_Initplot
	SUB	#6, W15
;NewDesign_events_code.c,420 :: 		loggingflag=1;//turn on logging mode
	MOV	#1, W0
	MOV	W0, _loggingflag
;NewDesign_events_code.c,421 :: 		if(profilingMode){UART1_Write(0x1C);}
	MOV	#lo_addr(_profilingMode), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick178
	GOTO	L_EveButtonProfStartProfilingOnClick68
L__EveButtonProfStartProfilingOnClick178:
	MOV	#28, W10
	CALL	_UART1_Write
L_EveButtonProfStartProfilingOnClick68:
;NewDesign_events_code.c,422 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick69:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick69
	NOP
	NOP
;NewDesign_events_code.c,423 :: 		UART1_Write(0xA2);//tell smp to start logging
	MOV	#162, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,424 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_EveButtonProfStartProfilingOnClick71:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick71
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick71
	NOP
	NOP
;NewDesign_events_code.c,425 :: 		SPI2BUF=0xAB;//tell cam chip trigger
	MOV	#171, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,427 :: 		while(laserplotflag){
L_EveButtonProfStartProfilingOnClick73:
	MOV	#lo_addr(_laserplotflag), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick179
	GOTO	L_EveButtonProfStartProfilingOnClick74
L__EveButtonProfStartProfilingOnClick179:
;NewDesign_events_code.c,428 :: 		if(smpbuffReady){
	MOV	#lo_addr(_smpbuffReady), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick180
	GOTO	L_EveButtonProfStartProfilingOnClick75
L__EveButtonProfStartProfilingOnClick180:
;NewDesign_events_code.c,429 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,430 :: 		laserMeasurement=CalculateLaz(&smpbuff);
	MOV	#lo_addr(_smpbuff), W10
	CALL	_calculateLaz
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,432 :: 		if(laserMeasurement>12){
	MOV	#0, W2
	MOV	#16704, W3
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick181
	INC.B	W0
L__EveButtonProfStartProfilingOnClick181:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick182
	GOTO	L_EveButtonProfStartProfilingOnClick76
L__EveButtonProfStartProfilingOnClick182:
;NewDesign_events_code.c,433 :: 		laserMeasurement=12;
	MOV	#0, W0
	MOV	#16704, W1
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,434 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick77
L_EveButtonProfStartProfilingOnClick76:
;NewDesign_events_code.c,435 :: 		else if(laserMeasurement<8){
	MOV	#0, W2
	MOV	#16640, W3
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick183
	INC.B	W0
L__EveButtonProfStartProfilingOnClick183:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick184
	GOTO	L_EveButtonProfStartProfilingOnClick78
L__EveButtonProfStartProfilingOnClick184:
;NewDesign_events_code.c,436 :: 		laserMeasurement=8;
	MOV	#0, W0
	MOV	#16640, W1
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,437 :: 		}
L_EveButtonProfStartProfilingOnClick78:
L_EveButtonProfStartProfilingOnClick77:
;NewDesign_events_code.c,445 :: 		addData((laserMeasurement-9)*50,&laserplotflag,24,ProfilingScreen_Lines,25);
	MOV	#lo_addr(_ProfilingScreen_Lines), W0
	MOV	#higher_addr(_ProfilingScreen_Lines), W1
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	MOV	#0, W2
	MOV	#16656, W3
	CALL	__Sub_FP
	MOV	#0, W2
	MOV	#16968, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	[W14+0], W1
	MOV	[W14+2], W2
	MOV	#25, W13
	MOV	#24, W12
	MOV	#lo_addr(_laserplotflag), W11
	MOV	W0, W10
	PUSH	W1
	PUSH	W2
	CALL	_addData
	SUB	#4, W15
;NewDesign_events_code.c,450 :: 		EveGaugeProfSpeed.value=speed*50;
	MOV	_speed, W0
	MOV	_speed+2, W1
	MOV	#0, W2
	MOV	#16968, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _EveGaugeProfSpeed+22
;NewDesign_events_code.c,452 :: 		if(speed>1.99){speed=2;}
	MOV	#47186, W2
	MOV	#16382, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick185
	INC.B	W0
L__EveButtonProfStartProfilingOnClick185:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick186
	GOTO	L_EveButtonProfStartProfilingOnClick79
L__EveButtonProfStartProfilingOnClick186:
	MOV	#0, W0
	MOV	#16384, W1
	MOV	W0, _speed
	MOV	W1, _speed+2
L_EveButtonProfStartProfilingOnClick79:
;NewDesign_events_code.c,453 :: 		if(speed<0.3||speed>1.7){EveGaugeProfSpeed.Color= 0xC800;}
	MOV	#39322, W2
	MOV	#16025, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick187
	INC.B	W0
L__EveButtonProfStartProfilingOnClick187:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick188
	GOTO	L__EveButtonProfStartProfilingOnClick126
L__EveButtonProfStartProfilingOnClick188:
	MOV	#39322, W2
	MOV	#16345, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick189
	INC.B	W0
L__EveButtonProfStartProfilingOnClick189:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick190
	GOTO	L__EveButtonProfStartProfilingOnClick125
L__EveButtonProfStartProfilingOnClick190:
	GOTO	L_EveButtonProfStartProfilingOnClick82
L__EveButtonProfStartProfilingOnClick126:
L__EveButtonProfStartProfilingOnClick125:
	MOV	#51200, W0
	MOV	W0, _EveGaugeProfSpeed+16
	GOTO	L_EveButtonProfStartProfilingOnClick83
L_EveButtonProfStartProfilingOnClick82:
;NewDesign_events_code.c,454 :: 		else{EveGaugeProfSpeed.Color= 0x03DA;  }
	MOV	#986, W0
	MOV	W0, _EveGaugeProfSpeed+16
L_EveButtonProfStartProfilingOnClick83:
;NewDesign_events_code.c,456 :: 		CurrentEnc=calculateRQEI(&smpbuff[15]);
	MOV	#lo_addr(_smpbuff+15), W10
	CALL	_calculateRQEI
	MOV	W0, _CurrentEnc
	MOV	W1, _CurrentEnc+2
;NewDesign_events_code.c,457 :: 		if((CurrentEnc-OldEnc)>=triggerDist){
	MOV	#lo_addr(_OldEnc), W4
	SUB	W0, [W4++], W2
	SUBB	W1, [W4--], W3
	MOV	_triggerDist, W0
	ASR	W0, #15, W1
	CP	W2, W0
	CPB	W3, W1
	BRA GEU	L__EveButtonProfStartProfilingOnClick191
	GOTO	L_EveButtonProfStartProfilingOnClick84
L__EveButtonProfStartProfilingOnClick191:
;NewDesign_events_code.c,458 :: 		SPI2BUF=0xAB;//tell GPS chip to toggle DSL trigger
	MOV	#171, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,459 :: 		OldEnc=CurrentEnc;
	MOV	_CurrentEnc, W0
	MOV	_CurrentEnc+2, W1
	MOV	W0, _OldEnc
	MOV	W1, _OldEnc+2
;NewDesign_events_code.c,461 :: 		}
L_EveButtonProfStartProfilingOnClick84:
;NewDesign_events_code.c,462 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,463 :: 		}
L_EveButtonProfStartProfilingOnClick75:
;NewDesign_events_code.c,464 :: 		ProcessVTFTStack();
	CALL	_ProcessVTFTStack
;NewDesign_events_code.c,465 :: 		}//jump out of loop when stop is pressed
	GOTO	L_EveButtonProfStartProfilingOnClick73
L_EveButtonProfStartProfilingOnClick74:
;NewDesign_events_code.c,467 :: 		BoxProfWaitingForCam.visible=1;
	MOV	#lo_addr(_BoxProfWaitingForCam+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,468 :: 		EveTextProfWaitingForCam.visible=1;
	MOV	#lo_addr(_EveTextProfWaitingForCam+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,469 :: 		EveButtonProfStartProfiling.visible=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,470 :: 		EveButtonProfStartProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,471 :: 		EveButtonProfStopProfiling.visible=0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,472 :: 		EveButtonProfStopProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,473 :: 		EveToggleProfMode.Active=1;//re enable mode selection
	MOV	#lo_addr(_EveToggleProfMode+43), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,474 :: 		SPI2BUF=0x62;//Tell camChip to stop logging
	MOV	#98, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,475 :: 		UART1_Write(0xB7);//tell smp to stop logging
	MOV	#183, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,476 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,479 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_EveButtonProfStartProfilingOnClick85:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick85
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick85
;NewDesign_events_code.c,480 :: 		SPI2BUF=0xFA;//ask camchip to load the status byte;
	MOV	#250, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,481 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick87:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick87
	NOP
	NOP
;NewDesign_events_code.c,482 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;NewDesign_events_code.c,483 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick89:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick89
	NOP
	NOP
;NewDesign_events_code.c,484 :: 		temp=SPI2BUF;
; temp start address is: 0 (W0)
	MOV.B	SPI2BUF, WREG
;NewDesign_events_code.c,485 :: 		if(temp==0x1C){
	CP.B	W0, #28
	BRA Z	L__EveButtonProfStartProfilingOnClick192
	GOTO	L_EveButtonProfStartProfilingOnClick91
L__EveButtonProfStartProfilingOnClick192:
; temp end address is: 0 (W0)
;NewDesign_events_code.c,486 :: 		handshakeCAM=1;
	MOV	#1, W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,487 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick92
L_EveButtonProfStartProfilingOnClick91:
;NewDesign_events_code.c,489 :: 		handshakeCAM=0;
	CLR	W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,490 :: 		}
L_EveButtonProfStartProfilingOnClick92:
;NewDesign_events_code.c,491 :: 		sprintf(EveTextSUdistance.Caption, "%.2f", calculateRQEI(&smpbuff[15])*wheelRadius*6.28318/cycle);
	MOV	#lo_addr(_smpbuff+15), W10
	CALL	_calculateRQEI
	CALL	__Long2Float
	MOV	_wheelRadius, W2
	MOV	_wheelRadius+2, W3
	CALL	__Mul_FP
	MOV	#4048, W2
	MOV	#16585, W3
	CALL	__Mul_FP
	MOV	_cycle, W2
	MOV	_cycle+2, W3
	CALL	__Div_FP
	PUSH.D	W0
	MOV	#lo_addr(?lstr_8_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextSUdistance+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,492 :: 		sprintf(EveTextSUtime.Caption, "%.2f",calculateTime(&smpbuff[12])/1000.0);
	MOV	#lo_addr(_smpbuff+12), W10
	CALL	_calculateTime
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	PUSH.D	W0
	MOV	#lo_addr(?lstr_9_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextSUtime+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,495 :: 		if(handshakeBUF && handshakeCAM){
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick193
	GOTO	L__EveButtonProfStartProfilingOnClick128
L__EveButtonProfStartProfilingOnClick193:
	MOV	#lo_addr(_handshakeCAM), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick194
	GOTO	L__EveButtonProfStartProfilingOnClick127
L__EveButtonProfStartProfilingOnClick194:
L__EveButtonProfStartProfilingOnClick123:
;NewDesign_events_code.c,497 :: 		strncpy(EveTextSUSpeed.Caption,"Success",8);
	MOV	#8, W12
	MOV	#lo_addr(?lstr10_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncpy
;NewDesign_events_code.c,500 :: 		EveTextSUSpeed.Font_Color=0x0640;
	MOV	#1600, W0
	MOV	W0, _EveTextSUSpeed+22
;NewDesign_events_code.c,502 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick96
;NewDesign_events_code.c,495 :: 		if(handshakeBUF && handshakeCAM){
L__EveButtonProfStartProfilingOnClick128:
L__EveButtonProfStartProfilingOnClick127:
;NewDesign_events_code.c,504 :: 		EveTextSUSpeed.Caption[0] = 0;
	MOV	_EveTextSUSpeed+14, W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,509 :: 		if(!handshakeBUF){
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick195
	GOTO	L_EveButtonProfStartProfilingOnClick97
L__EveButtonProfStartProfilingOnClick195:
;NewDesign_events_code.c,510 :: 		strncat(EveTextSUSpeed.Caption,"Buffer",7);
	MOV	#7, W12
	MOV	#lo_addr(?lstr11_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,512 :: 		}
L_EveButtonProfStartProfilingOnClick97:
;NewDesign_events_code.c,513 :: 		if(!handshakeCAM){
	MOV	#lo_addr(_handshakeCAM), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick196
	GOTO	L_EveButtonProfStartProfilingOnClick98
L__EveButtonProfStartProfilingOnClick196:
;NewDesign_events_code.c,514 :: 		if(!handshakeBUF)
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick197
	GOTO	L_EveButtonProfStartProfilingOnClick99
L__EveButtonProfStartProfilingOnClick197:
;NewDesign_events_code.c,516 :: 		strncat(EveTextSUSpeed.Caption," + Camera",10);
	MOV	#10, W12
	MOV	#lo_addr(?lstr12_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,517 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick100
L_EveButtonProfStartProfilingOnClick99:
;NewDesign_events_code.c,520 :: 		strncat(EveTextSUSpeed.Caption,"Camera",7);
	MOV	#7, W12
	MOV	#lo_addr(?lstr13_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,521 :: 		}
L_EveButtonProfStartProfilingOnClick100:
;NewDesign_events_code.c,524 :: 		}
L_EveButtonProfStartProfilingOnClick98:
;NewDesign_events_code.c,525 :: 		strncat(EveTextSUSpeed.Caption," Failed",8);
	MOV	#8, W12
	MOV	#lo_addr(?lstr14_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,526 :: 		EveTextSUSpeed.Font_Color=0xC800;
	MOV	#51200, W0
	MOV	W0, _EveTextSUSpeed+22
;NewDesign_events_code.c,527 :: 		}
L_EveButtonProfStartProfilingOnClick96:
;NewDesign_events_code.c,528 :: 		EveTextSUFilename.Caption= EveButtonFNfilename.Caption;
	MOV	_EveButtonFNfilename+22, W0
	MOV	W0, _EveTextSUFilename+14
;NewDesign_events_code.c,529 :: 		oldPos=0; //reset
	CLR	W0
	CLR	W1
	MOV	W0, _oldPos
	MOV	W1, _oldPos+2
;NewDesign_events_code.c,530 :: 		oldT=0;
	CLR	W0
	CLR	W1
	MOV	W0, _oldT
	MOV	W1, _oldT+2
;NewDesign_events_code.c,533 :: 		OldEnc=0;
	CLR	W0
	CLR	W1
	MOV	W0, _OldEnc
	MOV	W1, _OldEnc+2
;NewDesign_events_code.c,534 :: 		CurrentEnc=0;
	CLR	W0
	CLR	W1
	MOV	W0, _CurrentEnc
	MOV	W1, _CurrentEnc+2
;NewDesign_events_code.c,535 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,536 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick101:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick101
	NOP
	NOP
;NewDesign_events_code.c,537 :: 		handshakeCAM=0;
	CLR	W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,538 :: 		handshakeBUF=0;
	CLR	W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,539 :: 		loggingflag=0;//turn off logging mode
	CLR	W0
	MOV	W0, _loggingflag
;NewDesign_events_code.c,540 :: 		SPI2BUF=0x2F;//disble GPS output
	MOV	#47, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,541 :: 		averageSpeed=1;
	MOV	#1, W0
	MOV	W0, _averageSpeed
;NewDesign_events_code.c,542 :: 		}
L_end_EveButtonProfStartProfilingOnClick:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _EveButtonProfStartProfilingOnClick

_EveButtonProfStopProfilingOnClick:

;NewDesign_events_code.c,544 :: 		void EveButtonProfStopProfilingOnClick() {
;NewDesign_events_code.c,546 :: 		laserplotflag=0;
	CLR	W0
	MOV	W0, _laserplotflag
;NewDesign_events_code.c,547 :: 		Incplotflag=0;
	CLR	W0
	MOV	W0, _Incplotflag
;NewDesign_events_code.c,549 :: 		}
L_end_EveButtonProfStopProfilingOnClick:
	RETURN
; end of _EveButtonProfStopProfilingOnClick

_EveToggleProfModeOnClick:

;NewDesign_events_code.c,551 :: 		void EveToggleProfModeOnClick() {
;NewDesign_events_code.c,552 :: 		profilingMode=EveToggleProfMode.state;
	MOV	_EveToggleProfMode+40, W0
	MOV	W0, _profilingMode
;NewDesign_events_code.c,554 :: 		}
L_end_EveToggleProfModeOnClick:
	RETURN
; end of _EveToggleProfModeOnClick

_EveButtonProfCreateFileOnClick:

;NewDesign_events_code.c,557 :: 		void EveButtonProfCreateFileOnClick() {
;NewDesign_events_code.c,558 :: 		EveButtonFNConfirm.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,560 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,561 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,562 :: 		}
L_end_EveButtonProfCreateFileOnClick:
	POP	W10
	RETURN
; end of _EveButtonProfCreateFileOnClick

_SettingScreenOnTagChange:
	LNK	#2

;NewDesign_events_code.c,564 :: 		void SettingScreenOnTagChange() {
;NewDesign_events_code.c,565 :: 		char i, tag = 0;
	PUSH	W10
	MOV	#0, W0
	MOV.B	W0, [W14+0]
;NewDesign_events_code.c,566 :: 		if (FT800_Touch_GetTag(&tag))
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Touch_GetTag
	CP0.B	W0
	BRA NZ	L__SettingScreenOnTagChange202
	GOTO	L_SettingScreenOnTagChange103
L__SettingScreenOnTagChange202:
;NewDesign_events_code.c,567 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
L_SettingScreenOnTagChange103:
;NewDesign_events_code.c,569 :: 		if (!(((tag>='0')&&(tag<='9'))||(tag=='_')|| ((tag >= 'a') && (tag <= 'z'))||((tag >= 'A') && (tag <= 'Z'))))
	MOV.B	[W14+0], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange203
	GOTO	L__SettingScreenOnTagChange133
L__SettingScreenOnTagChange203:
	MOV.B	[W14+0], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange204
	GOTO	L__SettingScreenOnTagChange132
L__SettingScreenOnTagChange204:
	GOTO	L_SettingScreenOnTagChange107
L__SettingScreenOnTagChange133:
L__SettingScreenOnTagChange132:
	MOV.B	[W14+0], W1
	MOV.B	#95, W0
	CP.B	W1, W0
	BRA NZ	L__SettingScreenOnTagChange205
	GOTO	L_SettingScreenOnTagChange107
L__SettingScreenOnTagChange205:
	MOV.B	[W14+0], W1
	MOV.B	#97, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange206
	GOTO	L__SettingScreenOnTagChange135
L__SettingScreenOnTagChange206:
	MOV.B	[W14+0], W1
	MOV.B	#122, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange207
	GOTO	L__SettingScreenOnTagChange134
L__SettingScreenOnTagChange207:
	GOTO	L_SettingScreenOnTagChange107
L__SettingScreenOnTagChange135:
L__SettingScreenOnTagChange134:
	MOV.B	[W14+0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange208
	GOTO	L__SettingScreenOnTagChange137
L__SettingScreenOnTagChange208:
	MOV.B	[W14+0], W1
	MOV.B	#90, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange209
	GOTO	L__SettingScreenOnTagChange136
L__SettingScreenOnTagChange209:
	GOTO	L_SettingScreenOnTagChange107
L__SettingScreenOnTagChange137:
L__SettingScreenOnTagChange136:
	CLR	W1
	GOTO	L_SettingScreenOnTagChange106
L_SettingScreenOnTagChange107:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_SettingScreenOnTagChange106:
	CP0.B	W1
	BRA Z	L__SettingScreenOnTagChange210
	GOTO	L_SettingScreenOnTagChange112
L__SettingScreenOnTagChange210:
;NewDesign_events_code.c,570 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
L_SettingScreenOnTagChange112:
;NewDesign_events_code.c,572 :: 		i = strlen(EveButtonFNfilename_Caption);
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
; i start address is: 4 (W2)
	MOV.B	W0, W2
;NewDesign_events_code.c,573 :: 		if (i >= 7) {
	CP.B	W0, #7
	BRA GEU	L__SettingScreenOnTagChange211
	GOTO	L_SettingScreenOnTagChange113
L__SettingScreenOnTagChange211:
; i end address is: 4 (W2)
;NewDesign_events_code.c,574 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
;NewDesign_events_code.c,575 :: 		}
L_SettingScreenOnTagChange113:
;NewDesign_events_code.c,576 :: 		EveButtonFNfilename.Caption[i] = tag;
; i start address is: 4 (W2)
	ZE	W2, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,577 :: 		EveButtonFNfilename.Caption[i+1] = 0;
	ZE	W2, W0
; i end address is: 4 (W2)
	ADD	W0, #1, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,579 :: 		checkFileName();
	CALL	_checkFileName
;NewDesign_events_code.c,580 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,581 :: 		}
L_end_SettingScreenOnTagChange:
	POP	W10
	ULNK
	RETURN
; end of _SettingScreenOnTagChange

_EveButtonFNClearOnClick:

;NewDesign_events_code.c,583 :: 		void EveButtonFNClearOnClick() {
;NewDesign_events_code.c,584 :: 		Strcpy(EveButtonFNfilename.Caption,"");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr15_NewDesign_events_code), W11
	MOV	_EveButtonFNfilename+22, W10
	CALL	_strcpy
;NewDesign_events_code.c,585 :: 		EveButtonFNConfirm.Active=0;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,586 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,587 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,588 :: 		}
L_end_EveButtonFNClearOnClick:
	POP	W11
	POP	W10
	RETURN
; end of _EveButtonFNClearOnClick

_EveButtonFNBackspaceOnClick:

;NewDesign_events_code.c,590 :: 		void EveButtonFNBackspaceOnClick() {
;NewDesign_events_code.c,592 :: 		i = strlen(EveButtonFNfilename_Caption);
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
; i start address is: 2 (W1)
	MOV.B	W0, W1
;NewDesign_events_code.c,593 :: 		if(i==0){return;}
	CP.B	W0, #0
	BRA Z	L__EveButtonFNBackspaceOnClick214
	GOTO	L_EveButtonFNBackspaceOnClick114
L__EveButtonFNBackspaceOnClick214:
; i end address is: 2 (W1)
	GOTO	L_end_EveButtonFNBackspaceOnClick
L_EveButtonFNBackspaceOnClick114:
;NewDesign_events_code.c,594 :: 		EveButtonFNfilename.Caption[i-1] = 0;
; i start address is: 2 (W1)
	ZE	W1, W0
; i end address is: 2 (W1)
	SUB	W0, #1, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,595 :: 		checkFileName();
	CALL	_checkFileName
;NewDesign_events_code.c,596 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,597 :: 		}
L_end_EveButtonFNBackspaceOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNBackspaceOnClick

_EveButtonFNShiftOnClick:

;NewDesign_events_code.c,599 :: 		void EveButtonFNShiftOnClick() {
;NewDesign_events_code.c,601 :: 		if(isShiftOn){isShiftOn=0;EveButtonFNShift.Color=0x001F;}
	PUSH	W10
	MOV	#lo_addr(EveButtonFNShiftOnClick_isShiftOn_L0), W0
	CP0	[W0]
	BRA NZ	L__EveButtonFNShiftOnClick216
	GOTO	L_EveButtonFNShiftOnClick115
L__EveButtonFNShiftOnClick216:
	CLR	W0
	MOV	W0, EveButtonFNShiftOnClick_isShiftOn_L0
	MOV	#31, W0
	MOV	W0, _EveButtonFNShift+14
	GOTO	L_EveButtonFNShiftOnClick116
L_EveButtonFNShiftOnClick115:
;NewDesign_events_code.c,602 :: 		else{isShiftOn=1;EveButtonFNShift.Color=0xF800;}
	MOV	#1, W0
	MOV	W0, EveButtonFNShiftOnClick_isShiftOn_L0
	MOV	#63488, W0
	MOV	W0, _EveButtonFNShift+14
L_EveButtonFNShiftOnClick116:
;NewDesign_events_code.c,603 :: 		if(isShiftOn){
	MOV	#lo_addr(EveButtonFNShiftOnClick_isShiftOn_L0), W0
	CP0	[W0]
	BRA NZ	L__EveButtonFNShiftOnClick217
	GOTO	L_EveButtonFNShiftOnClick117
L__EveButtonFNShiftOnClick217:
;NewDesign_events_code.c,604 :: 		EveKeys2.Caption="QWERTYUIOP";
	MOV	#lo_addr(?lstr16_NewDesign_events_code), W0
	MOV	W0, _EveKeys2+22
;NewDesign_events_code.c,605 :: 		EveKeys3.Caption="ASDFGHJKL";
	MOV	#lo_addr(?lstr17_NewDesign_events_code), W0
	MOV	W0, _EveKeys3+22
;NewDesign_events_code.c,606 :: 		EveKeys4.Caption="ZXCVBNM_";
	MOV	#lo_addr(?lstr18_NewDesign_events_code), W0
	MOV	W0, _EveKeys4+22
;NewDesign_events_code.c,607 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,608 :: 		}
	GOTO	L_EveButtonFNShiftOnClick118
L_EveButtonFNShiftOnClick117:
;NewDesign_events_code.c,610 :: 		EveKeys2.Caption="qwertyuiop";
	MOV	#lo_addr(?lstr19_NewDesign_events_code), W0
	MOV	W0, _EveKeys2+22
;NewDesign_events_code.c,611 :: 		EveKeys3.Caption="asdfghjkl";
	MOV	#lo_addr(?lstr20_NewDesign_events_code), W0
	MOV	W0, _EveKeys3+22
;NewDesign_events_code.c,612 :: 		EveKeys4.Caption="zxcvbnm_";
	MOV	#lo_addr(?lstr21_NewDesign_events_code), W0
	MOV	W0, _EveKeys4+22
;NewDesign_events_code.c,613 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,614 :: 		}
L_EveButtonFNShiftOnClick118:
;NewDesign_events_code.c,615 :: 		}
L_end_EveButtonFNShiftOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNShiftOnClick

_EveButtonFNGoBackOnClick:

;NewDesign_events_code.c,617 :: 		void EveButtonFNGoBackOnClick() {
;NewDesign_events_code.c,618 :: 		DrawScreen(&ProfilingScreen);
	PUSH	W10
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,619 :: 		}
L_end_EveButtonFNGoBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNGoBackOnClick

_EveButtonSUNewRunOnClick:

;NewDesign_events_code.c,621 :: 		void EveButtonSUNewRunOnClick() {
;NewDesign_events_code.c,622 :: 		BoxProfWaitingForCam.visible=0;
	PUSH	W10
	MOV	#lo_addr(_BoxProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,623 :: 		EveTextProfWaitingForCam.visible=0;
	MOV	#lo_addr(_EveTextProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,624 :: 		EveTextProfFileName.Caption="None";
	MOV	#lo_addr(?lstr22_NewDesign_events_code), W0
	MOV	W0, _EveTextProfFileName+14
;NewDesign_events_code.c,625 :: 		EveButtonProfStartProfiling.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,626 :: 		EveButtonProfStartProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,627 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,628 :: 		}
L_end_EveButtonSUNewRunOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUNewRunOnClick

_EveButtonSUAboutOnClick:

;NewDesign_events_code.c,630 :: 		void EveButtonSUAboutOnClick() {
;NewDesign_events_code.c,631 :: 		BoxRound6.visible=1;
	PUSH	W10
	MOV	#lo_addr(_BoxRound6+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,632 :: 		EveText9.visible=1;
	MOV	#lo_addr(_EveText9+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,633 :: 		EveText11.visible=1;
	MOV	#lo_addr(_EveText11+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,634 :: 		EveText13.visible=1;
	MOV	#lo_addr(_EveText13+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,635 :: 		EveText14.visible=1;
	MOV	#lo_addr(_EveText14+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,636 :: 		EveText15.visible=1;
	MOV	#lo_addr(_EveText15+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,637 :: 		EveText16.visible=1;
	MOV	#lo_addr(_EveText16+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,638 :: 		EveText17.visible=1;
	MOV	#lo_addr(_EveText17+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,639 :: 		EveButtonSUBack.visible=1;
	MOV	#lo_addr(_EveButtonSUBack+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,640 :: 		EveButtonSUBack.active=1;
	MOV	#lo_addr(_EveButtonSUBack+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,641 :: 		EveButtonSUNewRun.active=0;
	MOV	#lo_addr(_EveButtonSUNewRun+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,642 :: 		EveButtonSUHelp.active=0;
	MOV	#lo_addr(_EveButtonSUHelp+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,643 :: 		EveButtonSUAbout.active=0;
	MOV	#lo_addr(_EveButtonSUAbout+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,644 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,646 :: 		}
L_end_EveButtonSUAboutOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUAboutOnClick

_EveButtonSUHelpOnClick:

;NewDesign_events_code.c,648 :: 		void EveButtonSUHelpOnClick() {
;NewDesign_events_code.c,652 :: 		}
L_end_EveButtonSUHelpOnClick:
	RETURN
; end of _EveButtonSUHelpOnClick

_EveButtonFNConfirmOnClick:

;NewDesign_events_code.c,654 :: 		void EveButtonFNConfirmOnClick() {
;NewDesign_events_code.c,655 :: 		EveTextProfFileName.Caption=EveButtonFNfilename_Caption;
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W0
	MOV	W0, _EveTextProfFileName+14
;NewDesign_events_code.c,656 :: 		EveButtonProfStartProfiling.Color=0x3666;
	MOV	#13926, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,657 :: 		EveButtonProfStartProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,658 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,659 :: 		}
L_end_EveButtonFNConfirmOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNConfirmOnClick

_EveButtonSUBackOnClick:

;NewDesign_events_code.c,661 :: 		void EveButtonSUBackOnClick() {
;NewDesign_events_code.c,662 :: 		BoxRound6.Visible=0;
	PUSH	W10
	MOV	#lo_addr(_BoxRound6+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,663 :: 		EveText9.visible=0;
	MOV	#lo_addr(_EveText9+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,664 :: 		EveText11.visible=0;
	MOV	#lo_addr(_EveText11+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,665 :: 		EveText13.visible=0;
	MOV	#lo_addr(_EveText13+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,666 :: 		EveText14.visible=0;
	MOV	#lo_addr(_EveText14+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,667 :: 		EveText15.visible=0;
	MOV	#lo_addr(_EveText15+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,668 :: 		EveText16.visible=0;
	MOV	#lo_addr(_EveText16+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,669 :: 		EveText17.visible=0;
	MOV	#lo_addr(_EveText17+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,670 :: 		EveButtonSUBack.visible=0;
	MOV	#lo_addr(_EveButtonSUBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,671 :: 		EveButtonSUBack.active=0;
	MOV	#lo_addr(_EveButtonSUBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,672 :: 		EveButtonSUNewRun.active=1;
	MOV	#lo_addr(_EveButtonSUNewRun+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,673 :: 		EveButtonSUHelp.active=1;
	MOV	#lo_addr(_EveButtonSUHelp+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,674 :: 		EveButtonSUAbout.active=1;
	MOV	#lo_addr(_EveButtonSUAbout+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,675 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,676 :: 		}
L_end_EveButtonSUBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUBackOnClick

_EveButtonSmpConfigureMotorOnClick:

;NewDesign_events_code.c,678 :: 		void EveButtonSmpConfigureMotorOnClick() {
;NewDesign_events_code.c,680 :: 		EveButtonsmpResetInc.Active=1;
	PUSH	W10
	MOV	#lo_addr(_EveButtonsmpResetInc+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,681 :: 		EveButtonsmpResetInc.visible=1;
	MOV	#lo_addr(_EveButtonsmpResetInc+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,683 :: 		EveButtonSmpConfigureMotor.active=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,684 :: 		EveButtonSmpGotoProf.active=0;
	MOV	#lo_addr(_EveButtonSmpGotoProf+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,685 :: 		EveButtonSmpStopSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,686 :: 		EveButtonSmpStartSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,689 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,690 :: 		EveButtonSmpStartSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,691 :: 		EveButtonSmpConfigureMotor.visible=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,692 :: 		EveButtonSmpGotoProf.visible=0;
	MOV	#lo_addr(_EveButtonSmpGotoProf+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,693 :: 		BoxRound8.visible=0;
	MOV	#lo_addr(_BoxRound8+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,695 :: 		EveButtonsmpJogRear.active=1;
	MOV	#lo_addr(_EveButtonsmpJogRear+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,696 :: 		EveButtonsmpJogFront.active=1;
	MOV	#lo_addr(_EveButtonsmpJogFront+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,697 :: 		EveButtonsmpBack.active=1;
	MOV	#lo_addr(_EveButtonsmpBack+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,699 :: 		EveButtonsmpJogRear.visible=1;
	MOV	#lo_addr(_EveButtonsmpJogRear+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,700 :: 		EveButtonsmpJogFront.visible=1;
	MOV	#lo_addr(_EveButtonsmpJogFront+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,701 :: 		EveButtonsmpBack.visible=1;
	MOV	#lo_addr(_EveButtonsmpBack+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,702 :: 		BoxRound7.visible=1;
	MOV	#lo_addr(_BoxRound7+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,703 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,706 :: 		}
L_end_EveButtonSmpConfigureMotorOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpConfigureMotorOnClick

_EveButtonsmpJogRearOnPress:

;NewDesign_events_code.c,708 :: 		void EveButtonsmpJogRearOnPress() {
;NewDesign_events_code.c,709 :: 		UART1_Write(0x3E);
	PUSH	W10
	MOV	#62, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,710 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonsmpJogRearOnPress119:
	DEC	W7
	BRA NZ	L_EveButtonsmpJogRearOnPress119
	DEC	W8
	BRA NZ	L_EveButtonsmpJogRearOnPress119
	NOP
	NOP
;NewDesign_events_code.c,711 :: 		UART1_Write(0x3B);
	MOV	#59, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,712 :: 		}
L_end_EveButtonsmpJogRearOnPress:
	POP	W10
	RETURN
; end of _EveButtonsmpJogRearOnPress

_EveButtonsmpJogFrontOnPress:

;NewDesign_events_code.c,714 :: 		void EveButtonsmpJogFrontOnPress() {
;NewDesign_events_code.c,715 :: 		UART1_Write(0x5D);
	PUSH	W10
	MOV	#93, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,716 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonsmpJogFrontOnPress121:
	DEC	W7
	BRA NZ	L_EveButtonsmpJogFrontOnPress121
	DEC	W8
	BRA NZ	L_EveButtonsmpJogFrontOnPress121
	NOP
	NOP
;NewDesign_events_code.c,717 :: 		UART1_Write(0x3B);
	MOV	#59, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,718 :: 		}
L_end_EveButtonsmpJogFrontOnPress:
	POP	W10
	RETURN
; end of _EveButtonsmpJogFrontOnPress

_EveButtonsmpBackOnClick:

;NewDesign_events_code.c,720 :: 		void EveButtonsmpBackOnClick() {
;NewDesign_events_code.c,721 :: 		EveButtonsmpResetInc.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonsmpResetInc+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,722 :: 		EveButtonsmpResetInc.visible=0;
	MOV	#lo_addr(_EveButtonsmpResetInc+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,724 :: 		EveButtonSmpConfigureMotor.active=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,725 :: 		EveButtonSmpGotoProf.active=1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,726 :: 		EveButtonSmpStopSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,727 :: 		EveButtonSmpStartSampling.active=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,730 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,731 :: 		EveButtonSmpStartSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,732 :: 		EveButtonSmpConfigureMotor.visible=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,733 :: 		EveButtonSmpGotoProf.visible=1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,734 :: 		BoxRound8.visible=1;
	MOV	#lo_addr(_BoxRound8+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,736 :: 		EveButtonsmpJogRear.active=0;
	MOV	#lo_addr(_EveButtonsmpJogRear+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,737 :: 		EveButtonsmpJogFront.active=0;
	MOV	#lo_addr(_EveButtonsmpJogFront+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,738 :: 		EveButtonsmpBack.active=0;
	MOV	#lo_addr(_EveButtonsmpBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,740 :: 		EveButtonsmpJogRear.visible=0;
	MOV	#lo_addr(_EveButtonsmpJogRear+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,741 :: 		EveButtonsmpJogFront.visible=0;
	MOV	#lo_addr(_EveButtonsmpJogFront+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,742 :: 		EveButtonsmpBack.visible=0;
	MOV	#lo_addr(_EveButtonsmpBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,743 :: 		BoxRound7.visible=0;
	MOV	#lo_addr(_BoxRound7+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,744 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,745 :: 		}
L_end_EveButtonsmpBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonsmpBackOnClick

_EveButtonsmpResetIncOnClick:

;NewDesign_events_code.c,747 :: 		void EveButtonsmpResetIncOnClick() {
;NewDesign_events_code.c,748 :: 		UART1_Write(0xFC);//tell smp to reset zero ground plane for INC
	PUSH	W10
	MOV	#252, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,749 :: 		}
L_end_EveButtonsmpResetIncOnClick:
	POP	W10
	RETURN
; end of _EveButtonsmpResetIncOnClick

_EveButtonProfRough1OnClick:

;NewDesign_events_code.c,751 :: 		void EveButtonProfRough1OnClick() {
;NewDesign_events_code.c,752 :: 		UART1_Write(0xC1); //tell smp rough1
	PUSH	W10
	MOV	#193, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,753 :: 		}
L_end_EveButtonProfRough1OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough1OnClick

_EveButtonProfRough2OnClick:

;NewDesign_events_code.c,755 :: 		void EveButtonProfRough2OnClick() {
;NewDesign_events_code.c,756 :: 		UART1_Write(0xC2); //tell smp rough2
	PUSH	W10
	MOV	#194, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,757 :: 		}
L_end_EveButtonProfRough2OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough2OnClick

_EveButtonProfRough3OnClick:

;NewDesign_events_code.c,759 :: 		void EveButtonProfRough3OnClick() {
;NewDesign_events_code.c,760 :: 		UART1_Write(0xC3); //tell smp rough3
	PUSH	W10
	MOV	#195, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,761 :: 		}
L_end_EveButtonProfRough3OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough3OnClick

_EveButtonProfRough4OnClick:

;NewDesign_events_code.c,763 :: 		void EveButtonProfRough4OnClick() {
;NewDesign_events_code.c,764 :: 		UART1_Write(0xC4); //tell smp rough4
	PUSH	W10
	MOV	#196, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,765 :: 		}
L_end_EveButtonProfRough4OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough4OnClick
