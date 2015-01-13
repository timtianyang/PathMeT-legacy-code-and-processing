
//static unsigned char* StringPtrs[]={"noon","tmr","Cost Center","soccer"} ;
//lazer:
unsigned char setBaud[]={ 0x00, 0x83, 0x84, 0x80, 0x80, 0x8C };//460800 badu rate
unsigned char setSampling[] ={ 0x00,0x83,0x89 ,0x80 ,0x80 ,0x80 ,0x00 ,0x83 ,0x88 ,0x80,0x82 ,0x83};
unsigned char accumulationtime[]=  { 0x00 ,0x83 ,0x8B ,0x80 ,0x80,0x80 ,0x00 ,0x83 ,0x8A ,0x80 ,0x88 ,0x8C};
volatile unsigned char Laz[4];
volatile unsigned char LazIterator=0;//counter for lazer interrupt to receive bytes;

//Inc:



//9DOF
volatile unsigned char DOFBuf[18];
volatile unsigned char DOFReadyBuf[18];
volatile unsigned char DofIterator=0;//counter for interrupt routine to receive bytes
//QEI
unsigned long REncPos=0;
unsigned long oldREncPos=0;
unsigned long IEncPos=0;
volatile unsigned int inchWormDoneFlag=0;
volatile unsigned int inchWormMode=0;
volatile unsigned int logFlagByDistance=1;

//time:
volatile unsigned long t=0;

//sampling flags:
volatile unsigned int smpOnceflag=0;//0:don't sample, 1:sample once
volatile unsigned int loggingFlag=0;
volatile unsigned int nameStart=0;

volatile unsigned char measurements=0;
volatile unsigned char sendtoBufferCount=0;
volatile unsigned char bufferlistening=0;



//acc
unsigned int accx=0;
unsigned int accy=0;
unsigned int accz=0;

//motor
unsigned int pwm_period1;
unsigned long inchwormcycle=2300;


void resetAll();
void moveWorm(unsigned int direction);
void stopWorm();