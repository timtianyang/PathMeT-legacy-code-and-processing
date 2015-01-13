#line 1 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/smp.c"
#line 1 "c:/users/tic27/desktop/dc_tim708backuplazer/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/smpfunctionheader.h"



unsigned char setBaud[]={ 0x00, 0x83, 0x84, 0x80, 0x80, 0x8C };
unsigned char setSampling[] ={ 0x00,0x83,0x89 ,0x80 ,0x80 ,0x80 ,0x00 ,0x83 ,0x88 ,0x80,0x82 ,0x83};
unsigned char accumulationtime[]= { 0x00 ,0x83 ,0x8B ,0x80 ,0x80,0x80 ,0x00 ,0x83 ,0x8A ,0x80 ,0x88 ,0x8C};
volatile unsigned char Laz[4];
volatile unsigned char LazIterator=0;






volatile unsigned char DOFBuf[18];
volatile unsigned char DOFReadyBuf[18];
volatile unsigned char DofIterator=0;

unsigned long REncPos=0;
unsigned long oldREncPos=0;
unsigned long IEncPos=0;
volatile unsigned int inchWormDoneFlag=0;
volatile unsigned int inchWormMode=0;
volatile unsigned int logFlagByDistance=1;


volatile unsigned long t=0;


volatile unsigned int smpOnceflag=0;
volatile unsigned int loggingFlag=0;
volatile unsigned int nameStart=0;

volatile unsigned char measurements=0;
volatile unsigned char sendtoBufferCount=0;
volatile unsigned char bufferlistening=0;




unsigned int accx=0;
unsigned int accy=0;
unsigned int accz=0;


unsigned int pwm_period1;
unsigned long inchwormcycle=2300;


void resetAll();
void moveWorm(unsigned int direction);
void stopWorm();
#line 3 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/smp.c"
unsigned char i=0;
void initChip(){
 PLLFBD = 68;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;
}
void mapPins(){

 TRISE.B6 = 1;
 TRISE.B7 = 0;

 TRISD.B3 = 1;
 TRISD.B2 = 0;

 TRISE.B1=1;
 TRISE.B0=0;

 TRISG.B0=1;
 TRISG.B1=0;

 TRISA.B0=1;
 TRISE.B8=1;
 TRISE.B9=1;
 TRISB.B5=1;
 TRISB.B4=1;
 TRISB.B3=1;

 TRISD.B15=0;
 TRISD.B14=0;



 PPS_Mapping(86, _INPUT, _U1RX);
 PPS_Mapping(87, _OUTPUT, _U1TX);
 PPS_Mapping(67, _INPUT, _U2RX);
 PPS_Mapping(66, _OUTPUT, _U2TX);
 PPS_Mapping(81, _INPUT, _U3RX);
 PPS_Mapping(80, _OUTPUT, _U3TX);
 PPS_Mapping(112, _INPUT, _U4RX);
 PPS_Mapping(113, _OUTPUT, _U4TX);


 PPS_Mapping(16, _INPUT, _QEA1);
 PPS_Mapping(89, _INPUT, _QEB1);
 PPS_Mapping(88, _INPUT, _INDX1);
 PPS_Mapping(37, _INPUT, _QEA2);
 PPS_Mapping(35, _INPUT, _QEB2);
 PPS_Mapping(36, _INPUT, _INDX2);

 PPS_Mapping(79, _OUTPUT, _OC1);
}
void InitTimer1(){
 T1CON = 0x8010;
 T1IE_bit = 0;
 T1IF_bit = 0;
 IPC0.B14=1;
 IPC0.B13=1;
 IPC0.B12=1;
 PR1 = 8750;
}
void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
 T1IF_bit = 0;
 t++;
}


void initBufferchipUART(){
 UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
 Delay_ms(100);
 IFS0.B11=0;
 U1STA.OERR=0;
 IPC2.B14=1;
 IPC2.B13=0;
 IPC2.B12=0;
 IEC0.B11=1;
}
void BufferChipInterrupt() iv IVT_ADDR_U1RXINTERRUPT {
 unsigned char temp = 0;
 IFS0.B11=0;
 temp=UART1_Read();
 if(temp==0xF3){
 loggingFlag=0;

 }
 if(temp==0xE7){
 bufferlistening=1;
 Delay_ms(100);
 REncPos=0;
 POS1HLD=0;
 POS1CNTL=0;
 IEncPos=0;
 POS2HLD=0;
 POS2CNTL=0;
 if(inchWormMode){moveWorm(0);}
 T1IE_bit=1;
 }
 if(temp==0xA9){
 bufferlistening=0;
 }

}

void initBufferchipSPI(){
 SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_4, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_ACTIVE_2_IDLE);
 Delay_ms(100);
}

void initScreenChipCommunication(){

 UART2_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
 Delay_ms(100);
 IFS1.B14=0;
 U2STA.OERR=0;
 IPC7.B10=1;
 IPC7.B9=0;
 IPC7.B8=1;
 IEC1.B14=1;
}
void ScreenChipInterrupt() iv IVT_ADDR_U2RXINTERRUPT {
 unsigned char temp = 0;
 IFS1.B14=0;
 temp=UART2_Read();
 if(nameStart){
 if(temp==0xB5){
 nameStart=0;
 return;
 }
 UART1_Write(temp);
 }
 else{
 switch (temp){
 case 0x31:
 smpOnceflag=1;
 break;
 case 0xA2:
 if(loggingflag){return;}
 UART1_Write(0xD3);
 loggingFlag=1;
 REncPos=0;
 IEncPos=0;
 POS1HLD=0;
 POS1CNTL=0;
 POS2HLD=0;
 POS2CNTL=0;
 oldREncPos=0;
 sendtoBufferCount=0;
 measurements=0;
 t=0;

 break;
 case 0xB7:
 loggingFlag=0;

 break;
 case 0xE3:
 nameStart=1;
 UART1_Write(0xF3);
 break;
 default:
 UART1_Write(temp);
 break;
#line 191 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/smp.c"
 }
 }

}


void initLaz(){

 UART3_Init_Advanced(115200,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
 Delay_ms(100);
#line 213 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/smp.c"
 U3STA.OERR=0;

 U3STA.B7=0;
 IPC20.B10=1;
 IPC20.B9=0;
 IPC20.B8=1;
 U3STA.B7=0;
 IFS5.B2=0;
 IEC5.B2=1;

 Laz[3]=0;
 Laz[2]=0;
 Laz[1]=0;Laz[0]=0;
 LazIterator=0;
}
void LazInterrupt() iv IVT_ADDR_U3RXINTERRUPT ics ICS_AUTO {
 unsigned char temp;
 IFS5.B2=0;
 temp= U3RXREG;
 if(temp==0xFF){
 LazIterator=2;
 }

 Laz[LazIterator++]=temp;
 if(LazIterator==3){LazIterator=0;}




}
void init9DOF(){
 unsigned int initializer=0;
 for(initializer=0;initializer<18;initializer++){DOFReadyBuf[initializer]=0x0C;}
 UART4_Init(115200);
 Delay_ms(500);
 IFS5.B8=0;
 U4STA.B7=0;
 IPC22.B2=1;
 IPC22.B1=1;
 IPC22.B0=0;
 IEC5.B8=1;
 U4STA.OERR=0;
#line 262 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/smp.c"
 Delay_ms(500);
 DofIterator=0;

}
void DOFInterrupt() iv IVT_ADDR_U4RXINTERRUPT{
 IFS5.B8=0;
 DOFBuf[DofIterator++]=U4RXREG;
 if(DofIterator==18){DofIterator=0;memcpy(DOFReadyBuf,DOFBuf,18);}

}

void initAcc(){
 ANSELE.ANSE2=1;
 ANSELE.ANSE3=1;
 ANSELE.ANSE4=1;
 TRISE.B4=1;
 TRISE.B3=1;
 TRISE.B2=1;
 ADC1_Init();
}
void initRollingQEI(){
 QEI1CON=0b1000000000000000;
}
void initInchWormQEI(){
 QEI2CON=0b1000000000000000;
}
void initMotor(){
 initInchWormQEI();
 pwm_period1 = PWM_Init(500, 1, 1, 2);
}
void initAll(){

 initChip();
 mapPins();
 TRISF.B4=0;
 LATF.B4=1;
 initTimer1();
 initBufferchipUART();
 initBufferchipSPI();
 initScreenChipCommunication();

 Delay_ms(22000);


 initLaz();
 init9DOF();
 initRollingQEI();
 initInchWormQEI();

}

void resetAll(){
 T1IE_bit= 0;
 t=0;
 U1STA.OERR=0;
 U2STA.OERR=0;
 U3STA.OERR=0;
 U4STA.OERR=0;
 UART1_Read();
 UART2_Read();
 UART3_Read();
 UART4_Read();
 LazIterator=0;
 DofIterator=0;
 REncPos=0;
 IEncPos=0;
 POS1HLD=0;
 POS1CNTL=0;
 POS2HLD=0;
 POS2CNTL=0;
 oldREncPos=0;
 sendtoBufferCount=0;
}


void getRQEIPOS(unsigned long *pos, unsigned long *oldPos){
 static unsigned int posL;
 static unsigned long posH;
 posL=POS1CNTL;
 posH=POS1HLD;
 *pos=posL|(posH<<16);

 if (*pos < *oldPos || *pos - *oldPos > 0xFFFF) {logFlagByDistance = 0;}
 else {logFlagByDistance = 1;*oldPos = *pos;}
}

void getIQEIPOS(unsigned long *pos){
 static unsigned int posL;
 static unsigned long posH;
 posL=POS2CNTL;
 posH=POS2HLD;
 *pos=posL|(posH<<16);
}
void getLaz(){
 UART3_Write(0x00);UART3_Write(0x86);
}
void get9DOF(){
 UART4_Write(0x31);
}

void sampleOnce(){

 getRQEIPOS(&REncPos, &oldREncPos);
 getIQEIPOS(&IEncPos);
 if(!smpOnceflag){
 if (!logFlagByDistance) {return;}
 }

 measurements++;
 if(measurements==1){
 get9DOF();
 Delay_us(300);
 }
 else if(measurements==8){
 measurements=0;
 Delay_us(400);
 }
 else{
 Delay_us(400);
 }


}
void sendToBuffer(){
 volatile unsigned long tempT;
 unsigned char shadowDOFBuffer[2];
 if(!logFlagByDistance){return;}



 T1IE_bit = 0;
 tempT=t;
 T1IE_bit = 1;


 SPI2_Write(Laz[3]);SPI2_Write(Laz[2]);SPI2_Write(Laz[1]);SPI2_Write(Laz[0]);

 SPI2_Write(REncPos>>24);SPI2_Write(REncPos>>16);SPI2_Write(REncPos>>8);SPI2_Write(REncPos);
 SPI2_Write(IEncPos>>24);SPI2_Write(IEncPos>>16);SPI2_Write(IEncPos>>8);SPI2_Write(IEncPos);

 SPI2_Write(tempT>>16);SPI2_Write(tempT>>8);SPI2_Write(tempT);


 sendtoBufferCount++;


 if(sendtoBufferCount==10){
 sendtoBufferCount=0;



 memcpy(shadowDOFBuffer,DOFreadyBuf,2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[2],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[4],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);

 memcpy(shadowDOFBuffer,&DOFreadyBuf[6],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[8],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[10],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);

 memcpy(shadowDOFBuffer,&DOFreadyBuf[12],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[14],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 memcpy(shadowDOFBuffer,&DOFreadyBuf[16],2);
 SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
 }
}
void smpsendToScreen(){
 volatile unsigned long tempEncPos;




 tempEncPos=REncPos;

 UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);
 UART2_Write(tempEncPos>>24);UART2_Write(tempEncPos>>16);UART2_Write(tempEncPos>>8);UART2_Write(tempEncPos);
 UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
 UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
 UART2_Write(DOFReadyBuf[0]);UART2_Write(DOFReadyBuf[1]);
 UART2_Write(DOFReadyBuf[2]);UART2_Write(DOFReadyBuf[3]);
 UART2_Write(DOFReadyBuf[4]);UART2_Write(DOFReadyBuf[5]);
}
void logsendToScreen(){
 static unsigned int temp=0;
 unsigned long tempT;
 unsigned long tempEnc;
 if (!logFlagByDistance) {return;}
 tempT=t;
 if(inchWormMode){
 tempEnc=IEncPos;
 }
 else{
 tempEnc=REncPos;
 }
 temp++;
 if(temp==100){
 temp=0;
 UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);
 UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
 UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);
 UART2_Write(tempT>>16);UART2_Write(tempT>>8);UART2_Write(tempT);
 UART2_Write(tempEnc>>24);UART2_Write(tempEnc>>16);UART2_Write(tempEnc>>8);UART2_Write(tempEnc);
 }
}
void moveWorm(unsigned int direction){
 PWM_Start(1);
 if(direction==1){
 LATD.B14=1;
 }
 else{
 LATD.B14=0;
 }
 PWM_Set_Duty(pwm_period1/2, 1);
}
void stopWorm(){
 PWM_Stop(1);
}
void main() {
 unsigned char temp;
 initAll();
 LATF.B4=0;
 Delay_ms(100);
 resetAll();
 while(1){
 if(smpOnceflag){
 LATF.B4=1;
 sampleOnce();
 smpOnceflag=0;
 Delay_ms(10);
 smpsendToScreen();
 LATF.B4=0;
 Delay_ms(5);
 }
 if(sendtoBufferCount!=0){ LATF.B4=~LATF.B4;}
 while((loggingFlag+bufferlistening)==2){
 sampleOnce();

 sendToBuffer();

 logsendToScreen();
 if(inchWormMode){if(IEncPos>=inchwormcycle){stopWorm();Delay_ms(500);PWM_Start(1);loggingFlag=0;moveWorm(1);inchWormDoneFlag=1;}}
 if(!loggingFlag){
 Delay_ms(10);
 UART1_Write(0xE2);


 Delay_ms(1000);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 UART2_Write(0xAA);
 Delay_us(10);
 if(!bufferlistening){
 UART2_Write(0xAA);
 }
 else{
 UART2_Write(0x00);
 }

 measurements=0;
 sendtoBufferCount=0;
 T1IE_bit= 0;
 t=0;
 resetAll();


 while(inchWormDoneFlag){
 LATF.B4=1;
 getIQEIPOS(&IEncPos);
 if(IEncPos<=2){
 stopWorm();
 inchWormDoneFlag=0;
 LATF.B4=0;
 inchWormMode=0;
 }
 }
 break;
 }

 }
 }
}
