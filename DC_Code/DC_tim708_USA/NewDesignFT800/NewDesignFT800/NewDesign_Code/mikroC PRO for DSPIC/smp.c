#include "smpFunctionHeader.h"
//essentials:
unsigned char i=0;
void initChip(){
    PLLFBD = 68;            // PLL multiplier M=70
    CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2

    ANSELA = 0x00;          // Convert all I/O pins to digital
    ANSELB = 0x00;
    ANSELC = 0x00;
    ANSELD = 0x00;
    ANSELE = 0x00;
    ANSELG = 0x00;
}
void mapPins(){
	//U1Tx ---> U1Rx buffer chip
	//U1Rx --->	U1Tx buffer chip
	//U2Tx ---> U1Rx screen chip
	//U2Rx --->	U1Tx screen chip
	//U3Tx ---> Laser Rx
	//U3Rx --->	Laser Tx
	//U4Tx ---> 9dof Rx
	//U4Rx ---> 9dof Tx
	//SPI2 ---> SPI2 buffer chip
	//Q1A: A0
	//Q1I: E8
	//Q1B: E9
	//Q2A: B5
	//Q2I: B4
	//Q2B: B3
	//F4   ---> LED
    TRISE.B6 = 1; //U1Tx from bufferchip
    TRISE.B7 = 0; //U1Rx to bufferchip
    
    TRISD.B3 = 1; //U2Rx from master
    TRISD.B2 = 0; //U2Tx to master
    
    TRISE.B1=1;//U3RX from lazer
    TRISE.B0=0;//U3TX to lazer
    
    TRISG.B0=1;//U4Rx from 9DOF
    TRISG.B1=0;//U4Tx to 9DOF
    
    TRISA.B0=1;//Q1A
    TRISE.B8=1;//Q1I
    TRISE.B9=1;//Q1B
    TRISB.B5=1;//Q2A
    TRISB.B4=1;//Q2I
    TRISB.B3=1;//Q2B
    
    TRISD.B15=0;//pwm
    TRISD.B14=0;//direction
    
    
    
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
    
    PPS_Mapping(79, _OUTPUT, _OC1);//motor
}
void InitTimer1(){//set 1ms
  T1CON         = 0x8010;
  T1IE_bit         = 0;
  T1IF_bit         = 0;
  IPC0.B14=1;
  IPC0.B13=1;
  IPC0.B12=1;
  PR1                 = 8750;
}
void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
  T1IF_bit         = 0;
  t++;
}

//communication:
void initBufferchipUART(){//UART1 to buffer chip
   UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
   Delay_ms(100);
   IFS0.B11=0;
   U1STA.OERR=0;  //reset buffer
   IPC2.B14=1;
   IPC2.B13=0;
   IPC2.B12=0;
   IEC0.B11=1;    //enable interrupt
}
void BufferChipInterrupt() iv IVT_ADDR_U1RXINTERRUPT {
  unsigned char temp = 0;
  IFS0.B11=0;
  temp=UART1_Read();
  if(temp==0xF3){
    loggingFlag=0;//buffer chip starts to wrap up
    //UART2_Write(0xE2);//tell Screen to stop ploting
  }
  if(temp==0xE7){
    bufferlistening=1;
     Delay_ms(100);
     REncPos=0;
     POS1HLD=0;//resetQEI1
     POS1CNTL=0;
     IEncPos=0;
     POS2HLD=0;//resetQEI2
     POS2CNTL=0;
     if(inchWormMode){moveWorm(0);}
     T1IE_bit=1;
  }
  if(temp==0xA9){
    bufferlistening=0;//buffer chip closes the file
  }

}

void initBufferchipSPI(){//SPI2 to buffer
   SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_4, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_ACTIVE_2_IDLE);
   Delay_ms(100);
}

void initScreenChipCommunication(){//UART2 to master screen chip
   //UART2_Init(115200);
   UART2_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
   Delay_ms(100);
   IFS1.B14=0;
   U2STA.OERR=0;  //reset buffer
   IPC7.B10=1;
   IPC7.B9=0;
   IPC7.B8=1;
   IEC1.B14=1;    //enable interrupt
}
void ScreenChipInterrupt() iv IVT_ADDR_U2RXINTERRUPT {
  unsigned char temp = 0;
  IFS1.B14=0;
  temp=UART2_Read();
  if(nameStart){//send name when a byte is received
      if(temp==0xB5){
         nameStart=0;
         return;
      }
      UART1_Write(temp);
  }
  else{
      switch (temp){
         case 0x31://send Laz, to screen once
            smpOnceflag=1;
            break;
         case 0xA2://enter logging mode
            if(loggingflag){return;}
            UART1_Write(0xD3);//tell buffer to start listening
            loggingFlag=1;
            REncPos=0;
            IEncPos=0;
            POS1HLD=0;//resetQEI
            POS1CNTL=0;
            POS2HLD=0;//resetQEI
            POS2CNTL=0;
            oldREncPos=0;
            sendtoBufferCount=0;
            measurements=0;//reset counts
            t=0;

            break;
         case 0xB7://quit logging mode
            loggingFlag=0;
            //
            break;
         case 0xE3://start of name
            nameStart=1;
            UART1_Write(0xF3);
            break;
         default:
            UART1_Write(temp);//relay roughness bytes to buffchip
            break;
        /* case 0x1C://start inch worm from front to rear
            inchWormMode=1;
            IEncPos=0;
            POS2HLD=0;//resetQEI
            POS2CNTL=0;


            break;
         case 0x5D://move worm to the front
            moveWorm(1);
            break;
         case 0x3E:
            moveWorm(0);//move to the rear
            break;
         case 0x3B:
            stopWorm();
            break;
            
         case 0xFC:
            //setINCGroundPlane();
            break; */
      }
  }

}

//sensors:
void initLaz(){//UART3 to Laz
   unsigned int iterator=0;
   UART3_Init_Advanced(9600,_UART_8BIT_EVENPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);          //connect to sensor @9600
   Delay_ms(1000);
   for (iterator=0;iterator<7;iterator++){UART3_Write(setBaud[iterator]);} //set baudrate to 460800
  Delay_ms(100);
   //set sampling rate here
   UART3_Init_Advanced(460800,_UART_8BIT_EVENPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);       //reset PIC UART1 baudrate to 115200
   Delay_ms(100);

   for (iterator=0;iterator<sizeof(setSampling);iterator++){UART3_Write(setSampling[iterator]);}
   Delay_ms(10);
   
   for (iterator=0;iterator<sizeof(accumulationtime);iterator++){UART3_Write(accumulationtime[iterator]);}
   Delay_ms(10);

   Delay_ms(150);
   

   U3STA.OERR=0;

   U3STA.B7=0;
   IPC20.B10=1;  //priority 101
   IPC20.B9=0;
   IPC20.B8=1;
   U3STA.B7=0;
   IFS5.B2=0;
   IEC5.B2=1;

   Laz[3]=0;
   Laz[2]=0;
   Laz[1]=0;Laz[0]=0;
   LazIterator=0;//counter
}
void LazInterrupt() iv IVT_ADDR_U3RXINTERRUPT ics ICS_AUTO {
   IFS5.B2=0;
   //LATF.B4= ~LATF.B4;
   Laz[LazIterator++]=U3RXREG&0b00001111;
   if(LazIterator==4){LazIterator=0; }
}
void init9DOF(){//UART4 to Inc
   unsigned int initializer=0;
   for(initializer=0;initializer<18;initializer++){DOFReadyBuf[initializer]=0x0C;}//init 9DOF buff
   UART4_Init(115200);
   Delay_ms(500);
   IFS5.B8=0;
   U4STA.B7=0;
   IPC22.B2=1;//priority=110
   IPC22.B1=1;
   IPC22.B0=0;
   IEC5.B8=1;
   U4STA.OERR=0;

   /*
   for(initializer=0;initializer<sizeof(incChangeDampingTime);initializer++){
          UART4_Write(incChangeDampingTime[initializer]);//change damping
   }
     */
     
   Delay_ms(500);
   DofIterator=0;

}
void DOFInterrupt() iv IVT_ADDR_U4RXINTERRUPT{
   IFS5.B8=0;
   DOFBuf[DofIterator++]=U4RXREG;
   if(DofIterator==18){DofIterator=0;memcpy(DOFReadyBuf,DOFBuf,18);}

}

void initAcc(){
     ANSELE.ANSE2=1;//y
     ANSELE.ANSE3=1;//x
     ANSELE.ANSE4=1;//z
     TRISE.B4=1;
     TRISE.B3=1;
     TRISE.B2=1;
     ADC1_Init();
}
void initRollingQEI(){
   QEI1CON=0b1000000000000000; //index does not reset counter. no overflow interruptionn'shit
}
void initInchWormQEI(){
   QEI2CON=0b1000000000000000; //index does not reset counter. no overflow interruptionn'shit
}
void initMotor(){
    initInchWormQEI();
    pwm_period1 = PWM_Init(500, 1, 1, 2);
}
void initAll(){
    //essentials
    initChip();
    mapPins();
    TRISF.B4=0;//led
    LATF.B4=1;
    initTimer1();
    initBufferchipUART();//UART1
    initBufferchipSPI(); //SPI2
    initScreenChipCommunication(); //UART2
    
    Delay_ms(22000);
    
    //sensors:
    initLaz();//UART3
    init9DOF();//UART4
    initRollingQEI();//QEI1
    initInchWormQEI();

}

void resetAll(){
    T1IE_bit= 0; //stop timer
    t=0;
    U1STA.OERR=0;
    U2STA.OERR=0;
    U3STA.OERR=0;
    U4STA.OERR=0;
    UART1_Read();
    UART2_Read();
    UART3_Read();
    UART4_Read();
    LazIterator=0;//reset pointers
    DofIterator=0;
    REncPos=0;
    IEncPos=0;
    POS1HLD=0;//resetQEI
    POS1CNTL=0;
    POS2HLD=0;//resetQEI
    POS2CNTL=0;
    oldREncPos=0;
    sendtoBufferCount=0;
}


void getRQEIPOS(unsigned long *pos, unsigned long *oldPos){
  static unsigned int posL;
  static unsigned long posH;
  posL=POS1CNTL;  //get Low Position
  posH=POS1HLD;   //get High Position from hold reg        originally POS1HLD changed by Ian and James 07312013
  *pos=posL|(posH<<16); // writes to temp
  //logFlagByDistance = 1;
  if (*pos < *oldPos || *pos - *oldPos > 0xFFFF) {logFlagByDistance = 0;}
  else {logFlagByDistance = 1;*oldPos = *pos;}
}

void getIQEIPOS(unsigned long *pos){
  static unsigned int posL;
  static unsigned long posH;
  posL=POS2CNTL;  //get Low Position
  posH=POS2HLD;   //get High Position from hold reg        originally POS1HLD changed by Ian and James 07312013
  *pos=posL|(posH<<16); // writes to temp
}
void getLaz(){
   UART3_Write(0x00);UART3_Write(0x86);//request
}
void get9DOF(){
   UART4_Write(0x31);//requset
}

void sampleOnce(){

     getRQEIPOS(&REncPos, &oldREncPos);
     getIQEIPOS(&IEncPos);
     if(!smpOnceflag){
        if (!logFlagByDistance) {return;}
     }
     getLaz();    // Send command to laser to send back data
     measurements++;
     if(measurements==1){//every 8 Laz one inc
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
void sendToBuffer(){ //  (4 Laz 8 enc 3 time )*10  18 9DOF         504 per 512
  volatile unsigned long tempT;
  unsigned char shadowDOFBuffer[2];
  if(!logFlagByDistance){return;}
  //unsigned char TDOFBUF[18];

  
  T1IE_bit = 0;
  tempT=t;
  T1IE_bit = 1;

  // Write the 4 laser bytes to the buffer
  SPI2_Write(Laz[3]);SPI2_Write(Laz[2]);SPI2_Write(Laz[1]);SPI2_Write(Laz[0]);
  // Write the 8 encoder bytes to the buffer
  SPI2_Write(REncPos>>24);SPI2_Write(REncPos>>16);SPI2_Write(REncPos>>8);SPI2_Write(REncPos);
  SPI2_Write(IEncPos>>24);SPI2_Write(IEncPos>>16);SPI2_Write(IEncPos>>8);SPI2_Write(IEncPos);
  // Write the 3 time bytes to the buffer
  SPI2_Write(tempT>>16);SPI2_Write(tempT>>8);SPI2_Write(tempT);
  
  
  sendtoBufferCount++;
  
  // For every 10 writes of the previous 15 bytes...
  if(sendtoBufferCount==10){
    sendtoBufferCount=0;
    // Write 9DOF data to the buffer  18byte
    // Shadow each integer before writing
    //Accelerometer 3-axis (X,Y,Z)
    memcpy(shadowDOFBuffer,DOFreadyBuf,2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    memcpy(shadowDOFBuffer,&DOFreadyBuf[2],2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    memcpy(shadowDOFBuffer,&DOFreadyBuf[4],2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    //Gyroscope 3-axis (X,Y,Z)
    memcpy(shadowDOFBuffer,&DOFreadyBuf[6],2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    memcpy(shadowDOFBuffer,&DOFreadyBuf[8],2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    memcpy(shadowDOFBuffer,&DOFreadyBuf[10],2);
    SPI2_Write(shadowDOFBuffer[0]);SPI2_Write(shadowDOFBuffer[1]);
    //Magnetometer 3-axis (X,Y,Z)
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
 // if(inchWormMode){
 //    tempEncPos=IEncPos;
 // }
  //else{
  tempEncPos=REncPos;
  //}
  UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);  // 4laz-4enc-4pitch-4roll-6acc
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
    UART2_Write(Laz[3]);UART2_Write(Laz[2]);UART2_Write(Laz[1]);UART2_Write(Laz[0]);  //laz
    UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);          //pitch dummy
    UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);UART2_Write(0x00);          //roll dummy
    UART2_Write(tempT>>16);UART2_Write(tempT>>8);UART2_Write(tempT);                  //3t
    UART2_Write(tempEnc>>24);UART2_Write(tempEnc>>16);UART2_Write(tempEnc>>8);UART2_Write(tempEnc);//4enc
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
        if(smpOnceflag){//send once when a request is received.
          // LATF.B4=1;
           sampleOnce();
           smpOnceflag=0;
           Delay_ms(10);
           smpsendToScreen();
          // LATF.B4=0;
           Delay_ms(5);
        }
        if(sendtoBufferCount!=0){ LATF.B4=~LATF.B4;}
        while((loggingFlag+bufferlistening)==2){//continously log to buffer chip
           sampleOnce();

           sendToBuffer();

           logsendToScreen();
           if(inchWormMode){if(IEncPos>=inchwormcycle){stopWorm();Delay_ms(500);PWM_Start(1);loggingFlag=0;moveWorm(1);inchWormDoneFlag=1;}}
           if(!loggingFlag){
               Delay_ms(10);
               UART1_Write(0xE2);//tell buffer chip stop listening and log 0x00 speration sector


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
               if(!bufferlistening){//buffer chip done
                  UART2_Write(0xAA);
               }
               else{
                  UART2_Write(0x00);
               }

               measurements=0;
               sendtoBufferCount=0;
               T1IE_bit= 0; //stop timer
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