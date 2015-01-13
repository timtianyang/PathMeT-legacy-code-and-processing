#include "bufferchipHeader.h"
void LEDIndicator(){
    LATA.B1=1;
    Delay_ms(1000);
    LATA.B1=0;
    Delay_ms(1000);
}

void mappins(){
	//U1Tx ---> U1Rx smp chip
	//U1Rx ---> U1Tx smp chip
	//SPI2 ---> SPI2 smp chip
	//SPI1 ---> SD card
	//A1   ---> LED
     TRISB.B4=0;//U1TX
     TRISA.B4=1;//U1RX
     
     TRISB.B12=1;//SDI2
     TRISB.B11=0;//SDO2
     TRISB.B10=1;//SCK2IN
     
     TRISA.B1 = 0; //LED
     LATA.B1=1;
     
     PPS_Mapping(20,_INPUT,_U1RX);
     PPS_Mapping(36,_OUTPUT,_U1TX);
     
     PPS_Mapping(44,_INPUT,_SDI2IN);
     PPS_Mapping(43,_OUTPUT,_SDO2);
     PPS_Mapping(42,_INPUT,_SCK2IN);

}
void initSPICommunication(){//SPI2 to smp
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
void Spiinterrupt() iv IVT_ADDR_SPI2INTERRUPT{//(4laz4enc3t)*8+10
  unsigned tem;
  IFS2.B1=0;
  tem=SPI2BUF;

  //LEDIndicator();
  if(startListeningFlag){
    // LATA.B1=~LATA.B1;
     SDbuff[SDPTR++]=tem;
     if(SDPTR<=5112){
           if(SDPTR<=2552){
               if(SDPTR==504){SDPTR=512;dataReadyflag1=1;}  //load to ten buffers
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
    // if(SDPTR==5630){SDPTR=5632;dataReadyflag11=1;}
  //   if(SDPTR==5630){SDPTR=0;dataReadyflag11=1;}
   //  if(SDPTR==6142){SDPTR=6144;dataReadyflag12=1;}
    // if(SDPTR==6654){SDPTR=6656;dataReadyflag13=1;}
    // if(SDPTR==7166){SDPTR=7168;dataReadyflag14=1;}
   // if(SDPTR==7166){SDPTR=0;dataReadyflag14=1;}
    // if(SDPTR==7678){SDPTR=7680;dataReadyflag15=1;}
   //  if(SDPTR==8190){SDPTR=8192;dataReadyflag16=1;}
    // if(SDPTR==8702){SDPTR=8704;dataReadyflag17=1;}
    // if(SDPTR==9214){SDPTR=9216;dataReadyflag18=1;}
     //if(SDPTR==9726){SDPTR=9728;dataReadyflag19=1;}
     //if(SDPTR==10238){SDPTR=0;dataReadyflag20=1;}
  }

}
void initUARTCommunication(){//UART1 to smp
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
      if(temp==0xF3){//nameStart
          nameStart=1;
      }
      else if(temp==0xE2){
          stopLoggingFlag=1;
      }
      else if(temp==0xD3){//start listening
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

     SPI1_Init_Advanced(_SPI_MASTER,     // Init SPI at higher speed
                       _SPI_8_BIT,
                       _SPI_PRESCALE_SEC_2,
                       _SPI_PRESCALE_PRI_1,
                       _SPI_SS_DISABLE,
                       _SPI_DATA_SAMPLE_END,
                       _SPI_CLK_IDLE_HIGH,
                       _SPI_ACTIVE_2_IDLE);

     for(i=0;i<10420;i++){SDBuff[i]=0x00;}//set entire buffer to 0xDD
     SPI_Set_Active(SPI1_Read, SPI1_Write);

}
void initAll(){
   PLLFBD = 68;            // PLL multiplier M=70
   CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2

   ANSELA = 0x00;          // Convert all I/O pins to digital
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
   fhandle = FAT32_Open("test",0x02);//write
   for(tempi=0;tempi<200;tempi++){
     FAT32_Write(fhandle,SDBuffPTRS[0],512);
   }
   tempi=0;
   FAT32_Close(fhandle);
   LATA.B1=0;
   
   // The loop which makes everything happen
   while(1){
      if(newfileFlag){
         newfileFlag=0;
         LATA.B1=1;
         /*if(FAT32_MakeSwap(newFileName,30760,&SwapstartSector)==-1){
            LATA.B1=1;
            while(1);
         }*/
         fhandle = FAT32_Open(newFileName,0x04);
         if(fhandle == -1) {  // 0x04 is append
           LATA.B1 = 1;
           while(1);
         }
         /*Currentsect=SwapstartSector;
         if(Currentsect==0){
            log=FAT32_Open("log", 0x04);
            LongWordToStr(Currentsect,info);
            FAT32_Write(log, "sect is zero", 13);
            FAT32_Close(log);
         }*/
         SDPTR=0;
         dataReadyflag1=0;
         dataReadyflag2=0;
         LATA.B1=0;
         UART1_Write(0xE7);//tell smp I am listening
         roughnessFlag=0;
      }
      
      for(tempi=0;tempi<20;tempi++){
         if(*dataReadyflags[tempi]){
              *dataReadyflags[tempi]=0;
              LATA.B1=~LATA.B1;
              switch (roughnessFlag){ //event trigger
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
             UART1_Write(0xF3);//tell smp done logging
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
             UART1_Write(0xA9);//tell smp I stopped listening and file is closed
             
             SDPTR=0;
             dataReadyflag1=0;
             dataReadyflag2=0;
             stopLoggingFlag=0;
             startListeningFlag=0;

           
      }
   }
   
}