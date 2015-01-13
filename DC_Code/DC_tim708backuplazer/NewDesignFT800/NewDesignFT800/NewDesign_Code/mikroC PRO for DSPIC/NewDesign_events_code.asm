
_mapPins:

;NewDesign_events_code.c,6 :: 		void mapPins(){//42startlogging    53name  E4endofname
;NewDesign_events_code.c,7 :: 		TRISB.B12=1;//SDI2
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET	TRISB, #12
;NewDesign_events_code.c,8 :: 		TRISB.B11=0;//SDO2
	BCLR	TRISB, #11
;NewDesign_events_code.c,9 :: 		TRISB.B10=0;//SCK2 remove all communications between the cam chip
	BCLR	TRISB, #10
;NewDesign_events_code.c,14 :: 		TRISB.B4=0;//U1TX
	BCLR	TRISB, #4
;NewDesign_events_code.c,15 :: 		TRISA.B4=1;//U1RX
	BSET	TRISA, #4
;NewDesign_events_code.c,17 :: 		PPS_Mapping(44,_INPUT,_SDI2IN); //SPI2 to camera chip
	MOV.B	#16, W12
	MOV.B	#1, W11
	MOV.B	#44, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,18 :: 		PPS_Mapping(43,_OUTPUT,_SDO2);
	MOV.B	#8, W12
	CLR	W11
	MOV.B	#43, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,19 :: 		PPS_Mapping(42,_OUTPUT,_SCK2OUT);
	MOV.B	#9, W12
	CLR	W11
	MOV.B	#42, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,21 :: 		PPS_Mapping(36,_OUTPUT,_U1TX);  //smp
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#36, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,22 :: 		PPS_Mapping(20,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping
;NewDesign_events_code.c,26 :: 		}
L_end_mapPins:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _mapPins

_initCommunication:

;NewDesign_events_code.c,27 :: 		void initCommunication(){
;NewDesign_events_code.c,28 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;NewDesign_events_code.c,30 :: 		UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
	CLR	W13
	CLR	W12
	MOV	#4096, W10
	MOV	#14, W11
	MOV	#1, W0
	PUSH	W0
	CALL	_UART1_Init_Advanced
	SUB	#2, W15
;NewDesign_events_code.c,31 :: 		Delay_ms(150);
	MOV	#33, W8
	MOV	#2867, W7
L_initCommunication0:
	DEC	W7
	BRA NZ	L_initCommunication0
	DEC	W8
	BRA NZ	L_initCommunication0
;NewDesign_events_code.c,32 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,33 :: 		U1STA.OERR=0;  //reset buffer
	BCLR	U1STA, #1
;NewDesign_events_code.c,34 :: 		IPC2.B14=1;
	BSET	IPC2, #14
;NewDesign_events_code.c,35 :: 		IPC2.B13=0;
	BCLR	IPC2, #13
;NewDesign_events_code.c,36 :: 		IPC2.B12=0;
	BCLR	IPC2, #12
;NewDesign_events_code.c,38 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,39 :: 		IEC0.B11=1;//enable interrput
	BSET	IEC0, #11
;NewDesign_events_code.c,41 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initCommunication2:
	DEC	W7
	BRA NZ	L_initCommunication2
	DEC	W8
	BRA NZ	L_initCommunication2
	NOP
	NOP
;NewDesign_events_code.c,45 :: 		_SPI_PRESCALE_PRI_16,
	MOV	#1, W13
;NewDesign_events_code.c,44 :: 		_SPI_PRESCALE_SEC_4,
	MOV	#16, W12
;NewDesign_events_code.c,43 :: 		_SPI_8_BIT,
	CLR	W11
;NewDesign_events_code.c,42 :: 		SPI2_Init_Advanced(_SPI_MASTER,//this has to be middle,low,2idle or it loses last bit
	MOV	#32, W10
;NewDesign_events_code.c,49 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,48 :: 		_SPI_CLK_IDLE_LOW,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,47 :: 		_SPI_DATA_SAMPLE_MIDDLE,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,46 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;NewDesign_events_code.c,49 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;NewDesign_events_code.c,50 :: 		SPI_Set_Active(SPI1_Read, SPI1_Write);
	MOV	#lo_addr(_SPI1_Write), W11
	MOV	#lo_addr(_SPI1_Read), W10
	CALL	_SPI_Set_Active
;NewDesign_events_code.c,51 :: 		for(i=0;i<30;i++){
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initCommunication4:
; i start address is: 4 (W2)
	CP	W2, #30
	BRA LTU	L__initCommunication158
	GOTO	L_initCommunication5
L__initCommunication158:
;NewDesign_events_code.c,52 :: 		smpbuff[i]=0x00;
	MOV	#lo_addr(_smpbuff), W0
	ADD	W0, W2, W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,51 :: 		for(i=0;i<30;i++){
	INC	W2
;NewDesign_events_code.c,53 :: 		}
; i end address is: 4 (W2)
	GOTO	L_initCommunication4
L_initCommunication5:
;NewDesign_events_code.c,55 :: 		}
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

;NewDesign_events_code.c,56 :: 		void SPI2Interrupt() iv IVT_ADDR_SPI2INTERRUPT{
;NewDesign_events_code.c,58 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;NewDesign_events_code.c,59 :: 		temp=SPI2BUF;
; temp start address is: 4 (W2)
	MOV	SPI2BUF, W2
;NewDesign_events_code.c,61 :: 		GPSdataReceived[GPSdataReceivedPtr++]=temp;
	MOV	#lo_addr(_GPSdataReceived), W1
	MOV	#lo_addr(_GPSdataReceivedPtr), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
	MOV	_GPSdataReceivedPtr, W0
	INC	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,62 :: 		if(temp==0x00){
	CP.B	W2, #0
	BRA Z	L__SPI2Interrupt160
	GOTO	L_SPI2Interrupt7
L__SPI2Interrupt160:
; temp end address is: 4 (W2)
;NewDesign_events_code.c,64 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,66 :: 		return;
	GOTO	L_end_SPI2Interrupt
;NewDesign_events_code.c,67 :: 		}
L_SPI2Interrupt7:
;NewDesign_events_code.c,68 :: 		if(GPSdataReceivedPtr==37){GPSdataReceivedPtr=0;GPSdataReceived[37]=0x00;}
	MOV	#37, W1
	MOV	#lo_addr(_GPSdataReceivedPtr), W0
	CP	W1, [W0]
	BRA Z	L__SPI2Interrupt161
	GOTO	L_SPI2Interrupt8
L__SPI2Interrupt161:
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
	MOV	#lo_addr(_GPSdataReceived+37), W1
	CLR	W0
	MOV.B	W0, [W1]
L_SPI2Interrupt8:
;NewDesign_events_code.c,71 :: 		}
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

;NewDesign_events_code.c,72 :: 		void smpInterrupt() iv IVT_ADDR_U1RXINTERRUPT{//UART1 from smp chip
;NewDesign_events_code.c,73 :: 		unsigned char temp1=0;
	PUSH	W10
	PUSH	W11
;NewDesign_events_code.c,75 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;NewDesign_events_code.c,76 :: 		temp1=U1RXREG;
; temp1 start address is: 4 (W2)
	MOV	U1RXREG, W2
;NewDesign_events_code.c,78 :: 		if(temp1==0xAA){
	MOV.B	#170, W0
	CP.B	W2, W0
	BRA Z	L__smpInterrupt163
	GOTO	L_smpInterrupt9
L__smpInterrupt163:
;NewDesign_events_code.c,79 :: 		count++;
	MOV	#1, W1
	MOV	#lo_addr(smpInterrupt_count_L0), W0
	ADD	W1, [W0], [W0]
;NewDesign_events_code.c,80 :: 		if(count==8){
	MOV	smpInterrupt_count_L0, W0
	CP	W0, #8
	BRA Z	L__smpInterrupt164
	GOTO	L_smpInterrupt10
L__smpInterrupt164:
; temp1 end address is: 4 (W2)
;NewDesign_events_code.c,81 :: 		count=0;
	CLR	W0
	MOV	W0, smpInterrupt_count_L0
;NewDesign_events_code.c,82 :: 		laserplotflag=0;
	CLR	W0
	MOV	W0, _laserplotflag
;NewDesign_events_code.c,83 :: 		Incplotflag=0;
	CLR	W0
	MOV	W0, _Incplotflag
;NewDesign_events_code.c,84 :: 		handshakeBUF=1;
	MOV	#1, W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,85 :: 		return;
	GOTO	L_end_smpInterrupt
;NewDesign_events_code.c,86 :: 		}
L_smpInterrupt10:
;NewDesign_events_code.c,87 :: 		}
; temp1 start address is: 4 (W2)
	GOTO	L_smpInterrupt11
L_smpInterrupt9:
;NewDesign_events_code.c,89 :: 		count=0;
	CLR	W0
	MOV	W0, smpInterrupt_count_L0
;NewDesign_events_code.c,90 :: 		handshakeBUF=0;
	CLR	W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,91 :: 		}
L_smpInterrupt11:
;NewDesign_events_code.c,95 :: 		if(smpflag){//in sampling mode-----4laz-4enc-4pitch-4roll-6acc
	MOV	#lo_addr(_smpflag), W0
	CP0	[W0]
	BRA NZ	L__smpInterrupt165
	GOTO	L_smpInterrupt12
L__smpInterrupt165:
;NewDesign_events_code.c,96 :: 		smpbuff[smpbuffIterator++]=temp1;
	MOV	#lo_addr(_smpbuff), W1
	MOV	#lo_addr(_smpbuffIterator), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
	MOV	_smpbuffIterator, W0
	INC	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,97 :: 		if(smpbuffIterator==22){
	MOV	_smpbuffIterator, W0
	CP	W0, #22
	BRA Z	L__smpInterrupt166
	GOTO	L_smpInterrupt13
L__smpInterrupt166:
;NewDesign_events_code.c,98 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,99 :: 		smpbuffReady=1;
	MOV	#1, W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,100 :: 		}
L_smpInterrupt13:
;NewDesign_events_code.c,101 :: 		}
L_smpInterrupt12:
;NewDesign_events_code.c,102 :: 		if(loggingflag){//in logging mode-----4laz-4pitch-4roll-3t-4enc
	MOV	#lo_addr(_loggingflag), W0
	CP0	[W0]
	BRA NZ	L__smpInterrupt167
	GOTO	L_smpInterrupt14
L__smpInterrupt167:
;NewDesign_events_code.c,103 :: 		smpbuff[smpbuffIterator++]=temp1;
	MOV	#lo_addr(_smpbuff), W1
	MOV	#lo_addr(_smpbuffIterator), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; temp1 end address is: 4 (W2)
	MOV	_smpbuffIterator, W0
	INC	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,104 :: 		if(smpbuffIterator==19){
	MOV	_smpbuffIterator, W0
	CP	W0, #19
	BRA Z	L__smpInterrupt168
	GOTO	L_smpInterrupt15
L__smpInterrupt168:
;NewDesign_events_code.c,105 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,108 :: 		speed=CalculateSpeed(&smpbuff[12],&smpbuff[15]);
	MOV	#lo_addr(_smpbuff+15), W11
	MOV	#lo_addr(_smpbuff+12), W10
	CALL	_CalculateSpeed
	MOV	W0, _speed
	MOV	W1, _speed+2
;NewDesign_events_code.c,109 :: 		smpbuffReady=1;
	MOV	#1, W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,110 :: 		}
L_smpInterrupt15:
;NewDesign_events_code.c,112 :: 		}
L_smpInterrupt14:
;NewDesign_events_code.c,115 :: 		}
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

;NewDesign_events_code.c,116 :: 		unsigned long calculateRQEI(unsigned char *buff){
;NewDesign_events_code.c,121 :: 		d=*buff;
; d start address is: 2 (W1)
	ZE	[W10], W1
	CLR	W2
;NewDesign_events_code.c,122 :: 		d=d<<24;
	MOV	#24, W0
	MOV	W1, W6
	MOV	W2, W7
L__calculateRQEI170:
	DEC	W0, W0
	BRA LT	L__calculateRQEI171
	SL	W6, W6
	RLC	W7, W7
	BRA	L__calculateRQEI170
L__calculateRQEI171:
; d end address is: 2 (W1)
;NewDesign_events_code.c,123 :: 		c=*(buff+1);
	ADD	W10, #1, W0
; c start address is: 0 (W0)
	ZE	[W0], W0
	CLR	W1
;NewDesign_events_code.c,124 :: 		c=c<<16;
	MOV	W0, W5
	CLR	W4
; c end address is: 0 (W0)
;NewDesign_events_code.c,125 :: 		b=*(buff+2);
	ADD	W10, #2, W0
; b start address is: 2 (W1)
	ZE	[W0], W1
;NewDesign_events_code.c,126 :: 		b=b<<8;
	SL	W1, #8, W0
; b end address is: 2 (W1)
;NewDesign_events_code.c,127 :: 		d=d|c|b|(*(buff+3));
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
;NewDesign_events_code.c,128 :: 		return d;
;NewDesign_events_code.c,130 :: 		}
L_end_calculateRQEI:
	RETURN
; end of _calculateRQEI

_calculateLaz:

;NewDesign_events_code.c,131 :: 		float calculateLaz(unsigned char *buff){//for old lazer
;NewDesign_events_code.c,132 :: 		return (((*(buff+2))<<8)|(*(buff+3)))*0.00012f+7f;
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W1
	ADD	W10, #3, W0
	ZE	[W0], W0
	IOR	W1, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#43138, W2
	MOV	#14587, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16608, W3
	CALL	__AddSub_FP
;NewDesign_events_code.c,134 :: 		}
L_end_calculateLaz:
	RETURN
; end of _calculateLaz

_CalculateAngle:

;NewDesign_events_code.c,136 :: 		float CalculateAngle(unsigned char *angleBuff){
;NewDesign_events_code.c,140 :: 		a=angleBuff[0];
	MOV.B	[W10], W0
	ZE	W0, W0
	CLR	W1
	MOV	W0, CalculateAngle_a_L0
	MOV	W1, CalculateAngle_a_L0+2
;NewDesign_events_code.c,141 :: 		b=angleBuff[1];
	ADD	W10, #1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	CLR	W1
	MOV	W0, CalculateAngle_b_L0
	MOV	W1, CalculateAngle_b_L0+2
;NewDesign_events_code.c,142 :: 		c=angleBuff[2];
	ADD	W10, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	W0, CalculateAngle_c_L0
;NewDesign_events_code.c,144 :: 		if(a!=0xff){
	MOV	#255, W1
	MOV	#0, W2
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CalculateAngle174
	GOTO	L_CalculateAngle16
L__CalculateAngle174:
;NewDesign_events_code.c,145 :: 		return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3]))/1000.0);
	MOV	#24, W1
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	MOV.D	[W0], W4
L__CalculateAngle175:
	DEC	W1, W1
	BRA LT	L__CalculateAngle176
	SL	W4, W4
	RLC	W5, W5
	BRA	L__CalculateAngle175
L__CalculateAngle176:
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
;NewDesign_events_code.c,146 :: 		}
L_CalculateAngle16:
;NewDesign_events_code.c,147 :: 		else{return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3])-0xffffffff))/1000.0;}
	MOV	#24, W1
	MOV	#lo_addr(CalculateAngle_a_L0), W0
	MOV.D	[W0], W4
L__CalculateAngle177:
	DEC	W1, W1
	BRA LT	L__CalculateAngle178
	SL	W4, W4
	RLC	W5, W5
	BRA	L__CalculateAngle177
L__CalculateAngle178:
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
;NewDesign_events_code.c,148 :: 		}
L_end_CalculateAngle:
	RETURN
; end of _CalculateAngle

_CalculateAcc:

;NewDesign_events_code.c,149 :: 		float CalculateAcc(unsigned char *accBuff){
;NewDesign_events_code.c,151 :: 		temp=accBuff[0];
; temp start address is: 0 (W0)
	ZE	[W10], W0
;NewDesign_events_code.c,152 :: 		temp=temp<<8;
	SL	W0, #8, W1
; temp end address is: 0 (W0)
;NewDesign_events_code.c,153 :: 		temp=temp|accBuff[1];
	ADD	W10, #1, W0
	ZE	[W0], W0
	IOR	W1, W0, W0
;NewDesign_events_code.c,154 :: 		return  temp*0.0078;
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#38692, W2
	MOV	#15359, W3
	CALL	__Mul_FP
;NewDesign_events_code.c,155 :: 		}
L_end_CalculateAcc:
	RETURN
; end of _CalculateAcc

_calculateTime:

;NewDesign_events_code.c,157 :: 		unsigned long calculateTime(unsigned char *tBuff){
;NewDesign_events_code.c,158 :: 		return  (((unsigned long)tBuff[0])<<16)|(tBuff[1]<<8)|(tBuff[2]);
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
;NewDesign_events_code.c,159 :: 		}
L_end_calculateTime:
	RETURN
; end of _calculateTime

_CalculateSpeed:
	LNK	#12

;NewDesign_events_code.c,161 :: 		float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff){//M/S
;NewDesign_events_code.c,162 :: 		float speedtemp=0;
;NewDesign_events_code.c,163 :: 		newPos=calculateRQEI(encBuff);
	PUSH	W10
	MOV	W11, W10
	CALL	_calculateRQEI
	POP	W10
	MOV	W0, _newPos
	MOV	W1, _newPos+2
;NewDesign_events_code.c,164 :: 		newT=calculateTime(tBuff);
	CALL	_calculateTime
	MOV	W0, _newT
	MOV	W1, _newT+2
;NewDesign_events_code.c,165 :: 		speedtemp=(newPos-oldPos)*0.0283*0.0254;  //distance traveled in meters
	MOV	_newPos, W3
	MOV	_newPos+2, W4
	MOV	#lo_addr(_oldPos), W2
	SUB	W3, [W2++], W0
	SUBB	W4, [W2--], W1
	CALL	__Long2Float
	MOV	#54631, W2
	MOV	#15591, W3
	CALL	__Mul_FP
	MOV	#5033, W2
	MOV	#15568, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;NewDesign_events_code.c,166 :: 		speedtemp=speedtemp/((newT-oldT)/1000.0);
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
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;NewDesign_events_code.c,167 :: 		oldT=newT;
	MOV	_newT, W2
	MOV	_newT+2, W3
	MOV	W2, _oldT
	MOV	W3, _oldT+2
;NewDesign_events_code.c,168 :: 		oldPos=newPos;
	MOV	_newPos, W2
	MOV	_newPos+2, W3
	MOV	W2, _oldPos
	MOV	W3, _oldPos+2
;NewDesign_events_code.c,169 :: 		speedCounter++;
	MOV	_speedCounter, W2
	INC	W2
	MOV	W2, _speedCounter
;NewDesign_events_code.c,170 :: 		averageSpeed+=speedtemp;
	MOV	_averageSpeed, W2
	MOV	_averageSpeed+2, W3
	CALL	__AddSub_FP
	MOV	W0, _averageSpeed
	MOV	W1, _averageSpeed+2
;NewDesign_events_code.c,171 :: 		return speedtemp;
	MOV	[W14+8], W0
	MOV	[W14+10], W1
;NewDesign_events_code.c,172 :: 		}
L_end_CalculateSpeed:
	ULNK
	RETURN
; end of _CalculateSpeed

_Initplot:
	LNK	#0

;NewDesign_events_code.c,173 :: 		void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf){//prepare plotting routine
; Ybase start address is: 2 (W1)
	MOV	[W14-8], W1
; lineResolution start address is: 4 (W2)
	MOV	[W14-10], W2
; pf start address is: 6 (W3)
	MOV	[W14-12], W3
;NewDesign_events_code.c,174 :: 		int i=0;
;NewDesign_events_code.c,176 :: 		lines[0]->First_Point_X=Xbase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #6, W0
	MOV	W13, [W0]
;NewDesign_events_code.c,177 :: 		lines[0]->Second_Point_X=Xbase+lineResolution;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #10, W0
	ADD	W13, W2, [W0]
;NewDesign_events_code.c,178 :: 		lines[0]->First_Point_Y=Ybase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #8, W0
	MOV	W1, [W0]
;NewDesign_events_code.c,179 :: 		lines[0]->Second_Point_Y=Ybase;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #12, W0
	MOV	W1, [W0]
; Ybase end address is: 2 (W1)
;NewDesign_events_code.c,181 :: 		lines[0]->visible=1;
	MOV	W11, 50
	MOV	[W10], W0
	ADD	W0, #3, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,182 :: 		for(i=1;i<numberOfLines;i++){ //make a flat line
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
	BRA LTU	L__Initplot183
	GOTO	L_Initplot19
L__Initplot183:
; lineResolution end address is: 10 (W5)
;NewDesign_events_code.c,183 :: 		lines[i]->First_Point_X=lines[i-1]->Second_Point_X;
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
;NewDesign_events_code.c,184 :: 		lines[i]->First_Point_Y=lines[i-1]->Second_Point_Y;
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
;NewDesign_events_code.c,185 :: 		lines[i]->Second_Point_X=lines[i]->First_Point_X+lineResolution;
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
;NewDesign_events_code.c,186 :: 		lines[i]->Second_Point_Y=lines[i]->First_Point_Y;
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
;NewDesign_events_code.c,187 :: 		lines[i]->visible=1;
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
;NewDesign_events_code.c,182 :: 		for(i=1;i<numberOfLines;i++){ //make a flat line
	INC	W4
;NewDesign_events_code.c,188 :: 		}
; lineResolution end address is: 10 (W5)
; i end address is: 8 (W4)
	GOTO	L_Initplot18
L_Initplot19:
;NewDesign_events_code.c,189 :: 		*pf=1;//set the plotflag and get ready to plot
	MOV	#1, W0
	MOV	W0, [W3]
; pf end address is: 6 (W3)
;NewDesign_events_code.c,190 :: 		DrawScreen(&ProfilingScreen);
	PUSH.D	W12
	PUSH.D	W10
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
	POP.D	W10
	POP.D	W12
;NewDesign_events_code.c,191 :: 		}
L_end_Initplot:
	ULNK
	RETURN
; end of _Initplot

_addData:
	LNK	#0

;NewDesign_events_code.c,192 :: 		void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines){//shifts plots and adds a new line
; lines start address is: 8 (W4)
	MOV	[W14-10], W4
	MOV	[W14-8], W5
; numberOfLines start address is: 6 (W3)
	MOV	[W14-12], W3
;NewDesign_events_code.c,193 :: 		int i=0;
;NewDesign_events_code.c,194 :: 		if(*pf){
	MOV	[W11], W0
	CP0	W0
	BRA NZ	L__addData185
	GOTO	L_addData21
L__addData185:
;NewDesign_events_code.c,195 :: 		for(i=0;i<numberOfLines-1;i++){ //shift all lines except the last line
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
; numberOfLines end address is: 6 (W3)
; lines end address is: 8 (W4)
	MOV	W0, W6
L_addData22:
; i start address is: 12 (W6)
; numberOfLines start address is: 6 (W3)
; lines start address is: 8 (W4)
	SUB	W3, #1, W0
	CP	W6, W0
	BRA LTU	L__addData186
	GOTO	L_addData23
L__addData186:
;NewDesign_events_code.c,196 :: 		lines[i]->First_Point_Y=lines[i+1]->First_Point_Y;
	MOV	W6, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W2
	ADD	W6, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,197 :: 		lines[i]->Second_Point_Y=lines[i+1]->Second_Point_Y;
	MOV	W6, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W2
	ADD	W6, #1, W0
	ASR	W0, #15, W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,195 :: 		for(i=0;i<numberOfLines-1;i++){ //shift all lines except the last line
	INC	W6
;NewDesign_events_code.c,198 :: 		}
; i end address is: 12 (W6)
	GOTO	L_addData22
L_addData23:
;NewDesign_events_code.c,199 :: 		lines[numberOfLines-1]->First_Point_Y=lines[numberOfLines-2]->Second_Point_Y;
	SUB	W3, #1, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #8, W2
	SUB	W3, #2, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	MOV	[W0], [W2]
;NewDesign_events_code.c,200 :: 		lines[numberOfLines-1]->Second_Point_Y=Ybase+newData;  //new data plot
	SUB	W3, #1, W0
; numberOfLines end address is: 6 (W3)
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	ADD	W4, W0, W0
	ADDC	W5, W1, W1
; lines end address is: 8 (W4)
	MOV	W1, 50
	MOV	[W0], W0
	ADD	W0, #12, W0
	ADD	W12, W10, [W0]
;NewDesign_events_code.c,201 :: 		}
L_addData21:
;NewDesign_events_code.c,202 :: 		}
L_end_addData:
	ULNK
	RETURN
; end of _addData

_sendCommandToCamChip:

;NewDesign_events_code.c,203 :: 		void sendCommandToCamChip(unsigned char* name,unsigned char size){
;NewDesign_events_code.c,205 :: 		unsigned int i=0;
;NewDesign_events_code.c,208 :: 		SPI2BUF=(0x53);
	MOV	#83, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,211 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip25:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip25
	NOP
	NOP
;NewDesign_events_code.c,212 :: 		for(i=0;i<size;i++){
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_sendCommandToCamChip27:
; i start address is: 2 (W1)
	ZE	W11, W0
	CP	W1, W0
	BRA LTU	L__sendCommandToCamChip188
	GOTO	L_sendCommandToCamChip28
L__sendCommandToCamChip188:
;NewDesign_events_code.c,213 :: 		SPI2BUF=(name[i]);
	ADD	W10, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,214 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip30:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip30
	NOP
	NOP
;NewDesign_events_code.c,212 :: 		for(i=0;i<size;i++){
	INC	W1
;NewDesign_events_code.c,215 :: 		}
; i end address is: 2 (W1)
	GOTO	L_sendCommandToCamChip27
L_sendCommandToCamChip28:
;NewDesign_events_code.c,216 :: 		SPI2BUF=(0xE4);//end of name
	MOV	#228, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,217 :: 		Delay_us(100);
	MOV	#1400, W7
L_sendCommandToCamChip32:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip32
	NOP
	NOP
;NewDesign_events_code.c,218 :: 		SPI2BUF=0x3B;//enable GPS output
	MOV	#59, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,219 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_sendCommandToCamChip34:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip34
	DEC	W8
	BRA NZ	L_sendCommandToCamChip34
	NOP
	NOP
;NewDesign_events_code.c,220 :: 		SPI2BUF=(0x43);//start logging mode
	MOV	#67, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,221 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_sendCommandToCamChip36:
	DEC	W7
	BRA NZ	L_sendCommandToCamChip36
	DEC	W8
	BRA NZ	L_sendCommandToCamChip36
	NOP
	NOP
;NewDesign_events_code.c,223 :: 		}
L_end_sendCommandToCamChip:
	RETURN
; end of _sendCommandToCamChip

_sendNameToSamChip:

;NewDesign_events_code.c,224 :: 		void sendNameToSamChip(unsigned char* name,unsigned char size){
;NewDesign_events_code.c,225 :: 		unsigned int i=0;
;NewDesign_events_code.c,226 :: 		UART1_Write(0xE3);//start of name
	PUSH	W10
	MOV	#227, W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,227 :: 		for(i=0;i<size;i++){
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_sendNameToSamChip38:
; i start address is: 2 (W1)
	ZE	W11, W0
	CP	W1, W0
	BRA LTU	L__sendNameToSamChip190
	GOTO	L_sendNameToSamChip39
L__sendNameToSamChip190:
;NewDesign_events_code.c,228 :: 		UART1_Write(name[i]);
	ADD	W10, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,227 :: 		for(i=0;i<size;i++){
	INC	W1
;NewDesign_events_code.c,229 :: 		}
; i end address is: 2 (W1)
	GOTO	L_sendNameToSamChip38
L_sendNameToSamChip39:
;NewDesign_events_code.c,230 :: 		UART1_Write(0xB5);//end of name
	PUSH	W10
	MOV	#181, W10
	CALL	_UART1_Write
	POP	W10
;NewDesign_events_code.c,231 :: 		}
L_end_sendNameToSamChip:
	RETURN
; end of _sendNameToSamChip

_checkFileName:

;NewDesign_events_code.c,233 :: 		void checkFileName(){
;NewDesign_events_code.c,234 :: 		if(strcmp(EveButtonFNfilename_Caption,oldname)==0){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_oldname), W11
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__checkFileName192
	GOTO	L_checkFileName41
L__checkFileName192:
;NewDesign_events_code.c,235 :: 		EveButtonFNConfirm.Active=0;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,236 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,237 :: 		}
	GOTO	L_checkFileName42
L_checkFileName41:
;NewDesign_events_code.c,239 :: 		EveButtonFNConfirm.Active=1;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,240 :: 		EveButtonFNConfirm.Color=0x3666;
	MOV	#13926, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,241 :: 		}
L_checkFileName42:
;NewDesign_events_code.c,242 :: 		}
L_end_checkFileName:
	POP	W11
	POP	W10
	RETURN
; end of _checkFileName

_EveButtonSmpStartSamplingOnClick:

;NewDesign_events_code.c,253 :: 		void EveButtonSmpStartSamplingOnClick() {
;NewDesign_events_code.c,254 :: 		unsigned int i=0;
	PUSH	W10
;NewDesign_events_code.c,255 :: 		unsigned int b=0;
;NewDesign_events_code.c,259 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,260 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,261 :: 		EveButtonSmpConfigureMotor.color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonSmpConfigureMotor+14
;NewDesign_events_code.c,262 :: 		EveButtonSmpConfigureMotor.active=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,265 :: 		EveButtonSmpStartSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,266 :: 		EveButtonSmpStartSampling.Active=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,267 :: 		EveButtonSmpStopSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,268 :: 		EveButtonSmpStopSampling.Active=1;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,269 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,271 :: 		smpflag=1;
	MOV	#1, W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,272 :: 		SPI2STAT.B4=0;//set interrupt mode
	BCLR	SPI2STAT, #4
;NewDesign_events_code.c,273 :: 		SPI2STAT.B3=0;
	BCLR	SPI2STAT, #3
;NewDesign_events_code.c,274 :: 		SPI2STAT.B2=1;
	BSET	SPI2STAT, #2
;NewDesign_events_code.c,275 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;NewDesign_events_code.c,276 :: 		IPC8.B6=1;
	BSET	IPC8, #6
;NewDesign_events_code.c,277 :: 		IPC8.B5=0;
	BCLR	IPC8, #5
;NewDesign_events_code.c,278 :: 		IPC8.B4=0;
	BCLR	IPC8, #4
;NewDesign_events_code.c,279 :: 		IEC2.B1=1;//enable interrupt
	BSET	IEC2, #1
;NewDesign_events_code.c,281 :: 		SPI2BUF=0x3B;//tell camchip to enale GPS output
	MOV	#59, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,282 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick43:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick43
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick43
	NOP
	NOP
;NewDesign_events_code.c,283 :: 		SPI2BUF=0x31;//tell CamChip to load buffer
	MOV	#49, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,284 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick45:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick45
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick45
	NOP
	NOP
;NewDesign_events_code.c,286 :: 		UART1_Write(0x31);
	MOV	#49, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,287 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonSmpStartSamplingOnClick47:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick47
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick47
	NOP
	NOP
;NewDesign_events_code.c,288 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,289 :: 		while(smpflag){
L_EveButtonSmpStartSamplingOnClick49:
	MOV	#lo_addr(_smpflag), W0
	CP0	[W0]
	BRA NZ	L__EveButtonSmpStartSamplingOnClick194
	GOTO	L_EveButtonSmpStartSamplingOnClick50
L__EveButtonSmpStartSamplingOnClick194:
;NewDesign_events_code.c,292 :: 		for(b=0;b<33;b++){
; b start address is: 2 (W1)
	CLR	W1
; b end address is: 2 (W1)
L_EveButtonSmpStartSamplingOnClick51:
; b start address is: 2 (W1)
	MOV	#33, W0
	CP	W1, W0
	BRA LTU	L__EveButtonSmpStartSamplingOnClick195
	GOTO	L_EveButtonSmpStartSamplingOnClick52
L__EveButtonSmpStartSamplingOnClick195:
;NewDesign_events_code.c,293 :: 		SPI2BUF=0x31;//continuously ask for a byte and GPS will be updated automatically
	MOV	#49, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,294 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonSmpStartSamplingOnClick54:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick54
	NOP
	NOP
;NewDesign_events_code.c,292 :: 		for(b=0;b<33;b++){
	INC	W1
;NewDesign_events_code.c,295 :: 		}
; b end address is: 2 (W1)
	GOTO	L_EveButtonSmpStartSamplingOnClick51
L_EveButtonSmpStartSamplingOnClick52:
;NewDesign_events_code.c,296 :: 		SPI2BUF=0x32;//tell camchip reset GPS output buffptr
	MOV	#50, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,297 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,299 :: 		ProcessVTFTStack();
	CALL	_ProcessVTFTStack
;NewDesign_events_code.c,300 :: 		Delay_ms(50);
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
;NewDesign_events_code.c,302 :: 		GPSdataReceived[33]=0x00;
	MOV	#lo_addr(_GPSdataReceived+33), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,304 :: 		if(smpbuffReady){
	MOV	#lo_addr(_smpbuffReady), W0
	CP0	[W0]
	BRA NZ	L__EveButtonSmpStartSamplingOnClick196
	GOTO	L_EveButtonSmpStartSamplingOnClick58
L__EveButtonSmpStartSamplingOnClick196:
;NewDesign_events_code.c,305 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,310 :: 		sprintf(EveTextLaserSmp.Caption, "%.4f", calculateLaz(&smpbuff));
	MOV	#lo_addr(_smpbuff), W10
	CALL	_calculateLaz
	PUSH.D	W0
	MOV	#lo_addr(?lstr_1_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextLaserSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,311 :: 		sprintf(EveTextEncoderSamp.Caption, "%+ld",calculateRQEI(&smpbuff[4]));
	MOV	#lo_addr(_smpbuff+4), W10
	CALL	_calculateRQEI
	PUSH.D	W0
	MOV	#lo_addr(?lstr_2_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextEncoderSamp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,312 :: 		sprintf(EveTextPitchSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[8]));
	MOV	#lo_addr(_smpbuff+8), W10
	CALL	_CalculateAngle
	PUSH.D	W0
	MOV	#lo_addr(?lstr_3_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextPitchSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,313 :: 		sprintf(EveTextRollSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[12]));
	MOV	#lo_addr(_smpbuff+12), W10
	CALL	_CalculateAngle
	PUSH.D	W0
	MOV	#lo_addr(?lstr_4_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextRollSmp+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,317 :: 		EveTextGPSSmp.Caption=GPSdataReceived+1;
	MOV	#lo_addr(_GPSdataReceived+1), W0
	MOV	W0, _EveTextGPSSmp+14
;NewDesign_events_code.c,319 :: 		sprintf(EveTextAccx_Caption, "%+.2f", CalculateAcc(&smpbuff[16]));
	MOV	#lo_addr(_smpbuff+16), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_5_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccx_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,320 :: 		sprintf(EveTextAccy_Caption, "%+.2f", CalculateAcc(&smpbuff[18]));
	MOV	#lo_addr(_smpbuff+18), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_6_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccy_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,321 :: 		sprintf(EveTextAccz_Caption, "%+.2f", CalculateAcc(&smpbuff[20]));
	MOV	#lo_addr(_smpbuff+20), W10
	CALL	_CalculateAcc
	PUSH.D	W0
	MOV	#lo_addr(?lstr_7_NewDesign_events_code), W0
	PUSH	W0
	MOV	#lo_addr(_EveTextAccz_Caption), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,323 :: 		UART1_Write(0x31);//continous request
	MOV	#49, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,324 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,325 :: 		}
L_EveButtonSmpStartSamplingOnClick58:
;NewDesign_events_code.c,328 :: 		}
	GOTO	L_EveButtonSmpStartSamplingOnClick49
L_EveButtonSmpStartSamplingOnClick50:
;NewDesign_events_code.c,329 :: 		EveButtonSmpStartSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,330 :: 		EveButtonSmpStartSampling.Active=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,331 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,332 :: 		EveButtonSmpStopSampling.Active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,334 :: 		SPI2BUF=0x22;  //tell came chip to stop sending GPS packets
	MOV	#34, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,337 :: 		EveButtonSmpConfigureMotor.color=0xA865;
	MOV	#43109, W0
	MOV	W0, _EveButtonSmpConfigureMotor+14
;NewDesign_events_code.c,338 :: 		EveButtonSmpConfigureMotor.active=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,339 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,340 :: 		SPI2BUF=0x2F;//tell camchip to disable GPS output
	MOV	#47, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,341 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_EveButtonSmpStartSamplingOnClick59:
	DEC	W7
	BRA NZ	L_EveButtonSmpStartSamplingOnClick59
	DEC	W8
	BRA NZ	L_EveButtonSmpStartSamplingOnClick59
	NOP
	NOP
;NewDesign_events_code.c,342 :: 		IEC2.B1=0;//disable SPI2 int
	BCLR	IEC2, #1
;NewDesign_events_code.c,343 :: 		GPSdataReceivedPtr=0;
	CLR	W0
	MOV	W0, _GPSdataReceivedPtr
;NewDesign_events_code.c,344 :: 		smpbuffIterator=0;//reset ptr after sampling mode is finished
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,345 :: 		smpbuffReady=0;//reset buffer ready flag
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,346 :: 		}
L_end_EveButtonSmpStartSamplingOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpStartSamplingOnClick

_EveButtonSmpStopSamplingOnClick:

;NewDesign_events_code.c,348 :: 		void EveButtonSmpStopSamplingOnClick() {
;NewDesign_events_code.c,349 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,350 :: 		smpflag=0;
	CLR	W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,352 :: 		}
L_end_EveButtonSmpStopSamplingOnClick:
	RETURN
; end of _EveButtonSmpStopSamplingOnClick

_EveButtonSplashInitOnClick:

;NewDesign_events_code.c,354 :: 		void EveButtonSplashInitOnClick() {
;NewDesign_events_code.c,355 :: 		int i=0;
	PUSH	W10
;NewDesign_events_code.c,358 :: 		EveButtonSplashInit.visible=0;
	MOV	#lo_addr(_EveButtonSplashInit+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,359 :: 		EveProgressBar1.visible=1;
	MOV	#lo_addr(_EveProgressBar1+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,360 :: 		EveTextSplashScreenStatus.visible=1;
	MOV	#lo_addr(_EveTextSplashScreenStatus+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,362 :: 		mapPins();
	CALL	_mapPins
;NewDesign_events_code.c,363 :: 		TRISB.B14=0;
	BCLR	TRISB, #14
;NewDesign_events_code.c,364 :: 		LATB.B14=0;
	BCLR	LATB, #14
;NewDesign_events_code.c,365 :: 		initCommunication();
	CALL	_initCommunication
;NewDesign_events_code.c,368 :: 		for(i=0;i<100;i++){EveProgressBar1.value=i;DrawScreen(&SplashScreen);Delay_ms(200);}
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_EveButtonSplashInitOnClick61:
; i start address is: 2 (W1)
	MOV	#100, W0
	CP	W1, W0
	BRA LT	L__EveButtonSplashInitOnClick199
	GOTO	L_EveButtonSplashInitOnClick62
L__EveButtonSplashInitOnClick199:
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
;NewDesign_events_code.c,369 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,370 :: 		}
L_end_EveButtonSplashInitOnClick:
	POP	W10
	RETURN
; end of _EveButtonSplashInitOnClick

_EveButtonSmpGotoProfOnClick:

;NewDesign_events_code.c,372 :: 		void EveButtonSmpGotoProfOnClick() {
;NewDesign_events_code.c,373 :: 		EveButtonProfStartProfiling.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,374 :: 		EveButtonProfStartProfiling.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,379 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,380 :: 		}
L_end_EveButtonSmpGotoProfOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpGotoProfOnClick

_EveButtonProfStartProfilingOnClick:
	LNK	#8

;NewDesign_events_code.c,382 :: 		void EveButtonProfStartProfilingOnClick() {
;NewDesign_events_code.c,384 :: 		unsigned char temp=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;NewDesign_events_code.c,387 :: 		strcpy(oldname,EveTextProfFileName_Caption);
	MOV	#lo_addr(_EveTextProfFileName_Caption), W11
	MOV	#lo_addr(_oldname), W10
	CALL	_strcpy
;NewDesign_events_code.c,388 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_EveButtonProfStartProfilingOnClick66:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick66
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick66
;NewDesign_events_code.c,389 :: 		smpflag=0;//not in samp mode
	CLR	W0
	MOV	W0, _smpflag
;NewDesign_events_code.c,390 :: 		smpbuffIterator=0;
	CLR	W0
	MOV	W0, _smpbuffIterator
;NewDesign_events_code.c,391 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,392 :: 		IEC2.B1=1; //Enable SPI2 Interrupt
	BSET	IEC2, #1
;NewDesign_events_code.c,394 :: 		EveButtonProfStartProfiling.visible=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,395 :: 		EveButtonProfStartProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,396 :: 		EveButtonProfStopProfiling.visible=1;
	MOV	#lo_addr(_EveButtonProfStopProfiling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,397 :: 		EveButtonProfStopProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStopProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,398 :: 		EveToggleProfMode.Active=0; //disable mode selection
	MOV	#lo_addr(_EveToggleProfMode+43), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,402 :: 		sendCommandToCamChip(EveButtonFNfilename.Caption,strlen(EveButtonFNfilename.Caption)+1);
	MOV	_EveButtonFNfilename+22, W10
	CALL	_strlen
	INC	W0
	MOV.B	W0, W11
	MOV	_EveButtonFNfilename+22, W10
	CALL	_sendCommandToCamChip
;NewDesign_events_code.c,404 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,406 :: 		sendNameToSamChip(EveButtonFNfilename_Caption,strlen(EveButtonFNfilename_Caption)+1);
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
	INC	W0
	MOV.B	W0, W11
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_sendNameToSamChip
;NewDesign_events_code.c,413 :: 		Initplot(ProfilingScreen_Lines,25,34,80,8,&laserplotflag);
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
;NewDesign_events_code.c,416 :: 		loggingflag=1;//turn on logging mode
	MOV	#1, W0
	MOV	W0, _loggingflag
;NewDesign_events_code.c,417 :: 		if(profilingMode){UART1_Write(0x1C);}
	MOV	#lo_addr(_profilingMode), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick202
	GOTO	L_EveButtonProfStartProfilingOnClick68
L__EveButtonProfStartProfilingOnClick202:
	MOV	#28, W10
	CALL	_UART1_Write
L_EveButtonProfStartProfilingOnClick68:
;NewDesign_events_code.c,418 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick69:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick69
	NOP
	NOP
;NewDesign_events_code.c,419 :: 		UART1_Write(0xA2);//tell smp to start logging
	MOV	#162, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,420 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_EveButtonProfStartProfilingOnClick71:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick71
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick71
	NOP
	NOP
;NewDesign_events_code.c,421 :: 		SPI2BUF=0xAB;//tell cam chip trigger
	MOV	#171, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,423 :: 		while(laserplotflag){
L_EveButtonProfStartProfilingOnClick73:
	MOV	#lo_addr(_laserplotflag), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick203
	GOTO	L_EveButtonProfStartProfilingOnClick74
L__EveButtonProfStartProfilingOnClick203:
;NewDesign_events_code.c,424 :: 		if(smpbuffReady){
	MOV	#lo_addr(_smpbuffReady), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick204
	GOTO	L_EveButtonProfStartProfilingOnClick75
L__EveButtonProfStartProfilingOnClick204:
;NewDesign_events_code.c,425 :: 		smpbuffReady=0;
	CLR	W0
	MOV	W0, _smpbuffReady
;NewDesign_events_code.c,426 :: 		laserMeasurement=CalculateLaz(&smpbuff);
	MOV	#lo_addr(_smpbuff), W10
	CALL	_calculateLaz
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,428 :: 		if(laserMeasurement>10){
	MOV	#0, W2
	MOV	#16672, W3
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick205
	INC.B	W0
L__EveButtonProfStartProfilingOnClick205:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick206
	GOTO	L_EveButtonProfStartProfilingOnClick76
L__EveButtonProfStartProfilingOnClick206:
;NewDesign_events_code.c,429 :: 		laserMeasurement=10;
	MOV	#0, W0
	MOV	#16672, W1
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,430 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick77
L_EveButtonProfStartProfilingOnClick76:
;NewDesign_events_code.c,431 :: 		else if(laserMeasurement<8){
	MOV	#0, W2
	MOV	#16640, W3
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick207
	INC.B	W0
L__EveButtonProfStartProfilingOnClick207:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick208
	GOTO	L_EveButtonProfStartProfilingOnClick78
L__EveButtonProfStartProfilingOnClick208:
;NewDesign_events_code.c,432 :: 		laserMeasurement=8;
	MOV	#0, W0
	MOV	#16640, W1
	MOV	W0, _laserMeasurement
	MOV	W1, _laserMeasurement+2
;NewDesign_events_code.c,433 :: 		}
L_EveButtonProfStartProfilingOnClick78:
L_EveButtonProfStartProfilingOnClick77:
;NewDesign_events_code.c,434 :: 		if(Pitch>50||Pitch<-50){pitch=0;}
	MOV	#0, W2
	MOV	#16968, W3
	MOV	_Pitch, W0
	MOV	_Pitch+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick209
	INC.B	W0
L__EveButtonProfStartProfilingOnClick209:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick210
	GOTO	L__EveButtonProfStartProfilingOnClick140
L__EveButtonProfStartProfilingOnClick210:
	MOV	#0, W2
	MOV	#49736, W3
	MOV	_Pitch, W0
	MOV	_Pitch+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick211
	INC.B	W0
L__EveButtonProfStartProfilingOnClick211:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick212
	GOTO	L__EveButtonProfStartProfilingOnClick139
L__EveButtonProfStartProfilingOnClick212:
	GOTO	L_EveButtonProfStartProfilingOnClick81
L__EveButtonProfStartProfilingOnClick140:
L__EveButtonProfStartProfilingOnClick139:
	CLR	W0
	CLR	W1
	MOV	W0, _Pitch
	MOV	W1, _Pitch+2
L_EveButtonProfStartProfilingOnClick81:
;NewDesign_events_code.c,435 :: 		if(Roll>50||Roll<-50){Roll=0;}
	MOV	#0, W2
	MOV	#16968, W3
	MOV	_roll, W0
	MOV	_roll+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick213
	INC.B	W0
L__EveButtonProfStartProfilingOnClick213:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick214
	GOTO	L__EveButtonProfStartProfilingOnClick142
L__EveButtonProfStartProfilingOnClick214:
	MOV	#0, W2
	MOV	#49736, W3
	MOV	_roll, W0
	MOV	_roll+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick215
	INC.B	W0
L__EveButtonProfStartProfilingOnClick215:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick216
	GOTO	L__EveButtonProfStartProfilingOnClick141
L__EveButtonProfStartProfilingOnClick216:
	GOTO	L_EveButtonProfStartProfilingOnClick84
L__EveButtonProfStartProfilingOnClick142:
L__EveButtonProfStartProfilingOnClick141:
	CLR	W0
	CLR	W1
	MOV	W0, _roll
	MOV	W1, _roll+2
L_EveButtonProfStartProfilingOnClick84:
;NewDesign_events_code.c,436 :: 		if(Pitch>3){Pitch=3;}
	MOV	#0, W2
	MOV	#16448, W3
	MOV	_Pitch, W0
	MOV	_Pitch+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick217
	INC.B	W0
L__EveButtonProfStartProfilingOnClick217:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick218
	GOTO	L_EveButtonProfStartProfilingOnClick85
L__EveButtonProfStartProfilingOnClick218:
	MOV	#0, W0
	MOV	#16448, W1
	MOV	W0, _Pitch
	MOV	W1, _Pitch+2
	GOTO	L_EveButtonProfStartProfilingOnClick86
L_EveButtonProfStartProfilingOnClick85:
;NewDesign_events_code.c,437 :: 		else if(Pitch<-3){Pitch=-3;}
	MOV	#0, W2
	MOV	#49216, W3
	MOV	_Pitch, W0
	MOV	_Pitch+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick219
	INC.B	W0
L__EveButtonProfStartProfilingOnClick219:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick220
	GOTO	L_EveButtonProfStartProfilingOnClick87
L__EveButtonProfStartProfilingOnClick220:
	MOV	#0, W0
	MOV	#49216, W1
	MOV	W0, _Pitch
	MOV	W1, _Pitch+2
L_EveButtonProfStartProfilingOnClick87:
L_EveButtonProfStartProfilingOnClick86:
;NewDesign_events_code.c,438 :: 		if(Roll>30){Roll=30;}
	MOV	#0, W2
	MOV	#16880, W3
	MOV	_roll, W0
	MOV	_roll+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick221
	INC.B	W0
L__EveButtonProfStartProfilingOnClick221:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick222
	GOTO	L_EveButtonProfStartProfilingOnClick88
L__EveButtonProfStartProfilingOnClick222:
	MOV	#0, W0
	MOV	#16880, W1
	MOV	W0, _roll
	MOV	W1, _roll+2
	GOTO	L_EveButtonProfStartProfilingOnClick89
L_EveButtonProfStartProfilingOnClick88:
;NewDesign_events_code.c,439 :: 		else if(Roll<-30){Roll=-30;}
	MOV	#0, W2
	MOV	#49648, W3
	MOV	_roll, W0
	MOV	_roll+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick223
	INC.B	W0
L__EveButtonProfStartProfilingOnClick223:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick224
	GOTO	L_EveButtonProfStartProfilingOnClick90
L__EveButtonProfStartProfilingOnClick224:
	MOV	#0, W0
	MOV	#49648, W1
	MOV	W0, _roll
	MOV	W1, _roll+2
L_EveButtonProfStartProfilingOnClick90:
L_EveButtonProfStartProfilingOnClick89:
;NewDesign_events_code.c,441 :: 		addData((laserMeasurement-8)*50,&laserplotflag,24,ProfilingScreen_Lines,25);
	MOV	#lo_addr(_ProfilingScreen_Lines), W0
	MOV	#higher_addr(_ProfilingScreen_Lines), W1
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_laserMeasurement, W0
	MOV	_laserMeasurement+2, W1
	MOV	#0, W2
	MOV	#16640, W3
	CALL	__Sub_FP
	MOV	#0, W2
	MOV	#16968, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	#24, W12
	MOV	#lo_addr(_laserplotflag), W11
	MOV	W0, W10
	MOV	#25, W2
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	PUSH	W2
	PUSH.D	W0
	CALL	_addData
	SUB	#6, W15
;NewDesign_events_code.c,446 :: 		EveGaugeProfSpeed.value=speed*50;
	MOV	_speed, W0
	MOV	_speed+2, W1
	MOV	#0, W2
	MOV	#16968, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _EveGaugeProfSpeed+22
;NewDesign_events_code.c,448 :: 		if(speed>1.99){speed=2;}
	MOV	#47186, W2
	MOV	#16382, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick225
	INC.B	W0
L__EveButtonProfStartProfilingOnClick225:
	CP0.B	W0
	BRA NZ	L__EveButtonProfStartProfilingOnClick226
	GOTO	L_EveButtonProfStartProfilingOnClick91
L__EveButtonProfStartProfilingOnClick226:
	MOV	#0, W0
	MOV	#16384, W1
	MOV	W0, _speed
	MOV	W1, _speed+2
L_EveButtonProfStartProfilingOnClick91:
;NewDesign_events_code.c,449 :: 		if(speed<0.3||speed>1.7){EveGaugeProfSpeed.Color= 0xC800;}
	MOV	#39322, W2
	MOV	#16025, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__EveButtonProfStartProfilingOnClick227
	INC.B	W0
L__EveButtonProfStartProfilingOnClick227:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick228
	GOTO	L__EveButtonProfStartProfilingOnClick144
L__EveButtonProfStartProfilingOnClick228:
	MOV	#39322, W2
	MOV	#16345, W3
	MOV	_speed, W0
	MOV	_speed+2, W1
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__EveButtonProfStartProfilingOnClick229
	INC.B	W0
L__EveButtonProfStartProfilingOnClick229:
	CP0.B	W0
	BRA Z	L__EveButtonProfStartProfilingOnClick230
	GOTO	L__EveButtonProfStartProfilingOnClick143
L__EveButtonProfStartProfilingOnClick230:
	GOTO	L_EveButtonProfStartProfilingOnClick94
L__EveButtonProfStartProfilingOnClick144:
L__EveButtonProfStartProfilingOnClick143:
	MOV	#51200, W0
	MOV	W0, _EveGaugeProfSpeed+16
	GOTO	L_EveButtonProfStartProfilingOnClick95
L_EveButtonProfStartProfilingOnClick94:
;NewDesign_events_code.c,450 :: 		else{EveGaugeProfSpeed.Color= 0x03DA;  }
	MOV	#986, W0
	MOV	W0, _EveGaugeProfSpeed+16
L_EveButtonProfStartProfilingOnClick95:
;NewDesign_events_code.c,452 :: 		CurrentEnc=calculateRQEI(&smpbuff[15]);
	MOV	#lo_addr(_smpbuff+15), W10
	CALL	_calculateRQEI
	MOV	W0, _CurrentEnc
	MOV	W1, _CurrentEnc+2
;NewDesign_events_code.c,453 :: 		if((CurrentEnc-OldEnc)>=triggerDist){
	MOV	#lo_addr(_OldEnc), W4
	SUB	W0, [W4++], W2
	SUBB	W1, [W4--], W3
	MOV	_triggerDist, W0
	ASR	W0, #15, W1
	CP	W2, W0
	CPB	W3, W1
	BRA GEU	L__EveButtonProfStartProfilingOnClick231
	GOTO	L_EveButtonProfStartProfilingOnClick96
L__EveButtonProfStartProfilingOnClick231:
;NewDesign_events_code.c,454 :: 		SPI2BUF=0xAB;//tell GPS chip to toggle DSL trigger
	MOV	#171, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,455 :: 		OldEnc=CurrentEnc;
	MOV	_CurrentEnc, W0
	MOV	_CurrentEnc+2, W1
	MOV	W0, _OldEnc
	MOV	W1, _OldEnc+2
;NewDesign_events_code.c,456 :: 		}
L_EveButtonProfStartProfilingOnClick96:
;NewDesign_events_code.c,457 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,458 :: 		}
L_EveButtonProfStartProfilingOnClick75:
;NewDesign_events_code.c,459 :: 		ProcessVTFTStack();
	CALL	_ProcessVTFTStack
;NewDesign_events_code.c,460 :: 		}//jump out of loop when stop is pressed
	GOTO	L_EveButtonProfStartProfilingOnClick73
L_EveButtonProfStartProfilingOnClick74:
;NewDesign_events_code.c,462 :: 		BoxProfWaitingForCam.visible=1;
	MOV	#lo_addr(_BoxProfWaitingForCam+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,463 :: 		EveTextProfWaitingForCam.visible=1;
	MOV	#lo_addr(_EveTextProfWaitingForCam+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,464 :: 		EveButtonProfStartProfiling.visible=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,465 :: 		EveButtonProfStartProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,466 :: 		EveButtonProfStopProfiling.visible=0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,467 :: 		EveButtonProfStopProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStopProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,468 :: 		EveToggleProfMode.Active=1;//re enable mode selection
	MOV	#lo_addr(_EveToggleProfMode+43), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,469 :: 		SPI2BUF=0x62;//Tell camChip to stop logging
	MOV	#98, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,470 :: 		UART1_Write(0xB7);//tell smp to stop logging
	MOV	#183, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,471 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,474 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_EveButtonProfStartProfilingOnClick97:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick97
	DEC	W8
	BRA NZ	L_EveButtonProfStartProfilingOnClick97
;NewDesign_events_code.c,475 :: 		SPI2BUF=0xFA;//ask camchip to load the status byte;
	MOV	#250, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,476 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick99:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick99
	NOP
	NOP
;NewDesign_events_code.c,477 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;NewDesign_events_code.c,478 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick101:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick101
	NOP
	NOP
;NewDesign_events_code.c,479 :: 		temp=SPI2BUF;
; temp start address is: 0 (W0)
	MOV.B	SPI2BUF, WREG
;NewDesign_events_code.c,480 :: 		if(temp==0x1C){
	CP.B	W0, #28
	BRA Z	L__EveButtonProfStartProfilingOnClick232
	GOTO	L_EveButtonProfStartProfilingOnClick103
L__EveButtonProfStartProfilingOnClick232:
; temp end address is: 0 (W0)
;NewDesign_events_code.c,481 :: 		handshakeCAM=1;
	MOV	#1, W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,482 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick104
L_EveButtonProfStartProfilingOnClick103:
;NewDesign_events_code.c,484 :: 		handshakeCAM=0;
	CLR	W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,485 :: 		}
L_EveButtonProfStartProfilingOnClick104:
;NewDesign_events_code.c,486 :: 		sprintf(EveTextSUdistance.Caption, "%.2f", calculateRQEI(&smpbuff[15])*wheelRadius*6.28318/cycle);
	MOV	#lo_addr(_smpbuff+15), W10
	CALL	_calculateRQEI
	CALL	__Long2Float
	MOV	_wheelRadius, W2
	MOV	_wheelRadius+2, W3
	CALL	__Mul_FP
	MOV	#4048, W2
	MOV	#16585, W3
	CALL	__Mul_FP
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	_cycle, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	POP.D	W2
	PUSH.D	W0
	MOV	#lo_addr(?lstr_8_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextSUdistance+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,487 :: 		sprintf(EveTextSUtime.Caption, "%.2f",calculateTime(&smpbuff[12])/1000.0);
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
;NewDesign_events_code.c,489 :: 		sprintf(EveTextSUAverageSpeed.Caption, "%.2f",averageSpeed/speedCounter);
	MOV	_speedCounter, W0
	CLR	W1
	CALL	__Long2Float
	MOV.D	W0, W2
	MOV	_averageSpeed, W0
	MOV	_averageSpeed+2, W1
	CALL	__Div_FP
	PUSH.D	W0
	MOV	#lo_addr(?lstr_10_NewDesign_events_code), W0
	PUSH	W0
	PUSH	_EveTextSUAverageSpeed+14
	CALL	_sprintf
	SUB	#8, W15
;NewDesign_events_code.c,490 :: 		if(handshakeBUF && handshakeCAM){
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick233
	GOTO	L__EveButtonProfStartProfilingOnClick146
L__EveButtonProfStartProfilingOnClick233:
	MOV	#lo_addr(_handshakeCAM), W0
	CP0	[W0]
	BRA NZ	L__EveButtonProfStartProfilingOnClick234
	GOTO	L__EveButtonProfStartProfilingOnClick145
L__EveButtonProfStartProfilingOnClick234:
L__EveButtonProfStartProfilingOnClick135:
;NewDesign_events_code.c,492 :: 		strncpy(EveTextSUSpeed.Caption,"Success",8);
	MOV	#8, W12
	MOV	#lo_addr(?lstr11_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncpy
;NewDesign_events_code.c,495 :: 		EveTextSUSpeed.Font_Color=0x0640;
	MOV	#1600, W0
	MOV	W0, _EveTextSUSpeed+22
;NewDesign_events_code.c,497 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick108
;NewDesign_events_code.c,490 :: 		if(handshakeBUF && handshakeCAM){
L__EveButtonProfStartProfilingOnClick146:
L__EveButtonProfStartProfilingOnClick145:
;NewDesign_events_code.c,499 :: 		EveTextSUSpeed.Caption[0] = 0;
	MOV	_EveTextSUSpeed+14, W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,504 :: 		if(!handshakeBUF){
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick235
	GOTO	L_EveButtonProfStartProfilingOnClick109
L__EveButtonProfStartProfilingOnClick235:
;NewDesign_events_code.c,505 :: 		strncat(EveTextSUSpeed.Caption,"Buffer",7);
	MOV	#7, W12
	MOV	#lo_addr(?lstr12_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,507 :: 		}
L_EveButtonProfStartProfilingOnClick109:
;NewDesign_events_code.c,508 :: 		if(!handshakeCAM){
	MOV	#lo_addr(_handshakeCAM), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick236
	GOTO	L_EveButtonProfStartProfilingOnClick110
L__EveButtonProfStartProfilingOnClick236:
;NewDesign_events_code.c,509 :: 		if(!handshakeBUF)
	MOV	#lo_addr(_handshakeBUF), W0
	CP0	[W0]
	BRA Z	L__EveButtonProfStartProfilingOnClick237
	GOTO	L_EveButtonProfStartProfilingOnClick111
L__EveButtonProfStartProfilingOnClick237:
;NewDesign_events_code.c,511 :: 		strncat(EveTextSUSpeed.Caption," + Camera",10);
	MOV	#10, W12
	MOV	#lo_addr(?lstr13_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,512 :: 		}
	GOTO	L_EveButtonProfStartProfilingOnClick112
L_EveButtonProfStartProfilingOnClick111:
;NewDesign_events_code.c,515 :: 		strncat(EveTextSUSpeed.Caption,"Camera",7);
	MOV	#7, W12
	MOV	#lo_addr(?lstr14_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,516 :: 		}
L_EveButtonProfStartProfilingOnClick112:
;NewDesign_events_code.c,519 :: 		}
L_EveButtonProfStartProfilingOnClick110:
;NewDesign_events_code.c,520 :: 		strncat(EveTextSUSpeed.Caption," Failed",8);
	MOV	#8, W12
	MOV	#lo_addr(?lstr15_NewDesign_events_code), W11
	MOV	_EveTextSUSpeed+14, W10
	CALL	_strncat
;NewDesign_events_code.c,521 :: 		EveTextSUSpeed.Font_Color=0xC800;
	MOV	#51200, W0
	MOV	W0, _EveTextSUSpeed+22
;NewDesign_events_code.c,522 :: 		}
L_EveButtonProfStartProfilingOnClick108:
;NewDesign_events_code.c,523 :: 		EveTextSUFilename.Caption= EveButtonFNfilename.Caption;
	MOV	_EveButtonFNfilename+22, W0
	MOV	W0, _EveTextSUFilename+14
;NewDesign_events_code.c,524 :: 		oldPos=0; //reset
	CLR	W0
	CLR	W1
	MOV	W0, _oldPos
	MOV	W1, _oldPos+2
;NewDesign_events_code.c,525 :: 		oldT=0;
	CLR	W0
	CLR	W1
	MOV	W0, _oldT
	MOV	W1, _oldT+2
;NewDesign_events_code.c,528 :: 		OldEnc=0;
	CLR	W0
	CLR	W1
	MOV	W0, _OldEnc
	MOV	W1, _OldEnc+2
;NewDesign_events_code.c,529 :: 		CurrentEnc=0;
	CLR	W0
	CLR	W1
	MOV	W0, _CurrentEnc
	MOV	W1, _CurrentEnc+2
;NewDesign_events_code.c,530 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,531 :: 		Delay_ms(1);
	MOV	#14000, W7
L_EveButtonProfStartProfilingOnClick113:
	DEC	W7
	BRA NZ	L_EveButtonProfStartProfilingOnClick113
	NOP
	NOP
;NewDesign_events_code.c,532 :: 		handshakeCAM=0;
	CLR	W0
	MOV	W0, _handshakeCAM
;NewDesign_events_code.c,533 :: 		handshakeBUF=0;
	CLR	W0
	MOV	W0, _handshakeBUF
;NewDesign_events_code.c,534 :: 		loggingflag=0;//turn off logging mode
	CLR	W0
	MOV	W0, _loggingflag
;NewDesign_events_code.c,535 :: 		SPI2BUF=0x2F;//disble GPS output
	MOV	#47, W0
	MOV	WREG, SPI2BUF
;NewDesign_events_code.c,536 :: 		}
L_end_EveButtonProfStartProfilingOnClick:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _EveButtonProfStartProfilingOnClick

_EveButtonProfStopProfilingOnClick:

;NewDesign_events_code.c,538 :: 		void EveButtonProfStopProfilingOnClick() {
;NewDesign_events_code.c,540 :: 		laserplotflag=0;
	CLR	W0
	MOV	W0, _laserplotflag
;NewDesign_events_code.c,541 :: 		Incplotflag=0;
	CLR	W0
	MOV	W0, _Incplotflag
;NewDesign_events_code.c,543 :: 		}
L_end_EveButtonProfStopProfilingOnClick:
	RETURN
; end of _EveButtonProfStopProfilingOnClick

_EveToggleProfModeOnClick:

;NewDesign_events_code.c,545 :: 		void EveToggleProfModeOnClick() {
;NewDesign_events_code.c,546 :: 		profilingMode=EveToggleProfMode.state;
	MOV	_EveToggleProfMode+40, W0
	MOV	W0, _profilingMode
;NewDesign_events_code.c,548 :: 		}
L_end_EveToggleProfModeOnClick:
	RETURN
; end of _EveToggleProfModeOnClick

_EveButtonProfCreateFileOnClick:

;NewDesign_events_code.c,551 :: 		void EveButtonProfCreateFileOnClick() {
;NewDesign_events_code.c,552 :: 		EveButtonFNConfirm.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,554 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,555 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,556 :: 		}
L_end_EveButtonProfCreateFileOnClick:
	POP	W10
	RETURN
; end of _EveButtonProfCreateFileOnClick

_SettingScreenOnTagChange:
	LNK	#2

;NewDesign_events_code.c,558 :: 		void SettingScreenOnTagChange() {
;NewDesign_events_code.c,559 :: 		char i, tag = 0;
	PUSH	W10
	MOV	#0, W0
	MOV.B	W0, [W14+0]
;NewDesign_events_code.c,560 :: 		if (FT800_Touch_GetTag(&tag))
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_FT800_Touch_GetTag
	CP0.B	W0
	BRA NZ	L__SettingScreenOnTagChange242
	GOTO	L_SettingScreenOnTagChange115
L__SettingScreenOnTagChange242:
;NewDesign_events_code.c,561 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
L_SettingScreenOnTagChange115:
;NewDesign_events_code.c,563 :: 		if (!(((tag>='0')&&(tag<='9'))||(tag=='_')|| ((tag >= 'a') && (tag <= 'z'))||((tag >= 'A') && (tag <= 'Z'))))
	MOV.B	[W14+0], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange243
	GOTO	L__SettingScreenOnTagChange151
L__SettingScreenOnTagChange243:
	MOV.B	[W14+0], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange244
	GOTO	L__SettingScreenOnTagChange150
L__SettingScreenOnTagChange244:
	GOTO	L_SettingScreenOnTagChange119
L__SettingScreenOnTagChange151:
L__SettingScreenOnTagChange150:
	MOV.B	[W14+0], W1
	MOV.B	#95, W0
	CP.B	W1, W0
	BRA NZ	L__SettingScreenOnTagChange245
	GOTO	L_SettingScreenOnTagChange119
L__SettingScreenOnTagChange245:
	MOV.B	[W14+0], W1
	MOV.B	#97, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange246
	GOTO	L__SettingScreenOnTagChange153
L__SettingScreenOnTagChange246:
	MOV.B	[W14+0], W1
	MOV.B	#122, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange247
	GOTO	L__SettingScreenOnTagChange152
L__SettingScreenOnTagChange247:
	GOTO	L_SettingScreenOnTagChange119
L__SettingScreenOnTagChange153:
L__SettingScreenOnTagChange152:
	MOV.B	[W14+0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA GEU	L__SettingScreenOnTagChange248
	GOTO	L__SettingScreenOnTagChange155
L__SettingScreenOnTagChange248:
	MOV.B	[W14+0], W1
	MOV.B	#90, W0
	CP.B	W1, W0
	BRA LEU	L__SettingScreenOnTagChange249
	GOTO	L__SettingScreenOnTagChange154
L__SettingScreenOnTagChange249:
	GOTO	L_SettingScreenOnTagChange119
L__SettingScreenOnTagChange155:
L__SettingScreenOnTagChange154:
	CLR	W1
	GOTO	L_SettingScreenOnTagChange118
L_SettingScreenOnTagChange119:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_SettingScreenOnTagChange118:
	CP0.B	W1
	BRA Z	L__SettingScreenOnTagChange250
	GOTO	L_SettingScreenOnTagChange124
L__SettingScreenOnTagChange250:
;NewDesign_events_code.c,564 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
L_SettingScreenOnTagChange124:
;NewDesign_events_code.c,566 :: 		i = strlen(EveButtonFNfilename_Caption);
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
; i start address is: 4 (W2)
	MOV.B	W0, W2
;NewDesign_events_code.c,567 :: 		if (i >= 7) {
	CP.B	W0, #7
	BRA GEU	L__SettingScreenOnTagChange251
	GOTO	L_SettingScreenOnTagChange125
L__SettingScreenOnTagChange251:
; i end address is: 4 (W2)
;NewDesign_events_code.c,568 :: 		return;
	GOTO	L_end_SettingScreenOnTagChange
;NewDesign_events_code.c,569 :: 		}
L_SettingScreenOnTagChange125:
;NewDesign_events_code.c,570 :: 		EveButtonFNfilename.Caption[i] = tag;
; i start address is: 4 (W2)
	ZE	W2, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,571 :: 		EveButtonFNfilename.Caption[i+1] = 0;
	ZE	W2, W0
; i end address is: 4 (W2)
	ADD	W0, #1, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,573 :: 		checkFileName();
	CALL	_checkFileName
;NewDesign_events_code.c,574 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,575 :: 		}
L_end_SettingScreenOnTagChange:
	POP	W10
	ULNK
	RETURN
; end of _SettingScreenOnTagChange

_EveButtonFNClearOnClick:

;NewDesign_events_code.c,577 :: 		void EveButtonFNClearOnClick() {
;NewDesign_events_code.c,578 :: 		Strcpy(EveButtonFNfilename.Caption,"");
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(?lstr16_NewDesign_events_code), W11
	MOV	_EveButtonFNfilename+22, W10
	CALL	_strcpy
;NewDesign_events_code.c,579 :: 		EveButtonFNConfirm.Active=0;
	MOV	#lo_addr(_EveButtonFNConfirm+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,580 :: 		EveButtonFNConfirm.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonFNConfirm+14
;NewDesign_events_code.c,581 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,582 :: 		}
L_end_EveButtonFNClearOnClick:
	POP	W11
	POP	W10
	RETURN
; end of _EveButtonFNClearOnClick

_EveButtonFNBackspaceOnClick:

;NewDesign_events_code.c,584 :: 		void EveButtonFNBackspaceOnClick() {
;NewDesign_events_code.c,586 :: 		i = strlen(EveButtonFNfilename_Caption);
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W10
	CALL	_strlen
; i start address is: 2 (W1)
	MOV.B	W0, W1
;NewDesign_events_code.c,587 :: 		if(i==0){return;}
	CP.B	W0, #0
	BRA Z	L__EveButtonFNBackspaceOnClick254
	GOTO	L_EveButtonFNBackspaceOnClick126
L__EveButtonFNBackspaceOnClick254:
; i end address is: 2 (W1)
	GOTO	L_end_EveButtonFNBackspaceOnClick
L_EveButtonFNBackspaceOnClick126:
;NewDesign_events_code.c,588 :: 		EveButtonFNfilename.Caption[i-1] = 0;
; i start address is: 2 (W1)
	ZE	W1, W0
; i end address is: 2 (W1)
	SUB	W0, #1, W1
	MOV	#lo_addr(_EveButtonFNfilename+22), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,589 :: 		checkFileName();
	CALL	_checkFileName
;NewDesign_events_code.c,590 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,591 :: 		}
L_end_EveButtonFNBackspaceOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNBackspaceOnClick

_EveButtonFNShiftOnClick:

;NewDesign_events_code.c,593 :: 		void EveButtonFNShiftOnClick() {
;NewDesign_events_code.c,595 :: 		if(isShiftOn){isShiftOn=0;EveButtonFNShift.Color=0x001F;}
	PUSH	W10
	MOV	#lo_addr(EveButtonFNShiftOnClick_isShiftOn_L0), W0
	CP0	[W0]
	BRA NZ	L__EveButtonFNShiftOnClick256
	GOTO	L_EveButtonFNShiftOnClick127
L__EveButtonFNShiftOnClick256:
	CLR	W0
	MOV	W0, EveButtonFNShiftOnClick_isShiftOn_L0
	MOV	#31, W0
	MOV	W0, _EveButtonFNShift+14
	GOTO	L_EveButtonFNShiftOnClick128
L_EveButtonFNShiftOnClick127:
;NewDesign_events_code.c,596 :: 		else{isShiftOn=1;EveButtonFNShift.Color=0xF800;}
	MOV	#1, W0
	MOV	W0, EveButtonFNShiftOnClick_isShiftOn_L0
	MOV	#63488, W0
	MOV	W0, _EveButtonFNShift+14
L_EveButtonFNShiftOnClick128:
;NewDesign_events_code.c,597 :: 		if(isShiftOn){
	MOV	#lo_addr(EveButtonFNShiftOnClick_isShiftOn_L0), W0
	CP0	[W0]
	BRA NZ	L__EveButtonFNShiftOnClick257
	GOTO	L_EveButtonFNShiftOnClick129
L__EveButtonFNShiftOnClick257:
;NewDesign_events_code.c,598 :: 		EveKeys2.Caption="QWERTYUIOP";
	MOV	#lo_addr(?lstr17_NewDesign_events_code), W0
	MOV	W0, _EveKeys2+22
;NewDesign_events_code.c,599 :: 		EveKeys3.Caption="ASDFGHJKL";
	MOV	#lo_addr(?lstr18_NewDesign_events_code), W0
	MOV	W0, _EveKeys3+22
;NewDesign_events_code.c,600 :: 		EveKeys4.Caption="ZXCVBNM_";
	MOV	#lo_addr(?lstr19_NewDesign_events_code), W0
	MOV	W0, _EveKeys4+22
;NewDesign_events_code.c,601 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,602 :: 		}
	GOTO	L_EveButtonFNShiftOnClick130
L_EveButtonFNShiftOnClick129:
;NewDesign_events_code.c,604 :: 		EveKeys2.Caption="qwertyuiop";
	MOV	#lo_addr(?lstr20_NewDesign_events_code), W0
	MOV	W0, _EveKeys2+22
;NewDesign_events_code.c,605 :: 		EveKeys3.Caption="asdfghjkl";
	MOV	#lo_addr(?lstr21_NewDesign_events_code), W0
	MOV	W0, _EveKeys3+22
;NewDesign_events_code.c,606 :: 		EveKeys4.Caption="zxcvbnm_";
	MOV	#lo_addr(?lstr22_NewDesign_events_code), W0
	MOV	W0, _EveKeys4+22
;NewDesign_events_code.c,607 :: 		DrawScreen(&SettingScreen);
	MOV	#lo_addr(_SettingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,608 :: 		}
L_EveButtonFNShiftOnClick130:
;NewDesign_events_code.c,609 :: 		}
L_end_EveButtonFNShiftOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNShiftOnClick

_EveButtonFNGoBackOnClick:

;NewDesign_events_code.c,611 :: 		void EveButtonFNGoBackOnClick() {
;NewDesign_events_code.c,612 :: 		DrawScreen(&ProfilingScreen);
	PUSH	W10
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,613 :: 		}
L_end_EveButtonFNGoBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNGoBackOnClick

_EveButtonSUNewRunOnClick:

;NewDesign_events_code.c,615 :: 		void EveButtonSUNewRunOnClick() {
;NewDesign_events_code.c,616 :: 		BoxProfWaitingForCam.visible=0;
	PUSH	W10
	MOV	#lo_addr(_BoxProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,617 :: 		EveTextProfWaitingForCam.visible=0;
	MOV	#lo_addr(_EveTextProfWaitingForCam+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,618 :: 		EveTextProfFileName.Caption="None";
	MOV	#lo_addr(?lstr23_NewDesign_events_code), W0
	MOV	W0, _EveTextProfFileName+14
;NewDesign_events_code.c,619 :: 		EveButtonProfStartProfiling.Color=0xAD55;
	MOV	#44373, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,620 :: 		EveButtonProfStartProfiling.Active=0;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,621 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,622 :: 		}
L_end_EveButtonSUNewRunOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUNewRunOnClick

_EveButtonSUAboutOnClick:

;NewDesign_events_code.c,624 :: 		void EveButtonSUAboutOnClick() {
;NewDesign_events_code.c,625 :: 		BoxRound6.visible=1;
	PUSH	W10
	MOV	#lo_addr(_BoxRound6+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,626 :: 		EveText9.visible=1;
	MOV	#lo_addr(_EveText9+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,627 :: 		EveText11.visible=1;
	MOV	#lo_addr(_EveText11+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,628 :: 		EveText13.visible=1;
	MOV	#lo_addr(_EveText13+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,629 :: 		EveText14.visible=1;
	MOV	#lo_addr(_EveText14+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,630 :: 		EveText15.visible=1;
	MOV	#lo_addr(_EveText15+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,631 :: 		EveText16.visible=1;
	MOV	#lo_addr(_EveText16+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,632 :: 		EveText17.visible=1;
	MOV	#lo_addr(_EveText17+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,633 :: 		EveButtonSUBack.visible=1;
	MOV	#lo_addr(_EveButtonSUBack+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,634 :: 		EveButtonSUBack.active=1;
	MOV	#lo_addr(_EveButtonSUBack+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,635 :: 		EveButtonSUNewRun.active=0;
	MOV	#lo_addr(_EveButtonSUNewRun+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,636 :: 		EveButtonSUHelp.active=0;
	MOV	#lo_addr(_EveButtonSUHelp+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,637 :: 		EveButtonSUAbout.active=0;
	MOV	#lo_addr(_EveButtonSUAbout+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,638 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,640 :: 		}
L_end_EveButtonSUAboutOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUAboutOnClick

_EveButtonSUHelpOnClick:

;NewDesign_events_code.c,642 :: 		void EveButtonSUHelpOnClick() {
;NewDesign_events_code.c,646 :: 		}
L_end_EveButtonSUHelpOnClick:
	RETURN
; end of _EveButtonSUHelpOnClick

_EveButtonFNConfirmOnClick:

;NewDesign_events_code.c,648 :: 		void EveButtonFNConfirmOnClick() {
;NewDesign_events_code.c,649 :: 		EveTextProfFileName.Caption=EveButtonFNfilename_Caption;
	PUSH	W10
	MOV	#lo_addr(_EveButtonFNfilename_Caption), W0
	MOV	W0, _EveTextProfFileName+14
;NewDesign_events_code.c,650 :: 		EveButtonProfStartProfiling.Color=0x3666;
	MOV	#13926, W0
	MOV	W0, _EveButtonProfStartProfiling+14
;NewDesign_events_code.c,651 :: 		EveButtonProfStartProfiling.Active=1;
	MOV	#lo_addr(_EveButtonProfStartProfiling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,652 :: 		DrawScreen(&ProfilingScreen);
	MOV	#lo_addr(_ProfilingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,653 :: 		}
L_end_EveButtonFNConfirmOnClick:
	POP	W10
	RETURN
; end of _EveButtonFNConfirmOnClick

_EveButtonSUBackOnClick:

;NewDesign_events_code.c,655 :: 		void EveButtonSUBackOnClick() {
;NewDesign_events_code.c,656 :: 		BoxRound6.Visible=0;
	PUSH	W10
	MOV	#lo_addr(_BoxRound6+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,657 :: 		EveText9.visible=0;
	MOV	#lo_addr(_EveText9+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,658 :: 		EveText11.visible=0;
	MOV	#lo_addr(_EveText11+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,659 :: 		EveText13.visible=0;
	MOV	#lo_addr(_EveText13+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,660 :: 		EveText14.visible=0;
	MOV	#lo_addr(_EveText14+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,661 :: 		EveText15.visible=0;
	MOV	#lo_addr(_EveText15+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,662 :: 		EveText16.visible=0;
	MOV	#lo_addr(_EveText16+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,663 :: 		EveText17.visible=0;
	MOV	#lo_addr(_EveText17+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,664 :: 		EveButtonSUBack.visible=0;
	MOV	#lo_addr(_EveButtonSUBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,665 :: 		EveButtonSUBack.active=0;
	MOV	#lo_addr(_EveButtonSUBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,666 :: 		EveButtonSUNewRun.active=1;
	MOV	#lo_addr(_EveButtonSUNewRun+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,667 :: 		EveButtonSUHelp.active=1;
	MOV	#lo_addr(_EveButtonSUHelp+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,668 :: 		EveButtonSUAbout.active=1;
	MOV	#lo_addr(_EveButtonSUAbout+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,669 :: 		DrawScreen(&SummaryScreen);
	MOV	#lo_addr(_SummaryScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,670 :: 		}
L_end_EveButtonSUBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonSUBackOnClick

_EveButtonSmpConfigureMotorOnClick:

;NewDesign_events_code.c,672 :: 		void EveButtonSmpConfigureMotorOnClick() {
;NewDesign_events_code.c,674 :: 		EveButtonsmpResetInc.Active=1;
	PUSH	W10
	MOV	#lo_addr(_EveButtonsmpResetInc+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,675 :: 		EveButtonsmpResetInc.visible=1;
	MOV	#lo_addr(_EveButtonsmpResetInc+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,677 :: 		EveButtonSmpConfigureMotor.active=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,678 :: 		EveButtonSmpGotoProf.active=0;
	MOV	#lo_addr(_EveButtonSmpGotoProf+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,679 :: 		EveButtonSmpStopSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,680 :: 		EveButtonSmpStartSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,683 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,684 :: 		EveButtonSmpStartSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,685 :: 		EveButtonSmpConfigureMotor.visible=0;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,686 :: 		EveButtonSmpGotoProf.visible=0;
	MOV	#lo_addr(_EveButtonSmpGotoProf+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,687 :: 		BoxRound8.visible=0;
	MOV	#lo_addr(_BoxRound8+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,689 :: 		EveButtonsmpJogRear.active=1;
	MOV	#lo_addr(_EveButtonsmpJogRear+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,690 :: 		EveButtonsmpJogFront.active=1;
	MOV	#lo_addr(_EveButtonsmpJogFront+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,691 :: 		EveButtonsmpBack.active=1;
	MOV	#lo_addr(_EveButtonsmpBack+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,693 :: 		EveButtonsmpJogRear.visible=1;
	MOV	#lo_addr(_EveButtonsmpJogRear+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,694 :: 		EveButtonsmpJogFront.visible=1;
	MOV	#lo_addr(_EveButtonsmpJogFront+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,695 :: 		EveButtonsmpBack.visible=1;
	MOV	#lo_addr(_EveButtonsmpBack+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,696 :: 		BoxRound7.visible=1;
	MOV	#lo_addr(_BoxRound7+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,697 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,700 :: 		}
L_end_EveButtonSmpConfigureMotorOnClick:
	POP	W10
	RETURN
; end of _EveButtonSmpConfigureMotorOnClick

_EveButtonsmpJogRearOnPress:

;NewDesign_events_code.c,702 :: 		void EveButtonsmpJogRearOnPress() {
;NewDesign_events_code.c,703 :: 		UART1_Write(0x3E);
	PUSH	W10
	MOV	#62, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,704 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonsmpJogRearOnPress131:
	DEC	W7
	BRA NZ	L_EveButtonsmpJogRearOnPress131
	DEC	W8
	BRA NZ	L_EveButtonsmpJogRearOnPress131
	NOP
	NOP
;NewDesign_events_code.c,705 :: 		UART1_Write(0x3B);
	MOV	#59, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,706 :: 		}
L_end_EveButtonsmpJogRearOnPress:
	POP	W10
	RETURN
; end of _EveButtonsmpJogRearOnPress

_EveButtonsmpJogFrontOnPress:

;NewDesign_events_code.c,708 :: 		void EveButtonsmpJogFrontOnPress() {
;NewDesign_events_code.c,709 :: 		UART1_Write(0x5D);
	PUSH	W10
	MOV	#93, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,710 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_EveButtonsmpJogFrontOnPress133:
	DEC	W7
	BRA NZ	L_EveButtonsmpJogFrontOnPress133
	DEC	W8
	BRA NZ	L_EveButtonsmpJogFrontOnPress133
	NOP
	NOP
;NewDesign_events_code.c,711 :: 		UART1_Write(0x3B);
	MOV	#59, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,712 :: 		}
L_end_EveButtonsmpJogFrontOnPress:
	POP	W10
	RETURN
; end of _EveButtonsmpJogFrontOnPress

_EveButtonsmpBackOnClick:

;NewDesign_events_code.c,714 :: 		void EveButtonsmpBackOnClick() {
;NewDesign_events_code.c,715 :: 		EveButtonsmpResetInc.Active=0;
	PUSH	W10
	MOV	#lo_addr(_EveButtonsmpResetInc+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,716 :: 		EveButtonsmpResetInc.visible=0;
	MOV	#lo_addr(_EveButtonsmpResetInc+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,718 :: 		EveButtonSmpConfigureMotor.active=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,719 :: 		EveButtonSmpGotoProf.active=1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,720 :: 		EveButtonSmpStopSampling.active=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,721 :: 		EveButtonSmpStartSampling.active=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+37), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,724 :: 		EveButtonSmpStopSampling.visible=0;
	MOV	#lo_addr(_EveButtonSmpStopSampling+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,725 :: 		EveButtonSmpStartSampling.visible=1;
	MOV	#lo_addr(_EveButtonSmpStartSampling+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,726 :: 		EveButtonSmpConfigureMotor.visible=1;
	MOV	#lo_addr(_EveButtonSmpConfigureMotor+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,727 :: 		EveButtonSmpGotoProf.visible=1;
	MOV	#lo_addr(_EveButtonSmpGotoProf+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,728 :: 		BoxRound8.visible=1;
	MOV	#lo_addr(_BoxRound8+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,730 :: 		EveButtonsmpJogRear.active=0;
	MOV	#lo_addr(_EveButtonsmpJogRear+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,731 :: 		EveButtonsmpJogFront.active=0;
	MOV	#lo_addr(_EveButtonsmpJogFront+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,732 :: 		EveButtonsmpBack.active=0;
	MOV	#lo_addr(_EveButtonsmpBack+37), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,734 :: 		EveButtonsmpJogRear.visible=0;
	MOV	#lo_addr(_EveButtonsmpJogRear+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,735 :: 		EveButtonsmpJogFront.visible=0;
	MOV	#lo_addr(_EveButtonsmpJogFront+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,736 :: 		EveButtonsmpBack.visible=0;
	MOV	#lo_addr(_EveButtonsmpBack+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,737 :: 		BoxRound7.visible=0;
	MOV	#lo_addr(_BoxRound7+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;NewDesign_events_code.c,738 :: 		DrawScreen(&SamplingScreen);
	MOV	#lo_addr(_SamplingScreen), W10
	CALL	_DrawScreen
;NewDesign_events_code.c,739 :: 		}
L_end_EveButtonsmpBackOnClick:
	POP	W10
	RETURN
; end of _EveButtonsmpBackOnClick

_EveButtonsmpResetIncOnClick:

;NewDesign_events_code.c,741 :: 		void EveButtonsmpResetIncOnClick() {
;NewDesign_events_code.c,742 :: 		UART1_Write(0xFC);//tell smp to reset zero ground plane for INC
	PUSH	W10
	MOV	#252, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,743 :: 		}
L_end_EveButtonsmpResetIncOnClick:
	POP	W10
	RETURN
; end of _EveButtonsmpResetIncOnClick

_EveButtonProfRough1OnClick:

;NewDesign_events_code.c,745 :: 		void EveButtonProfRough1OnClick() {
;NewDesign_events_code.c,746 :: 		UART1_Write(0xC1); //tell smp rough1
	PUSH	W10
	MOV	#193, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,747 :: 		}
L_end_EveButtonProfRough1OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough1OnClick

_EveButtonProfRough2OnClick:

;NewDesign_events_code.c,749 :: 		void EveButtonProfRough2OnClick() {
;NewDesign_events_code.c,750 :: 		UART1_Write(0xC2); //tell smp rough2
	PUSH	W10
	MOV	#194, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,751 :: 		}
L_end_EveButtonProfRough2OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough2OnClick

_EveButtonProfRough3OnClick:

;NewDesign_events_code.c,753 :: 		void EveButtonProfRough3OnClick() {
;NewDesign_events_code.c,754 :: 		UART1_Write(0xC3); //tell smp rough3
	PUSH	W10
	MOV	#195, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,755 :: 		}
L_end_EveButtonProfRough3OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough3OnClick

_EveButtonProfRough4OnClick:

;NewDesign_events_code.c,757 :: 		void EveButtonProfRough4OnClick() {
;NewDesign_events_code.c,758 :: 		UART1_Write(0xC4); //tell smp rough4
	PUSH	W10
	MOV	#196, W10
	CALL	_UART1_Write
;NewDesign_events_code.c,759 :: 		}
L_end_EveButtonProfRough4OnClick:
	POP	W10
	RETURN
; end of _EveButtonProfRough4OnClick
