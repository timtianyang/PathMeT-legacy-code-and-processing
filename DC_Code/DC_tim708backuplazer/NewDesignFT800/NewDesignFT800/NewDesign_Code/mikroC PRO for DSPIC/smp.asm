
_initChip:

;smp.c,4 :: 		void initChip(){
;smp.c,5 :: 		PLLFBD = 68;            // PLL multiplier M=70
	MOV	#68, W0
	MOV	WREG, PLLFBD
;smp.c,6 :: 		CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;smp.c,8 :: 		ANSELA = 0x00;          // Convert all I/O pins to digital
	CLR	ANSELA
;smp.c,9 :: 		ANSELB = 0x00;
	CLR	ANSELB
;smp.c,10 :: 		ANSELC = 0x00;
	CLR	ANSELC
;smp.c,11 :: 		ANSELD = 0x00;
	CLR	ANSELD
;smp.c,12 :: 		ANSELE = 0x00;
	CLR	ANSELE
;smp.c,13 :: 		ANSELG = 0x00;
	CLR	ANSELG
;smp.c,14 :: 		}
L_end_initChip:
	RETURN
; end of _initChip

_mapPins:

;smp.c,15 :: 		void mapPins(){
;smp.c,17 :: 		TRISE.B6 = 1; //U1Tx from bufferchip
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET	TRISE, #6
;smp.c,18 :: 		TRISE.B7 = 0; //U1Rx to bufferchip
	BCLR	TRISE, #7
;smp.c,20 :: 		TRISD.B3 = 1; //U2Rx from master
	BSET	TRISD, #3
;smp.c,21 :: 		TRISD.B2 = 0; //U2Tx to master
	BCLR	TRISD, #2
;smp.c,23 :: 		TRISE.B1=1;//U3RX from lazer
	BSET	TRISE, #1
;smp.c,24 :: 		TRISE.B0=0;//U3TX to lazer
	BCLR	TRISE, #0
;smp.c,26 :: 		TRISG.B0=1;//U4Rx from 9DOF
	BSET	TRISG, #0
;smp.c,27 :: 		TRISG.B1=0;//U4Tx to 9DOF
	BCLR	TRISG, #1
;smp.c,29 :: 		TRISA.B0=1;//Q1A
	BSET	TRISA, #0
;smp.c,30 :: 		TRISE.B8=1;//Q1I
	BSET	TRISE, #8
;smp.c,31 :: 		TRISE.B9=1;//Q1B
	BSET	TRISE, #9
;smp.c,32 :: 		TRISB.B5=1;//Q2A
	BSET	TRISB, #5
;smp.c,33 :: 		TRISB.B4=1;//Q2I
	BSET	TRISB, #4
;smp.c,34 :: 		TRISB.B3=1;//Q2B
	BSET	TRISB, #3
;smp.c,36 :: 		TRISD.B15=0;//pwm
	BCLR	TRISD, #15
;smp.c,37 :: 		TRISD.B14=0;//direction
	BCLR	TRISD, #14
;smp.c,41 :: 		PPS_Mapping(86, _INPUT, _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#86, W10
	CALL	_PPS_Mapping
;smp.c,42 :: 		PPS_Mapping(87, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#87, W10
	CALL	_PPS_Mapping
;smp.c,43 :: 		PPS_Mapping(67, _INPUT, _U2RX);
	MOV.B	#36, W12
	MOV.B	#1, W11
	MOV.B	#67, W10
	CALL	_PPS_Mapping
;smp.c,44 :: 		PPS_Mapping(66, _OUTPUT, _U2TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#66, W10
	CALL	_PPS_Mapping
;smp.c,45 :: 		PPS_Mapping(81, _INPUT, _U3RX);
	MOV.B	#47, W12
	MOV.B	#1, W11
	MOV.B	#81, W10
	CALL	_PPS_Mapping
;smp.c,46 :: 		PPS_Mapping(80, _OUTPUT, _U3TX);
	MOV.B	#27, W12
	CLR	W11
	MOV.B	#80, W10
	CALL	_PPS_Mapping
;smp.c,47 :: 		PPS_Mapping(112, _INPUT, _U4RX);
	MOV.B	#49, W12
	MOV.B	#1, W11
	MOV.B	#112, W10
	CALL	_PPS_Mapping
;smp.c,48 :: 		PPS_Mapping(113, _OUTPUT, _U4TX);
	MOV.B	#29, W12
	CLR	W11
	MOV.B	#113, W10
	CALL	_PPS_Mapping
;smp.c,51 :: 		PPS_Mapping(16, _INPUT, _QEA1);
	MOV.B	#26, W12
	MOV.B	#1, W11
	MOV.B	#16, W10
	CALL	_PPS_Mapping
;smp.c,52 :: 		PPS_Mapping(89, _INPUT, _QEB1);
	MOV.B	#27, W12
	MOV.B	#1, W11
	MOV.B	#89, W10
	CALL	_PPS_Mapping
;smp.c,53 :: 		PPS_Mapping(88, _INPUT, _INDX1);
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#88, W10
	CALL	_PPS_Mapping
;smp.c,54 :: 		PPS_Mapping(37, _INPUT, _QEA2);
	MOV.B	#30, W12
	MOV.B	#1, W11
	MOV.B	#37, W10
	CALL	_PPS_Mapping
;smp.c,55 :: 		PPS_Mapping(35, _INPUT, _QEB2);
	MOV.B	#31, W12
	MOV.B	#1, W11
	MOV.B	#35, W10
	CALL	_PPS_Mapping
;smp.c,56 :: 		PPS_Mapping(36, _INPUT, _INDX2);
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#36, W10
	CALL	_PPS_Mapping
;smp.c,58 :: 		PPS_Mapping(79, _OUTPUT, _OC1);//motor
	MOV.B	#16, W12
	CLR	W11
	MOV.B	#79, W10
	CALL	_PPS_Mapping
;smp.c,59 :: 		}
L_end_mapPins:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _mapPins

_InitTimer1:

;smp.c,60 :: 		void InitTimer1(){//set 1ms
;smp.c,61 :: 		T1CON         = 0x8010;
	MOV	#32784, W0
	MOV	WREG, T1CON
;smp.c,62 :: 		T1IE_bit         = 0;
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,63 :: 		T1IF_bit         = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;smp.c,64 :: 		IPC0.B14=1;
	BSET	IPC0, #14
;smp.c,65 :: 		IPC0.B13=1;
	BSET	IPC0, #13
;smp.c,66 :: 		IPC0.B12=1;
	BSET	IPC0, #12
;smp.c,67 :: 		PR1                 = 8750;
	MOV	#8750, W0
	MOV	WREG, PR1
;smp.c,68 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_Timer1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;smp.c,69 :: 		void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
;smp.c,70 :: 		T1IF_bit         = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;smp.c,71 :: 		t++;
	MOV	_t, W0
	MOV	_t+2, W1
	ADD	W0, #1, W0
	ADDC	W1, #0, W1
	MOV	W0, _t
	MOV	W1, _t+2
;smp.c,72 :: 		}
L_end_Timer1Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _Timer1Interrupt

_initBufferchipUART:

;smp.c,75 :: 		void initBufferchipUART(){//UART1 to buffer chip
;smp.c,76 :: 		UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
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
;smp.c,77 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initBufferchipUART0:
	DEC	W7
	BRA NZ	L_initBufferchipUART0
	DEC	W8
	BRA NZ	L_initBufferchipUART0
	NOP
	NOP
;smp.c,78 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;smp.c,79 :: 		U1STA.OERR=0;  //reset buffer
	BCLR	U1STA, #1
;smp.c,80 :: 		IPC2.B14=1;
	BSET	IPC2, #14
;smp.c,81 :: 		IPC2.B13=0;
	BCLR	IPC2, #13
;smp.c,82 :: 		IPC2.B12=0;
	BCLR	IPC2, #12
;smp.c,83 :: 		IEC0.B11=1;    //enable interrupt
	BSET	IEC0, #11
;smp.c,84 :: 		}
L_end_initBufferchipUART:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initBufferchipUART

_BufferChipInterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;smp.c,85 :: 		void BufferChipInterrupt() iv IVT_ADDR_U1RXINTERRUPT {
;smp.c,86 :: 		unsigned char temp = 0;
	PUSH	W10
;smp.c,87 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;smp.c,88 :: 		temp=UART1_Read();
	CALL	_UART1_Read
; temp start address is: 6 (W3)
	MOV.B	W0, W3
;smp.c,89 :: 		if(temp==0xF3){
	MOV.B	#243, W1
	CP.B	W0, W1
	BRA Z	L__BufferChipInterrupt110
	GOTO	L_BufferChipInterrupt2
L__BufferChipInterrupt110:
;smp.c,90 :: 		loggingFlag=0;//buffer chip starts to wrap up
	CLR	W0
	MOV	W0, _loggingFlag
;smp.c,92 :: 		}
L_BufferChipInterrupt2:
;smp.c,93 :: 		if(temp==0xE7){
	MOV.B	#231, W0
	CP.B	W3, W0
	BRA Z	L__BufferChipInterrupt111
	GOTO	L_BufferChipInterrupt3
L__BufferChipInterrupt111:
;smp.c,94 :: 		bufferlistening=1;
	MOV	#lo_addr(_bufferlistening), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;smp.c,95 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_BufferChipInterrupt4:
	DEC	W7
	BRA NZ	L_BufferChipInterrupt4
	DEC	W8
	BRA NZ	L_BufferChipInterrupt4
	NOP
	NOP
;smp.c,96 :: 		REncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _REncPos
	MOV	W1, _REncPos+2
;smp.c,97 :: 		POS1HLD=0;//resetQEI1
	CLR	POS1HLD
;smp.c,98 :: 		POS1CNTL=0;
	CLR	POS1CNTL
;smp.c,99 :: 		IEncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _IEncPos
	MOV	W1, _IEncPos+2
;smp.c,100 :: 		POS2HLD=0;//resetQEI2
	CLR	POS2HLD
;smp.c,101 :: 		POS2CNTL=0;
	CLR	POS2CNTL
;smp.c,102 :: 		if(inchWormMode){moveWorm(0);}
	MOV	#lo_addr(_inchWormMode), W0
	CP0	[W0]
	BRA NZ	L__BufferChipInterrupt112
	GOTO	L_BufferChipInterrupt6
L__BufferChipInterrupt112:
	CLR	W10
	CALL	_moveWorm
L_BufferChipInterrupt6:
;smp.c,103 :: 		T1IE_bit=1;
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,104 :: 		}
L_BufferChipInterrupt3:
;smp.c,105 :: 		if(temp==0xA9){
	MOV.B	#169, W0
	CP.B	W3, W0
	BRA Z	L__BufferChipInterrupt113
	GOTO	L_BufferChipInterrupt7
L__BufferChipInterrupt113:
; temp end address is: 6 (W3)
;smp.c,106 :: 		bufferlistening=0;//buffer chip closes the file
	MOV	#lo_addr(_bufferlistening), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,107 :: 		}
L_BufferChipInterrupt7:
;smp.c,109 :: 		}
L_end_BufferChipInterrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _BufferChipInterrupt

_initBufferchipSPI:

;smp.c,111 :: 		void initBufferchipSPI(){//SPI2 to buffer
;smp.c,112 :: 		SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_4, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_ACTIVE_2_IDLE);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#2, W13
	CLR	W12
	CLR	W11
	MOV	#32, W10
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;smp.c,113 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initBufferchipSPI8:
	DEC	W7
	BRA NZ	L_initBufferchipSPI8
	DEC	W8
	BRA NZ	L_initBufferchipSPI8
	NOP
	NOP
;smp.c,114 :: 		}
L_end_initBufferchipSPI:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initBufferchipSPI

_initScreenChipCommunication:

;smp.c,116 :: 		void initScreenChipCommunication(){//UART2 to master screen chip
;smp.c,118 :: 		UART2_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
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
	CALL	_UART2_Init_Advanced
	SUB	#2, W15
;smp.c,119 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initScreenChipCommunication10:
	DEC	W7
	BRA NZ	L_initScreenChipCommunication10
	DEC	W8
	BRA NZ	L_initScreenChipCommunication10
	NOP
	NOP
;smp.c,120 :: 		IFS1.B14=0;
	BCLR	IFS1, #14
;smp.c,121 :: 		U2STA.OERR=0;  //reset buffer
	BCLR	U2STA, #1
;smp.c,122 :: 		IPC7.B10=1;
	BSET	IPC7, #10
;smp.c,123 :: 		IPC7.B9=0;
	BCLR	IPC7, #9
;smp.c,124 :: 		IPC7.B8=1;
	BSET	IPC7, #8
;smp.c,125 :: 		IEC1.B14=1;    //enable interrupt
	BSET	IEC1, #14
;smp.c,126 :: 		}
L_end_initScreenChipCommunication:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initScreenChipCommunication

_ScreenChipInterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;smp.c,127 :: 		void ScreenChipInterrupt() iv IVT_ADDR_U2RXINTERRUPT {
;smp.c,128 :: 		unsigned char temp = 0;
	PUSH	W10
;smp.c,129 :: 		IFS1.B14=0;
	BCLR	IFS1, #14
;smp.c,130 :: 		temp=UART2_Read();
	CALL	_UART2_Read
; temp start address is: 2 (W1)
	MOV.B	W0, W1
;smp.c,131 :: 		if(nameStart){//send name when a byte is received
	MOV	#lo_addr(_nameStart), W0
	CP0	[W0]
	BRA NZ	L__ScreenChipInterrupt117
	GOTO	L_ScreenChipInterrupt12
L__ScreenChipInterrupt117:
;smp.c,132 :: 		if(temp==0xB5){
	MOV.B	#181, W0
	CP.B	W1, W0
	BRA Z	L__ScreenChipInterrupt118
	GOTO	L_ScreenChipInterrupt13
L__ScreenChipInterrupt118:
; temp end address is: 2 (W1)
;smp.c,133 :: 		nameStart=0;
	CLR	W0
	MOV	W0, _nameStart
;smp.c,134 :: 		return;
	GOTO	L_end_ScreenChipInterrupt
;smp.c,135 :: 		}
L_ScreenChipInterrupt13:
;smp.c,136 :: 		UART1_Write(temp);
; temp start address is: 2 (W1)
	ZE	W1, W10
; temp end address is: 2 (W1)
	CALL	_UART1_Write
;smp.c,137 :: 		}
	GOTO	L_ScreenChipInterrupt14
L_ScreenChipInterrupt12:
;smp.c,139 :: 		switch (temp){
; temp start address is: 2 (W1)
	GOTO	L_ScreenChipInterrupt15
; temp end address is: 2 (W1)
;smp.c,140 :: 		case 0x31://send Laz, to screen once
L_ScreenChipInterrupt17:
;smp.c,141 :: 		smpOnceflag=1;
	MOV	#1, W0
	MOV	W0, _smpOnceflag
;smp.c,142 :: 		break;
	GOTO	L_ScreenChipInterrupt16
;smp.c,143 :: 		case 0xA2://enter logging mode
L_ScreenChipInterrupt18:
;smp.c,144 :: 		if(loggingflag){return;}
	MOV	#lo_addr(_loggingFlag), W0
	CP0	[W0]
	BRA NZ	L__ScreenChipInterrupt119
	GOTO	L_ScreenChipInterrupt19
L__ScreenChipInterrupt119:
	GOTO	L_end_ScreenChipInterrupt
L_ScreenChipInterrupt19:
;smp.c,145 :: 		UART1_Write(0xD3);//tell buffer to start listening
	MOV	#211, W10
	CALL	_UART1_Write
;smp.c,146 :: 		loggingFlag=1;
	MOV	#1, W0
	MOV	W0, _loggingFlag
;smp.c,147 :: 		REncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _REncPos
	MOV	W1, _REncPos+2
;smp.c,148 :: 		IEncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _IEncPos
	MOV	W1, _IEncPos+2
;smp.c,149 :: 		POS1HLD=0;//resetQEI
	CLR	POS1HLD
;smp.c,150 :: 		POS1CNTL=0;
	CLR	POS1CNTL
;smp.c,151 :: 		POS2HLD=0;//resetQEI
	CLR	POS2HLD
;smp.c,152 :: 		POS2CNTL=0;
	CLR	POS2CNTL
;smp.c,153 :: 		oldREncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _oldREncPos
	MOV	W1, _oldREncPos+2
;smp.c,154 :: 		sendtoBufferCount=0;
	MOV	#lo_addr(_sendtoBufferCount), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,155 :: 		measurements=0;//reset counts
	MOV	#lo_addr(_measurements), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,156 :: 		t=0;
	CLR	W0
	CLR	W1
	MOV	W0, _t
	MOV	W1, _t+2
;smp.c,158 :: 		break;
	GOTO	L_ScreenChipInterrupt16
;smp.c,159 :: 		case 0xB7://quit logging mode
L_ScreenChipInterrupt20:
;smp.c,160 :: 		loggingFlag=0;
	CLR	W0
	MOV	W0, _loggingFlag
;smp.c,162 :: 		break;
	GOTO	L_ScreenChipInterrupt16
;smp.c,163 :: 		case 0xE3://start of name
L_ScreenChipInterrupt21:
;smp.c,164 :: 		nameStart=1;
	MOV	#1, W0
	MOV	W0, _nameStart
;smp.c,165 :: 		UART1_Write(0xF3);
	MOV	#243, W10
	CALL	_UART1_Write
;smp.c,166 :: 		break;
	GOTO	L_ScreenChipInterrupt16
;smp.c,167 :: 		default:
L_ScreenChipInterrupt22:
;smp.c,168 :: 		UART1_Write(temp);//relay roughness bytes to buffchip
; temp start address is: 2 (W1)
	ZE	W1, W10
; temp end address is: 2 (W1)
	CALL	_UART1_Write
;smp.c,169 :: 		break;
	GOTO	L_ScreenChipInterrupt16
;smp.c,191 :: 		}
L_ScreenChipInterrupt15:
; temp start address is: 2 (W1)
	MOV.B	#49, W0
	CP.B	W1, W0
	BRA NZ	L__ScreenChipInterrupt120
	GOTO	L_ScreenChipInterrupt17
L__ScreenChipInterrupt120:
	MOV.B	#162, W0
	CP.B	W1, W0
	BRA NZ	L__ScreenChipInterrupt121
	GOTO	L_ScreenChipInterrupt18
L__ScreenChipInterrupt121:
	MOV.B	#183, W0
	CP.B	W1, W0
	BRA NZ	L__ScreenChipInterrupt122
	GOTO	L_ScreenChipInterrupt20
L__ScreenChipInterrupt122:
	MOV.B	#227, W0
	CP.B	W1, W0
	BRA NZ	L__ScreenChipInterrupt123
	GOTO	L_ScreenChipInterrupt21
L__ScreenChipInterrupt123:
	GOTO	L_ScreenChipInterrupt22
; temp end address is: 2 (W1)
L_ScreenChipInterrupt16:
;smp.c,192 :: 		}
L_ScreenChipInterrupt14:
;smp.c,194 :: 		}
L_end_ScreenChipInterrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _ScreenChipInterrupt

_initLaz:

;smp.c,197 :: 		void initLaz(){//UART3 to Laz
;smp.c,199 :: 		UART3_Init_Advanced(115200,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);          //connect to sensor @230400
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	CLR	W12
	MOV	#49664, W10
	MOV	#1, W11
	MOV	#1, W0
	PUSH	W0
	CALL	_UART3_Init_Advanced
	SUB	#2, W15
;smp.c,200 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initLaz23:
	DEC	W7
	BRA NZ	L_initLaz23
	DEC	W8
	BRA NZ	L_initLaz23
	NOP
	NOP
;smp.c,213 :: 		U3STA.OERR=0;
	BCLR	U3STA, #1
;smp.c,215 :: 		U3STA.B7=0;
	BCLR	U3STA, #7
;smp.c,216 :: 		IPC20.B10=1;  //priority 101
	BSET	IPC20, #10
;smp.c,217 :: 		IPC20.B9=0;
	BCLR	IPC20, #9
;smp.c,218 :: 		IPC20.B8=1;
	BSET	IPC20, #8
;smp.c,219 :: 		U3STA.B7=0;
	BCLR	U3STA, #7
;smp.c,220 :: 		IFS5.B2=0;
	BCLR	IFS5, #2
;smp.c,221 :: 		IEC5.B2=1;
	BSET	IEC5, #2
;smp.c,223 :: 		Laz[3]=0;
	MOV	#lo_addr(_Laz+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,224 :: 		Laz[2]=0;
	MOV	#lo_addr(_Laz+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,225 :: 		Laz[1]=0;Laz[0]=0;
	MOV	#lo_addr(_Laz+1), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_Laz), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,226 :: 		LazIterator=0;//counter
	MOV	#lo_addr(_LazIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,227 :: 		}
L_end_initLaz:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initLaz

_LazInterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;smp.c,228 :: 		void LazInterrupt() iv IVT_ADDR_U3RXINTERRUPT ics ICS_AUTO {
;smp.c,230 :: 		IFS5.B2=0;
	BCLR	IFS5, #2
;smp.c,231 :: 		temp= U3RXREG;
; temp start address is: 4 (W2)
	MOV	U3RXREG, W2
;smp.c,232 :: 		if(temp==0xFF){
	MOV.B	#255, W0
	CP.B	W2, W0
	BRA Z	L__LazInterrupt126
	GOTO	L_LazInterrupt25
L__LazInterrupt126:
;smp.c,233 :: 		LazIterator=2;
	MOV	#lo_addr(_LazIterator), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;smp.c,234 :: 		}
L_LazInterrupt25:
;smp.c,236 :: 		Laz[LazIterator++]=temp;
	MOV	#lo_addr(_LazIterator), W0
	ZE	[W0], W1
	MOV	#lo_addr(_Laz), W0
	ADD	W0, W1, W0
	MOV.B	W2, [W0]
; temp end address is: 4 (W2)
	MOV	#lo_addr(_LazIterator), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_LazIterator), W0
	MOV.B	W1, [W0]
;smp.c,237 :: 		if(LazIterator==3){LazIterator=0;}//chongfu jiancha
	MOV	#lo_addr(_LazIterator), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__LazInterrupt127
	GOTO	L_LazInterrupt26
L__LazInterrupt127:
	MOV	#lo_addr(_LazIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
L_LazInterrupt26:
;smp.c,242 :: 		}
L_end_LazInterrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _LazInterrupt

_init9DOF:

;smp.c,243 :: 		void init9DOF(){//UART4 to Inc
;smp.c,244 :: 		unsigned int initializer=0;
	PUSH	W10
	PUSH	W11
;smp.c,245 :: 		for(initializer=0;initializer<18;initializer++){DOFReadyBuf[initializer]=0x0C;}//init 9DOF buff
; initializer start address is: 4 (W2)
	CLR	W2
; initializer end address is: 4 (W2)
L_init9DOF27:
; initializer start address is: 4 (W2)
	CP	W2, #18
	BRA LTU	L__init9DOF129
	GOTO	L_init9DOF28
L__init9DOF129:
	MOV	#lo_addr(_DOFReadyBuf), W0
	ADD	W0, W2, W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
	INC	W2
; initializer end address is: 4 (W2)
	GOTO	L_init9DOF27
L_init9DOF28:
;smp.c,246 :: 		UART4_Init(115200);
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART4_Init
;smp.c,247 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_init9DOF30:
	DEC	W7
	BRA NZ	L_init9DOF30
	DEC	W8
	BRA NZ	L_init9DOF30
	NOP
	NOP
;smp.c,248 :: 		IFS5.B8=0;
	BCLR	IFS5, #8
;smp.c,249 :: 		U4STA.B7=0;
	BCLR	U4STA, #7
;smp.c,250 :: 		IPC22.B2=1;//priority=110
	BSET	IPC22, #2
;smp.c,251 :: 		IPC22.B1=1;
	BSET	IPC22, #1
;smp.c,252 :: 		IPC22.B0=0;
	BCLR	IPC22, #0
;smp.c,253 :: 		IEC5.B8=1;
	BSET	IEC5, #8
;smp.c,254 :: 		U4STA.OERR=0;
	BCLR	U4STA, #1
;smp.c,262 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_init9DOF32:
	DEC	W7
	BRA NZ	L_init9DOF32
	DEC	W8
	BRA NZ	L_init9DOF32
	NOP
	NOP
;smp.c,263 :: 		DofIterator=0;
	MOV	#lo_addr(_DofIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,265 :: 		}
L_end_init9DOF:
	POP	W11
	POP	W10
	RETURN
; end of _init9DOF

_DOFInterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;smp.c,266 :: 		void DOFInterrupt() iv IVT_ADDR_U4RXINTERRUPT{
;smp.c,267 :: 		IFS5.B8=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	IFS5, #8
;smp.c,268 :: 		DOFBuf[DofIterator++]=U4RXREG;
	MOV	#lo_addr(_DofIterator), W0
	ZE	[W0], W1
	MOV	#lo_addr(_DOFBuf), W0
	ADD	W0, W1, W1
	MOV.B	U4RXREG, WREG
	MOV.B	W0, [W1]
	MOV	#lo_addr(_DofIterator), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_DofIterator), W0
	MOV.B	W1, [W0]
;smp.c,269 :: 		if(DofIterator==18){DofIterator=0;memcpy(DOFReadyBuf,DOFBuf,18);}
	MOV	#lo_addr(_DofIterator), W0
	MOV.B	[W0], W0
	CP.B	W0, #18
	BRA Z	L__DOFInterrupt131
	GOTO	L_DOFInterrupt34
L__DOFInterrupt131:
	MOV	#lo_addr(_DofIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#18, W12
	MOV	#lo_addr(_DOFBuf), W11
	MOV	#lo_addr(_DOFReadyBuf), W10
	CALL	_memcpy
L_DOFInterrupt34:
;smp.c,271 :: 		}
L_end_DOFInterrupt:
	POP	W12
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
; end of _DOFInterrupt

_initAcc:

;smp.c,273 :: 		void initAcc(){
;smp.c,274 :: 		ANSELE.ANSE2=1;//y
	BSET	ANSELE, #2
;smp.c,275 :: 		ANSELE.ANSE3=1;//x
	BSET	ANSELE, #3
;smp.c,276 :: 		ANSELE.ANSE4=1;//z
	BSET	ANSELE, #4
;smp.c,277 :: 		TRISE.B4=1;
	BSET	TRISE, #4
;smp.c,278 :: 		TRISE.B3=1;
	BSET	TRISE, #3
;smp.c,279 :: 		TRISE.B2=1;
	BSET	TRISE, #2
;smp.c,280 :: 		ADC1_Init();
	CALL	_ADC1_Init
;smp.c,281 :: 		}
L_end_initAcc:
	RETURN
; end of _initAcc

_initRollingQEI:

;smp.c,282 :: 		void initRollingQEI(){
;smp.c,283 :: 		QEI1CON=0b1000000000000000; //index does not reset counter. no overflow interruptionn'shit
	MOV	#32768, W0
	MOV	WREG, QEI1CON
;smp.c,284 :: 		}
L_end_initRollingQEI:
	RETURN
; end of _initRollingQEI

_initInchWormQEI:

;smp.c,285 :: 		void initInchWormQEI(){
;smp.c,286 :: 		QEI2CON=0b1000000000000000; //index does not reset counter. no overflow interruptionn'shit
	MOV	#32768, W0
	MOV	WREG, QEI2CON
;smp.c,287 :: 		}
L_end_initInchWormQEI:
	RETURN
; end of _initInchWormQEI

_initMotor:

;smp.c,288 :: 		void initMotor(){
;smp.c,289 :: 		initInchWormQEI();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_initInchWormQEI
;smp.c,290 :: 		pwm_period1 = PWM_Init(500, 1, 1, 2);
	MOV	#1, W13
	MOV	#1, W12
	MOV	#500, W10
	MOV	#0, W11
	MOV	#2, W0
	PUSH	W0
	CALL	_PWM_Init
	SUB	#2, W15
	MOV	W0, _pwm_period1
;smp.c,291 :: 		}
L_end_initMotor:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initMotor

_initAll:

;smp.c,292 :: 		void initAll(){
;smp.c,294 :: 		initChip();
	CALL	_initChip
;smp.c,295 :: 		mapPins();
	CALL	_mapPins
;smp.c,296 :: 		TRISF.B4=0;//led
	BCLR	TRISF, #4
;smp.c,297 :: 		LATF.B4=1;
	BSET	LATF, #4
;smp.c,298 :: 		initTimer1();
	CALL	_InitTimer1
;smp.c,299 :: 		initBufferchipUART();//UART1
	CALL	_initBufferchipUART
;smp.c,300 :: 		initBufferchipSPI(); //SPI2
	CALL	_initBufferchipSPI
;smp.c,301 :: 		initScreenChipCommunication(); //UART2
	CALL	_initScreenChipCommunication
;smp.c,303 :: 		Delay_ms(22000);
	MOV	#4700, W8
	MOV	#49155, W7
L_initAll35:
	DEC	W7
	BRA NZ	L_initAll35
	DEC	W8
	BRA NZ	L_initAll35
	NOP
;smp.c,306 :: 		initLaz();//UART3
	CALL	_initLaz
;smp.c,307 :: 		init9DOF();//UART4
	CALL	_init9DOF
;smp.c,308 :: 		initRollingQEI();//QEI1
	CALL	_initRollingQEI
;smp.c,309 :: 		initInchWormQEI();
	CALL	_initInchWormQEI
;smp.c,311 :: 		}
L_end_initAll:
	RETURN
; end of _initAll

_resetAll:

;smp.c,313 :: 		void resetAll(){
;smp.c,314 :: 		T1IE_bit= 0; //stop timer
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,315 :: 		t=0;
	CLR	W0
	CLR	W1
	MOV	W0, _t
	MOV	W1, _t+2
;smp.c,316 :: 		U1STA.OERR=0;
	BCLR	U1STA, #1
;smp.c,317 :: 		U2STA.OERR=0;
	BCLR	U2STA, #1
;smp.c,318 :: 		U3STA.OERR=0;
	BCLR	U3STA, #1
;smp.c,319 :: 		U4STA.OERR=0;
	BCLR	U4STA, #1
;smp.c,320 :: 		UART1_Read();
	CALL	_UART1_Read
;smp.c,321 :: 		UART2_Read();
	CALL	_UART2_Read
;smp.c,322 :: 		UART3_Read();
	CALL	_UART3_Read
;smp.c,323 :: 		UART4_Read();
	CALL	_UART4_Read
;smp.c,324 :: 		LazIterator=0;//reset pointers
	MOV	#lo_addr(_LazIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,325 :: 		DofIterator=0;
	MOV	#lo_addr(_DofIterator), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,326 :: 		REncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _REncPos
	MOV	W1, _REncPos+2
;smp.c,327 :: 		IEncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _IEncPos
	MOV	W1, _IEncPos+2
;smp.c,328 :: 		POS1HLD=0;//resetQEI
	CLR	POS1HLD
;smp.c,329 :: 		POS1CNTL=0;
	CLR	POS1CNTL
;smp.c,330 :: 		POS2HLD=0;//resetQEI
	CLR	POS2HLD
;smp.c,331 :: 		POS2CNTL=0;
	CLR	POS2CNTL
;smp.c,332 :: 		oldREncPos=0;
	CLR	W0
	CLR	W1
	MOV	W0, _oldREncPos
	MOV	W1, _oldREncPos+2
;smp.c,333 :: 		sendtoBufferCount=0;
	MOV	#lo_addr(_sendtoBufferCount), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,334 :: 		}
L_end_resetAll:
	RETURN
; end of _resetAll

_getRQEIPOS:

;smp.c,337 :: 		void getRQEIPOS(unsigned long *pos, unsigned long *oldPos){
;smp.c,340 :: 		posL=POS1CNTL;  //get Low Position
	MOV	POS1CNTL, WREG
	MOV	W0, getRQEIPOS_posL_L0
;smp.c,341 :: 		posH=POS1HLD;   //get High Position from hold reg        originally POS1HLD changed by Ian and James 07312013
	MOV	POS1HLD, WREG
	CLR	W1
	MOV	W0, getRQEIPOS_posH_L0
	MOV	W1, getRQEIPOS_posH_L0+2
;smp.c,342 :: 		*pos=posL|(posH<<16); // writes to temp
	MOV	#lo_addr(getRQEIPOS_posH_L0), W0
	MOV	[W0], W3
	CLR	W2
	MOV	getRQEIPOS_posL_L0, W0
	CLR	W1
	IOR	W0, W2, W0
	IOR	W1, W3, W1
	MOV.D	W0, [W10]
;smp.c,344 :: 		if (*pos < *oldPos || *pos - *oldPos > 0xFFFF) {logFlagByDistance = 0;}
	MOV.D	[W10], W2
	MOV.D	[W11], W0
	CP	W2, W0
	CPB	W3, W1
	BRA GEU	L__getRQEIPOS139
	GOTO	L__getRQEIPOS103
L__getRQEIPOS139:
	MOV.D	[W10], W0
	SUB	W0, [W11++], W2
	SUBB	W1, [W11--], W3
	MOV	#65535, W0
	MOV	#0, W1
	CP	W2, W0
	CPB	W3, W1
	BRA LEU	L__getRQEIPOS140
	GOTO	L__getRQEIPOS102
L__getRQEIPOS140:
	GOTO	L_getRQEIPOS39
L__getRQEIPOS103:
L__getRQEIPOS102:
	CLR	W0
	MOV	W0, _logFlagByDistance
	GOTO	L_getRQEIPOS40
L_getRQEIPOS39:
;smp.c,345 :: 		else {logFlagByDistance = 1;*oldPos = *pos;}
	MOV	#1, W0
	MOV	W0, _logFlagByDistance
	MOV	[W10++], [W11++]
	MOV	[W10--], [W11--]
L_getRQEIPOS40:
;smp.c,346 :: 		}
L_end_getRQEIPOS:
	RETURN
; end of _getRQEIPOS

_getIQEIPOS:

;smp.c,348 :: 		void getIQEIPOS(unsigned long *pos){
;smp.c,351 :: 		posL=POS2CNTL;  //get Low Position
	MOV	POS2CNTL, WREG
	MOV	W0, getIQEIPOS_posL_L0
;smp.c,352 :: 		posH=POS2HLD;   //get High Position from hold reg        originally POS1HLD changed by Ian and James 07312013
	MOV	POS2HLD, WREG
	CLR	W1
	MOV	W0, getIQEIPOS_posH_L0
	MOV	W1, getIQEIPOS_posH_L0+2
;smp.c,353 :: 		*pos=posL|(posH<<16); // writes to temp
	MOV	#lo_addr(getIQEIPOS_posH_L0), W0
	MOV	[W0], W3
	CLR	W2
	MOV	getIQEIPOS_posL_L0, W0
	CLR	W1
	IOR	W0, W2, W0
	IOR	W1, W3, W1
	MOV.D	W0, [W10]
;smp.c,354 :: 		}
L_end_getIQEIPOS:
	RETURN
; end of _getIQEIPOS

_getLaz:

;smp.c,355 :: 		void getLaz(){
;smp.c,356 :: 		UART3_Write(0x00);UART3_Write(0x86);//request
	PUSH	W10
	CLR	W10
	CALL	_UART3_Write
	MOV	#134, W10
	CALL	_UART3_Write
;smp.c,357 :: 		}
L_end_getLaz:
	POP	W10
	RETURN
; end of _getLaz

_get9DOF:

;smp.c,358 :: 		void get9DOF(){
;smp.c,359 :: 		UART4_Write(0x31);//requset
	PUSH	W10
	MOV	#49, W10
	CALL	_UART4_Write
;smp.c,360 :: 		}
L_end_get9DOF:
	POP	W10
	RETURN
; end of _get9DOF

_sampleOnce:

;smp.c,362 :: 		void sampleOnce(){
;smp.c,364 :: 		getRQEIPOS(&REncPos, &oldREncPos);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_oldREncPos), W11
	MOV	#lo_addr(_REncPos), W10
	CALL	_getRQEIPOS
;smp.c,365 :: 		getIQEIPOS(&IEncPos);
	MOV	#lo_addr(_IEncPos), W10
	CALL	_getIQEIPOS
;smp.c,366 :: 		if(!smpOnceflag){
	MOV	#lo_addr(_smpOnceflag), W0
	CP0	[W0]
	BRA Z	L__sampleOnce145
	GOTO	L_sampleOnce41
L__sampleOnce145:
;smp.c,367 :: 		if (!logFlagByDistance) {return;}
	MOV	#lo_addr(_logFlagByDistance), W0
	CP0	[W0]
	BRA Z	L__sampleOnce146
	GOTO	L_sampleOnce42
L__sampleOnce146:
	GOTO	L_end_sampleOnce
L_sampleOnce42:
;smp.c,368 :: 		}
L_sampleOnce41:
;smp.c,370 :: 		measurements++;
	MOV	#lo_addr(_measurements), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_measurements), W0
	MOV.B	W1, [W0]
;smp.c,371 :: 		if(measurements==1){//every 8 Laz one inc
	MOV	#lo_addr(_measurements), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__sampleOnce147
	GOTO	L_sampleOnce43
L__sampleOnce147:
;smp.c,372 :: 		get9DOF();
	CALL	_get9DOF
;smp.c,373 :: 		Delay_us(300);
	MOV	#4200, W7
L_sampleOnce44:
	DEC	W7
	BRA NZ	L_sampleOnce44
	NOP
	NOP
;smp.c,374 :: 		}
	GOTO	L_sampleOnce46
L_sampleOnce43:
;smp.c,375 :: 		else if(measurements==8){
	MOV	#lo_addr(_measurements), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA Z	L__sampleOnce148
	GOTO	L_sampleOnce47
L__sampleOnce148:
;smp.c,376 :: 		measurements=0;
	MOV	#lo_addr(_measurements), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,377 :: 		Delay_us(400);
	MOV	#5600, W7
L_sampleOnce48:
	DEC	W7
	BRA NZ	L_sampleOnce48
	NOP
	NOP
;smp.c,378 :: 		}
	GOTO	L_sampleOnce50
L_sampleOnce47:
;smp.c,380 :: 		Delay_us(400);
	MOV	#5600, W7
L_sampleOnce51:
	DEC	W7
	BRA NZ	L_sampleOnce51
	NOP
	NOP
;smp.c,381 :: 		}
L_sampleOnce50:
L_sampleOnce46:
;smp.c,384 :: 		}
L_end_sampleOnce:
	POP	W11
	POP	W10
	RETURN
; end of _sampleOnce

_sendToBuffer:
	LNK	#2

;smp.c,385 :: 		void sendToBuffer(){ //  (4 Laz 8 enc 3 time )*10  18 9DOF         504 per 512
;smp.c,388 :: 		if(!logFlagByDistance){return;}
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_logFlagByDistance), W0
	CP0	[W0]
	BRA Z	L__sendToBuffer150
	GOTO	L_sendToBuffer53
L__sendToBuffer150:
	GOTO	L_end_sendToBuffer
L_sendToBuffer53:
;smp.c,392 :: 		T1IE_bit = 0;
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,393 :: 		tempT=t;
; tempT start address is: 8 (W4)
	MOV	_t, W4
	MOV	_t+2, W5
;smp.c,394 :: 		T1IE_bit = 1;
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,397 :: 		SPI2_Write(Laz[3]);SPI2_Write(Laz[2]);SPI2_Write(Laz[1]);SPI2_Write(Laz[0]);
	MOV	#lo_addr(_Laz+3), W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	MOV	#lo_addr(_Laz+2), W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	MOV	#lo_addr(_Laz+1), W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	MOV	#lo_addr(_Laz), W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,399 :: 		SPI2_Write(REncPos>>24);SPI2_Write(REncPos>>16);SPI2_Write(REncPos>>8);SPI2_Write(REncPos);
	MOV	#24, W3
	MOV	#lo_addr(_REncPos), W2
	MOV.D	[W2], W0
L__sendToBuffer151:
	DEC	W3, W3
	BRA LT	L__sendToBuffer152
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__sendToBuffer151
L__sendToBuffer152:
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	#lo_addr(_REncPos), W2
	MOV.D	[W2], W0
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	#8, W3
	MOV	#lo_addr(_REncPos), W2
	MOV.D	[W2], W0
L__sendToBuffer153:
	DEC	W3, W3
	BRA LT	L__sendToBuffer154
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__sendToBuffer153
L__sendToBuffer154:
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	_REncPos, W10
	CALL	_SPI2_Write
;smp.c,400 :: 		SPI2_Write(IEncPos>>24);SPI2_Write(IEncPos>>16);SPI2_Write(IEncPos>>8);SPI2_Write(IEncPos);
	MOV	#24, W3
	MOV	#lo_addr(_IEncPos), W2
	MOV.D	[W2], W0
L__sendToBuffer155:
	DEC	W3, W3
	BRA LT	L__sendToBuffer156
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__sendToBuffer155
L__sendToBuffer156:
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	#lo_addr(_IEncPos), W2
	MOV.D	[W2], W0
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	#8, W3
	MOV	#lo_addr(_IEncPos), W2
	MOV.D	[W2], W0
L__sendToBuffer157:
	DEC	W3, W3
	BRA LT	L__sendToBuffer158
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__sendToBuffer157
L__sendToBuffer158:
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	_IEncPos, W10
	CALL	_SPI2_Write
;smp.c,402 :: 		SPI2_Write(tempT>>16);SPI2_Write(tempT>>8);SPI2_Write(tempT);
	MOV.D	W4, W0
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	#8, W2
	MOV.D	W4, W0
L__sendToBuffer159:
	DEC	W2, W2
	BRA LT	L__sendToBuffer160
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__sendToBuffer159
L__sendToBuffer160:
	MOV	W0, W10
	CALL	_SPI2_Write
	MOV	W4, W10
; tempT end address is: 8 (W4)
	CALL	_SPI2_Write
;smp.c,405 :: 		sendtoBufferCount++;
	MOV	#lo_addr(_sendtoBufferCount), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_sendtoBufferCount), W0
	MOV.B	W1, [W0]
;smp.c,408 :: 		if(sendtoBufferCount==10){
	MOV	#lo_addr(_sendtoBufferCount), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA Z	L__sendToBuffer161
	GOTO	L_sendToBuffer54
L__sendToBuffer161:
;smp.c,409 :: 		sendtoBufferCount=0;
	MOV	#lo_addr(_sendtoBufferCount), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,413 :: 		memcpy(shadowDOFBuffer,DOFreadyBuf,2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,414 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,415 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[2],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+2), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,416 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,417 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[4],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+4), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,418 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,420 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[6],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+6), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,421 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,422 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[8],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+8), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,423 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,424 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[10],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+10), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,425 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,427 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[12],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+12), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,428 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,429 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[14],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+14), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,430 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,431 :: 		memcpy(shadowDOFBuffer,&DOFreadyBuf[16],2);
	ADD	W14, #0, W0
	MOV	#2, W12
	MOV	#lo_addr(_DOFReadyBuf+16), W11
	MOV	W0, W10
	CALL	_memcpy
;smp.c,432 :: 		SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI2_Write
	ADD	W14, #0, W0
	INC	W0
	ZE	[W0], W10
	CALL	_SPI2_Write
;smp.c,433 :: 		}
L_sendToBuffer54:
;smp.c,434 :: 		}
L_end_sendToBuffer:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _sendToBuffer

_smpsendToScreen:

;smp.c,435 :: 		void smpsendToScreen(){
;smp.c,441 :: 		tempEncPos=REncPos;
	PUSH	W10
; tempEncPos start address is: 6 (W3)
	MOV	_REncPos, W3
	MOV	_REncPos+2, W4
;smp.c,443 :: 		UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);  // 4laz-4enc-4pitch-4roll-6acc
	MOV	#lo_addr(_Laz+3), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz+2), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz+1), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz), W0
	ZE	[W0], W10
	CALL	_UART2_Write
;smp.c,444 :: 		UART2_Write(tempEncPos>>24);UART2_Write(tempEncPos>>16);UART2_Write(tempEncPos>>8);UART2_Write(tempEncPos);
	MOV	#24, W2
	MOV	W3, W0
	MOV	W4, W1
L__smpsendToScreen163:
	DEC	W2, W2
	BRA LT	L__smpsendToScreen164
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__smpsendToScreen163
L__smpsendToScreen164:
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	W3, W0
	MOV	W4, W1
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	#8, W2
	MOV	W3, W0
	MOV	W4, W1
L__smpsendToScreen165:
	DEC	W2, W2
	BRA LT	L__smpsendToScreen166
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__smpsendToScreen165
L__smpsendToScreen166:
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	W3, W10
; tempEncPos end address is: 6 (W3)
	CALL	_UART2_Write
;smp.c,445 :: 		UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
;smp.c,446 :: 		UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
;smp.c,447 :: 		UART2_Write(DOFReadyBuf[0]);UART2_Write(DOFReadyBuf[1]);
	MOV	#lo_addr(_DOFReadyBuf), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_DOFReadyBuf+1), W0
	ZE	[W0], W10
	CALL	_UART2_Write
;smp.c,448 :: 		UART2_Write(DOFReadyBuf[2]);UART2_Write(DOFReadyBuf[3]);
	MOV	#lo_addr(_DOFReadyBuf+2), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_DOFReadyBuf+3), W0
	ZE	[W0], W10
	CALL	_UART2_Write
;smp.c,449 :: 		UART2_Write(DOFReadyBuf[4]);UART2_Write(DOFReadyBuf[5]);
	MOV	#lo_addr(_DOFReadyBuf+4), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_DOFReadyBuf+5), W0
	ZE	[W0], W10
	CALL	_UART2_Write
;smp.c,450 :: 		}
L_end_smpsendToScreen:
	POP	W10
	RETURN
; end of _smpsendToScreen

_logsendToScreen:

;smp.c,451 :: 		void logsendToScreen(){
;smp.c,455 :: 		if (!logFlagByDistance) {return;}
	PUSH	W10
	MOV	#lo_addr(_logFlagByDistance), W0
	CP0	[W0]
	BRA Z	L__logsendToScreen168
	GOTO	L_logsendToScreen55
L__logsendToScreen168:
	GOTO	L_end_logsendToScreen
L_logsendToScreen55:
;smp.c,456 :: 		tempT=t;
; tempT start address is: 6 (W3)
	MOV	_t, W3
	MOV	_t+2, W4
;smp.c,457 :: 		if(inchWormMode){
	MOV	#lo_addr(_inchWormMode), W0
	CP0	[W0]
	BRA NZ	L__logsendToScreen169
	GOTO	L_logsendToScreen56
L__logsendToScreen169:
;smp.c,458 :: 		tempEnc=IEncPos;
; tempEnc start address is: 10 (W5)
	MOV	_IEncPos, W5
	MOV	_IEncPos+2, W6
;smp.c,459 :: 		}
; tempEnc end address is: 10 (W5)
	GOTO	L_logsendToScreen57
L_logsendToScreen56:
;smp.c,461 :: 		tempEnc=REncPos;
; tempEnc start address is: 10 (W5)
	MOV	_REncPos, W5
	MOV	_REncPos+2, W6
; tempEnc end address is: 10 (W5)
;smp.c,462 :: 		}
L_logsendToScreen57:
;smp.c,463 :: 		temp++;
; tempEnc start address is: 10 (W5)
	MOV	#1, W1
	MOV	#lo_addr(logsendToScreen_temp_L0), W0
	ADD	W1, [W0], [W0]
;smp.c,464 :: 		if(temp==100){
	MOV	#100, W1
	MOV	#lo_addr(logsendToScreen_temp_L0), W0
	CP	W1, [W0]
	BRA Z	L__logsendToScreen170
	GOTO	L_logsendToScreen58
L__logsendToScreen170:
;smp.c,465 :: 		temp=0;
	CLR	W0
	MOV	W0, logsendToScreen_temp_L0
;smp.c,466 :: 		UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);  //laz
	MOV	#lo_addr(_Laz+3), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz+2), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz+1), W0
	ZE	[W0], W10
	CALL	_UART2_Write
	MOV	#lo_addr(_Laz), W0
	ZE	[W0], W10
	CALL	_UART2_Write
;smp.c,467 :: 		UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);          //pitch dummy
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
;smp.c,468 :: 		UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);          //roll dummy
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
	CLR	W10
	CALL	_UART2_Write
;smp.c,469 :: 		UART2_Write(tempT>>16);UART2_Write(tempT>>8);UART2_Write(tempT);                  //3t
	MOV	W3, W0
	MOV	W4, W1
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	#8, W2
	MOV	W3, W0
	MOV	W4, W1
L__logsendToScreen171:
	DEC	W2, W2
	BRA LT	L__logsendToScreen172
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__logsendToScreen171
L__logsendToScreen172:
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	W3, W10
; tempT end address is: 6 (W3)
	CALL	_UART2_Write
;smp.c,470 :: 		UART2_Write(tempEnc>>24);UART2_Write(tempEnc>>16);UART2_Write(tempEnc>>8);UART2_Write(tempEnc);//4enc
	MOV	#24, W2
	MOV	W5, W0
	MOV	W6, W1
L__logsendToScreen173:
	DEC	W2, W2
	BRA LT	L__logsendToScreen174
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__logsendToScreen173
L__logsendToScreen174:
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	W5, W0
	MOV	W6, W1
	MOV	W1, W0
	CLR	W1
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	#8, W2
	MOV	W5, W0
	MOV	W6, W1
L__logsendToScreen175:
	DEC	W2, W2
	BRA LT	L__logsendToScreen176
	LSR	W1, W1
	RRC	W0, W0
	BRA	L__logsendToScreen175
L__logsendToScreen176:
	MOV	W0, W10
	CALL	_UART2_Write
	MOV	W5, W10
; tempEnc end address is: 10 (W5)
	CALL	_UART2_Write
;smp.c,471 :: 		}
L_logsendToScreen58:
;smp.c,472 :: 		}
L_end_logsendToScreen:
	POP	W10
	RETURN
; end of _logsendToScreen

_moveWorm:

;smp.c,473 :: 		void moveWorm(unsigned int direction){
;smp.c,474 :: 		PWM_Start(1);
	PUSH	W10
	PUSH	W11
	PUSH	W10
	MOV.B	#1, W10
	CALL	_PWM_Start
	POP	W10
;smp.c,475 :: 		if(direction==1){
	CP	W10, #1
	BRA Z	L__moveWorm178
	GOTO	L_moveWorm59
L__moveWorm178:
;smp.c,476 :: 		LATD.B14=1;
	BSET	LATD, #14
;smp.c,477 :: 		}
	GOTO	L_moveWorm60
L_moveWorm59:
;smp.c,479 :: 		LATD.B14=0;
	BCLR	LATD, #14
;smp.c,480 :: 		}
L_moveWorm60:
;smp.c,481 :: 		PWM_Set_Duty(pwm_period1/2, 1);
	MOV	_pwm_period1, W0
	LSR	W0, #1, W0
	MOV	#1, W11
	MOV	W0, W10
	CALL	_PWM_Set_Duty
;smp.c,482 :: 		}
L_end_moveWorm:
	POP	W11
	POP	W10
	RETURN
; end of _moveWorm

_stopWorm:

;smp.c,483 :: 		void stopWorm(){
;smp.c,484 :: 		PWM_Stop(1);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_PWM_Stop
;smp.c,485 :: 		}
L_end_stopWorm:
	POP	W10
	RETURN
; end of _stopWorm

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;smp.c,486 :: 		void main() {
;smp.c,488 :: 		initAll();
	PUSH	W10
	CALL	_initAll
;smp.c,489 :: 		LATF.B4=0;
	BCLR	LATF, #4
;smp.c,490 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main61:
	DEC	W7
	BRA NZ	L_main61
	DEC	W8
	BRA NZ	L_main61
	NOP
	NOP
;smp.c,491 :: 		resetAll();
	CALL	_resetAll
;smp.c,492 :: 		while(1){
L_main63:
;smp.c,493 :: 		if(smpOnceflag){//send once when a request is received.
	MOV	#lo_addr(_smpOnceflag), W0
	CP0	[W0]
	BRA NZ	L__main181
	GOTO	L_main65
L__main181:
;smp.c,494 :: 		LATF.B4=1;
	BSET	LATF, #4
;smp.c,495 :: 		sampleOnce();
	CALL	_sampleOnce
;smp.c,496 :: 		smpOnceflag=0;
	CLR	W0
	MOV	W0, _smpOnceflag
;smp.c,497 :: 		Delay_ms(10);
	MOV	#3, W8
	MOV	#8929, W7
L_main66:
	DEC	W7
	BRA NZ	L_main66
	DEC	W8
	BRA NZ	L_main66
;smp.c,498 :: 		smpsendToScreen();
	CALL	_smpsendToScreen
;smp.c,499 :: 		LATF.B4=0;
	BCLR	LATF, #4
;smp.c,500 :: 		Delay_ms(5);
	MOV	#2, W8
	MOV	#4464, W7
L_main68:
	DEC	W7
	BRA NZ	L_main68
	DEC	W8
	BRA NZ	L_main68
	NOP
	NOP
;smp.c,501 :: 		}
L_main65:
;smp.c,502 :: 		if(sendtoBufferCount!=0){ LATF.B4=~LATF.B4;}
	MOV	#lo_addr(_sendtoBufferCount), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__main182
	GOTO	L_main70
L__main182:
	BTG	LATF, #4
L_main70:
;smp.c,503 :: 		while((loggingFlag+bufferlistening)==2){//continously log to buffer chip
L_main71:
	MOV	#lo_addr(_bufferlistening), W0
	ZE	[W0], W1
	MOV	#lo_addr(_loggingFlag), W0
	ADD	W1, [W0], W0
	CP	W0, #2
	BRA Z	L__main183
	GOTO	L_main72
L__main183:
;smp.c,504 :: 		sampleOnce();
	CALL	_sampleOnce
;smp.c,506 :: 		sendToBuffer();
	CALL	_sendToBuffer
;smp.c,508 :: 		logsendToScreen();
	CALL	_logsendToScreen
;smp.c,509 :: 		if(inchWormMode){if(IEncPos>=inchwormcycle){stopWorm();Delay_ms(500);PWM_Start(1);loggingFlag=0;moveWorm(1);inchWormDoneFlag=1;}}
	MOV	#lo_addr(_inchWormMode), W0
	CP0	[W0]
	BRA NZ	L__main184
	GOTO	L_main73
L__main184:
	MOV	_IEncPos, W1
	MOV	_IEncPos+2, W2
	MOV	#lo_addr(_inchwormcycle), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA GEU	L__main185
	GOTO	L_main74
L__main185:
	CALL	_stopWorm
	MOV	#107, W8
	MOV	#53247, W7
L_main75:
	DEC	W7
	BRA NZ	L_main75
	DEC	W8
	BRA NZ	L_main75
	NOP
	NOP
	MOV.B	#1, W10
	CALL	_PWM_Start
	CLR	W0
	MOV	W0, _loggingFlag
	MOV	#1, W10
	CALL	_moveWorm
	MOV	#1, W0
	MOV	W0, _inchWormDoneFlag
L_main74:
L_main73:
;smp.c,510 :: 		if(!loggingFlag){
	MOV	#lo_addr(_loggingFlag), W0
	CP0	[W0]
	BRA Z	L__main186
	GOTO	L_main77
L__main186:
;smp.c,511 :: 		Delay_ms(10);
	MOV	#3, W8
	MOV	#8929, W7
L_main78:
	DEC	W7
	BRA NZ	L_main78
	DEC	W8
	BRA NZ	L_main78
;smp.c,512 :: 		UART1_Write(0xE2);//tell buffer chip stop listening and log 0x00 speration sector
	MOV	#226, W10
	CALL	_UART1_Write
;smp.c,515 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main80:
	DEC	W7
	BRA NZ	L_main80
	DEC	W8
	BRA NZ	L_main80
	NOP
	NOP
	NOP
;smp.c,516 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,517 :: 		Delay_us(10);
	MOV	#140, W7
L_main82:
	DEC	W7
	BRA NZ	L_main82
	NOP
	NOP
;smp.c,518 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,519 :: 		Delay_us(10);
	MOV	#140, W7
L_main84:
	DEC	W7
	BRA NZ	L_main84
	NOP
	NOP
;smp.c,520 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,521 :: 		Delay_us(10);
	MOV	#140, W7
L_main86:
	DEC	W7
	BRA NZ	L_main86
	NOP
	NOP
;smp.c,522 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,523 :: 		Delay_us(10);
	MOV	#140, W7
L_main88:
	DEC	W7
	BRA NZ	L_main88
	NOP
	NOP
;smp.c,524 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,525 :: 		Delay_us(10);
	MOV	#140, W7
L_main90:
	DEC	W7
	BRA NZ	L_main90
	NOP
	NOP
;smp.c,526 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,527 :: 		Delay_us(10);
	MOV	#140, W7
L_main92:
	DEC	W7
	BRA NZ	L_main92
	NOP
	NOP
;smp.c,528 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,529 :: 		Delay_us(10);
	MOV	#140, W7
L_main94:
	DEC	W7
	BRA NZ	L_main94
	NOP
	NOP
;smp.c,530 :: 		if(!bufferlistening){//buffer chip done
	MOV	#lo_addr(_bufferlistening), W0
	CP0.B	[W0]
	BRA Z	L__main187
	GOTO	L_main96
L__main187:
;smp.c,531 :: 		UART2_Write(0xAA);
	MOV	#170, W10
	CALL	_UART2_Write
;smp.c,532 :: 		}
	GOTO	L_main97
L_main96:
;smp.c,534 :: 		UART2_Write(0x00);
	CLR	W10
	CALL	_UART2_Write
;smp.c,535 :: 		}
L_main97:
;smp.c,537 :: 		measurements=0;
	MOV	#lo_addr(_measurements), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,538 :: 		sendtoBufferCount=0;
	MOV	#lo_addr(_sendtoBufferCount), W1
	CLR	W0
	MOV.B	W0, [W1]
;smp.c,539 :: 		T1IE_bit= 0; //stop timer
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;smp.c,540 :: 		t=0;
	CLR	W0
	CLR	W1
	MOV	W0, _t
	MOV	W1, _t+2
;smp.c,541 :: 		resetAll();
	CALL	_resetAll
;smp.c,544 :: 		while(inchWormDoneFlag){
L_main98:
	MOV	#lo_addr(_inchWormDoneFlag), W0
	CP0	[W0]
	BRA NZ	L__main188
	GOTO	L_main99
L__main188:
;smp.c,545 :: 		LATF.B4=1;
	BSET	LATF, #4
;smp.c,546 :: 		getIQEIPOS(&IEncPos);
	MOV	#lo_addr(_IEncPos), W10
	CALL	_getIQEIPOS
;smp.c,547 :: 		if(IEncPos<=2){
	MOV	_IEncPos, W0
	MOV	_IEncPos+2, W1
	CP	W0, #2
	CPB	W1, #0
	BRA LEU	L__main189
	GOTO	L_main100
L__main189:
;smp.c,548 :: 		stopWorm();
	CALL	_stopWorm
;smp.c,549 :: 		inchWormDoneFlag=0;
	CLR	W0
	MOV	W0, _inchWormDoneFlag
;smp.c,550 :: 		LATF.B4=0;
	BCLR	LATF, #4
;smp.c,551 :: 		inchWormMode=0;
	CLR	W0
	MOV	W0, _inchWormMode
;smp.c,552 :: 		}
L_main100:
;smp.c,553 :: 		}
	GOTO	L_main98
L_main99:
;smp.c,554 :: 		break;
	GOTO	L_main72
;smp.c,555 :: 		}
L_main77:
;smp.c,557 :: 		}
	GOTO	L_main71
L_main72:
;smp.c,558 :: 		}
	GOTO	L_main63
;smp.c,559 :: 		}
L_end_main:
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
