sbit Mmc_Chip_Select at LATB6_bit;
sbit Mmc_Chip_Select_Direction at TRISB6_bit;


//camera commands
unsigned char setCameraBaud[]={0x56, 0x00, 0x24, 0x03, 0x01, 0x1C ,0x4C};//set camera at 57600
unsigned char setImageSize[]={0x56 ,0x00, 0x54 ,0x01 ,0x00};//set to 320*240
unsigned char takeAPic[]={0x56 , 0x00 , 0x36 , 0x01 , 0x00};
unsigned char readPicSize[]={ 0x56, 0x00, 0x34, 0x01, 0x00 };
unsigned char readPic[]={ 0x56, 0x00, 0x32, 0x0C, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x0A };
unsigned char reset[]={ 0x56, 0x00, 0x26, 0x00 };
unsigned char stop[]={ 0x56, 0x00, 0x36, 0x01, 0x03 };

volatile unsigned char tempCam1=0;
volatile unsigned char tempCam2=0;//used to see if it's the end of the pic
volatile unsigned int picSize=0;
unsigned char picStart=0;//see if the pic starts
volatile unsigned int EOF=0;
volatile unsigned int takePIC=0;
volatile unsigned int CameraBuffPointer=0;
volatile unsigned int picbufferfull1=0,picbufferfull2=0,picbufferfull3=0,picbufferfull4=0
                     ,picbufferfull5=0,picbufferfull6=0,picbufferfull7=0,picbufferfull8=0
                     ,picbufferfull9=0,picbufferfull10=0;// buffer full flag

volatile unsigned char CameraBuff[5120];


unsigned char* buffersPtrs[]={&CameraBuff,&CameraBuff[512],&CameraBuff[1024],&CameraBuff[1536],
                              &CameraBuff[2048],&CameraBuff[2560],&CameraBuff[3072],&CameraBuff[3584],
                              &CameraBuff[4096],&CameraBuff[4608]};
unsigned int* bufferFullFlags[]={&picbufferfull1,&picbufferfull2,&picbufferfull3,&picbufferfull4
                              ,&picbufferfull5,&picbufferfull6,&picbufferfull7,&picbufferfull8
                              ,&picbufferfull9,&picbufferfull10};

volatile unsigned char bufferLastFullSector;
//SD card
unsigned long SDstartSector;
unsigned long SDcurrentSector;

//GPS

volatile unsigned char GPSDelay=10;
volatile unsigned char GPSpackageReady=0;
volatile unsigned char GPSData[512];
volatile unsigned char GPSDataPtr=0;
unsigned char GPSintervalCounter=0;
unsigned char commandmsson[]= {0xA0,0xA1,0x00,0x09,0x08,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x0D,0x0A};
unsigned char commandmssoff[]={0xA0,0xA1,0x00,0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x0D,0x0A};
unsigned char GPSBaudcmd[]={0xA0,0xA1,0x00,0x04,0x05,0x00,0x05,0x00,0x00,0x0D,0x0A};
unsigned char GPSPowerModeNormal[]={0xA0,0xA1,0x00,0x03,0x0C,0x00,0x00,0x0C,0x0D,0x0A};
unsigned char GPSUpdataRate[]={0xA0,0xA1,0x00,0x03,0x0E,0x14,0x00,0x1A,0x0D,0x0A};              //20HZ
unsigned char GPSWAASEnable[]={0xA0,0xA1,0x00,0x03,0x37,0x01,0x00,0x36,0x0D,0x0A};
volatile unsigned int enableGPSOutput=0;
volatile unsigned int disableGPSOutput=0;
//{0xA0,0xA1,0x00,0x09,0x08,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0B,0x0D,0x0A};
//{0xA0,0xA1,0x00,0x09,0x08,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x0D,0x0A};

//unsigned char sendGPSProcessedPackage=0x03;//this flag has three states. -1 no command received thus no action.
                                         //1 command received so it will send one package to Master
//unsigned int sendGPS=0;//flag  send GPS to master

unsigned int logGPS=0;

float GPSLatitude=0;
float GPSLongitude=0;
unsigned char GPSquality=0;
unsigned char tempLatitudeString[15];
unsigned char tempLongitudeString[15];
static unsigned char tempHourString[7];
static unsigned char tempMinuteString[7];
static unsigned char tempSecondString[7];      //do not recreate local variables with the same name as global variables.
volatile unsigned int GPStoMasterPtr=0;
unsigned char* packageToSend;//package to master
unsigned char GPSString[70]="GPS is disabled lol";
volatile unsigned int GPSStartFlag=0;
volatile unsigned int packageSize=0;

volatile unsigned int PicnumIncrementor=0;
unsigned int oldPicNum=0;
//state flags:

volatile unsigned int loggingmode=0;
volatile unsigned int startName=0;
volatile unsigned int samplingmode=0;

//SPI file name
volatile unsigned char nameReceived[10];
volatile unsigned int nameReceivedPtr=7;

volatile unsigned int newDir=0;
volatile unsigned int handshake=0;
volatile int timerFlag=0;

void processGPS();
unsigned char* processGPSString();
void logGPSToSD();

short logg;