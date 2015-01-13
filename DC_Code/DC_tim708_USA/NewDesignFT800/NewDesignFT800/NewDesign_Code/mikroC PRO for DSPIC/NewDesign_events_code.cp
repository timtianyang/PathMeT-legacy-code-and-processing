#line 1 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/NewDesign_events_code.c"
#line 1 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/newdesign_objects.h"
#line 1 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/ft800_types.h"
#line 21 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/ft800_types.h"
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
#line 6 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/newdesign_objects.h"
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
#line 1 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/newdesign_resources.h"
#line 1 "d:/desktopbak/github/pathmet/dc_code/dc_tim708_usa/newdesignft800/newdesignft800/newdesign_code/mikroc pro for dspic/fandh.h"


int triggerDist=10387;
float wheelRadius=0.203;
float cycle=4268.0;

void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf);
void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines);
float calculateLaz(unsigned char *buff);

float CalculateAngle(unsigned char *angleBuff);
unsigned long calculateRQEI(unsigned char *buff);
float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff);


void initCommunication();
void mapPins();


unsigned long CurrentEnc=0;
unsigned long OldEnc=0;

volatile unsigned int laserplotflag=0;
volatile unsigned int Incplotflag=0;

volatile unsigned int smpflag=0;
volatile unsigned int loggingflag=0;
volatile unsigned int profilingMode=0;



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


volatile unsigned char GPSpackage[90];
volatile unsigned int GPSSize=0;


unsigned char foldername[9];
unsigned char oldname[11];

volatile unsigned char GPSdataReceived[35];
volatile unsigned int GPSdataReceivedPtr=0;
#line 6 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/NewDesign_events_code.c"
void mapPins(){




 TRISB.B12=1;
 TRISB.B11=0;
 TRISB.B10=0;




 TRISB.B4=0;
 TRISA.B4=1;

 PPS_Mapping(44,_INPUT,_SDI2IN);
 PPS_Mapping(43,_OUTPUT,_SDO2);
 PPS_Mapping(42,_OUTPUT,_SCK2OUT);

 PPS_Mapping(36,_OUTPUT,_U1TX);
 PPS_Mapping(20,_INPUT,_U1RX);



}
void initCommunication(){
 unsigned int i=0;

 UART1_Init_Advanced(921600,_UART_8BIT_NOPARITY,_UART_ONE_STOPBIT,_UART_HI_SPEED);
 Delay_ms(150);
 IFS0.B11=0;
 U1STA.OERR=0;
 IPC2.B14=1;
 IPC2.B13=0;
 IPC2.B12=0;

 IFS0.B11=0;
 IEC0.B11=1;

 Delay_ms(100);
 SPI2_Init_Advanced(_SPI_MASTER,
 _SPI_8_BIT,
 _SPI_PRESCALE_SEC_8,
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

 GPSdataReceivedPtr=0;

 return;
 }
 if(GPSdataReceivedPtr==37){GPSdataReceivedPtr=0;GPSdataReceived[37]=0x00;}


}
void smpInterrupt() iv IVT_ADDR_U1RXINTERRUPT{
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



 if(smpflag){
 smpbuff[smpbuffIterator++]=temp1;
 if(smpbuffIterator==22){
 smpbuffIterator=0;
 smpbuffReady=1;
 }
 }
 if(loggingflag){
 smpbuff[smpbuffIterator++]=temp1;
 if(smpbuffIterator==19){
 smpbuffIterator=0;


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
float calculateLaz(unsigned char *buff){
 return (((*buff)<<12)|((*(buff+1))<<8)|((*(buff+2))<<4)|((*(buff+3))))/16463f*19.5f+5f;

}

float CalculateAngle(unsigned char *angleBuff){
 static unsigned long a;
 static unsigned long b;
 static unsigned int c;
 a=angleBuff[0];
 b=angleBuff[1];
 c=angleBuff[2];

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
 return temp*0.0078;
}

unsigned long calculateTime(unsigned char *tBuff){
 return (((unsigned long)tBuff[0])<<16)|(tBuff[1]<<8)|(tBuff[2]);
}

float CalculateSpeed(unsigned char *tBuff, unsigned char *encBuff){
 float speedtemp=0;
 newPos=calculateRQEI(encBuff);
 newT=calculateTime(tBuff);
 speedtemp=(newPos-oldPos)/cycle*1.2267;
 speedtemp=speedtemp/((newT-oldT)/1000.0);
 oldT=newT;
 oldPos=newPos;


 return speedtemp;
}
void Initplot(TLine *far const code lines[],unsigned int numberOfLines,unsigned int Xbase,unsigned int Ybase,unsigned int lineResolution,int *pf){
 int i=0;

 lines[0]->First_Point_X=Xbase;
 lines[0]->Second_Point_X=Xbase+lineResolution;
 lines[0]->First_Point_Y=Ybase;
 lines[0]->Second_Point_Y=Ybase;

 lines[0]->visible=1;
 for(i=1;i<numberOfLines;i++){
 lines[i]->First_Point_X=lines[i-1]->Second_Point_X;
 lines[i]->First_Point_Y=lines[i-1]->Second_Point_Y;
 lines[i]->Second_Point_X=lines[i]->First_Point_X+lineResolution;
 lines[i]->Second_Point_Y=lines[i]->First_Point_Y;
 lines[i]->visible=1;
 }
 *pf=1;
 DrawScreen(&ProfilingScreen);
}
void addData(int Newdata,int *pf,int Ybase,TLine *far const code lines[],unsigned int numberOfLines){
 int i=0;
 if(*pf){
 for(i=0;i<numberOfLines-1;i++){
 lines[i]->First_Point_Y=lines[i+1]->First_Point_Y;
 lines[i]->Second_Point_Y=lines[i+1]->Second_Point_Y;
 }
 lines[numberOfLines-1]->First_Point_Y=lines[numberOfLines-2]->Second_Point_Y;
 lines[numberOfLines-1]->Second_Point_Y=Ybase+newData;
 }
}
void sendCommandToCamChip(unsigned char* name,unsigned char size){

 unsigned int i=0;


 SPI2BUF=(0x53);


 Delay_us(100);
 for(i=0;i<size;i++){
 SPI2BUF=(name[i]);
 Delay_us(100);
 }
 SPI2BUF=(0xE4);
 Delay_us(100);
 SPI2BUF=0x3B;
 Delay_ms(100);
 SPI2BUF=(0x43);
 Delay_ms(100);

}
void sendNameToSamChip(unsigned char* name,unsigned char size){
 unsigned int i=0;
 UART1_Write(0xE3);
 for(i=0;i<size;i++){
 UART1_Write(name[i]);
 }
 UART1_Write(0xB5);
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










void EveButtonSmpStartSamplingOnClick() {
 unsigned int i=0;
 unsigned int b=0;
 unsigned char temp[3];
 unsigned char te;

 smpbuffIterator=0;
 smpbuffReady=0;
 EveButtonSmpConfigureMotor.color=0xAD55;
 EveButtonSmpConfigureMotor.active=0;


 EveButtonSmpStartSampling.visible=0;
 EveButtonSmpStartSampling.Active=0;
 EveButtonSmpStopSampling.visible=1;
 EveButtonSmpStopSampling.Active=1;
 DrawScreen(&SamplingScreen);

 smpflag=1;
 SPI2STAT.B4=0;
 SPI2STAT.B3=0;
 SPI2STAT.B2=1;
 IFS2.B1=0;
 IPC8.B6=1;
 IPC8.B5=0;
 IPC8.B4=0;
 IEC2.B1=1;

 SPI2BUF=0x3B;
 Delay_ms(100);
 SPI2BUF=0x31;
 Delay_ms(100);

 UART1_Write(0x31);
 Delay_ms(100);
 GPSdataReceivedPtr=0;
 while(smpflag){


 for(b=0;b<33;b++){
 SPI2BUF=0x31;
 Delay_ms(1);
 }
 SPI2BUF=0x32;
 GPSdataReceivedPtr=0;

 ProcessVTFTStack();
 Delay_ms(50);

 GPSdataReceived[33]=0x00;

 if(smpbuffReady){
 smpbuffReady=0;




 sprintf(EveTextLaserSmp.Caption, "%.4f", calculateLaz(&smpbuff));
 sprintf(EveTextEncoderSamp.Caption, "%+ld",calculateRQEI(&smpbuff[4]));
 sprintf(EveTextPitchSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[8]));
 sprintf(EveTextRollSmp.Caption, "%+.2f",CalculateAngle(&smpbuff[12]));



 EveTextGPSSmp.Caption=GPSdataReceived+1;

 sprintf(EveTextAccx_Caption, "%+.2f", CalculateAcc(&smpbuff[16]));
 sprintf(EveTextAccy_Caption, "%+.2f", CalculateAcc(&smpbuff[18]));
 sprintf(EveTextAccz_Caption, "%+.2f", CalculateAcc(&smpbuff[20]));

 UART1_Write(0x31);
 DrawScreen(&SamplingScreen);
 }


 }
 EveButtonSmpStartSampling.visible=1;
 EveButtonSmpStartSampling.Active=1;
 EveButtonSmpStopSampling.visible=0;
 EveButtonSmpStopSampling.Active=0;

 SPI2BUF=0x22;


 EveButtonSmpConfigureMotor.color=0xA865;
 EveButtonSmpConfigureMotor.active=1;
 DrawScreen(&SamplingScreen);
 SPI2BUF=0x2F;
 Delay_ms(500);
 IEC2.B1=0;
 GPSdataReceivedPtr=0;
 smpbuffIterator=0;
 smpbuffReady=0;
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




 DrawScreen(&ProfilingScreen);
}

void EveButtonProfStartProfilingOnClick() {
 int crossslp;
 unsigned char temp=0;
 unsigned char* Emsg;

 strcpy(oldname,EveTextProfFileName_Caption);
 Delay_ms(200);
 smpflag=0;
 smpbuffIterator=0;
 smpbuffReady=0;
 IEC2.B1=1;

 EveButtonProfStartProfiling.visible=0;
 EveButtonProfStartProfiling.Active=0;
 EveButtonProfStopProfiling.visible=1;
 EveButtonProfStopProfiling.Active=1;
 EveToggleProfMode.Active=0;



 sendCommandToCamChip(EveButtonFNfilename.Caption,strlen(EveButtonFNfilename.Caption)+1);

 DrawScreen(&ProfilingScreen);

 sendNameToSamChip(EveButtonFNfilename_Caption,strlen(EveButtonFNfilename_Caption)+1);






 Initplot(ProfilingScreen_Lines,25,34,80,8,&laserplotflag);


 loggingflag=1;
 if(profilingMode){UART1_Write(0x1C);}
 Delay_ms(1);
 UART1_Write(0xA2);
 Delay_ms(500);
 SPI2BUF=0xAB;

 while(laserplotflag){
 if(smpbuffReady){
 smpbuffReady=0;
 laserMeasurement=CalculateLaz(&smpbuff);

 if(laserMeasurement>12){
 laserMeasurement=12;
 }
 else if(laserMeasurement<8){
 laserMeasurement=8;
 }
#line 445 "D:/desktopbak/github/PathMeT/DC_Code/DC_tim708_USA/NewDesignFT800/NewDesignFT800/NewDesign_Code/mikroC PRO for DSPIC/NewDesign_events_code.c"
 addData((laserMeasurement-9)*50,&laserplotflag,24,ProfilingScreen_Lines,25);


 crossslp=Roll+50;

 EveGaugeProfSpeed.value=speed*50;

 if(speed>1.99){speed=2;}
 if(speed<0.3||speed>1.7){EveGaugeProfSpeed.Color= 0xC800;}
 else{EveGaugeProfSpeed.Color= 0x03DA; }

 CurrentEnc=calculateRQEI(&smpbuff[15]);
 if((CurrentEnc-OldEnc)>=triggerDist){
 SPI2BUF=0xAB;
 OldEnc=CurrentEnc;

 }
 DrawScreen(&ProfilingScreen);
 }
 ProcessVTFTStack();
 }

 BoxProfWaitingForCam.visible=1;
 EveTextProfWaitingForCam.visible=1;
 EveButtonProfStartProfiling.visible=1;
 EveButtonProfStartProfiling.Active=1;
 EveButtonProfStopProfiling.visible=0;
 EveButtonProfStopProfiling.Active=0;
 EveToggleProfMode.Active=1;
 SPI2BUF=0x62;
 UART1_Write(0xB7);
 DrawScreen(&ProfilingScreen);


 Delay_ms(2000);
 SPI2BUF=0xFA;
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


 if(handshakeBUF && handshakeCAM){

 strncpy(EveTextSUSpeed.Caption,"Success",8);


 EveTextSUSpeed.Font_Color=0x0640;

 }
 else{
 EveTextSUSpeed.Caption[0] = 0;




 if(!handshakeBUF){
 strncat(EveTextSUSpeed.Caption,"Buffer",7);

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


 }
 strncat(EveTextSUSpeed.Caption," Failed",8);
 EveTextSUSpeed.Font_Color=0xC800;
 }
 EveTextSUFilename.Caption= EveButtonFNfilename.Caption;
 oldPos=0;
 oldT=0;


 OldEnc=0;
 CurrentEnc=0;
 DrawScreen(&SummaryScreen);
 Delay_ms(1);
 handshakeCAM=0;
 handshakeBUF=0;
 loggingflag=0;
 SPI2BUF=0x2F;
 averageSpeed=1;
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
 UART1_Write(0xFC);
}

void EveButtonProfRough1OnClick() {
 UART1_Write(0xC1);
}

void EveButtonProfRough2OnClick() {
 UART1_Write(0xC2);
}

void EveButtonProfRough3OnClick() {
 UART1_Write(0xC3);
}

void EveButtonProfRough4OnClick() {
 UART1_Write(0xC4);
}
