//This is the header file
//constants
int triggerDist=10387;  //10 feet
float wheelRadius=0.203;    //meters  used in summary distance
float cycle=4268.0;      //one rotation of wheel ticks  ticks/cycle   used in summary distance
//Function list:
void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf);
void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines);
float calculateLaz(unsigned char *buff);
//signed long CalculatePitch(unsigned char *angleBuff);
float CalculateAngle(unsigned char *angleBuff);
unsigned long calculateRQEI(unsigned char *buff);
float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff);


void initCommunication();
void mapPins();

//variables list:
unsigned long CurrentEnc=0;//for camera trigger
unsigned long OldEnc=0;
//flags
volatile unsigned  int laserplotflag=0;//update plots or not. used in button events
volatile unsigned  int Incplotflag=0;

volatile unsigned int smpflag=0;//sampling mode
volatile unsigned int loggingflag=0;
volatile unsigned int profilingMode=0;//0=Rolling,1=Inchworm
  
//smp receive buffer:

volatile float laserMeasurement=0;
volatile float speed=0;
volatile unsigned speedCounter=0;
volatile unsigned int averageSpeed=1;
volatile unsigned char smpbuff[30];
volatile unsigned int smpbuffReady=0;
volatile unsigned int smpbuffIterator=0;
volatile unsigned int handshakeBUF=0;
volatile unsigned int handshakeCAM=0;

volatile float Pitch=0;
volatile float roll=0;

volatile unsigned long oldPos=0;
volatile unsigned long oldT=0;
volatile unsigned long newPos=0;
volatile unsigned long newT=0;

//GPS data from GPS  chip
volatile unsigned char GPSpackage[90];
volatile unsigned int GPSSize=0;

//File name to CamCHIP
unsigned char foldername[9];
unsigned char oldname[11];
//GPSdata received from Camchip
volatile unsigned char GPSdataReceived[35];
volatile unsigned int GPSdataReceivedPtr=0;