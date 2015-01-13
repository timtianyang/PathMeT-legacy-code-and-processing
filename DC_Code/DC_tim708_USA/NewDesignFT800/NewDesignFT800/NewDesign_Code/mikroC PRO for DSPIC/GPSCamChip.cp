#line 1 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/GPSCamChip.c"
#line 1 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/camfunctionheader.h"
sbit Mmc_Chip_Select at LATB6_bit;
sbit Mmc_Chip_Select_Direction at TRISB6_bit;



unsigned char setCameraBaud[]={0x56, 0x00, 0x24, 0x03, 0x01, 0x1C ,0x4C};
unsigned char setImageSize[]={0x56 ,0x00, 0x54 ,0x01 ,0x00};
unsigned char takeAPic[]={0x56 , 0x00 , 0x36 , 0x01 , 0x00};
unsigned char readPicSize[]={ 0x56, 0x00, 0x34, 0x01, 0x00 };
unsigned char readPic[]={ 0x56, 0x00, 0x32, 0x0C, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x0A };
unsigned char reset[]={ 0x56, 0x00, 0x26, 0x00 };
unsigned char stop[]={ 0x56, 0x00, 0x36, 0x01, 0x03 };

volatile unsigned char tempCam1=0;
volatile unsigned char tempCam2=0;
volatile unsigned int picSize=0;
unsigned char picStart=0;
volatile unsigned int EOF=0;
volatile unsigned int takePIC=0;
volatile unsigned int CameraBuffPointer=0;
volatile unsigned int picbufferfull1=0,picbufferfull2=0,picbufferfull3=0,picbufferfull4=0
 ,picbufferfull5=0,picbufferfull6=0,picbufferfull7=0,picbufferfull8=0
 ,picbufferfull9=0,picbufferfull10=0;

volatile unsigned char CameraBuff[5120];


unsigned char* buffersPtrs[]={&CameraBuff,&CameraBuff[512],&CameraBuff[1024],&CameraBuff[1536],
 &CameraBuff[2048],&CameraBuff[2560],&CameraBuff[3072],&CameraBuff[3584],
 &CameraBuff[4096],&CameraBuff[4608]};
unsigned int* bufferFullFlags[]={&picbufferfull1,&picbufferfull2,&picbufferfull3,&picbufferfull4
 ,&picbufferfull5,&picbufferfull6,&picbufferfull7,&picbufferfull8
 ,&picbufferfull9,&picbufferfull10};

volatile unsigned char bufferLastFullSector;

unsigned long SDstartSector;
unsigned long SDcurrentSector;



volatile unsigned char GPSDelay=10;
volatile unsigned char GPSpackageReady=0;
volatile unsigned char GPSData[512];
volatile unsigned char GPSDataPtr=0;
unsigned char GPSintervalCounter=0;
unsigned char commandmsson[]= {0xA0,0xA1,0x00,0x09,0x08,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x0D,0x0A};
unsigned char commandmssoff[]={0xA0,0xA1,0x00,0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x0D,0x0A};
unsigned char GPSBaudcmd[]={0xA0,0xA1,0x00,0x04,0x05,0x00,0x05,0x00,0x00,0x0D,0x0A};
unsigned char GPSPowerModeNormal[]={0xA0,0xA1,0x00,0x03,0x0C,0x00,0x00,0x0C,0x0D,0x0A};
unsigned char GPSUpdataRate[]={0xA0,0xA1,0x00,0x03,0x0E,0x14,0x00,0x1A,0x0D,0x0A};
unsigned char GPSWAASEnable[]={0xA0,0xA1,0x00,0x03,0x37,0x01,0x00,0x36,0x0D,0x0A};
volatile unsigned int enableGPSOutput=0;
volatile unsigned int disableGPSOutput=0;







unsigned int logGPS=0;

float GPSLatitude=0;
float GPSLongitude=0;
unsigned char GPSquality=0;
unsigned char tempLatitudeString[15];
unsigned char tempLongitudeString[15];
static unsigned char tempHourString[7];
static unsigned char tempMinuteString[7];
static unsigned char tempSecondString[7];
volatile unsigned int GPStoMasterPtr=0;
unsigned char* packageToSend;
unsigned char GPSString[70]="GPS is disabled lol";
volatile unsigned int GPSStartFlag=0;
volatile unsigned int packageSize=0;

volatile unsigned int PicnumIncrementor=0;
unsigned int oldPicNum=0;


volatile unsigned int loggingmode=0;
volatile unsigned int startName=0;
volatile unsigned int samplingmode=0;


volatile unsigned char nameReceived[10];
volatile unsigned int nameReceivedPtr=7;

volatile unsigned int newDir=0;
volatile unsigned int handshake=0;
volatile int timerFlag=0;

void processGPS();
unsigned char* processGPSString();
void logGPSToSD();

short logg;
#line 3 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/GPSCamChip.c"
void LEDIndicator(){
 LATA.B1=0;
 Delay_ms(1000);
 LATA.B1=1;
 Delay_ms(1000);
 LATA.B1=0;
}
void InitTimer1(){
 T1CON = 0x8030;
 T1IE_bit = 0;
 T1IF_bit = 0;
 IPC0 = IPC0 | 0x1000;
 PR1 = 54688;

}



void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
 T1IF_bit = 0;
 timerFlag++;
 if(timerFlag==5){
 LATB.B4=1;

 T1IE_bit = 0;
 timerFlag=0;
 }
}


void mappins(){
 TRISA.B1=0;
 LATA.B1=1;
 TRISB.B0=1;
 TRISB.B5=0;
 TRISB.B1=1;
 TRISA.B4=0;

 TRISB.B12=1;
 TRISB.B11=0;
 TRISB.B10=1;

 TRISB.B4=0;
 LATB.B4=1;
 PPS_Mapping(32,_INPUT,_U1RX);
 PPS_Mapping(37,_OUTPUT,_U1TX);
 PPS_Mapping(33,_INPUT,_U2RX);
 PPS_Mapping(20,_OUTPUT,_U2TX);

 PPS_Mapping(44,_INPUT,_SDI2IN);
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

 SPI1_Init_Advanced(_SPI_MASTER,
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
 SPI2STAT.SPIROV=0;
 temp=SPI2BUF;

 if(!startName){
 switch(temp){
 case 0x31:
 loggingmode=0;
 samplingmode=1;
 SPI2BUF=GPSString[GPSToMasterPtr++];

 break;
 case 0x32:
 GPSToMasterPtr=0;
 SPI2BUF=GPSString[GPSToMasterPtr++];
 break;
 case 0x22:
 samplingmode=0;
 GPStoMasterPtr=0;
 SPI2BUF=0x00;
 break;
 case 0x3B:
 enableGPSOutput=1;
 break;
 case 0x2F:
 disableGPSOutput=1;
 break;
 case 0x43:
 loggingmode=1;
 newDir=1;
 PicnumIncrementor=0;
 SPI2BUF=0x00;
 break;
 case 0x62:
 loggingmode=0;
 SPI2BUF=0x00;
 break;

 case 0xAB:



 TMR1 = 0;

 LATB.B4=0;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PicnumIncrementor++;
 break;
 case 0x53:
 startName=1;
 nameReceivedPtr=0;
 case 0xFA:
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
 if(temp==0xE4){
 startName=0;

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
 {
 tempCam2=UART1_Read();
 if(tempCam2==0xD9&&tempCam1==0xFF){
 CameraBuff[CameraBuffPointer++]=tempCam2;

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
#line 389 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/GPSCamChip.c"
void initGPS(){

 unsigned char i=0;

 for(i=0;i<90;i++){GPSData[i]=0x00;}
 LATA.B1=1;
 Delay_ms(100);
 LATA.B1=0;
 Delay_ms(100);
 LATA.B1=1;
 Delay_ms(100);
 LATA.B1=0;
 Delay_ms(100);
 LATA.B1=1;
 Delay_ms(100);
 LATA.B1=0;
 Delay_ms(100);
 LATA.B1=1;
 Delay_ms(100);

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
 for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}
 Delay_ms(200);
 IFS1.B14=0;
 U2STA.OERR=0;
 IPC7.B10=1;
 IPC7.B9=0;
 IPC7.B8=0;
 IEC1.B14=1;


}
void GPSinterrupt() iv IVT_ADDR_U2RXINTERRUPT {
 unsigned char temp=0;
 IFS1.B14=0;
 temp=UART2_Read();
 if(temp==0x24){GPSDataPtr=0;GPSData[GPSDataPtr++]=temp;return;}
 GPSData[GPSDataPtr++]=temp;
 if(temp==0x2A){GPSpackageReady=1;if(samplingmode){processGPS();}}

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

unsigned char* processGPSString(){
 unsigned char ProcessedGPSString[70];

 sprintf(tempLongitudeString,"%.7f", GPSLongitude);
 sprintf(tempLatitudeString,"%.7f", GPSLatitude);
 ProcessedGPSString[0]=GPSData[7];
 ProcessedGPSString[1]=GPSData[8];
 ProcessedGPSString[2]=0x3A;
 ProcessedGPSString[3]=GPSData[9];
 ProcessedGPSString[4]=GPSData[10];
 ProcessedGPSString[5]=0x3A;
 ProcessedGPSString[6]=GPSData[11];
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
 PLLFBD = 68;
 CLKDIV = 0x0000;
 ANSELA = 0x00;
 ANSELB = 0x00;

 mappins();
 initSPI2CommunicationTOMaster();
 InitSD();
 initGPS();

 InitTimer1();
}


void main() {
 short log;
 short error;
 unsigned char errorString[6];
 unsigned int i=0;
 initAll();

 LATA.B1=1;

 for(i=0;i<16;i++){UART2_Write(commandmsson[i]);}


 while(!GPSpackageReady);

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





 Delay_ms(300);

 }
 }
 while(loggingmode){
 if(newDir){
 FAT32_ChangeDir("\\");
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
#line 644 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/GPSCamChip.c"
 }
 if(disableGPSOutput){
 disableGPSOutput=0;
#line 654 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/GPSCamChip.c"
 PicnumIncrementor=0;
 oldPicNum=0;
 }



 }
}
