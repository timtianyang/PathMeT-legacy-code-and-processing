#ifndef NEWDESIGN_OBJECTS
#define NEWDESIGN_OBJECTS

#include "FT800_Types.h"

typedef enum {taNone, taLeft, taCenter, taRight, taCenterX, taCenterY, taRightX} TTextAlign;

typedef struct Screen TScreen;

typedef unsigned long TPointer;

typedef struct tagObjInfo {
  TPointer Obj;
  char     Type;
  char     Order;
  char     Flags;

  char     HitTag;
  int      HitX;
  int      HitY;
} TObjInfo;

typedef struct tagTouchStat {
  char Pressed;

  char Tag;
  int  X;
  int  Y;

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
  TEvtSound  Sound;
} TCEvent;

typedef struct tagEvent {
  TEvtAction Action;
  TEvtSound  Sound;
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
  TScreen      *OwnerScreen;
  char         Order;
  char         Visible;
  char         Opacity;
  char         Tag;
  int          Left;
  int          Top;
  int          Width;
  int          Height;
  char         Pen_Width;
  unsigned int Pen_Color;
  unsigned int Color;
  unsigned int Press_Color;
  unsigned int ColorTo;
  unsigned int Press_ColorTo;
  char         Gradient;
  char         Active;
  TEvent       *OnUp;
  TEvent       *OnDown;
  TEvent       *OnClick;
  TEvent       *OnPress;
} TBox;

typedef far const code struct tagCBox {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  char                Pen_Width;
  unsigned int        Pen_Color;
  unsigned int        Color;
  unsigned int        Press_Color;
  unsigned int        ColorTo;
  unsigned int        Press_ColorTo;
  char                Gradient;
  char                Active;
  TCEvent             *OnUp;
  TCEvent             *OnDown;
  TCEvent             *OnClick;
  TCEvent             *OnPress;
} TCBox;

typedef struct tagBox_Round {
  TScreen      *OwnerScreen;
  char         Order;
  char         Visible;
  char         Opacity;
  char         Tag;
  int          Left;
  int          Top;
  int          Width;
  int          Height;
  char         Pen_Width;
  unsigned int Pen_Color;
  unsigned int Color;
  unsigned int Press_Color;
  char         Corner_Radius;
  char         Active;
  TEvent       *OnUp;
  TEvent       *OnDown;
  TEvent       *OnClick;
  TEvent       *OnPress;
} TBox_Round;

typedef far const code struct tagCBox_Round {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  char                Pen_Width;
  unsigned int        Pen_Color;
  unsigned int        Color;
  unsigned int        Press_Color;
  char                Corner_Radius;
  char                Active;
  TCEvent             *OnUp;
  TCEvent             *OnDown;
  TCEvent             *OnClick;
  TCEvent             *OnPress;
} TCBox_Round;

typedef struct tagLine {
  TScreen      *OwnerScreen;
  char         Order;
  char         Visible;
  char         Opacity;
  char         Tag;
  int          First_Point_X;
  int          First_Point_Y;
  int          Second_Point_X;
  int          Second_Point_Y;
  char         Pen_Width;
  unsigned int Pen_Color;
} TLine;

typedef struct tagEveGauge {
  TScreen      *OwnerScreen;
  char         Order;
  char         Visible;
  char         Opacity;
  char         Tag;
  int          Left;
  int          Top;
  int          Radius;
  char         Pen_Width;
  unsigned int Pen_Color;
  unsigned int Color;
  unsigned int Press_Color;
  char         Major;
  char         Minor;
  unsigned int Value;
  unsigned int Range;
  char         Flat;
  char         NoBackground;
  char         NoPointer;
  char         TicksVisible;
  char         Active;
  TEvent       *OnUp;
  TEvent       *OnDown;
  TEvent       *OnClick;
  TEvent       *OnPress;
} TEveGauge;

typedef struct tagEveKeys {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  unsigned int        Color;
  unsigned int        Press_Color;
  unsigned int        ColorTo;
  unsigned int        Press_ColorTo;
  char                *Caption;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  char                Flat;
  char                AutoSize;
  char                Active;
  TEvent              *OnUp;
  TEvent              *OnDown;
  TEvent              *OnClick;
  TEvent              *OnPress;
} TEveKeys;

typedef struct tagEveProgressBar {
  TScreen      *OwnerScreen;
  char         Order;
  char         Visible;
  char         Opacity;
  char         Tag;
  int          Left;
  int          Top;
  int          Width;
  int          Height;
  unsigned int Background_Color;
  unsigned int Color;
  unsigned int Value;
  unsigned int Range;
  char         Flat;
} TEveProgressBar;

typedef struct tagEveToggle {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  char                Pen_Width;
  unsigned int        Pen_Color;
  unsigned int        Background_Color;
  unsigned int        Color;
  unsigned int        Press_Color;
  char                *StateOFF_Caption;
  char                *StateON_Caption;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  unsigned int        State;
  char                Flat;
  char                Active;
  TEvent              *OnUp;
  TEvent              *OnDown;
  TEvent              *OnClick;
  TEvent              *OnPress;
} TEveToggle;

typedef struct tagEveButton {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  unsigned int        Color;
  unsigned int        Press_Color;
  unsigned int        ColorTo;
  unsigned int        Press_ColorTo;
  char                *Caption;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  char                Flat;
  char                Active;
  TEvent              *OnUp;
  TEvent              *OnDown;
  TEvent              *OnClick;
  TEvent              *OnPress;
} TEveButton;

typedef struct tagEveText {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  char                *Caption;
  TTextAlign          TextAlign;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  char                Active;
  TEvent              *OnUp;
  TEvent              *OnDown;
  TEvent              *OnClick;
  TEvent              *OnPress;
} TEveText;

typedef far const code struct tagCEveText {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  far const code char *Caption;
  TTextAlign          TextAlign;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  char                Active;
  TCEvent             *OnUp;
  TCEvent             *OnDown;
  TCEvent             *OnClick;
  TCEvent             *OnPress;
} TCEveText;

typedef far const code struct tagCEveNumber {
  TScreen             *OwnerScreen;
  char                Order;
  char                Visible;
  char                Opacity;
  char                Tag;
  int                 Left;
  int                 Top;
  int                 Width;
  int                 Height;
  char                Text_Length;
  TTextAlign          TextAlign;
  far const code char *FontName;
  unsigned int        Font_Color;
  char                FontHandle;
  long                Source;
  signed long         Value;
  unsigned char       Signed;
  char                Active;
  TCEvent             *OnUp;
  TCEvent             *OnDown;
  TCEvent             *OnClick;
  TCEvent             *OnPress;
} TCEveNumber;

struct Screen {
  unsigned int    Color;
  unsigned int    Width;
  unsigned int    Height;
  unsigned short  ObjectsCount;
  unsigned short BoxesCount;
  TBox            *far const code *Boxes;
  unsigned short CBoxesCount;
  TCBox           *far const code *CBoxes;
  unsigned short Boxes_RoundCount;
  TBox_Round      *far const code *Boxes_Round;
  unsigned short CBoxes_RoundCount;
  TCBox_Round     *far const code *CBoxes_Round;
  unsigned short LinesCount;
  TLine           *far const code *Lines;
  unsigned short EveGaugesCount;
  TEveGauge       *far const code *EveGauges;
  unsigned short EveKeysCount;
  TEveKeys        *far const code *EveKeys;
  unsigned short EveProgressBarsCount;
  TEveProgressBar *far const code *EveProgressBars;
  unsigned short EveTogglesCount;
  TEveToggle      *far const code *EveToggles;
  unsigned short EveButtonsCount;
  TEveButton      *far const code *EveButtons;
  unsigned short EveTextsCount;
  TEveText        *far const code *EveTexts;
  unsigned short CEveTextsCount;
  TCEveText       *far const code *CEveTexts;
  unsigned short CEveNumbersCount;
  TCEveNumber     *far const code *CEveNumbers;
  unsigned long   DynResStart;
  unsigned short  Active;
  unsigned short  SniffObjectEvents;
  TEvent          *OnUp;
  TEvent          *OnDown;
  TEvent          *OnTagChange;
  TEvent          *OnPress;
};


// Object type constants
// Usage: VTFT stack internally
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
// ~Object type constants

// Event type constants
// Usage: OnEvent
extern const VTFT_EVT_UP;
extern const VTFT_EVT_DOWN;
extern const VTFT_EVT_CLICK;
extern const VTFT_EVT_PRESS;
// ~Event type constants

// Sound action constants
// Usage: sound event action property and ProcessEvent
extern const VTFT_SNDACT_NONE;
extern const VTFT_SNDACT_PLAY;
extern const VTFT_SNDACT_STOP;
// ~Sound action constants

// Resource loading constants.
// Usage: DrawScreenO and LoadCurrentScreenResToGRAM
extern const VTFT_LOAD_RES_NONE;
extern const VTFT_LOAD_RES_STATIC;
extern const VTFT_LOAD_RES_DYNAMIC;
extern const VTFT_LOAD_RES_ALL;
// ~Resource loading constants

// Display effect constants
// Usage: DrawScreenO
extern const VTFT_DISPLAY_EFF_NONE;
extern const VTFT_DISPLAY_EFF_LIGHTS_FADE;
extern const VTFT_DISPLAY_EFF_LIGHTS_OFF;
// ~Display effect constants

// Stack flags
// Usage: internally used by VTFT stack
extern const VTFT_INT_REPAINT_ON_DOWN;
extern const VTFT_INT_REPAINT_ON_UP;
extern const VTFT_INT_BRING_TO_FRONT;
extern const VTFT_INT_INTRINSIC_CLICK_EFF;
// ~Stack flags

// Table of object draw handlers
// Use object type constants to access coresponding object draw handler
extern const TPointer DrawHandlerTable[44];
// ~Table of draw handler pointers

// Default configuration parameters
extern const TFT800PWM            VTFT_FT800_CONFIG_PWM;
extern const TFT800GPIO           VTFT_FT800_CONFIG_GPIO;
extern const TFT800Sound          VTFT_FT800_CONFIG_SOUND;
extern const TFT800Audio          VTFT_FT800_CONFIG_AUDIO;
extern const TFT800Display        VTFT_FT800_CONFIG_DISPLAY;
extern const TFT800Interrupt      VTFT_FT800_CONFIG_INTERRUPT;
extern const TFT800Touch          VTFT_FT800_CONFIG_TOUCH;
extern const TFT800TouchTransform VTFT_FT800_CONFIG_TOUCHTRANSFORM;

extern TTouchStat TouchS;

extern TScreen SplashScreen;

extern TCEveText       EveTextSplashScreenName;
extern TEveButton      EveButtonSplashInit;
extern TEvent          EveButtonSplashInit_OnClick;
extern TEveText        EveTextSplashScreenStatus;
extern TEveProgressBar EveProgressBar1;

extern TEveProgressBar *far const code SplashScreen_EveProgressBars[1];
extern TEveButton      *far const code SplashScreen_EveButtons[1];
extern TEveText        *far const code SplashScreen_EveTexts[1];
extern TCEveText       *far const code SplashScreen_CEveTexts[1];

extern TScreen SamplingScreen;

extern TCBox_Round BoxRoundsmpScn1;
extern TCEveText   EveTextSampScnLabel1;
extern TCEveText   EveTextsampscnlabel2;
extern TCEveText   EveTextsampscnlabel4;
extern TCEveText   EveTextsampscnlabel3;
extern TCEveText   EveTextsampscnlabel5;
extern TCEveText   EveTextsampscnlabel6;
extern TCBox_Round BoxRoundSmpscn2;
extern TEveText    EveTextEncoderSamp;
extern TEveText    EveTextLaserSmp;
extern TEveText    EveTextPitchSmp;
extern TEveText    EveTextGPSSmp;
extern TEveText    EveTextSDSmp;
extern TEveText    EveTextRollSmp;
extern TEveText    EveTextAccx;
extern TEveText    EveTextAccy;
extern TEveText    EveTextAccz;
extern TBox_Round  BoxRound7;
extern TEveButton  EveButtonsmpJogRear;
extern TEvent      EveButtonsmpJogRear_OnPress;
extern TEveButton  EveButtonsmpJogFront;
extern TEvent      EveButtonsmpJogFront_OnPress;
extern TEveButton  EveButtonsmpBack;
extern TEvent      EveButtonsmpBack_OnClick;
extern TBox_Round  BoxRound8;
extern TEveButton  EveButtonSmpStartSampling;
extern TEvent      EveButtonSmpStartSampling_OnClick;
extern TEveButton  EveButtonSmpStopSampling;
extern TEvent      EveButtonSmpStopSampling_OnClick;
extern TEveButton  EveButtonSmpConfigureMotor;
extern TEvent      EveButtonSmpConfigureMotor_OnClick;
extern TEveButton  EveButtonSmpGotoProf;
extern TEvent      EveButtonSmpGotoProf_OnClick;
extern TEveButton  EveButtonsmpResetInc;
extern TEvent      EveButtonsmpResetInc_OnClick;

extern TBox_Round  *far const code SamplingScreen_Boxes_Round[2];
extern TCBox_Round *far const code SamplingScreen_CBoxes_Round[2];
extern TEveButton  *far const code SamplingScreen_EveButtons[8];
extern TEveText    *far const code SamplingScreen_EveTexts[9];
extern TCEveText   *far const code SamplingScreen_CEveTexts[6];

extern TScreen ProfilingScreen;

extern TCBox       Box1;
extern TCEveText   EveTextProflabel1;
extern TCEveNumber EveNumber1;
extern TCEveNumber EveNumber2;
extern TCEveNumber EveNumber3;
extern TCBox_Round BoxRound1;
extern TEveGauge   EveGaugeProfSpeed;
extern TCEveText   EveTextProflabel4;
extern TEveToggle  EveToggleProfMode;
extern TEvent      EveToggleProfMode_OnClick;
extern TCEveText   EveTextProflabel3;
extern TEveButton  EveButtonProfStartProfiling;
extern TEvent      EveButtonProfStartProfiling_OnClick;
extern TEveButton  EveButtonProfStopProfiling;
extern TEvent      EveButtonProfStopProfiling_OnClick;
extern TLine       Line1;
extern TLine       Line2;
extern TLine       Line3;
extern TLine       Line4;
extern TLine       Line5;
extern TLine       Line6;
extern TLine       Line7;
extern TLine       Line8;
extern TLine       Line9;
extern TLine       Line10;
extern TLine       Line11;
extern TLine       Line12;
extern TLine       Line13;
extern TLine       Line14;
extern TLine       Line15;
extern TLine       Line16;
extern TLine       Line17;
extern TLine       Line18;
extern TLine       Line19;
extern TLine       Line20;
extern TLine       Line21;
extern TLine       Line22;
extern TLine       Line23;
extern TLine       Line24;
extern TLine       Line25;
extern TLine       Line26;
extern TLine       Line27;
extern TLine       Line28;
extern TLine       Line29;
extern TLine       Line30;
extern TLine       Line31;
extern TLine       Line32;
extern TLine       Line33;
extern TLine       Line34;
extern TLine       Line35;
extern TLine       Line36;
extern TLine       Line37;
extern TLine       Line38;
extern TLine       Line39;
extern TLine       Line40;
extern TLine       Line41;
extern TLine       Line42;
extern TLine       Line43;
extern TLine       Line44;
extern TLine       Line45;
extern TLine       Line46;
extern TLine       Line47;
extern TLine       Line48;
extern TLine       Line49;
extern TLine       Line50;
extern TEveText    EveText1;
extern TEveButton  EveButtonProfCreateFile;
extern TEvent      EveButtonProfCreateFile_OnClick;
extern TEveText    EveTextProfFileName;
extern TCEveText   EveText12;
extern TEveButton  EveButtonProfRough1;
extern TEvent      EveButtonProfRough1_OnClick;
extern TEveButton  EveButtonProfRough2;
extern TEvent      EveButtonProfRough2_OnClick;
extern TEveButton  EveButtonProfRough3;
extern TEvent      EveButtonProfRough3_OnClick;
extern TEveButton  EveButtonProfRough4;
extern TEvent      EveButtonProfRough4_OnClick;
extern TEveText    EveText18;
extern TBox        BoxProfWaitingForCam;
extern TEveText    EveTextProfWaitingForCam;

extern TBox        *far const code ProfilingScreen_Boxes[1];
extern TCBox       *far const code ProfilingScreen_CBoxes[1];
extern TCBox_Round *far const code ProfilingScreen_CBoxes_Round[1];
extern TLine       *far const code ProfilingScreen_Lines[50];
extern TEveGauge   *far const code ProfilingScreen_EveGauges[1];
extern TEveToggle  *far const code ProfilingScreen_EveToggles[1];
extern TEveButton  *far const code ProfilingScreen_EveButtons[7];
extern TEveText    *far const code ProfilingScreen_EveTexts[4];
extern TCEveText   *far const code ProfilingScreen_CEveTexts[4];
extern TCEveNumber *far const code ProfilingScreen_CEveNumbers[3];

extern TScreen SettingScreen;
extern TEvent  SettingScreen_OnTagChange;

extern TEveButton  EveButtonFNfilename;
extern TCBox_Round BoxRound2;
extern TEveKeys    EveKeys1;
extern TEveKeys    EveKeys2;
extern TEveKeys    EveKeys3;
extern TEveKeys    EveKeys4;
extern TCEveText   EveText2;
extern TCBox_Round BoxRound3;
extern TEveButton  EveButtonFNBackspace;
extern TEvent      EveButtonFNBackspace_OnClick;
extern TEveButton  EveButtonFNClear;
extern TEvent      EveButtonFNClear_OnClick;
extern TEveButton  EveButtonFNConfirm;
extern TEvent      EveButtonFNConfirm_OnClick;
extern TEveButton  EveButtonFNGoBack;
extern TEvent      EveButtonFNGoBack_OnClick;
extern TEveButton  EveButtonFNShift;
extern TEvent      EveButtonFNShift_OnClick;

extern TCBox_Round *far const code SettingScreen_CBoxes_Round[2];
extern TEveKeys    *far const code SettingScreen_EveKeys[4];
extern TEveButton  *far const code SettingScreen_EveButtons[6];
extern TCEveText   *far const code SettingScreen_CEveTexts[1];

extern TScreen SummaryScreen;

extern TCBox_Round BoxRound4;
extern TCEveText   EveText3;
extern TCEveText   EveText4;
extern TCEveText   EveText5;
extern TCEveText   EveText6;
extern TCEveText   EveText7;
extern TCBox_Round BoxRound5;
extern TEveButton  EveButtonSUNewRun;
extern TEvent      EveButtonSUNewRun_OnClick;
extern TEveButton  EveButtonSUHelp;
extern TEvent      EveButtonSUHelp_OnClick;
extern TEveButton  EveButtonSUAbout;
extern TEvent      EveButtonSUAbout_OnClick;
extern TEveText    EveTextSUtime;
extern TEveText    EveTextSUdistance;
extern TEveText    EveTextSUSpeed;
extern TEveText    EveTextSUFilename;
extern TEveText    EveTextSUAverageSpeed;
extern TEveText    EveText8;
extern TBox_Round  BoxRound6;
extern TEveText    EveText9;
extern TEveText    EveText11;
extern TEveText    EveText13;
extern TEveText    EveText14;
extern TEveText    EveText15;
extern TEveText    EveText16;
extern TEveText    EveText17;
extern TEveButton  EveButtonSUBack;
extern TEvent      EveButtonSUBack_OnClick;

extern TBox_Round  *far const code SummaryScreen_Boxes_Round[1];
extern TCBox_Round *far const code SummaryScreen_CBoxes_Round[2];
extern TEveButton  *far const code SummaryScreen_EveButtons[4];
extern TEveText    *far const code SummaryScreen_EveTexts[13];
extern TCEveText   *far const code SummaryScreen_CEveTexts[5];

extern TScreen *CurrentScreen;

/////////////////////////
// User Event Handlers
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
/////////////////////////

/////////////////////////////////
// Captions
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

/////////////////////////////////
// Event Descriptors 
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
/////////////////////////////////

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

#endif
