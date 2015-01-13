#include "NewDesign_objects.h"
#include "NewDesign_resources.h"

//--------------------- User code ---------------------//
#include "FandH.h"
void mapPins(){//42startlogging    53name  E4endofname
    TRISB.B12=1;//SDI2
    TRISB.B11=0;//SDO2
    TRISB.B10=0;//SCK2 remove all communications between the cam chip
    
    //TRISB.B10=0; //trigger for Cannon
    //LATB.B10=1;
    
    TRISB.B4=0;//U1TX
    TRISA.B4=1;//U1RX
    
    PPS_Mapping(44,_INPUT,_SDI2IN); //SPI2 to camera chip
    PPS_Mapping(43,_OUTPUT,_SDO2);
    PPS_Mapping(42,_OUTPUT,_SCK2OUT);
    
    PPS_Mapping(36,_OUTPUT,_U1TX);  //smp
    PPS_Mapping(20,_INPUT,_U1RX);


    
}
void initCommunication(){
    unsigned int i=0;
    //UART1_Init(115200);  //to sampling chip
    UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
    Delay_ms(150);
    IFS0.B11=0;
    U1STA.OERR=0;  //reset buffer
    IPC2.B14=1;
    IPC2.B13=0;
    IPC2.B12=0;

    IFS0.B11=0;
    IEC0.B11=1;//enable interrput
        //not enable interrupt
    Delay_ms(100);
   SPI2_Init_Advanced(_SPI_MASTER,//this has to be middle,low,2idle or it loses last bit
                       _SPI_8_BIT,
                       _SPI_PRESCALE_SEC_4,
                       _SPI_PRESCALE_PRI_16,
                       _SPI_SS_DISABLE,
                       _SPI_DATA_SAMPLE_MIDDLE,
                       _SPI_CLK_IDLE_LOW,
                       _SPI_ACTIVE_2_IDLE);
    SPI_Set_Active(SPI1_Read, SPI1_Write);
    for(i=0;i<30;i++){
         smpbuff[i]=0x00;
    }

}
void SPI2Interrupt() iv IVT_ADDR_SPI2INTERRUPT{
    unsigned char temp;
    IFS2.B1=0;
    temp=SPI2BUF;

    GPSdataReceived[GPSdataReceivedPtr++]=temp;
    if(temp==0x00){
       //GPSSize=GPSdataReceivedPtr;
       GPSdataReceivedPtr=0;

       return;
    }
   if(GPSdataReceivedPtr==37){GPSdataReceivedPtr=0;GPSdataReceived[37]=0x00;}


}
void smpInterrupt() iv IVT_ADDR_U1RXINTERRUPT{//UART1 from smp chip
    unsigned char temp1=0;
    static unsigned int count;
    IFS0.B11=0;
    temp1=U1RXREG;

    if(temp1==0xAA){
       count++;
       if(count==8){
         count=0;
         laserplotflag=0;
         Incplotflag=0;
         handshakeBUF=1;
         return;
       }
    }
    else{
       count=0;
       handshakeBUF=0;
    }



    if(smpflag){//in sampling mode-----4laz-4enc-4pitch-4roll-6acc
      smpbuff[smpbuffIterator++]=temp1;
      if(smpbuffIterator==22){
        smpbuffIterator=0;
        smpbuffReady=1;
      }
    }
    if(loggingflag){//in logging mode-----4laz-4pitch-4roll-3t-4enc
      smpbuff[smpbuffIterator++]=temp1;
      if(smpbuffIterator==19){
        smpbuffIterator=0;
        //pitch=CalculateAngle(&smpbuff[4]);
        //roll= CalculateAngle(&smpbuff[8]);
        speed=CalculateSpeed(&smpbuff[12],&smpbuff[15]);
        smpbuffReady=1;
      }
    
    }


}
unsigned long calculateRQEI(unsigned char *buff){
    unsigned long result;
    unsigned long d;
    unsigned long c;
    unsigned int b;
    d=*buff;
    d=d<<24;
    c=*(buff+1);
    c=c<<16;
    b=*(buff+2);
    b=b<<8;
    d=d|c|b|(*(buff+3));
    return d;

}
float calculateLaz(unsigned char *buff){//for old lazer
         return (((*(buff+2))<<8)|(*(buff+3)))*0.00012f+7f;
         //we need to double check data sheet
}

float CalculateAngle(unsigned char *angleBuff){
   static unsigned long a;
   static unsigned long b;
   static unsigned int c;
   a=angleBuff[0];
   b=angleBuff[1];
   c=angleBuff[2];
    //   if((incxy[5]^incxy[6]^incxy[7]^incxy[8])!=incxy[9]){return;}
   if(a!=0xff){
   return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3]))/1000.0);
   }
   else{return (((a<<24)|(b<<16)|(c<<8)|(angleBuff[3])-0xffffffff))/1000.0;}
}
float CalculateAcc(unsigned char *accBuff){
     int temp;
     temp=accBuff[0];
     temp=temp<<8;
     temp=temp|accBuff[1];
     return  temp*0.0078;
}

unsigned long calculateTime(unsigned char *tBuff){
      return  (((unsigned long)tBuff[0])<<16)|(tBuff[1]<<8)|(tBuff[2]);
}

float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff){//M/S
      float speedtemp=0;
      newPos=calculateRQEI(encBuff);
      newT=calculateTime(tBuff);
      speedtemp=(newPos-oldPos)*0.0283*0.0254;  //distance traveled in meters
      speedtemp=speedtemp/((newT-oldT)/1000.0);
      oldT=newT;
      oldPos=newPos;
      speedCounter++;
      averageSpeed+=speedtemp;
      return speedtemp;
}
void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf){//prepare plotting routine
      int i=0;

      lines[0]->First_Point_X=Xbase;
      lines[0]->Second_Point_X=Xbase+lineResolution;
      lines[0]->First_Point_Y=Ybase;
      lines[0]->Second_Point_Y=Ybase;

      lines[0]->visible=1;
      for(i=1;i<numberOfLines;i++){ //make a flat line
          lines[i]->First_Point_X=lines[i-1]->Second_Point_X;
          lines[i]->First_Point_Y=lines[i-1]->Second_Point_Y;
          lines[i]->Second_Point_X=lines[i]->First_Point_X+lineResolution;
          lines[i]->Second_Point_Y=lines[i]->First_Point_Y;
          lines[i]->visible=1;
      }
      *pf=1;//set the plotflag and get ready to plot
      DrawScreen(&ProfilingScreen);
}
void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines){//shifts plots and adds a new line
     int i=0;
     if(*pf){
        for(i=0;i<numberOfLines-1;i++){ //shift all lines except the last line
            lines[i]->First_Point_Y=lines[i+1]->First_Point_Y;
            lines[i]->Second_Point_Y=lines[i+1]->Second_Point_Y;
        }
           lines[numberOfLines-1]->First_Point_Y=lines[numberOfLines-2]->Second_Point_Y;
           lines[numberOfLines-1]->Second_Point_Y=Ybase+newData;  //new data plot
     }
}
void sendCommandToCamChip(unsigned char* name,unsigned char size){
    // unsigned char d[]={0x53,0x31,0x32,0x33,0x34,0x00,0xE4,0x43};//set name and start logging
     unsigned int i=0;
     
     //SPI2_Read(0x00);
     SPI2BUF=(0x53);
     //while()
     
     Delay_us(100);
     for(i=0;i<size;i++){
       SPI2BUF=(name[i]);
       Delay_us(100);
     }
     SPI2BUF=(0xE4);//end of name
     Delay_us(100);
     SPI2BUF=0x3B;//enable GPS output
     Delay_ms(100);
     SPI2BUF=(0x43);//start logging mode
     Delay_ms(100);
     
}
void sendNameToSamChip(unsigned char* name,unsigned char size){
     unsigned int i=0;
     UART1_Write(0xE3);//start of name
     for(i=0;i<size;i++){
        UART1_Write(name[i]);
     }
     UART1_Write(0xB5);//end of name
}

void checkFileName(){
    if(strcmp(EveButtonFNfilename_Caption,oldname)==0){
          EveButtonFNConfirm.Active=0;
          EveButtonFNConfirm.Color=0xAD55;
      }
    else{
          EveButtonFNConfirm.Active=1;
          EveButtonFNConfirm.Color=0x3666;
    }
}



//----------------- End of User code ------------------//

// Event Handlers

     


void EveButtonSmpStartSamplingOnClick() {
    unsigned int i=0;
    unsigned int b=0;
    unsigned char temp[3];
    unsigned char te;
    
    smpbuffIterator=0;
    smpbuffReady=0;
    EveButtonSmpConfigureMotor.color=0xAD55;
    EveButtonSmpConfigureMotor.active=0;

   // EveTextLaserSmp_Caption
    EveButtonSmpStartSampling.visible=0;
    EveButtonSmpStartSampling.Active=0;
    EveButtonSmpStopSampling.visible=1;
    EveButtonSmpStopSampling.Active=1;
    DrawScreen(&SamplingScreen);

    smpflag=1;
   SPI2STAT.B4=0;//set interrupt mode
    SPI2STAT.B3=0;
    SPI2STAT.B2=1;
    IFS2.B1=0;
    IPC8.B6=1;
    IPC8.B5=0;
    IPC8.B4=0;
    IEC2.B1=1;//enable interrupt

     SPI2BUF=0x3B;//tell camchip to enale GPS output
     Delay_ms(100);
     SPI2BUF=0x31;//tell CamChip to load buffer
     Delay_ms(100);

    UART1_Write(0x31);
    Delay_ms(100);
    GPSdataReceivedPtr=0;
    while(smpflag){


        for(b=0;b<33;b++){
           SPI2BUF=0x31;//continuously ask for a byte and GPS will be updated automatically
           Delay_ms(1);
        }
        SPI2BUF=0x32;//tell camchip reset GPS output buffptr
        GPSdataReceivedPtr=0;
        
        ProcessVTFTStack();
        Delay_ms(50);
        
        GPSdataReceived[33]=0x00;
        
        if(smpbuffReady){
           smpbuffReady=0;
            //ByteToHex(smpbuff[4],EveTextLaserSmp.Caption);
           // ByteToHex(smpbuff[5], EveTextEncoderSamp.Caption);
            //ByteToHex(smpbuff[6], EveTextPitchSmp.Caption);
           // ByteToHex(smpbuff[7], EveTextRollSmp.Caption);
           sprintf(EveTextLaserSmp.Caption, "%.4f", calculateLaz(&smpbuff));
           sprintf(EveTextEncoderSamp.Caption, "%+ld",calculateRQEI(&smpbuff[4]));
           sprintf(EveTextPitchSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[8]));
           sprintf(EveTextRollSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[12]));


            //GPSdataReceived[GPSSize]=0x00;
            EveTextGPSSmp.Caption=GPSdataReceived+1;
            //if(strlen(GPSdataReceived[0]!=0x31)){while(1);}
            sprintf(EveTextAccx_Caption, "%+.2f", CalculateAcc(&smpbuff[16]));
            sprintf(EveTextAccy_Caption, "%+.2f", CalculateAcc(&smpbuff[18]));
            sprintf(EveTextAccz_Caption, "%+.2f", CalculateAcc(&smpbuff[20]));

            UART1_Write(0x31);//continous request
            DrawScreen(&SamplingScreen);
        }


    }
    EveButtonSmpStartSampling.visible=1;
    EveButtonSmpStartSampling.Active=1;
    EveButtonSmpStopSampling.visible=0;
    EveButtonSmpStopSampling.Active=0;

    SPI2BUF=0x22;  //tell came chip to stop sending GPS packets
    

    EveButtonSmpConfigureMotor.color=0xA865;
    EveButtonSmpConfigureMotor.active=1;
    DrawScreen(&SamplingScreen);
    SPI2BUF=0x2F;//tell camchip to disable GPS output
    Delay_ms(500);
    IEC2.B1=0;//disable SPI2 int
    GPSdataReceivedPtr=0;
    smpbuffIterator=0;//reset ptr after sampling mode is finished
    smpbuffReady=0;//reset buffer ready flag
}

void EveButtonSmpStopSamplingOnClick() {
    smpbuffIterator=0;
    smpflag=0;

}

void EveButtonSplashInitOnClick() {
    int i=0;
    unsigned int pwm_period1;

    EveButtonSplashInit.visible=0;
    EveProgressBar1.visible=1;
    EveTextSplashScreenStatus.visible=1;
    
    mapPins();
    TRISB.B14=0;
    LATB.B14=0;
    initCommunication();


    for(i=0;i<100;i++){EveProgressBar1.value=i;DrawScreen(&SplashScreen);Delay_ms(200);}
    DrawScreen(&SamplingScreen);
}

void EveButtonSmpGotoProfOnClick() {
    EveButtonProfStartProfiling.Active=0;
    EveButtonProfStartProfiling.Color=0xAD55;
    //SPI2BUF=0x3B;//enable GPS output



    DrawScreen(&ProfilingScreen);
}

void EveButtonProfStartProfilingOnClick() {
    int crossslp;
    unsigned char temp=0;
    unsigned char* Emsg;
    
    strcpy(oldname,EveTextProfFileName_Caption);
    Delay_ms(200);
    smpflag=0;//not in samp mode
    smpbuffIterator=0;
    smpbuffReady=0;
    IEC2.B1=1; //Enable SPI2 Interrupt
    
    EveButtonProfStartProfiling.visible=0;
    EveButtonProfStartProfiling.Active=0;
    EveButtonProfStopProfiling.visible=1;
    EveButtonProfStopProfiling.Active=1;
    EveToggleProfMode.Active=0; //disable mode selection

    

    sendCommandToCamChip(EveButtonFNfilename.Caption,strlen(EveButtonFNfilename.Caption)+1);
    //SPI_Set_Active(SPI1_Read, SPI1_Write);
    DrawScreen(&ProfilingScreen);
    
    sendNameToSamChip(EveButtonFNfilename_Caption,strlen(EveButtonFNfilename_Caption)+1);
    
     

    

    
    Initplot(ProfilingScreen_Lines,25,34,80,8,&laserplotflag);
    //*Lines[],number of lines,x base, y base, line res, falg
  //  Initplot(ProfilingScreen_Lines+25,25,34,172,8,&incplotflag);
    loggingflag=1;//turn on logging mode
    if(profilingMode){UART1_Write(0x1C);}
    Delay_ms(1);
    UART1_Write(0xA2);//tell smp to start logging
    Delay_ms(500);
    SPI2BUF=0xAB;//tell cam chip trigger
    
    while(laserplotflag){
       if(smpbuffReady){
             smpbuffReady=0;
             laserMeasurement=CalculateLaz(&smpbuff);
             
             if(laserMeasurement>10){
                laserMeasurement=10;
             }
             else if(laserMeasurement<8){
                laserMeasurement=8;
             }
             if(Pitch>50||Pitch<-50){pitch=0;}
             if(Roll>50||Roll<-50){Roll=0;}
             if(Pitch>3){Pitch=3;}
             else if(Pitch<-3){Pitch=-3;}
             if(Roll>30){Roll=30;}
             else if(Roll<-30){Roll=-30;}
             
             addData((laserMeasurement-8)*50,&laserplotflag,24,ProfilingScreen_Lines,25);
          //   addData(Pitch*8.3,&incplotflag,177,ProfilingScreen_Lines+25,25);
             //data,flag,y base,*Lines[],number of lines
             crossslp=Roll+50;
             //EveGaugeProfCrossSlp.value=crossslp;
             EveGaugeProfSpeed.value=speed*50;
             
             if(speed>1.99){speed=2;}
             if(speed<0.3||speed>1.7){EveGaugeProfSpeed.Color= 0xC800;}
             else{EveGaugeProfSpeed.Color= 0x03DA;  }
           
             CurrentEnc=calculateRQEI(&smpbuff[15]);
             if((CurrentEnc-OldEnc)>=triggerDist){
                 SPI2BUF=0xAB;//tell GPS chip to toggle DSL trigger
                 OldEnc=CurrentEnc;
             }
             DrawScreen(&ProfilingScreen);
       }
       ProcessVTFTStack();
    }//jump out of loop when stop is pressed
    
     BoxProfWaitingForCam.visible=1;
     EveTextProfWaitingForCam.visible=1;
     EveButtonProfStartProfiling.visible=1;
     EveButtonProfStartProfiling.Active=1;
     EveButtonProfStopProfiling.visible=0;
     EveButtonProfStopProfiling.Active=0;
     EveToggleProfMode.Active=1;//re enable mode selection
     SPI2BUF=0x62;//Tell camChip to stop logging
     UART1_Write(0xB7);//tell smp to stop logging
     DrawScreen(&ProfilingScreen);
     

     Delay_ms(2000);
     SPI2BUF=0xFA;//ask camchip to load the status byte;
     Delay_ms(1);
     SPI2BUF=0x00;
     Delay_ms(1);
     temp=SPI2BUF;
     if(temp==0x1C){
         handshakeCAM=1;
     }
     else{
         handshakeCAM=0;
     }
     sprintf(EveTextSUdistance.Caption, "%.2f", calculateRQEI(&smpbuff[15])*wheelRadius*6.28318/cycle);
     sprintf(EveTextSUtime.Caption, "%.2f",calculateTime(&smpbuff[12])/1000.0);

     sprintf(EveTextSUAverageSpeed.Caption, "%.2f",averageSpeed/speedCounter);
     if(handshakeBUF && handshakeCAM){
       //sprintf(EveTextSUSpeed.Caption, "%c",temp);
       strncpy(EveTextSUSpeed.Caption,"Success",8);
      // = "Success";
       // EveTextSUSpeed.Caption="Success";
        EveTextSUSpeed.Font_Color=0x0640;
        
     }
     else{
        EveTextSUSpeed.Caption[0] = 0;
        //=;
       // EveTextSUSpeed.Caption[6]=0;
        //sprintf(EveTextSUSpeed.Caption, "%c",temp);
       // strcpy(EveTextSUSpeed.Caption, "Failed"); temp
        if(!handshakeBUF){
            strncat(EveTextSUSpeed.Caption,"Buffer",7);
            //EveTextSUSpeed.Caption=Emsg;
        }
        if(!handshakeCAM){
            if(!handshakeBUF)
            {
                strncat(EveTextSUSpeed.Caption," + Camera",10);
            }
            else
            {
                strncat(EveTextSUSpeed.Caption,"Camera",7);
            }
            //EveTextSUSpeed.Caption=Emsg;
            //EveTextSUSpeed.Caption=
        }
        strncat(EveTextSUSpeed.Caption," Failed",8);
        EveTextSUSpeed.Font_Color=0xC800;
     }
     EveTextSUFilename.Caption= EveButtonFNfilename.Caption;
     oldPos=0; //reset
     oldT=0;


     OldEnc=0;
     CurrentEnc=0;
     DrawScreen(&SummaryScreen);
     Delay_ms(1);
     handshakeCAM=0;
     handshakeBUF=0;
     loggingflag=0;//turn off logging mode
     SPI2BUF=0x2F;//disble GPS output
}

void EveButtonProfStopProfilingOnClick() {

    laserplotflag=0;
    Incplotflag=0;

}

void EveToggleProfModeOnClick() {
     profilingMode=EveToggleProfMode.state;

}


void EveButtonProfCreateFileOnClick() {
    EveButtonFNConfirm.Active=0;
    //UART1_Write(0xFC);          // Added 01212014 to level inclinometer by Ian McIntyre
    EveButtonFNConfirm.Color=0xAD55;
    DrawScreen(&SettingScreen);
}

void SettingScreenOnTagChange() {
    char i, tag = 0;
    if (FT800_Touch_GetTag(&tag))
       return;

    if (!(((tag>='0')&&(tag<='9'))||(tag=='_')|| ((tag >= 'a') && (tag <= 'z'))||((tag >= 'A') && (tag <= 'Z'))))
       return;

    i = strlen(EveButtonFNfilename_Caption);
    if (i >= 7) {
       return;
    }
    EveButtonFNfilename.Caption[i] = tag;
    EveButtonFNfilename.Caption[i+1] = 0;
    
    checkFileName();
    DrawScreen(&SettingScreen);
}

void EveButtonFNClearOnClick() {
     Strcpy(EveButtonFNfilename.Caption,"");
     EveButtonFNConfirm.Active=0;
     EveButtonFNConfirm.Color=0xAD55;
     DrawScreen(&SettingScreen);
}

void EveButtonFNBackspaceOnClick() {
      char i;
      i = strlen(EveButtonFNfilename_Caption);
      if(i==0){return;}
      EveButtonFNfilename.Caption[i-1] = 0;
      checkFileName();
      DrawScreen(&SettingScreen);
}

void EveButtonFNShiftOnClick() {
      static isShiftOn=0;
      if(isShiftOn){isShiftOn=0;EveButtonFNShift.Color=0x001F;}
      else{isShiftOn=1;EveButtonFNShift.Color=0xF800;}
      if(isShiftOn){
        EveKeys2.Caption="QWERTYUIOP";
        EveKeys3.Caption="ASDFGHJKL";
        EveKeys4.Caption="ZXCVBNM_";
        DrawScreen(&SettingScreen);
      }
      else{
        EveKeys2.Caption="qwertyuiop";
        EveKeys3.Caption="asdfghjkl";
        EveKeys4.Caption="zxcvbnm_";
        DrawScreen(&SettingScreen);
      }
}

void EveButtonFNGoBackOnClick() {
      DrawScreen(&ProfilingScreen);
}

void EveButtonSUNewRunOnClick() {
       BoxProfWaitingForCam.visible=0;
       EveTextProfWaitingForCam.visible=0;
       EveTextProfFileName.Caption="None";
       EveButtonProfStartProfiling.Color=0xAD55;
       EveButtonProfStartProfiling.Active=0;
       DrawScreen(&ProfilingScreen);
}

void EveButtonSUAboutOnClick() {
      BoxRound6.visible=1;
      EveText9.visible=1;
      EveText11.visible=1;
      EveText13.visible=1;
      EveText14.visible=1;
      EveText15.visible=1;
      EveText16.visible=1;
      EveText17.visible=1;
      EveButtonSUBack.visible=1;
      EveButtonSUBack.active=1;
      EveButtonSUNewRun.active=0;
      EveButtonSUHelp.active=0;
      EveButtonSUAbout.active=0;
      DrawScreen(&SummaryScreen);
  
}

void EveButtonSUHelpOnClick() {



}

void EveButtonFNConfirmOnClick() {
   EveTextProfFileName.Caption=EveButtonFNfilename_Caption;
   EveButtonProfStartProfiling.Color=0x3666;
   EveButtonProfStartProfiling.Active=1;
   DrawScreen(&ProfilingScreen);
}

void EveButtonSUBackOnClick() {
      BoxRound6.Visible=0;
      EveText9.visible=0;
      EveText11.visible=0;
      EveText13.visible=0;
      EveText14.visible=0;
      EveText15.visible=0;
      EveText16.visible=0;
      EveText17.visible=0;
      EveButtonSUBack.visible=0;
      EveButtonSUBack.active=0;
      EveButtonSUNewRun.active=1;
      EveButtonSUHelp.active=1;
      EveButtonSUAbout.active=1;
      DrawScreen(&SummaryScreen);
}

void EveButtonSmpConfigureMotorOnClick() {

      EveButtonsmpResetInc.Active=1;
      EveButtonsmpResetInc.visible=1;

      EveButtonSmpConfigureMotor.active=0;
      EveButtonSmpGotoProf.active=0;
      EveButtonSmpStopSampling.active=0;
      EveButtonSmpStartSampling.active=0;

      
      EveButtonSmpStopSampling.visible=0;
      EveButtonSmpStartSampling.visible=0;
      EveButtonSmpConfigureMotor.visible=0;
      EveButtonSmpGotoProf.visible=0;
      BoxRound8.visible=0;
      
      EveButtonsmpJogRear.active=1;
      EveButtonsmpJogFront.active=1;
      EveButtonsmpBack.active=1;
      
      EveButtonsmpJogRear.visible=1;
      EveButtonsmpJogFront.visible=1;
      EveButtonsmpBack.visible=1;
      BoxRound7.visible=1;
      DrawScreen(&SamplingScreen);
      
      
}

void EveButtonsmpJogRearOnPress() {
      UART1_Write(0x3E);
      Delay_ms(100);
      UART1_Write(0x3B);
}

void EveButtonsmpJogFrontOnPress() {
     UART1_Write(0x5D);
     Delay_ms(100);
     UART1_Write(0x3B);
}

void EveButtonsmpBackOnClick() {
     EveButtonsmpResetInc.Active=0;
      EveButtonsmpResetInc.visible=0;

     EveButtonSmpConfigureMotor.active=1;
      EveButtonSmpGotoProf.active=1;
      EveButtonSmpStopSampling.active=0;
      EveButtonSmpStartSampling.active=1;


      EveButtonSmpStopSampling.visible=0;
      EveButtonSmpStartSampling.visible=1;
      EveButtonSmpConfigureMotor.visible=1;
      EveButtonSmpGotoProf.visible=1;
      BoxRound8.visible=1;

     EveButtonsmpJogRear.active=0;
     EveButtonsmpJogFront.active=0;
     EveButtonsmpBack.active=0;
     
     EveButtonsmpJogRear.visible=0;
     EveButtonsmpJogFront.visible=0;
     EveButtonsmpBack.visible=0;
     BoxRound7.visible=0;
     DrawScreen(&SamplingScreen);
}

void EveButtonsmpResetIncOnClick() {
     UART1_Write(0xFC);//tell smp to reset zero ground plane for INC
}

void EveButtonProfRough1OnClick() {
     UART1_Write(0xC1); //tell smp rough1
}

void EveButtonProfRough2OnClick() {
     UART1_Write(0xC2); //tell smp rough2
}

void EveButtonProfRough3OnClick() {
     UART1_Write(0xC3); //tell smp rough3
}

void EveButtonProfRough4OnClick() {
     UART1_Write(0xC4); //tell smp rough4
}