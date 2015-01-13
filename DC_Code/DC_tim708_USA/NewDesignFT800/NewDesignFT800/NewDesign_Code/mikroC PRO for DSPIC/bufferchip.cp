#line 1 "C:/Users/tic27/Desktop/DC_tim618/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/bufferchip.c"
#line 1 "c:/users/tic27/desktop/dc_tim618/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/bufferchipheader.h"
sbit Mmc_Chip_Select at LATB6_bit;
sbit Mmc_Chip_Select_Direction at TRISB6_bit;

volatile unsigned char SDBuff[10420];
volatile unsigned int SDPTR=0;
unsigned char* SDBuffPTRS[]={&SDBuff[0],&SDBuff[512],&SDBuff[1024],&SDBuff[1536],
 &SDBuff[2048],&SDBuff[2560],&SDBuff[3072],&SDBuff[3584],
 &SDBuff[4096],&SDBuff[4608],&SDBuff[5120],&SDBuff[5632]
 ,&SDBuff[6144],&SDBuff[6656],&SDBuff[7168],&SDBuff[7680]
 ,&SDBuff[8192],&SDBuff[8704],&SDBuff[9216],&SDBuff[9728]};

volatile unsigned long Currentsect=0;
volatile unsigned long SwapstartSector=0;

volatile unsigned int dataReadyflag1=0;
volatile unsigned int dataReadyflag2=0;
volatile unsigned int dataReadyflag3=0;
volatile unsigned int dataReadyflag4=0;
volatile unsigned int dataReadyflag5=0;
volatile unsigned int dataReadyflag6=0;
volatile unsigned int dataReadyflag7=0;
volatile unsigned int dataReadyflag8=0;
volatile unsigned int dataReadyflag9=0;
volatile unsigned int dataReadyflag10=0;
volatile unsigned int dataReadyflag11=0;
volatile unsigned int dataReadyflag12=0;
volatile unsigned int dataReadyflag13=0;
volatile unsigned int dataReadyflag14=0;
volatile unsigned int dataReadyflag15=0;
volatile unsigned int dataReadyflag16=0;
volatile unsigned int dataReadyflag17=0;
volatile unsigned int dataReadyflag18=0;
volatile unsigned int dataReadyflag19=0;
volatile unsigned int dataReadyflag20=0;
unsigned int* dataReadyflags[]={&dataReadyflag1,&dataReadyflag2,&dataReadyflag3,&dataReadyflag4,
 &dataReadyflag5,&dataReadyflag6,&dataReadyflag7,&dataReadyflag8,
 &dataReadyflag9,&dataReadyflag10,&dataReadyflag11,&dataReadyflag12,
 &dataReadyflag13,&dataReadyflag14,&dataReadyflag15,&dataReadyflag16,
 &dataReadyflag17,&dataReadyflag18,&dataReadyflag19,&dataReadyflag20};


volatile unsigned int newFileflag=0;
volatile short fhandle;

volatile unsigned char newFileName[10];
volatile unsigned int newFileNamePtr=0;
volatile unsigned int nameStart=0;

volatile unsigned int stopLoggingFlag=0;
volatile short logtxt;
volatile short error;
volatile unsigned char errorString[5];

volatile unsigned int startListeningFlag=0;

volatile unsigned int roughnessFlag=0;
#line 2 "C:/Users/tic27/Desktop/DC_tim618/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/bufferchip.c"
void LEDIndicator(){
 LATA.B1=1;
 Delay_ms(1000);
 LATA.B1=0;
 Delay_ms(1000);
}

void mappins(){
 TRISB.B4=0;
 TRISA.B4=1;

 TRISB.B12=1;
 TRISB.B11=0;
 TRISB.B10=1;

 TRISA.B1 = 0;
 LATA.B1=1;

 PPS_Mapping(20,_INPUT,_U1RX);
 PPS_Mapping(36,_OUTPUT,_U1TX);

 PPS_Mapping(44,_INPUT,_SDI2IN);
 PPS_Mapping(43,_OUTPUT,_SDO2);
 PPS_Mapping(42,_INPUT,_SCK2IN);

}
void initSPICommunication(){
 SPI2_Init_Advanced(_SPI_SLAVE,
 _SPI_8_BIT,
 _SPI_PRESCALE_SEC_2,
 _SPI_PRESCALE_PRI_4,
 _SPI_SS_DISABLE,
 _SPI_DATA_SAMPLE_MIDDLE,
 _SPI_CLK_IDLE_LOW,
 _SPI_ACTIVE_2_IDLE);
 IFS2.B1=0;
 IPC8.B6=1;
 IPC8.B5=1;
 IPC8.B4=0;
 SPI2STAT.B4=0;
 SPI2STAT.B3=0;
 SPI2STAT.B2=1;
 IEC2.B1=1;

}
void Spiinterrupt() iv IVT_ADDR_SPI2INTERRUPT{
 unsigned tem;
 IFS2.B1=0;
 tem=SPI2BUF;


 if(startListeningFlag){

 SDbuff[SDPTR++]=tem;
 if(SDPTR<=5112){
 if(SDPTR<=2552){
 if(SDPTR==504){SDPTR=512;dataReadyflag1=1;}
 else if(SDPTR==1016){SDPTR=1024;dataReadyflag2=1;}
 else if(SDPTR==1528){SDPTR=1536;dataReadyflag3=1;}
 else if(SDPTR==2040){SDPTR=2048;dataReadyflag4=1;}
 else if(SDPTR==2552){SDPTR=2560;dataReadyflag5=1;}

 }
 else{
 if(SDPTR==3064){SDPTR=3072;dataReadyflag6=1;}
 else if(SDPTR==3576){SDPTR=3584;dataReadyflag7=1;}
 else if(SDPTR==4088){SDPTR=4096;dataReadyflag8=1;}
 else if(SDPTR==4600){SDPTR=4608;dataReadyflag9=1;}
 else if(SDPTR==5112){SDPTR=5120;dataReadyflag10=1;}
 }

 }
 else{
 if(SDPTR<=7672){
 if(SDPTR==5624){SDPTR=5632;dataReadyflag11=1;}
 else if(SDPTR==6136){SDPTR=6144;dataReadyflag12=1;}
 else if(SDPTR==6648){SDPTR=6656;dataReadyflag13=1;}
 else if(SDPTR==7160){SDPTR=7168;dataReadyflag14=1;}
 else if(SDPTR==7672){SDPTR=7680;dataReadyflag15=1;}
 }
 else{
 if(SDPTR==8184){SDPTR=8192;dataReadyflag16=1;}
 else if(SDPTR==8696){SDPTR=8704;dataReadyflag17=1;}
 else if(SDPTR==9208){SDPTR=9216;dataReadyflag18=1;}
 else if(SDPTR==9720){SDPTR=9728;dataReadyflag19=1;}
 else if(SDPTR==10232){SDPTR=0;dataReadyflag20=1;}
 }

 }
#line 103 "C:/Users/tic27/Desktop/DC_tim618/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/bufferchip.c"
 }

}
void initUARTCommunication(){
 UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
 Delay_ms(200);
 IFS0.B11=0;
 U1STA.OERR=0;
 IPC2.B14=1;
 IPC2.B13=0;
 IPC2.B12=0;
 IEC0.B11=1;
}
void U1interrupt() iv IVT_ADDR_U1RXINTERRUPT{
 unsigned char temp;
 IFS0.B11=0;
 temp=U1RXREG;

 if(nameStart){
 newFileName[newFileNamePtr++]=temp;
 if(temp==0x00){
 newfileFlag=1;
 newFileNamePtr=0;
 nameStart=0;
 }
 if(newFileNamePtr==10){newFileNamePtr=0;}
 }
 else
 {
 if(temp==0xF3){
 nameStart=1;
 }
 else if(temp==0xE2){
 stopLoggingFlag=1;
 }
 else if(temp==0xD3){
 startListeningFlag=1;
 SDPTR=0;
 }
 else if(temp==0xC1){
 roughnessFlag=1;
 }
 else if(temp==0xC2){
 roughnessFlag=2;
 }
 else if(temp==0xC3){
 roughnessFlag=3;
 }
 else if(temp==0xC4){
 roughnessFlag=4;
 }

 }


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

 for(i=0;i<10420;i++){SDBuff[i]=0x00;}
 SPI_Set_Active(SPI1_Read, SPI1_Write);

}
void initAll(){
 PLLFBD = 68;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 mappins();
 Delay_ms(500);
 initUARTCommunication();
 initSPICommunication();

 initSD();
}
void main() {
 unsigned int tempi=0;
 short log;
 unsigned char info[15];
 initAll();
 Delay_ms(500);
 fhandle = FAT32_Open("test",0x02);
 for(tempi=0;tempi<200;tempi++){
 FAT32_Write(fhandle,SDBuffPTRS[0],512);
 }
 tempi=0;
 FAT32_Close(fhandle);
 LATA.B1=0;


 while(1){
 if(newfileFlag){
 newfileFlag=0;
 LATA.B1=1;
#line 221 "C:/Users/tic27/Desktop/DC_tim618/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/bufferchip.c"
 fhandle = FAT32_Open(newFileName,0x04);
 if(fhandle == -1) {
 LATA.B1 = 1;
 while(1);
 }
#line 233 "C:/Users/tic27/Desktop/DC_tim618/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/bufferchip.c"
 SDPTR=0;
 dataReadyflag1=0;
 dataReadyflag2=0;
 LATA.B1=0;
 UART1_Write(0xE7);
 roughnessFlag=0;
 }

 for(tempi=0;tempi<20;tempi++){
 if(*dataReadyflags[tempi]){
 *dataReadyflags[tempi]=0;
 LATA.B1=~LATA.B1;
 switch (roughnessFlag){
 case 0:
 *((SDBuffPTRS[tempi])+504)=0x00;
 break;
 case 1:
 *((SDBuffPTRS[tempi])+504)=0x01;
 roughnessFlag=0;
 break;
 case 2:
 *((SDBuffPTRS[tempi])+504)=0x02;
 roughnessFlag=0;
 break;
 case 3:
 *((SDBuffPTRS[tempi])+504)=0x03;
 roughnessFlag=0;
 break;
 case 4:
 *((SDBuffPTRS[tempi])+504)=0x04;
 roughnessFlag=0;
 break;
 }
 if(FAT32_Write(fhandle,SDBuffPTRS[tempi],512) != 0) {
 LATA.B1=1;
 while(1);
 }

 }
 }

 if(stopLoggingFlag){
 UART1_Write(0xF3);
 Delay_ms(100);
 for(tempi=0;tempi<512;tempi++){
 SDbuff[tempi]=0x00;
 }

 if(FAT32_Write(fhandle,SDBuff,512) != 0) {
 LATA.B1=1;
 while(1);
 }
 FAT32_Close(fhandle);
 LATA.B1=0;
 UART1_Write(0xA9);

 SDPTR=0;
 dataReadyflag1=0;
 dataReadyflag2=0;
 stopLoggingFlag=0;
 startListeningFlag=0;


 }
 }

}
