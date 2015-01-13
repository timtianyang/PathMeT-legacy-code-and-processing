
#include "camFunctionHeader.h"
void LEDIndicator(){
     LATA.B1=0;
     Delay_ms(1000);
     LATA.B1=1;
     Delay_ms(1000);
     LATA.B1=0;
}
void InitTimer1(){//200ms
  T1CON         = 0x8030;
  T1IE_bit         = 0;
  T1IF_bit         = 0;
  IPC0                 = IPC0 | 0x1000;
  PR1                 = 54688;

}



void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
  T1IF_bit         = 0;
  timerFlag++;
  if(timerFlag==5){ //every 1s
      LATB.B4=1;

      T1IE_bit = 0;   //disable timer
      timerFlag=0;
  }
}


void mappins(){
     TRISA.B1=0;//Led
     LATA.B1=1;
     TRISB.B0=1;//U1RX
     TRISB.B5=0;//U1TX
     TRISB.B1=1;//U2RX
     TRISA.B4=0;//U2TX

     TRISB.B12=1;//SDI2
     TRISB.B11=0;//SDO2
     TRISB.B10=1;//sck2 input

     TRISB.B4=0;//DSL trigger output
     LATB.B4=1; //hold high
     PPS_Mapping(32,_INPUT,_U1RX);
     PPS_Mapping(37,_OUTPUT,_U1TX);
     PPS_Mapping(33,_INPUT,_U2RX);
     PPS_Mapping(20,_OUTPUT,_U2TX);

     PPS_Mapping(44,_INPUT,_SDI2IN); //SPI2
     PPS_Mapping(43,_OUTPUT,_SDO2);
     PPS_Mapping(42,_INPUT,_SCK2IN);
}
void initSD(){
     unsigned int i=0;
     SPI1_Init_Advanced(_SPI_MASTER,
                     _SPI_8_BIT,
                     _SPI_PRESCALE_SEC_2,
                     _SPI_PRESCALE_PRI_16,
                     _SPI_SS_DISABLE,
                     _SPI_DATA_SAMPLE_END,
                     _SPI_CLK_IDLE_HIGH,
                     _SPI_ACTIVE_2_IDLE) ;

     while(FAT32_Init()!=0){LEDIndicator();}

     SPI1_Init_Advanced(_SPI_MASTER,     // Init SPI at higher speed
                       _SPI_8_BIT,
                       _SPI_PRESCALE_SEC_2,
                       _SPI_PRESCALE_PRI_1,
                       _SPI_SS_DISABLE,
                       _SPI_DATA_SAMPLE_END,
                       _SPI_CLK_IDLE_HIGH,
                       _SPI_ACTIVE_2_IDLE);

     for(i=0;i<5120;i++){CameraBuff[i]=0x00;}

}
void initSPI2CommunicationTOMaster(){
    SPI2_Init_Advanced(_SPI_SLAVE,
                       _SPI_8_BIT,
                       _SPI_PRESCALE_SEC_4,
                       _SPI_PRESCALE_PRI_4,
                       _SPI_SS_DISABLE,
                       _SPI_DATA_SAMPLE_MIDDLE,
                       _SPI_CLK_IDLE_LOW,
                       _SPI_ACTIVE_2_IDLE);


   SPI2STAT.B0=1;
   SPI2STAT.B1=0;
   SPI2STAT.B2=0;

   IFS2.B1=0;
   IPC8.B6=1;
   IPC8.B5=0;
   IPC8.B4=0;
   IEC2.B1=1;
}
void SpI2interrupt() iv IVT_ADDR_SPI2INTERRUPT{
  unsigned char temp;
  IFS2.B1=0;
  SPI2STAT.SPIROV=0;//must be cleared otherwise the master will freeze.
  temp=SPI2BUF;
  
  if(!startName){
    switch(temp){
      case 0x31://sampling mode send back GPS
          loggingmode=0; //send back packages
          samplingmode=1;
          SPI2BUF=GPSString[GPSToMasterPtr++];
           //if(temp==0x00){GPStoMasterPtr=0;}
          break;
      case 0x32://reset GPS output ptr
          GPSToMasterPtr=0;
          SPI2BUF=GPSString[GPSToMasterPtr++];
          break;
      case 0x22://stop sampling mode
          samplingmode=0;
          GPStoMasterPtr=0;
          SPI2BUF=0x00;
          break;
      case 0x3B://enable GPSoutput
          enableGPSOutput=1;
          break;
      case 0x2F://disble GPSoutput
          disableGPSOutput=1;
          break;
      case 0x43://logging mode
          loggingmode=1;
          newDir=1;
          PicnumIncrementor=0;
          SPI2BUF=0x00;
          break;
      case 0x62://Stop logging mode
          loggingmode=0;
          SPI2BUF=0x00;
          break;

      case 0xAB: //toggle DSLR cam
          //LATB.B4=~LATB.B4;
          
         // if(LATB.B4==0){PicnumIncrementor++;}
         TMR1 = 0;
        //TRISB.B4=0;
         LATB.B4=0;
         T1IF_bit = 0;
         T1IE_bit = 1;
         PicnumIncrementor++;
          break;
      case 0x53://start receiving names
          startName=1;
          nameReceivedPtr=0;
      case 0xFA:// screen asking handshake for logging status
          if(handshake){
             SPI2BUF=0x1C;
          }
          else {
             SPI2BUF=0x00;
          }

      
      default:break;
    }
  }
  else
  {
     if(temp==0xE4){//end of the name
          startName=0;
          //nameReceived[nameReceivedPtr]=0x00;//terminate the string
          nameReceivedPtr=0;
          return;
     }
     nameReceived[nameReceivedPtr++]=temp;
     if(nameReceivedPtr==8){nameReceivedPtr=0;}
  }
}

void initCamera(){
   unsigned int iterator=0;
   UART1_Init(38400);
   Delay_ms(200);
   Delay_ms(2000);
   for(iterator=0;iterator<5;iterator++){
     UART1_Write(setImageSize[iterator]);
   }

   Delay_ms(150);

   for(iterator=0;iterator<7;iterator++){
     UART1_Write(setCameraBaud[iterator]);
   }
   Delay_ms(100);
   UART1_Init(57600);
   Delay_ms(200);
   U1STA.OERR=0;
}
void CameraInterrupt() iv IVT_ADDR_U1RXINTERRUPT{
     IFS0.B11=0;

    if(picStart==1)
    {   //LATF.B5=1;
       tempCam2=UART1_Read();
       if(tempCam2==0xD9&&tempCam1==0xFF){
           CameraBuff[CameraBuffPointer++]=tempCam2;
          // IEC0.B11=0;//disable interrupt so no longer receives any shit
           EOF=1;
           picStart=0;
           return;
       }

       CameraBuff[CameraBuffPointer++]=tempCam2;
       if(CameraBuffPointer<=2560){
           if(CameraBuffPointer==512){picbufferfull1=1;bufferLastFullSector=0;}
           else if(CameraBuffPointer==1024){picbufferfull2=1;bufferLastFullSector=1;}
           else if(CameraBuffPointer==1536){picbufferfull3=1;bufferLastFullSector=2;}
           else if(CameraBuffPointer==2048){picbufferfull4=1;bufferLastFullSector=3;}
           else if(CameraBuffPointer==2560){picbufferfull5=1;bufferLastFullSector=4;}
       }
       else{
           if(CameraBuffPointer==3072){picbufferfull6=1;bufferLastFullSector=5;}
           else if(CameraBuffPointer==3584){picbufferfull7=1;bufferLastFullSector=6;}
           else if(CameraBuffPointer==4096){picbufferfull8=1;bufferLastFullSector=7;}
           else if(CameraBuffPointer==4608){picbufferfull9=1;bufferLastFullSector=8;}
           else if(CameraBuffPointer==5120){CameraBuffPointer=0;picbufferfull10=1;bufferLastFullSector=9;}
       }
       


       tempCam1=tempCam2;



    }
    else if(picStart==0)
    {

        CameraBuff[CameraBuffPointer]=UART1_Read();
        CameraBuffPointer++;
        if(CameraBuffPointer==14){picStart=1;CameraBuffPointer=0;}
    }

}
/*
void takeOnePic(){
   unsigned int iterator=0;
   unsigned int sectorCount=0;
   unsigned int sectNumber=0;
   unsigned char PICNAMEString[10];
   short error=0;
   static unsigned int picnum=0;
   unsigned char picnumString[6];
   short int log=0;
   short fhandle;
  //no need to temperarily disable GPS logging and also interrupt for GPS;
   for(iterator=0;iterator<5120;iterator++){Camerabuff[iterator]=0x00;}
   CameraBuffPointer=0;
   for(iterator=0;iterator<sizeof(takeAPic);iterator++){
   UART1_Write(takeAPic[iterator]);}
   Delay_ms(200);
   U1STA.OERR=0;
   U1STA.OERR=0;
   IFS0.B11=0;
   IPC2.B14=1;
   IPC2.B13=1;
   IPC2.B12=0;
   IEC0.B11=1;    //enable interrupt

   Delay_ms(100);

   CameraBuffPointer=0;//reset pointer just to make sure

   for(iterator=0;iterator<sizeof(readPicSize);iterator++){
     UART1_Write(readPicSize[iterator]);
   } //receiving size information
   Delay_ms(15);
   //log size information
   
    log=    FAT32_Open("log", 0x04);
   FAT32_Write(log, CameraBuff, 8);
    FAT32_Close(log);
     LATA.B1=0;
     Delay_ms(1000);
     LATA.B1=1;
    

   picSize=CameraBuff[7];
   picSize=(picSize<<8)|CameraBuff[8];
   readPic[12]=CameraBuff[7]; //set highbyte for size
   readPic[13]=CameraBuff[8]; //low byte fot size
   Delay_ms(15);

   if(picSize>70000||picsize<40000)//reinit because of the error
      {
        for(iterator=0;iterator<4;iterator++)
        {
           UART1_Write(reset[iterator]);
        }
        Delay_ms(100);
        InitCamera();
        takeOnePic();
        return;
   }

   sectNumber=picSize/512;
   if(picSize%512!=0){sectNumber++;}

   WordToStrWithZeros(PicnumIncrementor,picnumString);
   PICNAMEString[0]='P';
   PICNAMEString[1]=0x00;
   strcat(PICNAMEString,picnumString);
   LTRIM(PICNAMEString);
   RTRIM(PICNAMEString);
   StrCat(PICNAMEString,".jpg");

   //error=FAT32_MakeSwap(PICNAMEString,sectNumber,&SDstartSector);//keep returning 0
   fhandle = FAT32_Open(PICNAMEString,0x04);
   SDcurrentSector=SDstartSector;



    for(iterator=0;iterator<sizeof(readPic);iterator++){
     UART1_Write(readPic[iterator]);
   } //receiving PIC

   //now Picture[] has the picture







   while(1){
       for(iterator=0;iterator<10;iterator++){//check flags and write
           if(*(bufferFullFlags[iterator])){
                *(bufferFullFlags[iterator])=0;
                //FAT32_Dev_Write_Sector(SDcurrentSector++,buffersPtrs[iterator]);
                if(FAT32_Write(fhandle,buffersPtrs[iterator],512)==-1){
                    while(1){ LATA.B1=~LATA.B1;
                     Delay_ms(100); }
                     
                }
                //*bufferFullFlags[iterator]=0;
               //sectorCount++;
           }
       }
       
       if(EOF) //the position!!!!!!!!!!!!!
       {
        Delay_ms(50);//wait till buffer is filled with entire pic

        // for(iterator=CameraBuffPointer;iterator<512;iterator++)
        //       {
       //           CameraBuff1[iterator]=0x00;

        //       }
       //   FAT32_Dev_Write_Sector(SDcurrentSector,CameraBuff1);
          //bufferLastFullSector++;
        //  if(bufferLastFullSector==9){bufferLastFullSector=0;}
         // FAT32_Dev_Write_Sector(SDcurrentSector++,buffersPtrs[bufferLastFullSector]);
           FAT32_Write(fhandle,buffersPtrs[++bufferLastFullSector],512);
          for(iterator=0;iterator<sizeof(stop);iterator++)
          {
              UART1_Write(stop[iterator]);
          }
          picStart=0;
          
          for(iterator=0;iterator<10;iterator++){
               *bufferFullFlags[iterator]=0;
          }
          CameraBuffPointer=0;
          
          tempCam1=0x00;
          tempCam2=0x00;
          EOF=0;
          //picbufferfull1=0;
          //IEC5.B8=0;
            FAT32_Close(fhandle);
          break;  //disable interrupt
        }

   }

}
*/
void initGPS(){
  //short log;
  unsigned char i=0;
  //log=FAT32_Open("GPSlog", 0x04);
  for(i=0;i<90;i++){GPSData[i]=0x00;}
   LATA.B1=1;//LED
   Delay_ms(100);
   LATA.B1=0;//LED
   Delay_ms(100);
   LATA.B1=1;//LED
   Delay_ms(100);
    LATA.B1=0;//LED
   Delay_ms(100);
   LATA.B1=1;//LED
   Delay_ms(100);
    LATA.B1=0;//LED
   Delay_ms(100);
   LATA.B1=1;//LED
   Delay_ms(100);
  //only need important information
  UART2_Init(9600);
  Delay_ms(500);

  for(i=0;i<11;i++){UART2_Write(GPSBaudcmd[i]);}
  Delay_ms(200);
  UART2_Init(115200);
  Delay_ms(200);
  for(i=0;i<10;i++){UART2_Write(GPSPowerModeNormal[i]);}
  Delay_ms(200);

  for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}
  Delay_ms(200);

  for(i=0;i<10;i++){UART2_Write(GPSUpdataRate[i]);}
  Delay_ms(200);

  for(i=0;i<10;i++){UART2_Write(GPSWAASEnable[i]);}
  Delay_ms(200);

   UART2_Init(115200);
   Delay_ms(100);
   for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}//only GPGGA
  Delay_ms(200);
   IFS1.B14=0;
  U2STA.OERR=0;
  IPC7.B10=1;
  IPC7.B9=0;
  IPC7.B8=0;  //clear buffer overrun error or interrupt will never fire
  IEC1.B14=1;


}
void GPSinterrupt() iv IVT_ADDR_U2RXINTERRUPT  {
   unsigned char temp=0;//the over flow error must be cleared or the interrupt will not be fired. The FIFO buffer is 4 bytes in dsPIC33E
   IFS1.B14=0;
   temp=UART2_Read();
   if(temp==0x24){GPSDataPtr=0;GPSData[GPSDataPtr++]=temp;return;}
   GPSData[GPSDataPtr++]=temp;
   if(temp==0x2A){GPSpackageReady=1;if(samplingmode){processGPS();}}
  // LATA.B1=~LATA.B1;
}
void processGPS(){
  unsigned char tempPtr=7;

  while(GPSData[tempPtr]!=','){tempPtr++;}
  tempPtr++;
  GPSLatitude=(GPSData[tempPtr]-48)*10+(GPSData[tempPtr+1]-48)+
  (
  (GPSData[tempPtr+2]-48)*10+(GPSData[tempPtr+3]-48)+
  (GPSData[tempPtr+5]-48)*0.1+
  (GPSData[tempPtr+6]-48)*0.01+
  (GPSData[tempPtr+7]-48)*0.001+
  (GPSData[tempPtr+8]-48)*0.0001
  )/60;
  tempPtr+=10;
  if(GPSData[tempPtr]=='S'){GPSLatitude=-GPSLatitude;}
  tempPtr+=2;
  //tempPtr=30;
  GPSLongitude=(GPSData[tempPtr]-48)*100+(GPSData[tempPtr+1]-48)*10+(GPSData[tempPtr+2]-48)+
  (
  (GPSData[tempPtr+3]-48)*10+
  (GPSData[tempPtr+4]-48)+
  (GPSData[tempPtr+6]-48)*0.1+
  (GPSData[tempPtr+7]-48)*0.01+
  (GPSData[tempPtr+8]-48)*0.001+
  (GPSData[tempPtr+9]-48)*0.0001
  )/60;
  tempPtr+=11;
  if(GPSData[tempPtr]=='W'){GPSLongitude=-GPSLongitude;}
}

unsigned char* processGPSString(){ //returns proccessed package
    unsigned char ProcessedGPSString[70]; //must set enough length

    sprintf(tempLongitudeString,"%.7f", GPSLongitude);
    sprintf(tempLatitudeString,"%.7f", GPSLatitude);
    ProcessedGPSString[0]=GPSData[7]; //hour
    ProcessedGPSString[1]=GPSData[8];
    ProcessedGPSString[2]=0x3A;
    ProcessedGPSString[3]=GPSData[9]; //minute
    ProcessedGPSString[4]=GPSData[10];
    ProcessedGPSString[5]=0x3A;
    ProcessedGPSString[6]=GPSData[11];//second
    ProcessedGPSString[7]=GPSData[12];
    ProcessedGPSString[8]=0x00;
  

    strcat(ProcessedGPSString," *" );
    strcat(ProcessedGPSString,Ltrim(tempLatitudeString) );
    strcat(ProcessedGPSString,"," );
    strcat(ProcessedGPSString,Ltrim(tempLongitudeString) );

    packageSize=strlen(ProcessedGPSString)+1;
    ProcessedGPSString[34]=0x00;
    memcpy(GPSString,ProcessedGPSString,35);
    
    return ProcessedGPSString;
}

void logGPSToSD(){
     short GPSfile;short log;
     short error;
     unsigned char errorString[6];
     unsigned char ProcessedGPSString[60];
     unsigned char num[6];
     unsigned int i=0;
     unsigned int comma=0;


     for(i=0;i<80;i++){
         if(GPSData[i]==','){
            comma++;
         }
         if(comma==10){break;}
     }

        memcpy(ProcessedGPSString,&GPSData[7],i-7);
        ProcessedGPSString[i-7]=0x00;

       if(oldPicNum!=PicnumIncrementor){
         strcat(ProcessedGPSString,",DSLR");
         oldPicNum=PicnumIncrementor;
       }
        GPSfile=FAT32_Open("GPS1.txt",0x04);


        if(FAT32_Write(GPSfile, ProcessedGPSString, Strlen(ProcessedGPSString))==-1){

                error = FAT32_GetError();
               ShortToStr(error,errorString);
               log=FAT32_Open("log", 0x04);
               FAT32_Write(log, errorString, strlen(errorString));
               FAT32_Close(log);
               while(1){
                    LedIndicator();
               }

        }
        FAT32_Write(GPSfile, "\r\n",2);
       FAT32_Close(GPSfile);


}
void initAll(){
   PLLFBD = 68;            // PLL multiplier M=70
   CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2
   ANSELA = 0x00;          // Convert all I/O pins to digital
   ANSELB = 0x00;

   mappins();
   initSPI2CommunicationTOMaster();
   InitSD();
   initGPS();
  // InitCamera();
   InitTimer1();
}


void main() {//GPS logging is working but cam hasn't been tested yet, nor is the communication line
   short log;
   short error;
   unsigned char errorString[6];
   unsigned int i=0;
   initAll();
   
   LATA.B1=1;//LED
   
     for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}//only GPGGA
  // Delay_ms(200);
   
   while(!GPSpackageReady);
   //processGPS();
   processGPSString();
   SPI2BUF=GPSString[0];
   GPStoMasterPtr=1;

   LATA.B1=0;
   while(1){
       while(samplingmode){
          if(GPSpackageReady){
           LATA.B1=1;
           GPSpackageReady=0;
           processGPSString();
           LATA.B1=0;
         // log=FAT32_Open("GPSlog", 0x04);
         //  IntToStr(packageSize,errorString);
          //  FAT32_Write(log,GPSString, strlen(GPSString));
           // FAT32_Write(log, "\r\n",2);
           //FAT32_Close(log);
           Delay_ms(300);

          }
       }
       while(loggingmode){
           if(newDir){
               FAT32_ChangeDir("\\");//create a new folder
               Ltrim(nameReceived);
               Rtrim(nameReceived);
               if(FAT32_MakeDir(nameReceived)==-1){
                 error = FAT32_GetError();
                 ShortToStr(error,errorString);
                 log=FAT32_Open("log", 0x04);
                 FAT32_Write(log, errorString, strlen(errorString));
                 FAT32_Close(log);
                 while(1){
                  LATA.B1=1;Delay_ms(100);LATA.B1=0;Delay_ms(100);
                 }
               }
               FAT32_Changedir(nameReceived);
               newDir=0;
           }
           if(GPSpackageReady){

           handshake=0;
           LATA.B1=1;
           LogGPSToSD();GPSpackageReady=0;

           handshake=1;
           LATA.B1=0;
           }
           
       }
       PicnumIncrementor=0;
       if(enableGPSOutput){
          enableGPSOutput=0;
         /*   for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}//only GPGGA
           IEC1.B14=0;
           U2STA.OERR=0;
           handshake=0;
           U2STA.OERR=0; */
          // Delay_ms(300);
           //GPSDataPtr=0;
       }
       if(disableGPSOutput){
         disableGPSOutput=0;
        /*   for(i=0;i<16;i++){UART2_Write(commandmssoff[i]);}//no output
          IEC1.B14=0;
          U2STA.OERR=0;
          Delay_ms(10);
          IEC1.B14=1;
          U2STA.OERR=0;
          GPSDataPtr=0; */
          PicnumIncrementor=0;
          oldPicNum=0;
       }



   }
}