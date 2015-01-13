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

volatile unsigned int dataReadyflag1=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag2=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag3=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag4=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag5=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag6=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag7=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag8=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag9=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag10=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag11=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag12=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag13=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag14=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag15=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag16=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag17=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag18=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag19=0;//if data from smp is ready for mmc
volatile unsigned int dataReadyflag20=0;//if data from smp is ready for mmc
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