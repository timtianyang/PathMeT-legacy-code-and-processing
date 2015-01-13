
_LEDIndicator:

;GPSCamChip.c,2 :: 		void LEDIndicator(){
;GPSCamChip.c,3 :: 		LATA.B1=0;
	BCLR	LATA, #1
;GPSCamChip.c,4 :: 		Delay_ms(1000);
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
;GPSCamChip.c,5 :: 		LATA.B1=1;
	BSET	LATA, #1
;GPSCamChip.c,6 :: 		Delay_ms(1000);
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
;GPSCamChip.c,7 :: 		LATA.B1=0;
	BCLR	LATA, #1
;GPSCamChip.c,8 :: 		}
L_end_LEDIndicator:
	RETURN
; end of _LEDIndicator

_InitTimer1:

;GPSCamChip.c,9 :: 		void InitTimer1(){//200ms
;GPSCamChip.c,10 :: 		T1CON         = 0x8030;
	MOV	#32816, W0
	MOV	WREG, T1CON
;GPSCamChip.c,11 :: 		T1IE_bit         = 0;
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;GPSCamChip.c,12 :: 		T1IF_bit         = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;GPSCamChip.c,13 :: 		IPC0                 = IPC0 | 0x1000;
	MOV	#4096, W1
	MOV	#lo_addr(IPC0), W0
	IOR	W1, [W0], [W0]
;GPSCamChip.c,14 :: 		PR1                 = 54688;
	MOV	#54688, W0
	MOV	WREG, PR1
;GPSCamChip.c,16 :: 		}
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

;GPSCamChip.c,20 :: 		void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
;GPSCamChip.c,21 :: 		T1IF_bit         = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;GPSCamChip.c,22 :: 		timerFlag++;
	MOV	_timerFlag, W0
	INC	W0
	MOV	W0, _timerFlag
;GPSCamChip.c,23 :: 		if(timerFlag==5){ //every 1s
	MOV	_timerFlag, W0
	CP	W0, #5
	BRA Z	L__Timer1Interrupt154
	GOTO	L_Timer1Interrupt4
L__Timer1Interrupt154:
;GPSCamChip.c,24 :: 		LATB.B4=1;
	BSET	LATB, #4
;GPSCamChip.c,26 :: 		T1IE_bit = 0;   //disable timer
	BCLR	T1IE_bit, BitPos(T1IE_bit+0)
;GPSCamChip.c,27 :: 		timerFlag=0;
	CLR	W0
	MOV	W0, _timerFlag
;GPSCamChip.c,28 :: 		}
L_Timer1Interrupt4:
;GPSCamChip.c,29 :: 		}
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

_mappins:

;GPSCamChip.c,32 :: 		void mappins(){
;GPSCamChip.c,33 :: 		TRISA.B1=0;//Led
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	TRISA, #1
;GPSCamChip.c,34 :: 		LATA.B1=1;
	BSET	LATA, #1
;GPSCamChip.c,35 :: 		TRISB.B0=1;//U1RX
	BSET	TRISB, #0
;GPSCamChip.c,36 :: 		TRISB.B5=0;//U1TX
	BCLR	TRISB, #5
;GPSCamChip.c,37 :: 		TRISB.B1=1;//U2RX
	BSET	TRISB, #1
;GPSCamChip.c,38 :: 		TRISA.B4=0;//U2TX
	BCLR	TRISA, #4
;GPSCamChip.c,40 :: 		TRISB.B12=1;//SDI2
	BSET	TRISB, #12
;GPSCamChip.c,41 :: 		TRISB.B11=0;//SDO2
	BCLR	TRISB, #11
;GPSCamChip.c,42 :: 		TRISB.B10=1;//sck2 input
	BSET	TRISB, #10
;GPSCamChip.c,44 :: 		TRISB.B4=0;//DSL trigger output
	BCLR	TRISB, #4
;GPSCamChip.c,46 :: 		LATB.B4=1; //hold high
	BSET	LATB, #4
;GPSCamChip.c,48 :: 		PPS_Mapping(32,_INPUT,_U1RX);
	MOV.B	#14, W12
	MOV.B	#1, W11
	MOV.B	#32, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,49 :: 		PPS_Mapping(37,_OUTPUT,_U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#37, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,50 :: 		PPS_Mapping(33,_INPUT,_U2RX);
	MOV.B	#15, W12
	MOV.B	#1, W11
	MOV.B	#33, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,51 :: 		PPS_Mapping(20,_OUTPUT,_U2TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,53 :: 		PPS_Mapping(44,_INPUT,_SDI2IN); //SPI2
	MOV.B	#16, W12
	MOV.B	#1, W11
	MOV.B	#44, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,54 :: 		PPS_Mapping(43,_OUTPUT,_SDO2);
	MOV.B	#8, W12
	CLR	W11
	MOV.B	#43, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,55 :: 		PPS_Mapping(42,_INPUT,_SCK2IN);
	MOV.B	#17, W12
	MOV.B	#1, W11
	MOV.B	#42, W10
	CALL	_PPS_Mapping
;GPSCamChip.c,58 :: 		}
L_end_mappins:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _mappins

_initSD:

;GPSCamChip.c,59 :: 		void initSD(){
;GPSCamChip.c,60 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;GPSCamChip.c,64 :: 		_SPI_PRESCALE_PRI_16,
	MOV	#1, W13
;GPSCamChip.c,63 :: 		_SPI_PRESCALE_SEC_2,
	MOV	#24, W12
;GPSCamChip.c,62 :: 		_SPI_8_BIT,
	CLR	W11
;GPSCamChip.c,61 :: 		SPI1_Init_Advanced(_SPI_MASTER,
	MOV	#32, W10
;GPSCamChip.c,68 :: 		_SPI_ACTIVE_2_IDLE) ;
	CLR	W0
	PUSH	W0
;GPSCamChip.c,67 :: 		_SPI_CLK_IDLE_HIGH,
	MOV	#64, W0
	PUSH	W0
;GPSCamChip.c,66 :: 		_SPI_DATA_SAMPLE_END,
	MOV	#512, W0
	PUSH	W0
;GPSCamChip.c,65 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;GPSCamChip.c,68 :: 		_SPI_ACTIVE_2_IDLE) ;
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;GPSCamChip.c,70 :: 		while(FAT32_Init()!=0){LEDIndicator();}
L_initSD5:
	CALL	_FAT32_Init
	CP.B	W0, #0
	BRA NZ	L__initSD157
	GOTO	L_initSD6
L__initSD157:
	CALL	_LEDIndicator
	GOTO	L_initSD5
L_initSD6:
;GPSCamChip.c,75 :: 		_SPI_PRESCALE_PRI_1,
	MOV	#3, W13
;GPSCamChip.c,74 :: 		_SPI_PRESCALE_SEC_2,
	MOV	#24, W12
;GPSCamChip.c,73 :: 		_SPI_8_BIT,
	CLR	W11
;GPSCamChip.c,72 :: 		SPI1_Init_Advanced(_SPI_MASTER,     // Init SPI at higher speed
	MOV	#32, W10
;GPSCamChip.c,79 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;GPSCamChip.c,78 :: 		_SPI_CLK_IDLE_HIGH,
	MOV	#64, W0
	PUSH	W0
;GPSCamChip.c,77 :: 		_SPI_DATA_SAMPLE_END,
	MOV	#512, W0
	PUSH	W0
;GPSCamChip.c,76 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;GPSCamChip.c,79 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;GPSCamChip.c,81 :: 		for(i=0;i<5120;i++){CameraBuff[i]=0x00;}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initSD7:
; i start address is: 4 (W2)
	MOV	#5120, W0
	CP	W2, W0
	BRA LTU	L__initSD158
	GOTO	L_initSD8
L__initSD158:
	MOV	#lo_addr(_CameraBuff), W0
	ADD	W0, W2, W1
	CLR	W0
	MOV.B	W0, [W1]
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_initSD7
L_initSD8:
;GPSCamChip.c,83 :: 		}
L_end_initSD:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initSD

_initSPI2CommunicationTOMaster:

;GPSCamChip.c,84 :: 		void initSPI2CommunicationTOMaster(){
;GPSCamChip.c,88 :: 		_SPI_PRESCALE_PRI_4,
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#2, W13
;GPSCamChip.c,87 :: 		_SPI_PRESCALE_SEC_4,
	MOV	#16, W12
;GPSCamChip.c,86 :: 		_SPI_8_BIT,
	CLR	W11
;GPSCamChip.c,85 :: 		SPI2_Init_Advanced(_SPI_SLAVE,
	CLR	W10
;GPSCamChip.c,92 :: 		_SPI_ACTIVE_2_IDLE);
	CLR	W0
	PUSH	W0
;GPSCamChip.c,91 :: 		_SPI_CLK_IDLE_LOW,
	CLR	W0
	PUSH	W0
;GPSCamChip.c,90 :: 		_SPI_DATA_SAMPLE_MIDDLE,
	CLR	W0
	PUSH	W0
;GPSCamChip.c,89 :: 		_SPI_SS_DISABLE,
	CLR	W0
	PUSH	W0
;GPSCamChip.c,92 :: 		_SPI_ACTIVE_2_IDLE);
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;GPSCamChip.c,95 :: 		SPI2STAT.B0=1;
	BSET	SPI2STAT, #0
;GPSCamChip.c,96 :: 		SPI2STAT.B1=0;
	BCLR	SPI2STAT, #1
;GPSCamChip.c,97 :: 		SPI2STAT.B2=0;
	BCLR	SPI2STAT, #2
;GPSCamChip.c,99 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;GPSCamChip.c,100 :: 		IPC8.B6=1;
	BSET	IPC8, #6
;GPSCamChip.c,101 :: 		IPC8.B5=0;
	BCLR	IPC8, #5
;GPSCamChip.c,102 :: 		IPC8.B4=0;
	BCLR	IPC8, #4
;GPSCamChip.c,103 :: 		IEC2.B1=1;
	BSET	IEC2, #1
;GPSCamChip.c,104 :: 		}
L_end_initSPI2CommunicationTOMaster:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _initSPI2CommunicationTOMaster

_SpI2interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GPSCamChip.c,105 :: 		void SpI2interrupt() iv IVT_ADDR_SPI2INTERRUPT{
;GPSCamChip.c,107 :: 		IFS2.B1=0;
	BCLR	IFS2, #1
;GPSCamChip.c,108 :: 		SPI2STAT.SPIROV=0;//must be cleared otherwise the master will freeze.
	BCLR	SPI2STAT, #6
;GPSCamChip.c,109 :: 		temp=SPI2BUF;
; temp start address is: 4 (W2)
	MOV	SPI2BUF, W2
;GPSCamChip.c,111 :: 		if(!startName){
	MOV	#lo_addr(_startName), W0
	CP0	[W0]
	BRA Z	L__SpI2interrupt161
	GOTO	L_SpI2interrupt10
L__SpI2interrupt161:
;GPSCamChip.c,112 :: 		switch(temp){
	GOTO	L_SpI2interrupt11
; temp end address is: 4 (W2)
;GPSCamChip.c,113 :: 		case 0x31://sampling mode send back GPS
L_SpI2interrupt13:
;GPSCamChip.c,114 :: 		loggingmode=0; //send back packages
	CLR	W0
	MOV	W0, _loggingmode
;GPSCamChip.c,115 :: 		samplingmode=1;
	MOV	#1, W0
	MOV	W0, _samplingmode
;GPSCamChip.c,116 :: 		SPI2BUF=GPSString[GPSToMasterPtr++];
	MOV	#lo_addr(_GPSString), W1
	MOV	#lo_addr(_GPStoMasterPtr), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	WREG, SPI2BUF
	MOV	_GPStoMasterPtr, W0
	INC	W0
	MOV	W0, _GPStoMasterPtr
;GPSCamChip.c,118 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,119 :: 		case 0x32://reset GPS output ptr
L_SpI2interrupt14:
;GPSCamChip.c,120 :: 		GPSToMasterPtr=0;
	CLR	W0
	MOV	W0, _GPStoMasterPtr
;GPSCamChip.c,121 :: 		SPI2BUF=GPSString[GPSToMasterPtr++];
	MOV	#lo_addr(_GPSString), W1
	MOV	#lo_addr(_GPStoMasterPtr), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	WREG, SPI2BUF
	MOV	_GPStoMasterPtr, W0
	INC	W0
	MOV	W0, _GPStoMasterPtr
;GPSCamChip.c,122 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,123 :: 		case 0x22://stop sampling mode
L_SpI2interrupt15:
;GPSCamChip.c,124 :: 		samplingmode=0;
	CLR	W0
	MOV	W0, _samplingmode
;GPSCamChip.c,125 :: 		GPStoMasterPtr=0;
	CLR	W0
	MOV	W0, _GPStoMasterPtr
;GPSCamChip.c,126 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;GPSCamChip.c,127 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,128 :: 		case 0x3B://enable GPSoutput
L_SpI2interrupt16:
;GPSCamChip.c,129 :: 		enableGPSOutput=1;
	MOV	#1, W0
	MOV	W0, _enableGPSOutput
;GPSCamChip.c,130 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,131 :: 		case 0x2F://disble GPSoutput
L_SpI2interrupt17:
;GPSCamChip.c,132 :: 		disableGPSOutput=1;
	MOV	#1, W0
	MOV	W0, _disableGPSOutput
;GPSCamChip.c,133 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,134 :: 		case 0x43://logging mode
L_SpI2interrupt18:
;GPSCamChip.c,135 :: 		loggingmode=1;
	MOV	#1, W0
	MOV	W0, _loggingmode
;GPSCamChip.c,136 :: 		newDir=1;
	MOV	#1, W0
	MOV	W0, _newDir
;GPSCamChip.c,137 :: 		PicnumIncrementor=0;
	CLR	W0
	MOV	W0, _PicnumIncrementor
;GPSCamChip.c,138 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;GPSCamChip.c,139 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,140 :: 		case 0x62://Stop logging mode
L_SpI2interrupt19:
;GPSCamChip.c,141 :: 		loggingmode=0;
	CLR	W0
	MOV	W0, _loggingmode
;GPSCamChip.c,142 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;GPSCamChip.c,143 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,145 :: 		case 0xAB: //toggle DSLR cam
L_SpI2interrupt20:
;GPSCamChip.c,149 :: 		TMR1 = 0;
	CLR	TMR1
;GPSCamChip.c,151 :: 		LATB.B4=0;
	BCLR	LATB, #4
;GPSCamChip.c,152 :: 		T1IF_bit = 0;
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
;GPSCamChip.c,153 :: 		T1IE_bit = 1;
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
;GPSCamChip.c,154 :: 		PicnumIncrementor++;
	MOV	_PicnumIncrementor, W0
	INC	W0
	MOV	W0, _PicnumIncrementor
;GPSCamChip.c,155 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,156 :: 		case 0x53://start receiving names
L_SpI2interrupt21:
;GPSCamChip.c,157 :: 		startName=1;
	MOV	#1, W0
	MOV	W0, _startName
;GPSCamChip.c,158 :: 		nameReceivedPtr=0;
	CLR	W0
	MOV	W0, _nameReceivedPtr
;GPSCamChip.c,159 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,160 :: 		case 0xFA:// screen asking handshake for logging status
L_SpI2interrupt22:
;GPSCamChip.c,161 :: 		if(handshake){
	MOV	#lo_addr(_handshake), W0
	CP0	[W0]
	BRA NZ	L__SpI2interrupt162
	GOTO	L_SpI2interrupt23
L__SpI2interrupt162:
;GPSCamChip.c,162 :: 		SPI2BUF=0x1C;
	MOV	#28, W0
	MOV	WREG, SPI2BUF
;GPSCamChip.c,163 :: 		}
	GOTO	L_SpI2interrupt24
L_SpI2interrupt23:
;GPSCamChip.c,165 :: 		SPI2BUF=0x00;
	CLR	SPI2BUF
;GPSCamChip.c,166 :: 		}
L_SpI2interrupt24:
;GPSCamChip.c,167 :: 		break;
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,169 :: 		default:break;
L_SpI2interrupt25:
	GOTO	L_SpI2interrupt12
;GPSCamChip.c,170 :: 		}
L_SpI2interrupt11:
; temp start address is: 4 (W2)
	MOV.B	#49, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt163
	GOTO	L_SpI2interrupt13
L__SpI2interrupt163:
	MOV.B	#50, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt164
	GOTO	L_SpI2interrupt14
L__SpI2interrupt164:
	MOV.B	#34, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt165
	GOTO	L_SpI2interrupt15
L__SpI2interrupt165:
	MOV.B	#59, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt166
	GOTO	L_SpI2interrupt16
L__SpI2interrupt166:
	MOV.B	#47, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt167
	GOTO	L_SpI2interrupt17
L__SpI2interrupt167:
	MOV.B	#67, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt168
	GOTO	L_SpI2interrupt18
L__SpI2interrupt168:
	MOV.B	#98, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt169
	GOTO	L_SpI2interrupt19
L__SpI2interrupt169:
	MOV.B	#171, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt170
	GOTO	L_SpI2interrupt20
L__SpI2interrupt170:
	MOV.B	#83, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt171
	GOTO	L_SpI2interrupt21
L__SpI2interrupt171:
	MOV.B	#250, W0
	CP.B	W2, W0
	BRA NZ	L__SpI2interrupt172
	GOTO	L_SpI2interrupt22
L__SpI2interrupt172:
; temp end address is: 4 (W2)
	GOTO	L_SpI2interrupt25
L_SpI2interrupt12:
;GPSCamChip.c,171 :: 		}
	GOTO	L_SpI2interrupt26
L_SpI2interrupt10:
;GPSCamChip.c,174 :: 		if(temp==0xE4){//end of the name
; temp start address is: 4 (W2)
	MOV.B	#228, W0
	CP.B	W2, W0
	BRA Z	L__SpI2interrupt173
	GOTO	L_SpI2interrupt27
L__SpI2interrupt173:
; temp end address is: 4 (W2)
;GPSCamChip.c,175 :: 		startName=0;
	CLR	W0
	MOV	W0, _startName
;GPSCamChip.c,177 :: 		nameReceivedPtr=0;
	CLR	W0
	MOV	W0, _nameReceivedPtr
;GPSCamChip.c,178 :: 		return;
	GOTO	L_end_SpI2interrupt
;GPSCamChip.c,179 :: 		}
L_SpI2interrupt27:
;GPSCamChip.c,180 :: 		nameReceived[nameReceivedPtr++]=temp;
; temp start address is: 4 (W2)
	MOV	#lo_addr(_nameReceived), W1
	MOV	#lo_addr(_nameReceivedPtr), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; temp end address is: 4 (W2)
	MOV	_nameReceivedPtr, W0
	INC	W0
	MOV	W0, _nameReceivedPtr
;GPSCamChip.c,181 :: 		if(nameReceivedPtr==8){nameReceivedPtr=0;}
	MOV	_nameReceivedPtr, W0
	CP	W0, #8
	BRA Z	L__SpI2interrupt174
	GOTO	L_SpI2interrupt28
L__SpI2interrupt174:
	CLR	W0
	MOV	W0, _nameReceivedPtr
L_SpI2interrupt28:
;GPSCamChip.c,182 :: 		}
L_SpI2interrupt26:
;GPSCamChip.c,183 :: 		}
L_end_SpI2interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _SpI2interrupt

_initCamera:

;GPSCamChip.c,185 :: 		void initCamera(){
;GPSCamChip.c,186 :: 		unsigned int iterator=0;
	PUSH	W10
	PUSH	W11
;GPSCamChip.c,187 :: 		UART1_Init(38400);
	MOV	#38400, W10
	MOV	#0, W11
	CALL	_UART1_Init
;GPSCamChip.c,188 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initCamera29:
	DEC	W7
	BRA NZ	L_initCamera29
	DEC	W8
	BRA NZ	L_initCamera29
;GPSCamChip.c,189 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_initCamera31:
	DEC	W7
	BRA NZ	L_initCamera31
	DEC	W8
	BRA NZ	L_initCamera31
;GPSCamChip.c,190 :: 		for(iterator=0;iterator<5;iterator++){
; iterator start address is: 2 (W1)
	CLR	W1
; iterator end address is: 2 (W1)
L_initCamera33:
; iterator start address is: 2 (W1)
	CP	W1, #5
	BRA LTU	L__initCamera176
	GOTO	L_initCamera34
L__initCamera176:
;GPSCamChip.c,191 :: 		UART1_Write(setImageSize[iterator]);
	MOV	#lo_addr(_setImageSize), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART1_Write
;GPSCamChip.c,190 :: 		for(iterator=0;iterator<5;iterator++){
	INC	W1
;GPSCamChip.c,192 :: 		}
; iterator end address is: 2 (W1)
	GOTO	L_initCamera33
L_initCamera34:
;GPSCamChip.c,194 :: 		Delay_ms(150);
	MOV	#33, W8
	MOV	#2867, W7
L_initCamera36:
	DEC	W7
	BRA NZ	L_initCamera36
	DEC	W8
	BRA NZ	L_initCamera36
;GPSCamChip.c,196 :: 		for(iterator=0;iterator<7;iterator++){
; iterator start address is: 2 (W1)
	CLR	W1
; iterator end address is: 2 (W1)
L_initCamera38:
; iterator start address is: 2 (W1)
	CP	W1, #7
	BRA LTU	L__initCamera177
	GOTO	L_initCamera39
L__initCamera177:
;GPSCamChip.c,197 :: 		UART1_Write(setCameraBaud[iterator]);
	MOV	#lo_addr(_setCameraBaud), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART1_Write
;GPSCamChip.c,196 :: 		for(iterator=0;iterator<7;iterator++){
	INC	W1
;GPSCamChip.c,198 :: 		}
; iterator end address is: 2 (W1)
	GOTO	L_initCamera38
L_initCamera39:
;GPSCamChip.c,199 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initCamera41:
	DEC	W7
	BRA NZ	L_initCamera41
	DEC	W8
	BRA NZ	L_initCamera41
	NOP
	NOP
;GPSCamChip.c,200 :: 		UART1_Init(57600);
	MOV	#57600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;GPSCamChip.c,201 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initCamera43:
	DEC	W7
	BRA NZ	L_initCamera43
	DEC	W8
	BRA NZ	L_initCamera43
;GPSCamChip.c,202 :: 		U1STA.OERR=0;
	BCLR	U1STA, #1
;GPSCamChip.c,203 :: 		}
L_end_initCamera:
	POP	W11
	POP	W10
	RETURN
; end of _initCamera

_CameraInterrupt:
	LNK	#2
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GPSCamChip.c,204 :: 		void CameraInterrupt() iv IVT_ADDR_U1RXINTERRUPT{
;GPSCamChip.c,205 :: 		IFS0.B11=0;
	BCLR	IFS0, #11
;GPSCamChip.c,207 :: 		if(picStart==1)
	MOV	#lo_addr(_picStart), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__CameraInterrupt179
	GOTO	L_CameraInterrupt45
L__CameraInterrupt179:
;GPSCamChip.c,209 :: 		tempCam2=UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_tempCam2), W1
	MOV.B	W0, [W1]
;GPSCamChip.c,210 :: 		if(tempCam2==0xD9&&tempCam1==0xFF){
	MOV	#lo_addr(_tempCam2), W0
	MOV.B	[W0], W1
	MOV.B	#217, W0
	CP.B	W1, W0
	BRA Z	L__CameraInterrupt180
	GOTO	L__CameraInterrupt149
L__CameraInterrupt180:
	MOV	#lo_addr(_tempCam1), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__CameraInterrupt181
	GOTO	L__CameraInterrupt148
L__CameraInterrupt181:
L__CameraInterrupt147:
;GPSCamChip.c,211 :: 		CameraBuff[CameraBuffPointer++]=tempCam2;
	MOV	#lo_addr(_CameraBuff), W1
	MOV	#lo_addr(_CameraBuffPointer), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_tempCam2), W0
	MOV.B	[W0], [W1]
	MOV	_CameraBuffPointer, W0
	INC	W0
	MOV	W0, _CameraBuffPointer
;GPSCamChip.c,213 :: 		EOF=1;
	MOV	#1, W0
	MOV	W0, _EOF
;GPSCamChip.c,214 :: 		picStart=0;
	MOV	#lo_addr(_picStart), W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,215 :: 		return;
	GOTO	L_end_CameraInterrupt
;GPSCamChip.c,210 :: 		if(tempCam2==0xD9&&tempCam1==0xFF){
L__CameraInterrupt149:
L__CameraInterrupt148:
;GPSCamChip.c,218 :: 		CameraBuff[CameraBuffPointer++]=tempCam2;
	MOV	#lo_addr(_CameraBuff), W1
	MOV	#lo_addr(_CameraBuffPointer), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_tempCam2), W0
	MOV.B	[W0], [W1]
	MOV	_CameraBuffPointer, W0
	INC	W0
	MOV	W0, _CameraBuffPointer
;GPSCamChip.c,219 :: 		if(CameraBuffPointer<=2560){
	MOV	_CameraBuffPointer, W1
	MOV	#2560, W0
	CP	W1, W0
	BRA LEU	L__CameraInterrupt182
	GOTO	L_CameraInterrupt49
L__CameraInterrupt182:
;GPSCamChip.c,220 :: 		if(CameraBuffPointer==512){picbufferfull1=1;bufferLastFullSector=0;}
	MOV	_CameraBuffPointer, W1
	MOV	#512, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt183
	GOTO	L_CameraInterrupt50
L__CameraInterrupt183:
	MOV	#1, W0
	MOV	W0, _picbufferfull1
	MOV	#lo_addr(_bufferLastFullSector), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt51
L_CameraInterrupt50:
;GPSCamChip.c,221 :: 		else if(CameraBuffPointer==1024){picbufferfull2=1;bufferLastFullSector=1;}
	MOV	_CameraBuffPointer, W1
	MOV	#1024, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt184
	GOTO	L_CameraInterrupt52
L__CameraInterrupt184:
	MOV	#1, W0
	MOV	W0, _picbufferfull2
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt53
L_CameraInterrupt52:
;GPSCamChip.c,222 :: 		else if(CameraBuffPointer==1536){picbufferfull3=1;bufferLastFullSector=2;}
	MOV	_CameraBuffPointer, W1
	MOV	#1536, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt185
	GOTO	L_CameraInterrupt54
L__CameraInterrupt185:
	MOV	#1, W0
	MOV	W0, _picbufferfull3
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt55
L_CameraInterrupt54:
;GPSCamChip.c,223 :: 		else if(CameraBuffPointer==2048){picbufferfull4=1;bufferLastFullSector=3;}
	MOV	_CameraBuffPointer, W1
	MOV	#2048, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt186
	GOTO	L_CameraInterrupt56
L__CameraInterrupt186:
	MOV	#1, W0
	MOV	W0, _picbufferfull4
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt57
L_CameraInterrupt56:
;GPSCamChip.c,224 :: 		else if(CameraBuffPointer==2560){picbufferfull5=1;bufferLastFullSector=4;}
	MOV	_CameraBuffPointer, W1
	MOV	#2560, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt187
	GOTO	L_CameraInterrupt58
L__CameraInterrupt187:
	MOV	#1, W0
	MOV	W0, _picbufferfull5
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L_CameraInterrupt58:
L_CameraInterrupt57:
L_CameraInterrupt55:
L_CameraInterrupt53:
L_CameraInterrupt51:
;GPSCamChip.c,225 :: 		}
	GOTO	L_CameraInterrupt59
L_CameraInterrupt49:
;GPSCamChip.c,227 :: 		if(CameraBuffPointer==3072){picbufferfull6=1;bufferLastFullSector=5;}
	MOV	_CameraBuffPointer, W1
	MOV	#3072, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt188
	GOTO	L_CameraInterrupt60
L__CameraInterrupt188:
	MOV	#1, W0
	MOV	W0, _picbufferfull6
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt61
L_CameraInterrupt60:
;GPSCamChip.c,228 :: 		else if(CameraBuffPointer==3584){picbufferfull7=1;bufferLastFullSector=6;}
	MOV	_CameraBuffPointer, W1
	MOV	#3584, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt189
	GOTO	L_CameraInterrupt62
L__CameraInterrupt189:
	MOV	#1, W0
	MOV	W0, _picbufferfull7
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt63
L_CameraInterrupt62:
;GPSCamChip.c,229 :: 		else if(CameraBuffPointer==4096){picbufferfull8=1;bufferLastFullSector=7;}
	MOV	_CameraBuffPointer, W1
	MOV	#4096, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt190
	GOTO	L_CameraInterrupt64
L__CameraInterrupt190:
	MOV	#1, W0
	MOV	W0, _picbufferfull8
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt65
L_CameraInterrupt64:
;GPSCamChip.c,230 :: 		else if(CameraBuffPointer==4608){picbufferfull9=1;bufferLastFullSector=8;}
	MOV	_CameraBuffPointer, W1
	MOV	#4608, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt191
	GOTO	L_CameraInterrupt66
L__CameraInterrupt191:
	MOV	#1, W0
	MOV	W0, _picbufferfull9
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
	GOTO	L_CameraInterrupt67
L_CameraInterrupt66:
;GPSCamChip.c,231 :: 		else if(CameraBuffPointer==5120){CameraBuffPointer=0;picbufferfull10=1;bufferLastFullSector=9;}
	MOV	_CameraBuffPointer, W1
	MOV	#5120, W0
	CP	W1, W0
	BRA Z	L__CameraInterrupt192
	GOTO	L_CameraInterrupt68
L__CameraInterrupt192:
	CLR	W0
	MOV	W0, _CameraBuffPointer
	MOV	#1, W0
	MOV	W0, _picbufferfull10
	MOV	#lo_addr(_bufferLastFullSector), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
L_CameraInterrupt68:
L_CameraInterrupt67:
L_CameraInterrupt65:
L_CameraInterrupt63:
L_CameraInterrupt61:
;GPSCamChip.c,232 :: 		}
L_CameraInterrupt59:
;GPSCamChip.c,236 :: 		tempCam1=tempCam2;
	MOV	#lo_addr(_tempCam1), W1
	MOV	#lo_addr(_tempCam2), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,240 :: 		}
	GOTO	L_CameraInterrupt69
L_CameraInterrupt45:
;GPSCamChip.c,241 :: 		else if(picStart==0)
	MOV	#lo_addr(_picStart), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__CameraInterrupt193
	GOTO	L_CameraInterrupt70
L__CameraInterrupt193:
;GPSCamChip.c,244 :: 		CameraBuff[CameraBuffPointer]=UART1_Read();
	MOV	#lo_addr(_CameraBuff), W1
	MOV	#lo_addr(_CameraBuffPointer), W0
	ADD	W1, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART1_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;GPSCamChip.c,245 :: 		CameraBuffPointer++;
	MOV	_CameraBuffPointer, W0
	INC	W0
	MOV	W0, _CameraBuffPointer
;GPSCamChip.c,246 :: 		if(CameraBuffPointer==14){picStart=1;CameraBuffPointer=0;}
	MOV	_CameraBuffPointer, W0
	CP	W0, #14
	BRA Z	L__CameraInterrupt194
	GOTO	L_CameraInterrupt71
L__CameraInterrupt194:
	MOV	#lo_addr(_picStart), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV	W0, _CameraBuffPointer
L_CameraInterrupt71:
;GPSCamChip.c,247 :: 		}
L_CameraInterrupt70:
L_CameraInterrupt69:
;GPSCamChip.c,249 :: 		}
L_end_CameraInterrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	ULNK
	RETFIE
; end of _CameraInterrupt

_initGPS:

;GPSCamChip.c,393 :: 		void initGPS(){
;GPSCamChip.c,395 :: 		unsigned char i=0;
	PUSH	W10
	PUSH	W11
;GPSCamChip.c,397 :: 		for(i=0;i<90;i++){GPSData[i]=0x00;}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS72:
; i start address is: 4 (W2)
	MOV.B	#90, W0
	CP.B	W2, W0
	BRA LTU	L__initGPS196
	GOTO	L_initGPS73
L__initGPS196:
	ZE	W2, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV.B	W0, [W1]
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS72
L_initGPS73:
;GPSCamChip.c,402 :: 		UART2_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART2_Init
;GPSCamChip.c,403 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_initGPS75:
	DEC	W7
	BRA NZ	L_initGPS75
	DEC	W8
	BRA NZ	L_initGPS75
	NOP
	NOP
;GPSCamChip.c,405 :: 		for(i=0;i<11;i++){UART2_Write(GPSBaudcmd[i]);}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS77:
; i start address is: 4 (W2)
	CP.B	W2, #11
	BRA LTU	L__initGPS197
	GOTO	L_initGPS78
L__initGPS197:
	ZE	W2, W1
	MOV	#lo_addr(_GPSBaudcmd), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS77
L_initGPS78:
;GPSCamChip.c,406 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS80:
	DEC	W7
	BRA NZ	L_initGPS80
	DEC	W8
	BRA NZ	L_initGPS80
;GPSCamChip.c,407 :: 		UART2_Init(115200);
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART2_Init
;GPSCamChip.c,408 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS82:
	DEC	W7
	BRA NZ	L_initGPS82
	DEC	W8
	BRA NZ	L_initGPS82
;GPSCamChip.c,409 :: 		for(i=0;i<10;i++){UART2_Write(GPSPowerModeNormal[i]);}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS84:
; i start address is: 4 (W2)
	CP.B	W2, #10
	BRA LTU	L__initGPS198
	GOTO	L_initGPS85
L__initGPS198:
	ZE	W2, W1
	MOV	#lo_addr(_GPSPowerModeNormal), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS84
L_initGPS85:
;GPSCamChip.c,410 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS87:
	DEC	W7
	BRA NZ	L_initGPS87
	DEC	W8
	BRA NZ	L_initGPS87
;GPSCamChip.c,412 :: 		for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS89:
; i start address is: 4 (W2)
	CP.B	W2, #16
	BRA LTU	L__initGPS199
	GOTO	L_initGPS90
L__initGPS199:
	ZE	W2, W1
	MOV	#lo_addr(_commandmsson), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS89
L_initGPS90:
;GPSCamChip.c,413 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS92:
	DEC	W7
	BRA NZ	L_initGPS92
	DEC	W8
	BRA NZ	L_initGPS92
;GPSCamChip.c,415 :: 		for(i=0;i<10;i++){UART2_Write(GPSUpdataRate[i]);}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS94:
; i start address is: 4 (W2)
	CP.B	W2, #10
	BRA LTU	L__initGPS200
	GOTO	L_initGPS95
L__initGPS200:
	ZE	W2, W1
	MOV	#lo_addr(_GPSUpdataRate), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS94
L_initGPS95:
;GPSCamChip.c,416 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS97:
	DEC	W7
	BRA NZ	L_initGPS97
	DEC	W8
	BRA NZ	L_initGPS97
;GPSCamChip.c,418 :: 		for(i=0;i<10;i++){UART2_Write(GPSWAASEnable[i]);}
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_initGPS99:
; i start address is: 4 (W2)
	CP.B	W2, #10
	BRA LTU	L__initGPS201
	GOTO	L_initGPS100
L__initGPS201:
	ZE	W2, W1
	MOV	#lo_addr(_GPSWAASEnable), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC.B	W2
; i end address is: 4 (W2)
	GOTO	L_initGPS99
L_initGPS100:
;GPSCamChip.c,419 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_initGPS102:
	DEC	W7
	BRA NZ	L_initGPS102
	DEC	W8
	BRA NZ	L_initGPS102
;GPSCamChip.c,421 :: 		UART2_Init(115200);
	MOV	#49664, W10
	MOV	#1, W11
	CALL	_UART2_Init
;GPSCamChip.c,422 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_initGPS104:
	DEC	W7
	BRA NZ	L_initGPS104
	DEC	W8
	BRA NZ	L_initGPS104
	NOP
	NOP
;GPSCamChip.c,425 :: 		IFS1.B14=0;
	BCLR	IFS1, #14
;GPSCamChip.c,426 :: 		U2STA.OERR=0;
	BCLR	U2STA, #1
;GPSCamChip.c,427 :: 		IPC7.B10=1;
	BSET	IPC7, #10
;GPSCamChip.c,428 :: 		IPC7.B9=0;
	BCLR	IPC7, #9
;GPSCamChip.c,429 :: 		IPC7.B8=0;  //clear buffer overrun error or interrupt will never fire
	BCLR	IPC7, #8
;GPSCamChip.c,430 :: 		IEC1.B14=1;
	BSET	IEC1, #14
;GPSCamChip.c,432 :: 		}
L_end_initGPS:
	POP	W11
	POP	W10
	RETURN
; end of _initGPS

_GPSinterrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GPSCamChip.c,433 :: 		void GPSinterrupt() iv IVT_ADDR_U2RXINTERRUPT  {
;GPSCamChip.c,434 :: 		unsigned char temp=0;//the over flow error must be cleared or the interrupt will not be fired. The FIFO buffer is 4 bytes in dsPIC33E
;GPSCamChip.c,435 :: 		IFS1.B14=0;
	BCLR	IFS1, #14
;GPSCamChip.c,436 :: 		temp=UART2_Read();
	CALL	_UART2_Read
; temp start address is: 4 (W2)
	MOV.B	W0, W2
;GPSCamChip.c,437 :: 		if(temp==0x24){GPSDataPtr=0;GPSData[GPSDataPtr++]=temp;return;}
	MOV.B	#36, W1
	CP.B	W0, W1
	BRA Z	L__GPSinterrupt203
	GOTO	L_GPSinterrupt106
L__GPSinterrupt203:
	MOV	#lo_addr(_GPSDataPtr), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_GPSDataPtr), W0
	ZE	[W0], W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	W2, [W0]
; temp end address is: 4 (W2)
	MOV	#lo_addr(_GPSDataPtr), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_GPSDataPtr), W0
	MOV.B	W1, [W0]
	GOTO	L_end_GPSinterrupt
L_GPSinterrupt106:
;GPSCamChip.c,438 :: 		GPSData[GPSDataPtr++]=temp;
; temp start address is: 4 (W2)
	MOV	#lo_addr(_GPSDataPtr), W0
	ZE	[W0], W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	W2, [W0]
	MOV	#lo_addr(_GPSDataPtr), W0
	MOV.B	[W0], W0
	ADD.B	W0, #1, W1
	MOV	#lo_addr(_GPSDataPtr), W0
	MOV.B	W1, [W0]
;GPSCamChip.c,439 :: 		if(temp==0x2A){GPSpackageReady=1;if(samplingmode){processGPS();}}
	MOV.B	#42, W0
	CP.B	W2, W0
	BRA Z	L__GPSinterrupt204
	GOTO	L_GPSinterrupt107
L__GPSinterrupt204:
; temp end address is: 4 (W2)
	MOV	#lo_addr(_GPSpackageReady), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_samplingmode), W0
	CP0	[W0]
	BRA NZ	L__GPSinterrupt205
	GOTO	L_GPSinterrupt108
L__GPSinterrupt205:
	CALL	_processGPS
L_GPSinterrupt108:
L_GPSinterrupt107:
;GPSCamChip.c,441 :: 		}
L_end_GPSinterrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _GPSinterrupt

_processGPS:
	LNK	#14

;GPSCamChip.c,442 :: 		void processGPS(){
;GPSCamChip.c,443 :: 		unsigned char tempPtr=7;
	MOV	#7, W0
	MOV.B	W0, [W14+0]
;GPSCamChip.c,445 :: 		while(GPSData[tempPtr]!=','){tempPtr++;}
L_processGPS109:
	ADD	W14, #0, W0
	ZE	[W0], W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W1
	MOV.B	#44, W0
	CP.B	W1, W0
	BRA NZ	L__processGPS207
	GOTO	L_processGPS110
L__processGPS207:
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
	GOTO	L_processGPS109
L_processGPS110:
;GPSCamChip.c,446 :: 		tempPtr++;
	MOV.B	[W14+0], W0
	INC.B	W0
	MOV.B	W0, [W14+0]
;GPSCamChip.c,447 :: 		GPSLatitude=(GPSData[tempPtr]-48)*10+(GPSData[tempPtr+1]-48)+
	ZE	W0, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W1
	MOV	#10, W0
	MUL.SS	W1, W0, W2
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #1, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ADD	W2, W0, W0
	MOV	W0, [W14+12]
;GPSCamChip.c,449 :: 		(GPSData[tempPtr+2]-48)*10+(GPSData[tempPtr+3]-48)+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #2, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W1
	MOV	#10, W0
	MUL.SS	W1, W0, W2
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #3, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ADD	W2, W0, W0
	MOV	W0, [W14+8]
;GPSCamChip.c,450 :: 		(GPSData[tempPtr+5]-48)*0.1+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #5, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,451 :: 		(GPSData[tempPtr+6]-48)*0.01+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #6, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#55050, W2
	MOV	#15395, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,452 :: 		(GPSData[tempPtr+7]-48)*0.001+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #7, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#4719, W2
	MOV	#14979, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,453 :: 		(GPSData[tempPtr+8]-48)*0.0001
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #8, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#46871, W2
	MOV	#14545, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
;GPSCamChip.c,454 :: 		)/60;
	MOV	#0, W2
	MOV	#17008, W3
	CALL	__Div_FP
	MOV	[W14+12], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, _GPSLatitude
	MOV	W1, _GPSLatitude+2
;GPSCamChip.c,455 :: 		tempPtr+=10;
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #10, W0
	MOV.B	W0, [W14+0]
;GPSCamChip.c,456 :: 		if(GPSData[tempPtr]=='S'){GPSLatitude=-GPSLatitude;}
	ZE	W0, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W1
	MOV.B	#83, W0
	CP.B	W1, W0
	BRA Z	L__processGPS208
	GOTO	L_processGPS111
L__processGPS208:
	MOV	#0, W1
	MOV	#32768, W2
	MOV	#lo_addr(_GPSLatitude), W0
	XOR	W1, [W0], [W0++]
	XOR	W2, [W0], [W0--]
L_processGPS111:
;GPSCamChip.c,457 :: 		tempPtr+=2;
	ADD	W14, #0, W0
	ZE	[W0], W0
	INC2	W0
	MOV.B	W0, [W14+0]
;GPSCamChip.c,459 :: 		GPSLongitude=(GPSData[tempPtr]-48)*100+(GPSData[tempPtr+1]-48)*10+(GPSData[tempPtr+2]-48)+
	ZE	W0, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W1
	MOV	#100, W0
	MUL.SS	W1, W0, W2
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #1, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W1
	MOV	#10, W0
	MUL.SS	W1, W0, W0
	ADD	W2, W0, W2
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #2, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ADD	W2, W0, W0
	MOV	W0, [W14+12]
;GPSCamChip.c,461 :: 		(GPSData[tempPtr+3]-48)*10+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #3, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W1
	MOV	#10, W0
	MUL.SS	W1, W0, W2
;GPSCamChip.c,462 :: 		(GPSData[tempPtr+4]-48)+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #4, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ADD	W2, W0, W0
	MOV	W0, [W14+8]
;GPSCamChip.c,463 :: 		(GPSData[tempPtr+6]-48)*0.1+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #6, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,464 :: 		(GPSData[tempPtr+7]-48)*0.01+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #7, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#55050, W2
	MOV	#15395, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,465 :: 		(GPSData[tempPtr+8]-48)*0.001+
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #8, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#4719, W2
	MOV	#14979, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
;GPSCamChip.c,466 :: 		(GPSData[tempPtr+9]-48)*0.0001
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #9, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#48, W0
	SUB	W1, W0, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#46871, W2
	MOV	#14545, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
;GPSCamChip.c,467 :: 		)/60;
	MOV	#0, W2
	MOV	#17008, W3
	CALL	__Div_FP
	MOV	[W14+12], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__AddSub_FP
	MOV	W0, _GPSLongitude
	MOV	W1, _GPSLongitude+2
;GPSCamChip.c,468 :: 		tempPtr+=11;
	ADD	W14, #0, W0
	ZE	[W0], W0
	ADD	W0, #11, W0
;GPSCamChip.c,469 :: 		if(GPSData[tempPtr]=='W'){GPSLongitude=-GPSLongitude;}
	ZE	W0, W1
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W1
	MOV.B	#87, W0
	CP.B	W1, W0
	BRA Z	L__processGPS209
	GOTO	L_processGPS112
L__processGPS209:
	MOV	#0, W1
	MOV	#32768, W2
	MOV	#lo_addr(_GPSLongitude), W0
	XOR	W1, [W0], [W0++]
	XOR	W2, [W0], [W0--]
L_processGPS112:
;GPSCamChip.c,470 :: 		}
L_end_processGPS:
	ULNK
	RETURN
; end of _processGPS

_processGPSString:
	LNK	#72

;GPSCamChip.c,472 :: 		unsigned char* processGPSString(){ //returns proccessed package
;GPSCamChip.c,475 :: 		sprintf(tempLongitudeString,"%.7f", GPSLongitude);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	_GPSLongitude
	PUSH	_GPSLongitude+2
	MOV	#lo_addr(?lstr_1_GPSCamChip), W0
	PUSH	W0
	MOV	#lo_addr(_tempLongitudeString), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;GPSCamChip.c,476 :: 		sprintf(tempLatitudeString,"%.7f", GPSLatitude);
	PUSH	_GPSLatitude
	PUSH	_GPSLatitude+2
	MOV	#lo_addr(?lstr_2_GPSCamChip), W0
	PUSH	W0
	MOV	#lo_addr(_tempLatitudeString), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#8, W15
;GPSCamChip.c,477 :: 		ProcessedGPSString[0]=GPSData[7]; //hour
	ADD	W14, #0, W2
	MOV	W2, [W14+70]
	MOV	#lo_addr(_GPSData+7), W0
	MOV.B	[W0], [W2]
;GPSCamChip.c,478 :: 		ProcessedGPSString[1]=GPSData[8];
	ADD	W2, #1, W1
	MOV	#lo_addr(_GPSData+8), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,479 :: 		ProcessedGPSString[2]=0x3A;
	ADD	W2, #2, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1]
;GPSCamChip.c,480 :: 		ProcessedGPSString[3]=GPSData[9]; //minute
	ADD	W2, #3, W1
	MOV	#lo_addr(_GPSData+9), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,481 :: 		ProcessedGPSString[4]=GPSData[10];
	ADD	W2, #4, W1
	MOV	#lo_addr(_GPSData+10), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,482 :: 		ProcessedGPSString[5]=0x3A;
	ADD	W2, #5, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1]
;GPSCamChip.c,483 :: 		ProcessedGPSString[6]=GPSData[11];//second
	ADD	W2, #6, W1
	MOV	#lo_addr(_GPSData+11), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,484 :: 		ProcessedGPSString[7]=GPSData[12];
	ADD	W2, #7, W1
	MOV	#lo_addr(_GPSData+12), W0
	MOV.B	[W0], [W1]
;GPSCamChip.c,485 :: 		ProcessedGPSString[8]=0x00;
	ADD	W2, #8, W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,488 :: 		strcat(ProcessedGPSString," *" );
	MOV	#lo_addr(?lstr3_GPSCamChip), W11
	MOV	W2, W10
	CALL	_strcat
;GPSCamChip.c,489 :: 		strcat(ProcessedGPSString,Ltrim(tempLatitudeString) );
	MOV	#lo_addr(_tempLatitudeString), W10
	CALL	_Ltrim
	ADD	W14, #0, W1
	MOV	W0, W11
	MOV	W1, W10
	CALL	_strcat
;GPSCamChip.c,490 :: 		strcat(ProcessedGPSString,"," );
	ADD	W14, #0, W0
	MOV	#lo_addr(?lstr4_GPSCamChip), W11
	MOV	W0, W10
	CALL	_strcat
;GPSCamChip.c,491 :: 		strcat(ProcessedGPSString,Ltrim(tempLongitudeString) );
	MOV	#lo_addr(_tempLongitudeString), W10
	CALL	_Ltrim
	ADD	W14, #0, W1
	MOV	W0, W11
	MOV	W1, W10
	CALL	_strcat
;GPSCamChip.c,493 :: 		packageSize=strlen(ProcessedGPSString)+1;
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_strlen
	MOV	#lo_addr(_packageSize), W1
	ADD	W0, #1, [W1]
;GPSCamChip.c,494 :: 		ProcessedGPSString[34]=0x00;
	ADD	W14, #0, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,495 :: 		memcpy(GPSString,ProcessedGPSString,35);
	MOV	[W14+70], W0
	MOV	#35, W12
	MOV	W0, W11
	MOV	#lo_addr(_GPSString), W10
	CALL	_memcpy
;GPSCamChip.c,497 :: 		return ProcessedGPSString;
	ADD	W14, #0, W0
;GPSCamChip.c,498 :: 		}
;GPSCamChip.c,497 :: 		return ProcessedGPSString;
;GPSCamChip.c,498 :: 		}
L_end_processGPSString:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _processGPSString

_logGPSToSD:
	LNK	#68

;GPSCamChip.c,500 :: 		void logGPSToSD(){
;GPSCamChip.c,506 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
;GPSCamChip.c,507 :: 		unsigned int comma=0;
; comma start address is: 4 (W2)
	CLR	W2
;GPSCamChip.c,510 :: 		for(i=0;i<80;i++){
; i start address is: 8 (W4)
	CLR	W4
; comma end address is: 4 (W2)
; i end address is: 8 (W4)
L_logGPSToSD113:
; i start address is: 8 (W4)
; comma start address is: 4 (W2)
	MOV	#80, W0
	CP	W4, W0
	BRA LTU	L__logGPSToSD212
	GOTO	L_logGPSToSD114
L__logGPSToSD212:
;GPSCamChip.c,511 :: 		if(GPSData[i]==','){
	MOV	#lo_addr(_GPSData), W0
	ADD	W0, W4, W0
	MOV.B	[W0], W1
	MOV.B	#44, W0
	CP.B	W1, W0
	BRA Z	L__logGPSToSD213
	GOTO	L__logGPSToSD150
L__logGPSToSD213:
;GPSCamChip.c,512 :: 		comma++;
; comma start address is: 4 (W2)
	INC	W2
; comma end address is: 4 (W2)
; comma end address is: 4 (W2)
;GPSCamChip.c,513 :: 		}
	GOTO	L_logGPSToSD116
L__logGPSToSD150:
;GPSCamChip.c,511 :: 		if(GPSData[i]==','){
;GPSCamChip.c,513 :: 		}
L_logGPSToSD116:
;GPSCamChip.c,514 :: 		if(comma==10){break;}
; comma start address is: 4 (W2)
	CP	W2, #10
	BRA Z	L__logGPSToSD214
	GOTO	L_logGPSToSD117
L__logGPSToSD214:
; comma end address is: 4 (W2)
	GOTO	L_logGPSToSD114
L_logGPSToSD117:
;GPSCamChip.c,510 :: 		for(i=0;i<80;i++){
; comma start address is: 4 (W2)
	INC	W4
;GPSCamChip.c,515 :: 		}
; comma end address is: 4 (W2)
	GOTO	L_logGPSToSD113
L_logGPSToSD114:
;GPSCamChip.c,517 :: 		memcpy(ProcessedGPSString,&GPSData[7],i-7);
	SUB	W4, #7, W1
	ADD	W14, #8, W0
	MOV	W1, W12
	MOV	#lo_addr(_GPSData+7), W11
	MOV	W0, W10
	CALL	_memcpy
;GPSCamChip.c,518 :: 		ProcessedGPSString[i-7]=0x00;
	SUB	W4, #7, W1
; i end address is: 8 (W4)
	ADD	W14, #8, W0
	ADD	W0, W1, W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,520 :: 		if(oldPicNum!=PicnumIncrementor){
	MOV	_oldPicNum, W1
	MOV	#lo_addr(_PicnumIncrementor), W0
	CP	W1, [W0]
	BRA NZ	L__logGPSToSD215
	GOTO	L_logGPSToSD118
L__logGPSToSD215:
;GPSCamChip.c,521 :: 		strcat(ProcessedGPSString,",DSLR");
	ADD	W14, #8, W0
	MOV	#lo_addr(?lstr5_GPSCamChip), W11
	MOV	W0, W10
	CALL	_strcat
;GPSCamChip.c,522 :: 		oldPicNum=PicnumIncrementor;
	MOV	_PicnumIncrementor, W0
	MOV	W0, _oldPicNum
;GPSCamChip.c,523 :: 		}
L_logGPSToSD118:
;GPSCamChip.c,524 :: 		GPSfile=FAT32_Open("GPS1.txt",0x04);
	MOV.B	#4, W11
	MOV	#lo_addr(?lstr6_GPSCamChip), W10
	CALL	_FAT32_Open
; GPSfile start address is: 4 (W2)
	MOV.B	W0, W2
;GPSCamChip.c,525 :: 		FAT32_Write(GPSfile,ProcessedGPSString, strlen(ProcessedGPSString));
	ADD	W14, #8, W0
	MOV	W0, W10
	CALL	_strlen
	ADD	W14, #8, W1
	PUSH	W2
	MOV	W0, W12
	MOV	W1, W11
	MOV.B	W2, W10
	CALL	_FAT32_Write
	POP	W2
;GPSCamChip.c,526 :: 		FAT32_Write(GPSfile, "\r\n",2);
	PUSH	W2
	MOV	#2, W12
	MOV	#lo_addr(?lstr7_GPSCamChip), W11
	MOV.B	W2, W10
	CALL	_FAT32_Write
	POP	W2
;GPSCamChip.c,528 :: 		FAT32_Close(GPSfile);
	MOV.B	W2, W10
; GPSfile end address is: 4 (W2)
	CALL	_FAT32_Close
;GPSCamChip.c,549 :: 		}
;GPSCamChip.c,534 :: 		return;
;GPSCamChip.c,549 :: 		}
L_end_logGPSToSD:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _logGPSToSD

_initAll:

;GPSCamChip.c,550 :: 		void initAll(){
;GPSCamChip.c,551 :: 		PLLFBD = 68;            // PLL multiplier M=70
	MOV	#68, W0
	MOV	WREG, PLLFBD
;GPSCamChip.c,552 :: 		CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;GPSCamChip.c,553 :: 		ANSELA = 0x00;          // Convert all I/O pins to digital
	CLR	ANSELA
;GPSCamChip.c,554 :: 		ANSELB = 0x00;
	CLR	ANSELB
;GPSCamChip.c,556 :: 		mappins();
	CALL	_mappins
;GPSCamChip.c,557 :: 		initSPI2CommunicationTOMaster();
	CALL	_initSPI2CommunicationTOMaster
;GPSCamChip.c,558 :: 		InitSD();
	CALL	_initSD
;GPSCamChip.c,559 :: 		initGPS();
	CALL	_initGPS
;GPSCamChip.c,561 :: 		InitTimer1();
	CALL	_InitTimer1
;GPSCamChip.c,562 :: 		}
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
	LNK	#6

;GPSCamChip.c,565 :: 		void main() {//GPS logging is working but cam hasn't been tested yet, nor is the communication line
;GPSCamChip.c,569 :: 		unsigned int i=0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
;GPSCamChip.c,570 :: 		initAll();
	CALL	_initAll
;GPSCamChip.c,572 :: 		LATA.B1=1;//LED
	BSET	LATA, #1
;GPSCamChip.c,574 :: 		for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}//only GPGGA
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_main122:
; i start address is: 2 (W1)
	CP	W1, #16
	BRA LTU	L__main218
	GOTO	L_main123
L__main218:
	MOV	#lo_addr(_commandmsson), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC	W1
; i end address is: 2 (W1)
	GOTO	L_main122
L_main123:
;GPSCamChip.c,577 :: 		while(!GPSpackageReady);
L_main125:
	MOV	#lo_addr(_GPSpackageReady), W0
	CP0.B	[W0]
	BRA Z	L__main219
	GOTO	L_main126
L__main219:
	GOTO	L_main125
L_main126:
;GPSCamChip.c,579 :: 		processGPSString();
	CALL	_processGPSString
;GPSCamChip.c,580 :: 		SPI2BUF=GPSString[0];
	MOV	#lo_addr(_GPSString), W0
	ZE	[W0], W0
	MOV	WREG, SPI2BUF
;GPSCamChip.c,581 :: 		GPStoMasterPtr=1;
	MOV	#1, W0
	MOV	W0, _GPStoMasterPtr
;GPSCamChip.c,583 :: 		LATA.B1=0;
	BCLR	LATA, #1
;GPSCamChip.c,584 :: 		while(1){
L_main127:
;GPSCamChip.c,585 :: 		while(samplingmode){
L_main129:
	MOV	#lo_addr(_samplingmode), W0
	CP0	[W0]
	BRA NZ	L__main220
	GOTO	L_main130
L__main220:
;GPSCamChip.c,586 :: 		if(GPSpackageReady){
	MOV	#lo_addr(_GPSpackageReady), W0
	CP0.B	[W0]
	BRA NZ	L__main221
	GOTO	L_main131
L__main221:
;GPSCamChip.c,587 :: 		LATA.B1=1;
	BSET	LATA, #1
;GPSCamChip.c,588 :: 		GPSpackageReady=0;
	MOV	#lo_addr(_GPSpackageReady), W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,589 :: 		processGPSString();
	CALL	_processGPSString
;GPSCamChip.c,590 :: 		LATA.B1=0;
	BCLR	LATA, #1
;GPSCamChip.c,596 :: 		Delay_ms(300);
	MOV	#65, W8
	MOV	#5734, W7
L_main132:
	DEC	W7
	BRA NZ	L_main132
	DEC	W8
	BRA NZ	L_main132
	NOP
;GPSCamChip.c,598 :: 		}
L_main131:
;GPSCamChip.c,599 :: 		}
	GOTO	L_main129
L_main130:
;GPSCamChip.c,600 :: 		while(loggingmode){
L_main134:
	MOV	#lo_addr(_loggingmode), W0
	CP0	[W0]
	BRA NZ	L__main222
	GOTO	L_main135
L__main222:
;GPSCamChip.c,601 :: 		if(newDir){
	MOV	#lo_addr(_newDir), W0
	CP0	[W0]
	BRA NZ	L__main223
	GOTO	L_main136
L__main223:
;GPSCamChip.c,602 :: 		FAT32_ChangeDir("\\");//create a new folder
	MOV	#lo_addr(?lstr9_GPSCamChip), W10
	CALL	_FAT32_ChangeDir
;GPSCamChip.c,603 :: 		Ltrim(nameReceived);
	MOV	#lo_addr(_nameReceived), W10
	CALL	_Ltrim
;GPSCamChip.c,604 :: 		Rtrim(nameReceived);
	MOV	#lo_addr(_nameReceived), W10
	CALL	_Rtrim
;GPSCamChip.c,605 :: 		if(FAT32_MakeDir(nameReceived)==-1){
	MOV	#lo_addr(_nameReceived), W10
	CALL	_FAT32_MakeDir
	MOV.B	#255, W1
	CP.B	W0, W1
	BRA Z	L__main224
	GOTO	L_main137
L__main224:
;GPSCamChip.c,606 :: 		error = FAT32_GetError();
	CALL	_FAT32_GetError
;GPSCamChip.c,607 :: 		ShortToStr(error,errorString);
	ADD	W14, #0, W1
	MOV	W1, W11
	MOV.B	W0, W10
	CALL	_ShortToStr
;GPSCamChip.c,608 :: 		log=FAT32_Open("log", 0x04);
	MOV.B	#4, W11
	MOV	#lo_addr(?lstr10_GPSCamChip), W10
	CALL	_FAT32_Open
; log start address is: 4 (W2)
	MOV.B	W0, W2
;GPSCamChip.c,609 :: 		FAT32_Write(log, errorString, strlen(errorString));
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_strlen
	ADD	W14, #0, W1
	PUSH	W2
	MOV	W0, W12
	MOV	W1, W11
	MOV.B	W2, W10
	CALL	_FAT32_Write
	POP	W2
;GPSCamChip.c,610 :: 		FAT32_Close(log);
	MOV.B	W2, W10
; log end address is: 4 (W2)
	CALL	_FAT32_Close
;GPSCamChip.c,611 :: 		while(1){
L_main138:
;GPSCamChip.c,612 :: 		LATA.B1=1;Delay_ms(100);LATA.B1=0;Delay_ms(100);
	BSET	LATA, #1
	MOV	#22, W8
	MOV	#23756, W7
L_main140:
	DEC	W7
	BRA NZ	L_main140
	DEC	W8
	BRA NZ	L_main140
	NOP
	NOP
	BCLR	LATA, #1
	MOV	#22, W8
	MOV	#23756, W7
L_main142:
	DEC	W7
	BRA NZ	L_main142
	DEC	W8
	BRA NZ	L_main142
	NOP
	NOP
;GPSCamChip.c,613 :: 		}
	GOTO	L_main138
;GPSCamChip.c,614 :: 		}
L_main137:
;GPSCamChip.c,615 :: 		FAT32_Changedir(nameReceived);
	MOV	#lo_addr(_nameReceived), W10
	CALL	_FAT32_ChangeDir
;GPSCamChip.c,616 :: 		newDir=0;
	CLR	W0
	MOV	W0, _newDir
;GPSCamChip.c,617 :: 		}
L_main136:
;GPSCamChip.c,618 :: 		if(GPSpackageReady){
	MOV	#lo_addr(_GPSpackageReady), W0
	CP0.B	[W0]
	BRA NZ	L__main225
	GOTO	L_main144
L__main225:
;GPSCamChip.c,620 :: 		handshake=0;
	CLR	W0
	MOV	W0, _handshake
;GPSCamChip.c,621 :: 		LATA.B1=1;
	BSET	LATA, #1
;GPSCamChip.c,622 :: 		LogGPSToSD();GPSpackageReady=0;
	CALL	_logGPSToSD
	MOV	#lo_addr(_GPSpackageReady), W1
	CLR	W0
	MOV.B	W0, [W1]
;GPSCamChip.c,624 :: 		handshake=1;
	MOV	#1, W0
	MOV	W0, _handshake
;GPSCamChip.c,625 :: 		LATA.B1=0;
	BCLR	LATA, #1
;GPSCamChip.c,626 :: 		}
L_main144:
;GPSCamChip.c,628 :: 		}
	GOTO	L_main134
L_main135:
;GPSCamChip.c,629 :: 		PicnumIncrementor=0;
	CLR	W0
	MOV	W0, _PicnumIncrementor
;GPSCamChip.c,630 :: 		if(enableGPSOutput){
	MOV	#lo_addr(_enableGPSOutput), W0
	CP0	[W0]
	BRA NZ	L__main226
	GOTO	L_main145
L__main226:
;GPSCamChip.c,631 :: 		enableGPSOutput=0;
	CLR	W0
	MOV	W0, _enableGPSOutput
;GPSCamChip.c,639 :: 		}
L_main145:
;GPSCamChip.c,640 :: 		if(disableGPSOutput){
	MOV	#lo_addr(_disableGPSOutput), W0
	CP0	[W0]
	BRA NZ	L__main227
	GOTO	L_main146
L__main227:
;GPSCamChip.c,641 :: 		disableGPSOutput=0;
	CLR	W0
	MOV	W0, _disableGPSOutput
;GPSCamChip.c,649 :: 		PicnumIncrementor=0;
	CLR	W0
	MOV	W0, _PicnumIncrementor
;GPSCamChip.c,650 :: 		oldPicNum=0;
	CLR	W0
	MOV	W0, _oldPicNum
;GPSCamChip.c,651 :: 		}
L_main146:
;GPSCamChip.c,655 :: 		}
	GOTO	L_main127
;GPSCamChip.c,656 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
