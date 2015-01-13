#line 1 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/NewDesign_main.c"
#line 1 "c:/users/tic27/desktop/dc_tim708backuplazer/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/newdesign_objects.h"
#line 1 "c:/users/tic27/desktop/dc_tim708backuplazer/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/ft800_types.h"
#line 21 "c:/users/tic27/desktop/dc_tim708backuplazer/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/ft800_types.h"
typedef unsigned char uint8_ft8;
typedef signed char int8_ft8;
typedef unsigned int uint16_ft8;
typedef int int16_ft8;
typedef unsigned long uint32_ft8;
typedef long int32_ft8;
typedef unsigned long long uint64_ft8;
typedef long long int64_ft8;

typedef enum {cmdREAD, cmdWRITE} TCmd;

typedef enum {opNONE, opREAD, opWRITE} TOpr;

typedef enum {umNONE, umDL=1<<0, umCP=1<<1, umGRAM=1<<2} TUpdateMode;

typedef uint8_ft8 TFT800Alpha;
typedef uint8_ft8 TFT800Handle;

typedef struct
{
 int16_ft8 X;
 int16_ft8 Y;
} TFT800Point;

typedef struct
{
 int16_ft8 Left;
 int16_ft8 Top;
 uint16_ft8 Width;
 uint16_ft8 Height;
} TFT800Rect;

typedef union
{
 struct
 {
 uint8_ft8 B;
 uint8_ft8 G;
 uint8_ft8 R;
 };
 uint32_ft8 RGB;
} TFT800Color;

typedef struct
{
 TFT800Color Color;
 TFT800Alpha Alpha;
 uint8_ft8 Width;
} TFT800Pen;

typedef struct
{
 TFT800Color ColorBg;
 TFT800Color Color;


 TFT800Color ColorTo;
 uint8_ft8 Gradient;
 TFT800Alpha Alpha;
 uint8_ft8 Style;
} TFT800Brush;




typedef struct
{

 uint8_ft8 FontWidth[ 256 ];
 uint32_ft8 FontBitmapFormat;
 uint32_ft8 FontLineStride;
 uint32_ft8 FontWidthInPixels;
 uint32_ft8 FontHeightInPixels;
 uint32_ft8 PointerToFontGraphicsData;
} TFT800FontGraphics;

typedef struct
{
 TFT800FontGraphics GrData;
 uint16_ft8 FirstChar;
 uint16_ft8 LastChar;
} TFT800CharSetDsc;

typedef struct
{
 uint32_ft8 Name;
 uint32_ft8 Source;
 TFT800Color Color;
 TFT800Alpha Alpha;
 TFT800Handle Handle;
 TFT800CharSetDsc CharSetDsc;
} TFT800Font;

typedef struct
{
 uint8_ft8 Format;
 uint16_ft8 LineStride;
 uint16_ft8 Height;
} TFT800BmpLayout;

typedef struct
{
 uint8_ft8 FwFlags;
 uint16_ft8 Width;
 uint16_ft8 Height;
} TFT800BmpSize;

typedef struct
{
 uint32_ft8 Source;
 TFT800BmpLayout Layout;
 TFT800BmpSize Size;
} TFT800BmpConfig;

typedef struct
{
 TFT800BmpConfig Configs[16];
 uint8_ft8 Current;
} TFT800BmpHandle;

typedef struct
{
 TFT800BmpConfig Config;
 TFT800Color BlendColor;
 TFT800Alpha Alpha;
 TFT800Handle Handle;
} TFT800Bitmap;

typedef struct
{
 uint16_ft8 Hour;
 uint16_ft8 Min;
 uint16_ft8 Sec;
 uint16_ft8 mSec;
} TFT800Time;

typedef struct
{
 uint32_ft8 DrawingOptions;
 uint16_ft8 Val;
 uint16_ft8 Size;
 uint16_ft8 Range;
 uint16_ft8 Minor;
 uint16_ft8 Major;
 TFT800Time Time;
 uint8_ft8 Style;
} TFT800CoProcGraphics;

typedef struct
{
 TFT800Pen Pen;
 TFT800Brush Brush;
 TFT800Font Font;
 TFT800Bitmap Bitmap;

 TFT800Rect ClipRect;
 TFT800Point Cursor;

 uint8_ft8 Stencil;
 uint8_ft8 Tag;

 TFT800CoProcGraphics CPGraphics;
} TFT800Canvas;

typedef struct
{
 TOpr Opr;
 uint32_ft8 RWPtr;
} TFT800IO;


typedef struct
{

 uint32_ft8 Frequency;
 uint32_ft8 OutRenderMode;
 uint32_ft8 RenderReadScanLine;
 uint32_ft8 RenderWriteTrigger;

 uint32_ft8 hCycle;
 uint32_ft8 hOffset;
 uint32_ft8 hSize;
 uint32_ft8 hSync0;
 uint32_ft8 hSync1;

 uint32_ft8 vCycle;
 uint32_ft8 vOffset;
 uint32_ft8 vSize;
 uint32_ft8 vSync0;
 uint32_ft8 vSync1;

 uint32_ft8 Rotate180;
 uint32_ft8 OutBits;
 uint32_ft8 OutDither;
 uint32_ft8 OutSwizzle;
 uint32_ft8 OutCSpread;
 uint32_ft8 PClockPolarity;
 uint32_ft8 PClock;
} TFT800Display;

typedef struct
{
 uint32_ft8 TouchMode;
 uint32_ft8 TouchADCMode;
 uint32_ft8 TouchCharge;
 uint32_ft8 TouchSettle;
 uint32_ft8 TouchOversample;
 uint32_ft8 TouchRZThreshold;
} TFT800Touch;

typedef struct
{
 uint32_ft8 TransformA;
 uint32_ft8 TransformB;
 uint32_ft8 TransformC;
 uint32_ft8 TransformD;
 uint32_ft8 TransformE;
 uint32_ft8 TransformF;
} TFT800TouchTransform;

typedef struct
{
 uint8_ft8 Enable;
 uint8_ft8 Mask;
 uint8_ft8 Flags;
} TFT800Interrupt;

typedef struct
{
 uint8_ft8 Effect;
 uint8_ft8 Pitch;
 uint8_ft8 Volume;
 uint8_ft8 Play;
} TFT800Sound;

typedef struct
{
 uint32_ft8 StartAddress;
 uint32_ft8 Length;
 uint16_ft8 Frequency;
 uint8_ft8 Format;
 uint8_ft8 Loop;
 uint8_ft8 Volume;
 uint8_ft8 Play;
} TFT800Audio;

typedef struct
{

 uint16_ft8 Freq;
 uint8_ft8 Duty;
} TFT800PWM;

typedef struct
{
 uint8_ft8 GPIODIR;
 uint8_ft8 GPIO;
} TFT800GPIO;

typedef struct
{
 TFT800PWM *pPWMCfg;
 TFT800GPIO *pGPIOCfg;
 TFT800Audio *pAudioCfg;
 TFT800Sound *pSoundCfg;
 TFT800Touch *pTouchCfg;
 TFT800Display *pDisplayCfg;
 TFT800Interrupt *pInterruptCfg;
 TFT800TouchTransform *pTTransformCfg;
} TFT800Config;



typedef struct
{
 struct
 {




 TFT800Color Color;
 TFT800Alpha Alpha;

 uint8_ft8 Tag;

 TFT800Color ClearColor;
 TFT800Alpha ClearAlpha;
 uint8_ft8 ClearStencil;
 uint8_ft8 ClearTag;

 uint16_ft8 LineWidth;
 uint16_ft8 PointSize;

 uint16_ft8 ScissorLeft;
 uint16_ft8 ScissorTop;
 uint16_ft8 ScissorWidth;
 uint16_ft8 ScissorHeight;

 uint8_ft8 BmpHandle;
 uint8_ft8 Cell;

 struct
 {
 Color : 1;
 Alpha : 1;
 Tag : 1;
 ClearColor : 1;
 ClearAlpha : 1;
 ClearStencil : 1;
 ClearTag : 1;
 LineWidth : 1;
 PointSize : 1;
 ScissorPos : 1;
 ScissorSize : 1;
 BmpHandle : 1;
 Cell : 1;

 Unused : 32-13;

 } UpdateFlags;


 } Context;

 TFT800BmpConfig BmpHandleCfg[16];

 int8_ft8 CurrGrPrim;
} TFT800Graphics;

typedef struct
{
 TFT800IO IO;

 TFT800Sound Sound;

 TFT800Audio Audio;

 TFT800Graphics Graphics;

 struct
 { uint16_ft8 Width;
 uint16_ft8 Height;
 } Display;

 uint8_ft8 UpdateMode;

} TFT800Controller;
#line 6 "c:/users/tic27/desktop/dc_tim708backuplazer/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/newdesign_objects.h"
typedef enum {taNone, taLeft, taCenter, taRight, taCenterX, taCenterY, taRightX} TTextAlign;

typedef struct Screen TScreen;

typedef unsigned long TPointer;

typedef struct tagObjInfo {
 TPointer Obj;
 char Type;
 char Order;
 char Flags;

 char HitTag;
 int HitX;
 int HitY;
} TObjInfo;

typedef struct tagTouchStat {
 char Pressed;

 char Tag;
 int X;
 int Y;

 TObjInfo ActObjInfo;
} TTouchStat;

typedef void (*TDrawHandler)(TPointer aObj);

typedef void (*TEvtAction)();

typedef struct tagEvtSound {
 char SndAct;
 char Effect;
 char Pitch;
 char Volume;
} TEvtSound;

typedef const far struct tagCEvent {
 TEvtAction Action;
 TEvtSound Sound;
} TCEvent;

typedef struct tagEvent {
 TEvtAction Action;
 TEvtSound Sound;
} TEvent;

typedef const far struct tagCRect {
 int Left;
 int Top;
 int Width;
 int Height;
} TCRect;

typedef struct tagRect {
 int Left;
 int Top;
 int Width;
 int Height;
} TRect;

typedef struct tagBox {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Color;
 unsigned int Press_Color;
 unsigned int ColorTo;
 unsigned int Press_ColorTo;
 char Gradient;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TBox;

typedef far const code struct tagCBox {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Color;
 unsigned int Press_Color;
 unsigned int ColorTo;
 unsigned int Press_ColorTo;
 char Gradient;
 char Active;
 TCEvent *OnUp;
 TCEvent *OnDown;
 TCEvent *OnClick;
 TCEvent *OnPress;
} TCBox;

typedef struct tagBox_Round {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Color;
 unsigned int Press_Color;
 char Corner_Radius;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TBox_Round;

typedef far const code struct tagCBox_Round {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Color;
 unsigned int Press_Color;
 char Corner_Radius;
 char Active;
 TCEvent *OnUp;
 TCEvent *OnDown;
 TCEvent *OnClick;
 TCEvent *OnPress;
} TCBox_Round;

typedef struct tagLine {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int First_Point_X;
 int First_Point_Y;
 int Second_Point_X;
 int Second_Point_Y;
 char Pen_Width;
 unsigned int Pen_Color;
} TLine;

typedef struct tagEveGauge {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Color;
 unsigned int Press_Color;
 char Major;
 char Minor;
 unsigned int Value;
 unsigned int Range;
 char Flat;
 char NoBackground;
 char NoPointer;
 char TicksVisible;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TEveGauge;

typedef struct tagEveKeys {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 unsigned int Color;
 unsigned int Press_Color;
 unsigned int ColorTo;
 unsigned int Press_ColorTo;
 char *Caption;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 char Flat;
 char AutoSize;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TEveKeys;

typedef struct tagEveProgressBar {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 unsigned int Background_Color;
 unsigned int Color;
 unsigned int Value;
 unsigned int Range;
 char Flat;
} TEveProgressBar;

typedef struct tagEveToggle {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 unsigned int Background_Color;
 unsigned int Color;
 unsigned int Press_Color;
 char *StateOFF_Caption;
 char *StateON_Caption;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 unsigned int State;
 char Flat;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TEveToggle;

typedef struct tagEveButton {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 unsigned int Color;
 unsigned int Press_Color;
 unsigned int ColorTo;
 unsigned int Press_ColorTo;
 char *Caption;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 char Flat;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TEveButton;

typedef struct tagEveText {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char *Caption;
 TTextAlign TextAlign;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 char Active;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnClick;
 TEvent *OnPress;
} TEveText;

typedef far const code struct tagCEveText {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 far const code char *Caption;
 TTextAlign TextAlign;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 char Active;
 TCEvent *OnUp;
 TCEvent *OnDown;
 TCEvent *OnClick;
 TCEvent *OnPress;
} TCEveText;

typedef far const code struct tagCEveNumber {
 TScreen *OwnerScreen;
 char Order;
 char Visible;
 char Opacity;
 char Tag;
 int Left;
 int Top;
 int Width;
 int Height;
 char Text_Length;
 TTextAlign TextAlign;
 far const code char *FontName;
 unsigned int Font_Color;
 char FontHandle;
 long Source;
 signed long Value;
 unsigned char Signed;
 char Active;
 TCEvent *OnUp;
 TCEvent *OnDown;
 TCEvent *OnClick;
 TCEvent *OnPress;
} TCEveNumber;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned short ObjectsCount;
 unsigned short BoxesCount;
 TBox *far const code *Boxes;
 unsigned short CBoxesCount;
 TCBox *far const code *CBoxes;
 unsigned short Boxes_RoundCount;
 TBox_Round *far const code *Boxes_Round;
 unsigned short CBoxes_RoundCount;
 TCBox_Round *far const code *CBoxes_Round;
 unsigned short LinesCount;
 TLine *far const code *Lines;
 unsigned short EveGaugesCount;
 TEveGauge *far const code *EveGauges;
 unsigned short EveKeysCount;
 TEveKeys *far const code *EveKeys;
 unsigned short EveProgressBarsCount;
 TEveProgressBar *far const code *EveProgressBars;
 unsigned short EveTogglesCount;
 TEveToggle *far const code *EveToggles;
 unsigned short EveButtonsCount;
 TEveButton *far const code *EveButtons;
 unsigned short EveTextsCount;
 TEveText *far const code *EveTexts;
 unsigned short CEveTextsCount;
 TCEveText *far const code *CEveTexts;
 unsigned short CEveNumbersCount;
 TCEveNumber *far const code *CEveNumbers;
 unsigned long DynResStart;
 unsigned short Active;
 unsigned short SniffObjectEvents;
 TEvent *OnUp;
 TEvent *OnDown;
 TEvent *OnTagChange;
 TEvent *OnPress;
};




extern const VTFT_OT_BOX;
extern const VTFT_OT_CBOX;
extern const VTFT_OT_BOXROUND;
extern const VTFT_OT_CBOXROUND;
extern const VTFT_OT_LINE;
extern const VTFT_OT_EVEGAUGE;
extern const VTFT_OT_EVEKEYS;
extern const VTFT_OT_EVEPROGRESSBAR;
extern const VTFT_OT_EVETOGGLE;
extern const VTFT_OT_EVEBUTTON;
extern const VTFT_OT_EVETEXT;
extern const VTFT_OT_CEVETEXT;
extern const VTFT_OT_CEVENUMBER;




extern const VTFT_EVT_UP;
extern const VTFT_EVT_DOWN;
extern const VTFT_EVT_CLICK;
extern const VTFT_EVT_PRESS;




extern const VTFT_SNDACT_NONE;
extern const VTFT_SNDACT_PLAY;
extern const VTFT_SNDACT_STOP;




extern const VTFT_LOAD_RES_NONE;
extern const VTFT_LOAD_RES_STATIC;
extern const VTFT_LOAD_RES_DYNAMIC;
extern const VTFT_LOAD_RES_ALL;




extern const VTFT_DISPLAY_EFF_NONE;
extern const VTFT_DISPLAY_EFF_LIGHTS_FADE;
extern const VTFT_DISPLAY_EFF_LIGHTS_OFF;




extern const VTFT_INT_REPAINT_ON_DOWN;
extern const VTFT_INT_REPAINT_ON_UP;
extern const VTFT_INT_BRING_TO_FRONT;
extern const VTFT_INT_INTRINSIC_CLICK_EFF;




extern const TPointer DrawHandlerTable[44];



extern const TFT800PWM VTFT_FT800_CONFIG_PWM;
extern const TFT800GPIO VTFT_FT800_CONFIG_GPIO;
extern const TFT800Sound VTFT_FT800_CONFIG_SOUND;
extern const TFT800Audio VTFT_FT800_CONFIG_AUDIO;
extern const TFT800Display VTFT_FT800_CONFIG_DISPLAY;
extern const TFT800Interrupt VTFT_FT800_CONFIG_INTERRUPT;
extern const TFT800Touch VTFT_FT800_CONFIG_TOUCH;
extern const TFT800TouchTransform VTFT_FT800_CONFIG_TOUCHTRANSFORM;

extern TTouchStat TouchS;

extern TScreen SplashScreen;

extern TCEveText EveTextSplashScreenName;
extern TEveButton EveButtonSplashInit;
extern TEvent EveButtonSplashInit_OnClick;
extern TEveText EveTextSplashScreenStatus;
extern TEveProgressBar EveProgressBar1;

extern TEveProgressBar *far const code SplashScreen_EveProgressBars[1];
extern TEveButton *far const code SplashScreen_EveButtons[1];
extern TEveText *far const code SplashScreen_EveTexts[1];
extern TCEveText *far const code SplashScreen_CEveTexts[1];

extern TScreen SamplingScreen;

extern TCBox_Round BoxRoundsmpScn1;
extern TCEveText EveTextSampScnLabel1;
extern TCEveText EveTextsampscnlabel2;
extern TCEveText EveTextsampscnlabel4;
extern TCEveText EveTextsampscnlabel3;
extern TCEveText EveTextsampscnlabel5;
extern TCEveText EveTextsampscnlabel6;
extern TCBox_Round BoxRoundSmpscn2;
extern TEveText EveTextEncoderSamp;
extern TEveText EveTextLaserSmp;
extern TEveText EveTextPitchSmp;
extern TEveText EveTextGPSSmp;
extern TEveText EveTextSDSmp;
extern TEveText EveTextRollSmp;
extern TEveText EveTextAccx;
extern TEveText EveTextAccy;
extern TEveText EveTextAccz;
extern TBox_Round BoxRound7;
extern TEveButton EveButtonsmpJogRear;
extern TEvent EveButtonsmpJogRear_OnPress;
extern TEveButton EveButtonsmpJogFront;
extern TEvent EveButtonsmpJogFront_OnPress;
extern TEveButton EveButtonsmpBack;
extern TEvent EveButtonsmpBack_OnClick;
extern TBox_Round BoxRound8;
extern TEveButton EveButtonSmpStartSampling;
extern TEvent EveButtonSmpStartSampling_OnClick;
extern TEveButton EveButtonSmpStopSampling;
extern TEvent EveButtonSmpStopSampling_OnClick;
extern TEveButton EveButtonSmpConfigureMotor;
extern TEvent EveButtonSmpConfigureMotor_OnClick;
extern TEveButton EveButtonSmpGotoProf;
extern TEvent EveButtonSmpGotoProf_OnClick;
extern TEveButton EveButtonsmpResetInc;
extern TEvent EveButtonsmpResetInc_OnClick;

extern TBox_Round *far const code SamplingScreen_Boxes_Round[2];
extern TCBox_Round *far const code SamplingScreen_CBoxes_Round[2];
extern TEveButton *far const code SamplingScreen_EveButtons[8];
extern TEveText *far const code SamplingScreen_EveTexts[9];
extern TCEveText *far const code SamplingScreen_CEveTexts[6];

extern TScreen ProfilingScreen;

extern TCBox Box1;
extern TCEveText EveTextProflabel1;
extern TCEveNumber EveNumber1;
extern TCEveNumber EveNumber2;
extern TCEveNumber EveNumber3;
extern TCBox_Round BoxRound1;
extern TEveGauge EveGaugeProfSpeed;
extern TCEveText EveTextProflabel4;
extern TEveToggle EveToggleProfMode;
extern TEvent EveToggleProfMode_OnClick;
extern TCEveText EveTextProflabel3;
extern TEveButton EveButtonProfStartProfiling;
extern TEvent EveButtonProfStartProfiling_OnClick;
extern TEveButton EveButtonProfStopProfiling;
extern TEvent EveButtonProfStopProfiling_OnClick;
extern TLine Line1;
extern TLine Line2;
extern TLine Line3;
extern TLine Line4;
extern TLine Line5;
extern TLine Line6;
extern TLine Line7;
extern TLine Line8;
extern TLine Line9;
extern TLine Line10;
extern TLine Line11;
extern TLine Line12;
extern TLine Line13;
extern TLine Line14;
extern TLine Line15;
extern TLine Line16;
extern TLine Line17;
extern TLine Line18;
extern TLine Line19;
extern TLine Line20;
extern TLine Line21;
extern TLine Line22;
extern TLine Line23;
extern TLine Line24;
extern TLine Line25;
extern TLine Line26;
extern TLine Line27;
extern TLine Line28;
extern TLine Line29;
extern TLine Line30;
extern TLine Line31;
extern TLine Line32;
extern TLine Line33;
extern TLine Line34;
extern TLine Line35;
extern TLine Line36;
extern TLine Line37;
extern TLine Line38;
extern TLine Line39;
extern TLine Line40;
extern TLine Line41;
extern TLine Line42;
extern TLine Line43;
extern TLine Line44;
extern TLine Line45;
extern TLine Line46;
extern TLine Line47;
extern TLine Line48;
extern TLine Line49;
extern TLine Line50;
extern TEveText EveText1;
extern TEveButton EveButtonProfCreateFile;
extern TEvent EveButtonProfCreateFile_OnClick;
extern TEveText EveTextProfFileName;
extern TCEveText EveText12;
extern TEveButton EveButtonProfRough1;
extern TEvent EveButtonProfRough1_OnClick;
extern TEveButton EveButtonProfRough2;
extern TEvent EveButtonProfRough2_OnClick;
extern TEveButton EveButtonProfRough3;
extern TEvent EveButtonProfRough3_OnClick;
extern TEveButton EveButtonProfRough4;
extern TEvent EveButtonProfRough4_OnClick;
extern TEveText EveText18;
extern TBox BoxProfWaitingForCam;
extern TEveText EveTextProfWaitingForCam;

extern TBox *far const code ProfilingScreen_Boxes[1];
extern TCBox *far const code ProfilingScreen_CBoxes[1];
extern TCBox_Round *far const code ProfilingScreen_CBoxes_Round[1];
extern TLine *far const code ProfilingScreen_Lines[50];
extern TEveGauge *far const code ProfilingScreen_EveGauges[1];
extern TEveToggle *far const code ProfilingScreen_EveToggles[1];
extern TEveButton *far const code ProfilingScreen_EveButtons[7];
extern TEveText *far const code ProfilingScreen_EveTexts[4];
extern TCEveText *far const code ProfilingScreen_CEveTexts[4];
extern TCEveNumber *far const code ProfilingScreen_CEveNumbers[3];

extern TScreen SettingScreen;
extern TEvent SettingScreen_OnTagChange;

extern TEveButton EveButtonFNfilename;
extern TCBox_Round BoxRound2;
extern TEveKeys EveKeys1;
extern TEveKeys EveKeys2;
extern TEveKeys EveKeys3;
extern TEveKeys EveKeys4;
extern TCEveText EveText2;
extern TCBox_Round BoxRound3;
extern TEveButton EveButtonFNBackspace;
extern TEvent EveButtonFNBackspace_OnClick;
extern TEveButton EveButtonFNClear;
extern TEvent EveButtonFNClear_OnClick;
extern TEveButton EveButtonFNConfirm;
extern TEvent EveButtonFNConfirm_OnClick;
extern TEveButton EveButtonFNGoBack;
extern TEvent EveButtonFNGoBack_OnClick;
extern TEveButton EveButtonFNShift;
extern TEvent EveButtonFNShift_OnClick;

extern TCBox_Round *far const code SettingScreen_CBoxes_Round[2];
extern TEveKeys *far const code SettingScreen_EveKeys[4];
extern TEveButton *far const code SettingScreen_EveButtons[6];
extern TCEveText *far const code SettingScreen_CEveTexts[1];

extern TScreen SummaryScreen;

extern TCBox_Round BoxRound4;
extern TCEveText EveText3;
extern TCEveText EveText4;
extern TCEveText EveText5;
extern TCEveText EveText6;
extern TCEveText EveText7;
extern TCBox_Round BoxRound5;
extern TEveButton EveButtonSUNewRun;
extern TEvent EveButtonSUNewRun_OnClick;
extern TEveButton EveButtonSUHelp;
extern TEvent EveButtonSUHelp_OnClick;
extern TEveButton EveButtonSUAbout;
extern TEvent EveButtonSUAbout_OnClick;
extern TEveText EveTextSUtime;
extern TEveText EveTextSUdistance;
extern TEveText EveTextSUSpeed;
extern TEveText EveTextSUFilename;
extern TEveText EveTextSUAverageSpeed;
extern TEveText EveText8;
extern TBox_Round BoxRound6;
extern TEveText EveText9;
extern TEveText EveText11;
extern TEveText EveText13;
extern TEveText EveText14;
extern TEveText EveText15;
extern TEveText EveText16;
extern TEveText EveText17;
extern TEveButton EveButtonSUBack;
extern TEvent EveButtonSUBack_OnClick;

extern TBox_Round *far const code SummaryScreen_Boxes_Round[1];
extern TCBox_Round *far const code SummaryScreen_CBoxes_Round[2];
extern TEveButton *far const code SummaryScreen_EveButtons[4];
extern TEveText *far const code SummaryScreen_EveTexts[13];
extern TCEveText *far const code SummaryScreen_CEveTexts[5];

extern TScreen *CurrentScreen;



void EveButtonFNBackspaceOnClick();
void EveButtonFNClearOnClick();
void EveButtonFNConfirmOnClick();
void EveButtonFNGoBackOnClick();
void EveButtonFNShiftOnClick();
void EveButtonProfCreateFileOnClick();
void EveButtonProfRough1OnClick();
void EveButtonProfRough2OnClick();
void EveButtonProfRough3OnClick();
void EveButtonProfRough4OnClick();
void EveButtonProfStartProfilingOnClick();
void EveButtonProfStopProfilingOnClick();
void EveButtonsmpBackOnClick();
void EveButtonSmpConfigureMotorOnClick();
void EveButtonSmpGotoProfOnClick();
void EveButtonsmpJogFrontOnPress();
void EveButtonsmpJogRearOnPress();
void EveButtonsmpResetIncOnClick();
void EveButtonSmpStartSamplingOnClick();
void EveButtonSmpStopSamplingOnClick();
void EveButtonSplashInitOnClick();
void EveButtonSUAboutOnClick();
void EveButtonSUBackOnClick();
void EveButtonSUHelpOnClick();
void EveButtonSUNewRunOnClick();
void EveToggleProfModeOnClick();
void SettingScreenOnTagChange();




extern const code far char EveTextSplashScreenName_Caption[];
extern char EveButtonSplashInit_Caption[];
extern char EveTextSplashScreenStatus_Caption[];
extern char EveProgressBar1_Caption[];
extern const code far char BoxRoundsmpScn1_Caption[];
extern const code far char EveTextSampScnLabel1_Caption[];
extern const code far char EveTextsampscnlabel2_Caption[];
extern const code far char EveTextsampscnlabel4_Caption[];
extern const code far char EveTextsampscnlabel3_Caption[];
extern const code far char EveTextsampscnlabel5_Caption[];
extern const code far char EveTextsampscnlabel6_Caption[];
extern const code far char BoxRoundSmpscn2_Caption[];
extern char EveTextEncoderSamp_Caption[];
extern char EveTextLaserSmp_Caption[];
extern char EveTextPitchSmp_Caption[];
extern char EveTextGPSSmp_Caption[];
extern char EveTextSDSmp_Caption[];
extern char EveTextRollSmp_Caption[];
extern char EveTextAccx_Caption[];
extern char EveTextAccy_Caption[];
extern char EveTextAccz_Caption[];
extern char BoxRound7_Caption[];
extern char EveButtonsmpJogRear_Caption[];
extern char EveButtonsmpJogFront_Caption[];
extern char EveButtonsmpBack_Caption[];
extern char BoxRound8_Caption[];
extern char EveButtonSmpStartSampling_Caption[];
extern char EveButtonSmpStopSampling_Caption[];
extern char EveButtonSmpConfigureMotor_Caption[];
extern char EveButtonSmpGotoProf_Caption[];
extern char EveButtonsmpResetInc_Caption[];
extern const code far char Box1_Caption[];
extern const code far char EveTextProflabel1_Caption[];
extern const code far char BoxRound1_Caption[];
extern char EveGaugeProfSpeed_Caption[];
extern const code far char EveTextProflabel4_Caption[];
extern char EveToggleProfMode_StateOFF_Caption[];
extern char EveToggleProfMode_StateON_Caption[];
extern const code far char EveTextProflabel3_Caption[];
extern char EveButtonProfStartProfiling_Caption[];
extern char EveButtonProfStopProfiling_Caption[];
extern char Line1_Caption[];
extern char Line2_Caption[];
extern char Line3_Caption[];
extern char Line4_Caption[];
extern char Line5_Caption[];
extern char Line6_Caption[];
extern char Line7_Caption[];
extern char Line8_Caption[];
extern char Line9_Caption[];
extern char Line10_Caption[];
extern char Line11_Caption[];
extern char Line12_Caption[];
extern char Line13_Caption[];
extern char Line14_Caption[];
extern char Line15_Caption[];
extern char Line16_Caption[];
extern char Line17_Caption[];
extern char Line18_Caption[];
extern char Line19_Caption[];
extern char Line20_Caption[];
extern char Line21_Caption[];
extern char Line22_Caption[];
extern char Line23_Caption[];
extern char Line24_Caption[];
extern char Line25_Caption[];
extern char Line26_Caption[];
extern char Line27_Caption[];
extern char Line28_Caption[];
extern char Line29_Caption[];
extern char Line30_Caption[];
extern char Line31_Caption[];
extern char Line32_Caption[];
extern char Line33_Caption[];
extern char Line34_Caption[];
extern char Line35_Caption[];
extern char Line36_Caption[];
extern char Line37_Caption[];
extern char Line38_Caption[];
extern char Line39_Caption[];
extern char Line40_Caption[];
extern char Line41_Caption[];
extern char Line42_Caption[];
extern char Line43_Caption[];
extern char Line44_Caption[];
extern char Line45_Caption[];
extern char Line46_Caption[];
extern char Line47_Caption[];
extern char Line48_Caption[];
extern char Line49_Caption[];
extern char Line50_Caption[];
extern char EveText1_Caption[];
extern char EveButtonProfCreateFile_Caption[];
extern char EveTextProfFileName_Caption[];
extern const code far char EveText12_Caption[];
extern char EveButtonProfRough1_Caption[];
extern char EveButtonProfRough2_Caption[];
extern char EveButtonProfRough3_Caption[];
extern char EveButtonProfRough4_Caption[];
extern char EveText18_Caption[];
extern char BoxProfWaitingForCam_Caption[];
extern char EveTextProfWaitingForCam_Caption[];
extern char EveButtonFNfilename_Caption[];
extern const code far char BoxRound2_Caption[];
extern char EveKeys1_Caption[];
extern char EveKeys2_Caption[];
extern char EveKeys3_Caption[];
extern char EveKeys4_Caption[];
extern const code far char EveText2_Caption[];
extern const code far char BoxRound3_Caption[];
extern char EveButtonFNBackspace_Caption[];
extern char EveButtonFNClear_Caption[];
extern char EveButtonFNConfirm_Caption[];
extern char EveButtonFNGoBack_Caption[];
extern char EveButtonFNShift_Caption[];
extern const code far char BoxRound4_Caption[];
extern const code far char EveText3_Caption[];
extern const code far char EveText4_Caption[];
extern const code far char EveText5_Caption[];
extern const code far char EveText6_Caption[];
extern const code far char EveText7_Caption[];
extern const code far char BoxRound5_Caption[];
extern char EveButtonSUNewRun_Caption[];
extern char EveButtonSUHelp_Caption[];
extern char EveButtonSUAbout_Caption[];
extern char EveTextSUtime_Caption[];
extern char EveTextSUdistance_Caption[];
extern char EveTextSUSpeed_Caption[];
extern char EveTextSUFilename_Caption[];
extern char EveTextSUAverageSpeed_Caption[];
extern char EveText8_Caption[];
extern char BoxRound6_Caption[];
extern char EveText9_Caption[];
extern char EveText11_Caption[];
extern char EveText13_Caption[];
extern char EveText14_Caption[];
extern char EveText15_Caption[];
extern char EveText16_Caption[];
extern char EveText17_Caption[];
extern char EveButtonSUBack_Caption[];



extern TEvent EveButtonSplashInit_OnUpOnClick;
extern TEvent EveButtonsmpJogRear_OnUpOnPress;
extern TEvent EveButtonsmpJogFront_OnUpOnPress;
extern TEvent EveButtonsmpBack_OnUpOnClick;
extern TEvent EveButtonSmpStartSampling_OnUpOnClick;
extern TEvent EveButtonSmpStopSampling_OnUpOnClick;
extern TEvent EveButtonSmpConfigureMotor_OnUpOnClick;
extern TEvent EveButtonSmpGotoProf_OnUpOnClick;
extern TEvent EveButtonsmpResetInc_OnUpOnClick;
extern TEvent EveToggleProfMode_OnUpOnClick;
extern TEvent EveButtonProfStartProfiling_OnUpOnClick;
extern TEvent EveButtonProfStopProfiling_OnUpOnClick;
extern TEvent EveButtonProfCreateFile_OnUpOnClick;
extern TEvent EveButtonProfRough1_OnUpOnClick;
extern TEvent EveButtonProfRough2_OnUpOnClick;
extern TEvent EveButtonProfRough3_OnUpOnClick;
extern TEvent EveButtonProfRough4_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonFNBackspace_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonFNClear_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonFNConfirm_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonFNGoBack_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonFNShift_OnUpOnClick;
extern TEvent SettingScreen_OnUpOnTagChange;
extern TEvent EveButtonSUNewRun_OnUpOnClick;
extern TEvent EveButtonSUHelp_OnUpOnClick;
extern TEvent EveButtonSUAbout_OnUpOnClick;
extern TEvent EveButtonSUBack_OnUpOnClick;


void DrawScreenO(TScreen *aScreen, char aOptions);
void DrawScreen(TScreen *aScreen);
void DrawBox(TBox *ABox);
void DrawCBox(TCBox *ACBox);
void DrawBoxRound(TBox_Round *ABoxRound);
void DrawCBoxRound(TCBox_Round *ACBoxRound);
void DrawLine(TLine *ALine);
void DrawEveGauge(TEveGauge *AEveGauge);
void DrawEveKeys(TEveKeys *AEveKeys);
void DrawEveProgressBar(TEveProgressBar *AEveProgressBar);
void DrawEveToggle(TEveToggle *AEveToggle);
void DrawEveButton(TEveButton *AEveButton);
void DrawEveText(TEveText *AEveText);
void DrawCEveText(TCEveText *ACEveText);
void DrawCEveNumber(TCEveNumber *ACEveNumber);
void ProcessVTFTStack();
void InitVTFTStack();
#line 24 "C:/Users/tic27/Desktop/DC_tim708backuplazer/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/NewDesign_main.c"
void main() {
 InitVTFTStack();
 while (1) {
 ProcessVTFTStack();
 }

}
