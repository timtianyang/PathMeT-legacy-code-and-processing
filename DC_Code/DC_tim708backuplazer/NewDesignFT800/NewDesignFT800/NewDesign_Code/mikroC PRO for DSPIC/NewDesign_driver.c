#include "NewDesign_objects.h"
#include "NewDesign_resources.h"
#include "built_in.h"
#include "FT800_Types.h"


// TFT module connections
sbit FT800_RST at LATB6_bit;
sbit FT800_CS at LATB1_bit;
sbit FT800_RST_Direction at TRISB6_bit;
sbit FT800_CS_Direction at TRISB1_bit;
// End TFT module connections

// Object type constants
// Usage: VTFT stack internally
const VTFT_OT_BOX            = 12;
const VTFT_OT_CBOX           = 13;
const VTFT_OT_BOXROUND       = 14;
const VTFT_OT_CBOXROUND      = 15;
const VTFT_OT_LINE           = 16;
const VTFT_OT_EVEGAUGE       = 25;
const VTFT_OT_EVEKEYS        = 27;
const VTFT_OT_EVEPROGRESSBAR = 29;
const VTFT_OT_EVETOGGLE      = 31;
const VTFT_OT_EVEBUTTON      = 36;
const VTFT_OT_EVETEXT        = 40;
const VTFT_OT_CEVETEXT       = 41;
const VTFT_OT_CEVENUMBER     = 43;
// ~Object type constants

// Event type constants
// Usage: OnEvent
const VTFT_EVT_UP    = 0;
const VTFT_EVT_DOWN  = 1;
const VTFT_EVT_CLICK = 2;
const VTFT_EVT_PRESS = 3;
// ~Event type constants

// Sound action constants
// Usage: sound event action property and ProcessEvent
const VTFT_SNDACT_NONE  = 0;
const VTFT_SNDACT_PLAY  = 1;
const VTFT_SNDACT_STOP  = 2;
// ~Sound action constants

// Resource loading constants.
// Usage: DrawScreenO and LoadCurrentScreenResToGRAM
const VTFT_LOAD_RES_NONE    = 0x00; // do not load g-ram resources
const VTFT_LOAD_RES_STATIC  = 0x01; // load g-ram resources for static objects
const VTFT_LOAD_RES_DYNAMIC = 0x02; // load g-ram resources for dynamic objects
const VTFT_LOAD_RES_ALL     = 0x03; // load g-ram resources for all objects
// ~Resource loading constants

// Display effect constants
// Usage: DrawScreenO
const VTFT_DISPLAY_EFF_NONE         = 0x00; // no effect when switching between screens
const VTFT_DISPLAY_EFF_LIGHTS_FADE  = 0x04; // backlight: fade out before, fade in after drawing new screen
const VTFT_DISPLAY_EFF_LIGHTS_OFF   = 0x08; // backlight: turn off before, turn on after drawing new screen
// ~Display effect constants

// Stack flags
// Usage: internally used by VTFT stack
const VTFT_INT_REPAINT_ON_DOWN     = 1 << 0;
const VTFT_INT_REPAINT_ON_UP       = 1 << 1;
const VTFT_INT_BRING_TO_FRONT      = 1 << 2;
const VTFT_INT_INTRINSIC_CLICK_EFF = 1 << 3;
// ~Stack flags

// Table of object draw handlers
// Use object type constants to access coresponding object draw handler
const TPointer DrawHandlerTable[44] = {
  0,                   // Button draw handler not used
  0,                   // CButton draw handler not used
  0,                   // ButtonRound draw handler not used
  0,                   // CButtonRound draw handler not used
  0,                   // Label draw handler not used
  0,                   // CLabel draw handler not used
  0,                   // Image draw handler not used
  0,                   // CImage draw handler not used
  0,                   // Circle draw handler not used
  0,                   // CCircle draw handler not used
  0,                   // CircleButton draw handler not used
  0,                   // CCircleButton draw handler not used
  &DrawBox,            // Box draw handler
  &DrawCBox,           // CBox draw handler
  &DrawBoxRound,       // BoxRound draw handler
  &DrawCBoxRound,      // CBoxRound draw handler
  &DrawLine,           // Line draw handler
  0,                   // CLine draw handler not used
  0,                   // Polygon draw handler not used
  0,                   // CPolygon draw handler not used
  0,                   // CheckBox draw handler not used
  0,                   // RadioButton draw handler not used
  0,                   // ProgressBar draw handler not used
  0,                   // Audio draw handler not used
  0,                   // EveClock draw handler not used
  &DrawEveGauge,       // EveGauge draw handler
  0,                   // EveDial draw handler not used
  &DrawEveKeys,        // EveKeys draw handler
  0,                   // CEveKeys draw handler not used
  &DrawEveProgressBar, // EveProgressBar draw handler
  0,                   // EveScrollBar draw handler not used
  &DrawEveToggle,      // EveToggle draw handler
  0,                   // EveSlider draw handler not used
  0,                   // EveSpinner draw handler not used
  0,                   // EveScreenSaver draw handler not used
  0,                   // EveScatch draw handler not used
  &DrawEveButton,      // EveButton draw handler
  0,                   // CEveButton draw handler not used
  0,                   // EveGradient draw handler not used
  0,                   // CEveGradient draw handler not used
  &DrawEveText,        // EveText draw handler
  &DrawCEveText,       // CEveText draw handler
  0,                   // EveNumber draw handler not used
  &DrawCEveNumber      // CEveNumber draw handler
};
// ~Table of draw handler pointers

// Default configuration parameters
const TFT800Display VTFT_FT800_CONFIG_DISPLAY =
{
  48000000,        // Frequency          = main clock frequency
  0,               // OutRenderMode      = 0 normal, 1 write, 2 read
  0,               // RenderReadScanLine = scanline for read render mode
  0,               // RenderWriteTrigger = trigger for write render mode (read only)
  525,             // hCycle             = number if horizontal cycles for display
  43,              // hOffset            = horizontal offset from starting signal
  480,             // hSize              = width resolution
  0,               // hSync0             = hsync falls
  41,              // hSync1             = hsync rise
  286,             // vCycle             = number of vertical cycles for display
  12,              // vOffset            = vertical offset from start signal
  272,             // vSize              = height resolution
  0,               // vSync0             = vsync falls
  10,              // vSync1             = vsync rise
  0,               // Rotate180          = rotate display 180 degrees: 1 - rotate enable, 0 - rotate disable
  0x01B6,          // OutBits            = output bits resolution
  0,               // OutDither          = output number of bits
  0x0000,          // OutSwizzle         = output swizzle
  0,               // OutCSpread         = output clock spread enable
  1,               // PClockPolarity     = clock polarity: 0 - rising edge, 1 - falling edge
  5,               // PClock             = clock prescaler of FT800: - 0 means disable and >0 means 48MHz/pclock
};

const TFT800Touch VTFT_FT800_CONFIG_TOUCH =
{
  3,               // TouchMode        = touch screen mode (2 bits): 0 - off, 1 - oneshot, 2 - frame, 3 - continuous
  1,               // TouchADCMode     = touch screen adc mode (1 bit): 0 - singleended, 1 - differential
  6000,            // TouchCharge      = Touchscreen charge time, units of 6 clocks
  3,               // TouchSettle      = touch screen settle time - 4 bits
  7,               // TouchOversample  = touch screen oversample - 4 bits
  2000,            // TouchRZThreshold = Touchscreen resistance threshold
};

const TFT800TouchTransform VTFT_FT800_CONFIG_TOUCHTRANSFORM =
{
  0x0000808D,      // TransformA = touch matrix transformation coefficient A
  0x0000003C,      // TransformB = touch matrix transformation coefficient B
  0xFFF11B12,      // TransformC = touch matrix transformation coefficient C
  0xFFFFFE39,      // TransformD = touch matrix transformation coefficient D
  0x00004C9B,      // TransformE = touch matrix transformation coefficient E
  0xFFF37878,      // TransformF = touch matrix transformation coefficient F
};

const TFT800GPIO VTFT_FT800_CONFIG_GPIO =
{
  0xFC,            // GPIODIR = GPIO direction: 1 - output, 0 - input (8bit wide)
  0xFF,            // GPIO    = GPIO data latch
};

const TFT800PWM VTFT_FT800_CONFIG_PWM =
{
  250,             // Freq = PWM frequency - 14 bits
  128,              // Duty = PWM duty cycle, 0 to 128 is the range
};

const TFT800Interrupt VTFT_FT800_CONFIG_INTERRUPT =
{
  0,               // Enable = global interrupt enable: 1 - enabled, 0 - disabled
  255,             // Mask   = interrupt mask value (individual interrupt enable): 1 - masked/disabled, 0 - enabled
  0,               // Flags  = interrupt flags (read only)
};

const TFT800Sound VTFT_FT800_CONFIG_SOUND =
{
  0,               // Effect
  0,               // Pitch
  0,               // Volume
  0,               // Play
};

const TFT800Audio VTFT_FT800_CONFIG_AUDIO =
{
  0,               // StartAddress
  0,               // Length
  8000,            // Frequency
  0,               // Format
  0,               // Loop = audio playback mode
  0,               // Volume
  0,               // Play
};

// Global variables

TTouchStat TouchS = {0};


/////////////////////////
TScreen *CurrentScreen = 0;


TScreen SplashScreen;

TCEveText       EveTextSplashScreenName = {
  &SplashScreen,                   // EveTextSplashScreenName.OwnerScreen
  0,                               // EveTextSplashScreenName.Order
  1,                               // EveTextSplashScreenName.Visible
  255,                             // EveTextSplashScreenName.Opacity
  255,                             // EveTextSplashScreenName.Tag
  187,                             // EveTextSplashScreenName.Left
  143,                             // EveTextSplashScreenName.Top
  85,                              // EveTextSplashScreenName.Width
  17,                              // EveTextSplashScreenName.Height
  EveTextSplashScreenName_Caption, // EveTextSplashScreenName.Caption
  taNone,                          // EveTextSplashScreenName.TextAlign
  27,                              // EveTextSplashScreenName.FontName
  0x0148,                          // EveTextSplashScreenName.Font_Color
  27,                              // EveTextSplashScreenName.FontHandle
  -1UL,                            // EveTextSplashScreenName.Source
  0,                               // EveTextSplashScreenName.Active
  0,                               // EveTextSplashScreenName.OnUp
  0,                               // EveTextSplashScreenName.OnDown
  0,                               // EveTextSplashScreenName.OnClick
  0                                // EveTextSplashScreenName.OnPress
};
far const code char EveTextSplashScreenName_Caption[14] = "PathMet V 2.0";
TEveButton      EveButtonSplashInit;
TEvent          EveButtonSplashInit_OnClick;
char            EveButtonSplashInit_Caption[11] = "Initialize";
TEveText        EveTextSplashScreenStatus;
char            EveTextSplashScreenStatus_Caption[16] = "Starting up....";
TEveProgressBar EveProgressBar1;

TEveProgressBar *far const code SplashScreen_EveProgressBars[1] = {
  &EveProgressBar1      
};

TEveButton *far const code SplashScreen_EveButtons[1] = {
  &EveButtonSplashInit  
};

TEveText *far const code SplashScreen_EveTexts[1] = {
  &EveTextSplashScreenStatus 
};

TCEveText *far const code SplashScreen_CEveTexts[1] = {
  &EveTextSplashScreenName 
};


TScreen SamplingScreen;

TCBox_Round BoxRoundsmpScn1 = {
  &SamplingScreen, // BoxRoundsmpScn1.OwnerScreen
  0,               // BoxRoundsmpScn1.Order
  1,               // BoxRoundsmpScn1.Visible
  255,             // BoxRoundsmpScn1.Opacity
  255,             // BoxRoundsmpScn1.Tag
  6,               // BoxRoundsmpScn1.Left
  4,               // BoxRoundsmpScn1.Top
  170,             // BoxRoundsmpScn1.Width
  174,             // BoxRoundsmpScn1.Height
  0,               // BoxRoundsmpScn1.Pen_Width
  0x22B3,          // BoxRoundsmpScn1.Pen_Color
  0x19CD,          // BoxRoundsmpScn1.Color
  0xE71C,          // BoxRoundsmpScn1.Press_Color
  5,               // BoxRoundsmpScn1.Corner_Radius
  0,               // BoxRoundsmpScn1.Active
  0,               // BoxRoundsmpScn1.OnUp
  0,               // BoxRoundsmpScn1.OnDown
  0,               // BoxRoundsmpScn1.OnClick
  0                // BoxRoundsmpScn1.OnPress
};
TCEveText   EveTextSampScnLabel1 = {
  &SamplingScreen,              // EveTextSampScnLabel1.OwnerScreen
  1,                            // EveTextSampScnLabel1.Order
  1,                            // EveTextSampScnLabel1.Visible
  255,                          // EveTextSampScnLabel1.Opacity
  255,                          // EveTextSampScnLabel1.Tag
  29,                           // EveTextSampScnLabel1.Left
  8,                            // EveTextSampScnLabel1.Top
  60,                           // EveTextSampScnLabel1.Width
  21,                           // EveTextSampScnLabel1.Height
  EveTextSampScnLabel1_Caption, // EveTextSampScnLabel1.Caption
  taNone,                       // EveTextSampScnLabel1.TextAlign
  28,                           // EveTextSampScnLabel1.FontName
  0xFFFF,                       // EveTextSampScnLabel1.Font_Color
  28,                           // EveTextSampScnLabel1.FontHandle
  -1UL,                         // EveTextSampScnLabel1.Source
  0,                            // EveTextSampScnLabel1.Active
  0,                            // EveTextSampScnLabel1.OnUp
  0,                            // EveTextSampScnLabel1.OnDown
  0,                            // EveTextSampScnLabel1.OnClick
  0                             // EveTextSampScnLabel1.OnPress
};
far const code char EveTextSampScnLabel1_Caption[8] = "Encoder";
TCEveText   EveTextsampscnlabel2 = {
  &SamplingScreen,              // EveTextsampscnlabel2.OwnerScreen
  2,                            // EveTextsampscnlabel2.Order
  1,                            // EveTextsampscnlabel2.Visible
  255,                          // EveTextsampscnlabel2.Opacity
  255,                          // EveTextsampscnlabel2.Tag
  29,                           // EveTextsampscnlabel2.Left
  33,                           // EveTextsampscnlabel2.Top
  84,                           // EveTextsampscnlabel2.Width
  21,                           // EveTextsampscnlabel2.Height
  EveTextsampscnlabel2_Caption, // EveTextsampscnlabel2.Caption
  taNone,                       // EveTextsampscnlabel2.TextAlign
  28,                           // EveTextsampscnlabel2.FontName
  0xFFFF,                       // EveTextsampscnlabel2.Font_Color
  28,                           // EveTextsampscnlabel2.FontHandle
  -1UL,                         // EveTextsampscnlabel2.Source
  0,                            // EveTextsampscnlabel2.Active
  0,                            // EveTextsampscnlabel2.OnUp
  0,                            // EveTextsampscnlabel2.OnDown
  0,                            // EveTextsampscnlabel2.OnClick
  0                             // EveTextsampscnlabel2.OnPress
};
far const code char EveTextsampscnlabel2_Caption[12] = "Laser(inch)";
TCEveText   EveTextsampscnlabel4 = {
  &SamplingScreen,              // EveTextsampscnlabel4.OwnerScreen
  3,                            // EveTextsampscnlabel4.Order
  1,                            // EveTextsampscnlabel4.Visible
  255,                          // EveTextsampscnlabel4.Opacity
  255,                          // EveTextsampscnlabel4.Tag
  29,                           // EveTextsampscnlabel4.Left
  87,                           // EveTextsampscnlabel4.Top
  79,                           // EveTextsampscnlabel4.Width
  21,                           // EveTextsampscnlabel4.Height
  EveTextsampscnlabel4_Caption, // EveTextsampscnlabel4.Caption
  taNone,                       // EveTextsampscnlabel4.TextAlign
  28,                           // EveTextsampscnlabel4.FontName
  0xFFFF,                       // EveTextsampscnlabel4.Font_Color
  28,                           // EveTextsampscnlabel4.FontHandle
  -1UL,                         // EveTextsampscnlabel4.Source
  0,                            // EveTextsampscnlabel4.Active
  0,                            // EveTextsampscnlabel4.OnUp
  0,                            // EveTextsampscnlabel4.OnDown
  0,                            // EveTextsampscnlabel4.OnClick
  0                             // EveTextsampscnlabel4.OnPress
};
far const code char EveTextsampscnlabel4_Caption[10] = "AccXYZ(g)";
TCEveText   EveTextsampscnlabel3 = {
  &SamplingScreen,              // EveTextsampscnlabel3.OwnerScreen
  4,                            // EveTextsampscnlabel3.Order
  1,                            // EveTextsampscnlabel3.Visible
  255,                          // EveTextsampscnlabel3.Opacity
  255,                          // EveTextsampscnlabel3.Tag
  29,                           // EveTextsampscnlabel3.Left
  61,                           // EveTextsampscnlabel3.Top
  110,                          // EveTextsampscnlabel3.Width
  21,                           // EveTextsampscnlabel3.Height
  EveTextsampscnlabel3_Caption, // EveTextsampscnlabel3.Caption
  taNone,                       // EveTextsampscnlabel3.TextAlign
  28,                           // EveTextsampscnlabel3.FontName
  0xFFFF,                       // EveTextsampscnlabel3.Font_Color
  28,                           // EveTextsampscnlabel3.FontHandle
  -1UL,                         // EveTextsampscnlabel3.Source
  0,                            // EveTextsampscnlabel3.Active
  0,                            // EveTextsampscnlabel3.OnUp
  0,                            // EveTextsampscnlabel3.OnDown
  0,                            // EveTextsampscnlabel3.OnClick
  0                             // EveTextsampscnlabel3.OnPress
};
far const code char EveTextsampscnlabel3_Caption[16] = "Pich/Roll (deg)";
TCEveText   EveTextsampscnlabel5 = {
  &SamplingScreen,              // EveTextsampscnlabel5.OwnerScreen
  5,                            // EveTextsampscnlabel5.Order
  1,                            // EveTextsampscnlabel5.Visible
  255,                          // EveTextsampscnlabel5.Opacity
  255,                          // EveTextsampscnlabel5.Tag
  28,                           // EveTextsampscnlabel5.Left
  113,                          // EveTextsampscnlabel5.Top
  32,                           // EveTextsampscnlabel5.Width
  21,                           // EveTextsampscnlabel5.Height
  EveTextsampscnlabel5_Caption, // EveTextsampscnlabel5.Caption
  taNone,                       // EveTextsampscnlabel5.TextAlign
  28,                           // EveTextsampscnlabel5.FontName
  0xFFFF,                       // EveTextsampscnlabel5.Font_Color
  28,                           // EveTextsampscnlabel5.FontHandle
  -1UL,                         // EveTextsampscnlabel5.Source
  0,                            // EveTextsampscnlabel5.Active
  0,                            // EveTextsampscnlabel5.OnUp
  0,                            // EveTextsampscnlabel5.OnDown
  0,                            // EveTextsampscnlabel5.OnClick
  0                             // EveTextsampscnlabel5.OnPress
};
far const code char EveTextsampscnlabel5_Caption[4] = "GPS";
TCEveText   EveTextsampscnlabel6 = {
  &SamplingScreen,              // EveTextsampscnlabel6.OwnerScreen
  6,                            // EveTextsampscnlabel6.Order
  1,                            // EveTextsampscnlabel6.Visible
  255,                          // EveTextsampscnlabel6.Opacity
  255,                          // EveTextsampscnlabel6.Tag
  28,                           // EveTextsampscnlabel6.Left
  137,                          // EveTextsampscnlabel6.Top
  4,                            // EveTextsampscnlabel6.Width
  21,                           // EveTextsampscnlabel6.Height
  EveTextsampscnlabel6_Caption, // EveTextsampscnlabel6.Caption
  taNone,                       // EveTextsampscnlabel6.TextAlign
  28,                           // EveTextsampscnlabel6.FontName
  0xFFFF,                       // EveTextsampscnlabel6.Font_Color
  28,                           // EveTextsampscnlabel6.FontHandle
  -1UL,                         // EveTextsampscnlabel6.Source
  0,                            // EveTextsampscnlabel6.Active
  0,                            // EveTextsampscnlabel6.OnUp
  0,                            // EveTextsampscnlabel6.OnDown
  0,                            // EveTextsampscnlabel6.OnClick
  0                             // EveTextsampscnlabel6.OnPress
};
far const code char EveTextsampscnlabel6_Caption[2] = ".";
TCBox_Round BoxRoundSmpscn2 = {
  &SamplingScreen, // BoxRoundSmpscn2.OwnerScreen
  7,               // BoxRoundSmpscn2.Order
  1,               // BoxRoundSmpscn2.Visible
  255,             // BoxRoundSmpscn2.Opacity
  255,             // BoxRoundSmpscn2.Tag
  179,             // BoxRoundSmpscn2.Left
  5,               // BoxRoundSmpscn2.Top
  295,             // BoxRoundSmpscn2.Width
  172,             // BoxRoundSmpscn2.Height
  0,               // BoxRoundSmpscn2.Pen_Width
  0x0000,          // BoxRoundSmpscn2.Pen_Color
  0xC618,          // BoxRoundSmpscn2.Color
  0xE71C,          // BoxRoundSmpscn2.Press_Color
  5,               // BoxRoundSmpscn2.Corner_Radius
  0,               // BoxRoundSmpscn2.Active
  0,               // BoxRoundSmpscn2.OnUp
  0,               // BoxRoundSmpscn2.OnDown
  0,               // BoxRoundSmpscn2.OnClick
  0                // BoxRoundSmpscn2.OnPress
};
TEveText    EveTextEncoderSamp;
char        EveTextEncoderSamp_Caption[14] = "Waiting";
TEveText    EveTextLaserSmp;
char        EveTextLaserSmp_Caption[19] = "Waiting";
TEveText    EveTextPitchSmp;
char        EveTextPitchSmp_Caption[16] = "Waiting";
TEveText    EveTextGPSSmp;
char        EveTextGPSSmp_Caption[41] = "Not Ready";
TEveText    EveTextSDSmp;
char        EveTextSDSmp_Caption[2] = ".";
TEveText    EveTextRollSmp;
char        EveTextRollSmp_Caption[16] = "Waiting";
TEveText    EveTextAccx;
char        EveTextAccx_Caption[16] = "Waiting";
TEveText    EveTextAccy;
char        EveTextAccy_Caption[16] = "Waiting";
TEveText    EveTextAccz;
char        EveTextAccz_Caption[16] = "Waiting";
TBox_Round  BoxRound7;
TEveButton  EveButtonsmpJogRear;
TEvent      EveButtonsmpJogRear_OnPress;
char        EveButtonsmpJogRear_Caption[16] = "Jog to the rear";
TEveButton  EveButtonsmpJogFront;
TEvent      EveButtonsmpJogFront_OnPress;
char        EveButtonsmpJogFront_Caption[17] = "Jog to the front";
TEveButton  EveButtonsmpBack;
TEvent      EveButtonsmpBack_OnClick;
char        EveButtonsmpBack_Caption[5] = "back";
TBox_Round  BoxRound8;
TEveButton  EveButtonSmpStartSampling;
TEvent      EveButtonSmpStartSampling_OnClick;
char        EveButtonSmpStartSampling_Caption[15] = "Start sampling";
TEveButton  EveButtonSmpStopSampling;
TEvent      EveButtonSmpStopSampling_OnClick;
char        EveButtonSmpStopSampling_Caption[14] = "Stop sampling";
TEveButton  EveButtonSmpConfigureMotor;
TEvent      EveButtonSmpConfigureMotor_OnClick;
char        EveButtonSmpConfigureMotor_Caption[10] = "Jog Motor";
TEveButton  EveButtonSmpGotoProf;
TEvent      EveButtonSmpGotoProf_OnClick;
char        EveButtonSmpGotoProf_Caption[13] = "Logging Mode";
TEveButton  EveButtonsmpResetInc;
TEvent      EveButtonsmpResetInc_OnClick;
char        EveButtonsmpResetInc_Caption[17] = "Set ground plane";

TBox_Round *far const code SamplingScreen_Boxes_Round[2] = {
  &BoxRound7,           
  &BoxRound8            
};

TCBox_Round *far const code SamplingScreen_CBoxes_Round[2] = {
  &BoxRoundsmpScn1,     
  &BoxRoundSmpscn2      
};

TEveButton *far const code SamplingScreen_EveButtons[8] = {
  &EveButtonsmpJogRear, 
  &EveButtonsmpJogFront,
  &EveButtonsmpBack,    
  &EveButtonSmpStartSampling,
  &EveButtonSmpStopSampling,
  &EveButtonSmpConfigureMotor,
  &EveButtonSmpGotoProf,
  &EveButtonsmpResetInc 
};

TEveText *far const code SamplingScreen_EveTexts[9] = {
  &EveTextEncoderSamp,  
  &EveTextLaserSmp,     
  &EveTextPitchSmp,     
  &EveTextGPSSmp,       
  &EveTextSDSmp,        
  &EveTextRollSmp,      
  &EveTextAccx,         
  &EveTextAccy,         
  &EveTextAccz          
};

TCEveText *far const code SamplingScreen_CEveTexts[6] = {
  &EveTextSampScnLabel1,
  &EveTextsampscnlabel2,
  &EveTextsampscnlabel4,
  &EveTextsampscnlabel3,
  &EveTextsampscnlabel5,
  &EveTextsampscnlabel6 
};


TScreen ProfilingScreen;

TCBox       Box1 = {
  &ProfilingScreen,     // Box1.OwnerScreen
  0,                    // Box1.Order
  1,                    // Box1.Visible
  255,                  // Box1.Opacity
  255,                  // Box1.Tag
  32,                   // Box1.Left
  24,                   // Box1.Top
  235,                  // Box1.Width
  102,                  // Box1.Height
  1,                    // Box1.Pen_Width
  0x0000,               // Box1.Pen_Color
  0xDEFB,               // Box1.Color
  0xFFFF,               // Box1.Press_Color
  0xFFFF,               // Box1.ColorTo
  0xC618,               // Box1.Press_ColorTo
  _FT800_BRUSH_GR_NONE, // Box1.Gradient
  0,                    // Box1.Active
  0,                    // Box1.OnUp
  0,                    // Box1.OnDown
  0,                    // Box1.OnClick
  0                     // Box1.OnPress
};
TCEveText   EveTextProflabel1 = {
  &ProfilingScreen,          // EveTextProflabel1.OwnerScreen
  1,                         // EveTextProflabel1.Order
  1,                         // EveTextProflabel1.Visible
  255,                       // EveTextProflabel1.Opacity
  255,                       // EveTextProflabel1.Tag
  7,                         // EveTextProflabel1.Left
  3,                         // EveTextProflabel1.Top
  68,                        // EveTextProflabel1.Width
  17,                        // EveTextProflabel1.Height
  EveTextProflabel1_Caption, // EveTextProflabel1.Caption
  taNone,                    // EveTextProflabel1.TextAlign
  27,                        // EveTextProflabel1.FontName
  0x0148,                    // EveTextProflabel1.Font_Color
  27,                        // EveTextProflabel1.FontHandle
  -1UL,                      // EveTextProflabel1.Source
  0,                         // EveTextProflabel1.Active
  0,                         // EveTextProflabel1.OnUp
  0,                         // EveTextProflabel1.OnDown
  0,                         // EveTextProflabel1.OnClick
  0                          // EveTextProflabel1.OnPress
};
far const code char EveTextProflabel1_Caption[12] = "Laser(inch)";
TCEveNumber EveNumber1 = {
  &ProfilingScreen, // EveNumber1.OwnerScreen
  2,                // EveNumber1.Order
  1,                // EveNumber1.Visible
  255,              // EveNumber1.Opacity
  255,              // EveNumber1.Tag
  16,               // EveNumber1.Left
  111,              // EveNumber1.Top
  8,                // EveNumber1.Width
  17,               // EveNumber1.Height
  0,                // EveNumber1.Text_Length
  taNone,           // EveNumber1.TextAlign
  27,               // EveNumber1.FontName
  0x0148,           // EveNumber1.Font_Color
  27,               // EveNumber1.FontHandle
  -1UL,             // EveNumber1.Source
  10,                // EveNumber1.Value
  0,                // EveNumber1.Signed
  1,                // EveNumber1.Active
  0,                // EveNumber1.OnUp
  0,                // EveNumber1.OnDown
  0,                // EveNumber1.OnClick
  0                 // EveNumber1.OnPress
};
TCEveNumber EveNumber2 = {
  &ProfilingScreen, // EveNumber2.OwnerScreen
  3,                // EveNumber2.Order
  1,                // EveNumber2.Visible
  255,              // EveNumber2.Opacity
  255,              // EveNumber2.Tag
  16,               // EveNumber2.Left
  21,               // EveNumber2.Top
  8,                // EveNumber2.Width
  17,               // EveNumber2.Height
  0,                // EveNumber2.Text_Length
  taNone,           // EveNumber2.TextAlign
  27,               // EveNumber2.FontName
  0x0148,           // EveNumber2.Font_Color
  27,               // EveNumber2.FontHandle
  -1UL,             // EveNumber2.Source
  8,                // EveNumber2.Value
  0,                // EveNumber2.Signed
  1,                // EveNumber2.Active
  0,                // EveNumber2.OnUp
  0,                // EveNumber2.OnDown
  0,                // EveNumber2.OnClick
  0                 // EveNumber2.OnPress
};
TCEveNumber EveNumber3 = {
  &ProfilingScreen, // EveNumber3.OwnerScreen
  4,                // EveNumber3.Order
  1,                // EveNumber3.Visible
  255,              // EveNumber3.Opacity
  255,              // EveNumber3.Tag
  23,               // EveNumber3.Left
  69,               // EveNumber3.Top
  6,                // EveNumber3.Width
  15,               // EveNumber3.Height
  0,                // EveNumber3.Text_Length
  taNone,           // EveNumber3.TextAlign
  26,               // EveNumber3.FontName
  0x0148,           // EveNumber3.Font_Color
  26,               // EveNumber3.FontHandle
  -1UL,             // EveNumber3.Source
  9,                // EveNumber3.Value
  0,                // EveNumber3.Signed
  1,                // EveNumber3.Active
  0,                // EveNumber3.OnUp
  0,                // EveNumber3.OnDown
  0,                // EveNumber3.OnClick
  0                 // EveNumber3.OnPress
};
TCBox_Round BoxRound1 = {
  &ProfilingScreen, // BoxRound1.OwnerScreen
  5,                // BoxRound1.Order
  1,                // BoxRound1.Visible
  255,              // BoxRound1.Opacity
  255,              // BoxRound1.Tag
  270,              // BoxRound1.Left
  2,                // BoxRound1.Top
  208,              // BoxRound1.Width
  203,              // BoxRound1.Height
  1,                // BoxRound1.Pen_Width
  0x0000,           // BoxRound1.Pen_Color
  0xAD75,           // BoxRound1.Color
  0xE71C,           // BoxRound1.Press_Color
  3,                // BoxRound1.Corner_Radius
  0,                // BoxRound1.Active
  0,                // BoxRound1.OnUp
  0,                // BoxRound1.OnDown
  0,                // BoxRound1.OnClick
  0                 // BoxRound1.OnPress
};
TEveGauge   EveGaugeProfSpeed;
TCEveText   EveTextProflabel4 = {
  &ProfilingScreen,          // EveTextProflabel4.OwnerScreen
  7,                         // EveTextProflabel4.Order
  1,                         // EveTextProflabel4.Visible
  255,                       // EveTextProflabel4.Opacity
  255,                       // EveTextProflabel4.Tag
  275,                       // EveTextProflabel4.Left
  6,                         // EveTextProflabel4.Top
  61,                        // EveTextProflabel4.Width
  15,                        // EveTextProflabel4.Height
  EveTextProflabel4_Caption, // EveTextProflabel4.Caption
  taNone,                    // EveTextProflabel4.TextAlign
  26,                        // EveTextProflabel4.FontName
  0x0148,                    // EveTextProflabel4.Font_Color
  26,                        // EveTextProflabel4.FontHandle
  -1UL,                      // EveTextProflabel4.Source
  0,                         // EveTextProflabel4.Active
  0,                         // EveTextProflabel4.OnUp
  0,                         // EveTextProflabel4.OnDown
  0,                         // EveTextProflabel4.OnClick
  0                          // EveTextProflabel4.OnPress
};
far const code char EveTextProflabel4_Caption[11] = "Speed(M/S)";
TEveToggle  EveToggleProfMode;
TEvent      EveToggleProfMode_OnClick;
char        EveToggleProfMode_StateOFF_Caption[3] = "RL";
char        EveToggleProfMode_StateON_Caption[3] = "IW";
TCEveText   EveTextProflabel3 = {
  &ProfilingScreen,          // EveTextProflabel3.OwnerScreen
  9,                         // EveTextProflabel3.Order
  1,                         // EveTextProflabel3.Visible
  255,                       // EveTextProflabel3.Opacity
  255,                       // EveTextProflabel3.Tag
  380,                       // EveTextProflabel3.Left
  6,                         // EveTextProflabel3.Top
  29,                        // EveTextProflabel3.Width
  15,                        // EveTextProflabel3.Height
  EveTextProflabel3_Caption, // EveTextProflabel3.Caption
  taNone,                    // EveTextProflabel3.TextAlign
  26,                        // EveTextProflabel3.FontName
  0x0148,                    // EveTextProflabel3.Font_Color
  26,                        // EveTextProflabel3.FontHandle
  -1UL,                      // EveTextProflabel3.Source
  0,                         // EveTextProflabel3.Active
  0,                         // EveTextProflabel3.OnUp
  0,                         // EveTextProflabel3.OnDown
  0,                         // EveTextProflabel3.OnClick
  0                          // EveTextProflabel3.OnPress
};
far const code char EveTextProflabel3_Caption[5] = "Mode";
TEveButton  EveButtonProfStartProfiling;
TEvent      EveButtonProfStartProfiling_OnClick;
char        EveButtonProfStartProfiling_Caption[16] = "Start Profiling";
TEveButton  EveButtonProfStopProfiling;
TEvent      EveButtonProfStopProfiling_OnClick;
char        EveButtonProfStopProfiling_Caption[15] = "Stop Profiling";
TLine       Line1;
TLine       Line2;
TLine       Line3;
TLine       Line4;
TLine       Line5;
TLine       Line6;
TLine       Line7;
TLine       Line8;
TLine       Line9;
TLine       Line10;
TLine       Line11;
TLine       Line12;
TLine       Line13;
TLine       Line14;
TLine       Line15;
TLine       Line16;
TLine       Line17;
TLine       Line18;
TLine       Line19;
TLine       Line20;
TLine       Line21;
TLine       Line22;
TLine       Line23;
TLine       Line24;
TLine       Line25;
TLine       Line26;
TLine       Line27;
TLine       Line28;
TLine       Line29;
TLine       Line30;
TLine       Line31;
TLine       Line32;
TLine       Line33;
TLine       Line34;
TLine       Line35;
TLine       Line36;
TLine       Line37;
TLine       Line38;
TLine       Line39;
TLine       Line40;
TLine       Line41;
TLine       Line42;
TLine       Line43;
TLine       Line44;
TLine       Line45;
TLine       Line46;
TLine       Line47;
TLine       Line48;
TLine       Line49;
TLine       Line50;
TEveText    EveText1;
char        EveText1_Caption[19] = "Profile Data File:";
TEveButton  EveButtonProfCreateFile;
TEvent      EveButtonProfCreateFile_OnClick;
char        EveButtonProfCreateFile_Caption[16] = "Create a Folder";
TEveText    EveTextProfFileName;
char        EveTextProfFileName_Caption[10] = "None";
TCEveText   EveText12 = {
  &ProfilingScreen,  // EveText12.OwnerScreen
  65,                // EveText12.Order
  1,                 // EveText12.Visible
  255,               // EveText12.Opacity
  255,               // EveText12.Tag
  309,               // EveText12.Left
  26,                // EveText12.Top
  20,                // EveText12.Width
  15,                // EveText12.Height
  EveText12_Caption, // EveText12.Caption
  taNone,            // EveText12.TextAlign
  26,                // EveText12.FontName
  0x0148,            // EveText12.Font_Color
  26,                // EveText12.FontHandle
  -1UL,              // EveText12.Source
  0,                 // EveText12.Active
  0,                 // EveText12.OnUp
  0,                 // EveText12.OnDown
  0,                 // EveText12.OnClick
  0                  // EveText12.OnPress
};
far const code char EveText12_Caption[4] = "0~2";
TEveButton  EveButtonProfRough1;
TEvent      EveButtonProfRough1_OnClick;
char        EveButtonProfRough1_Caption[2] = "1";
TEveButton  EveButtonProfRough2;
TEvent      EveButtonProfRough2_OnClick;
char        EveButtonProfRough2_Caption[2] = "2";
TEveButton  EveButtonProfRough3;
TEvent      EveButtonProfRough3_OnClick;
char        EveButtonProfRough3_Caption[2] = "3";
TEveButton  EveButtonProfRough4;
TEvent      EveButtonProfRough4_OnClick;
char        EveButtonProfRough4_Caption[2] = "4";
TEveText    EveText18;
char        EveText18_Caption[15] = "Roughness Flag";
TBox        BoxProfWaitingForCam;
TEveText    EveTextProfWaitingForCam;
char        EveTextProfWaitingForCam_Caption[32] = "Waiting For Camera to finish...";

TBox *far const code ProfilingScreen_Boxes[1] = {
  &BoxProfWaitingForCam 
};

TCBox *far const code ProfilingScreen_CBoxes[1] = {
  &Box1                 
};

TCBox_Round *far const code ProfilingScreen_CBoxes_Round[1] = {
  &BoxRound1            
};

TLine *far const code ProfilingScreen_Lines[50] = {
  &Line1,               
  &Line2,               
  &Line3,               
  &Line4,               
  &Line5,               
  &Line6,               
  &Line7,               
  &Line8,               
  &Line9,               
  &Line10,              
  &Line11,              
  &Line12,              
  &Line13,              
  &Line14,              
  &Line15,              
  &Line16,              
  &Line17,              
  &Line18,              
  &Line19,              
  &Line20,              
  &Line21,              
  &Line22,              
  &Line23,              
  &Line24,              
  &Line25,              
  &Line26,              
  &Line27,              
  &Line28,              
  &Line29,              
  &Line30,              
  &Line31,              
  &Line32,              
  &Line33,              
  &Line34,              
  &Line35,              
  &Line36,              
  &Line37,              
  &Line38,              
  &Line39,              
  &Line40,              
  &Line41,              
  &Line42,              
  &Line43,              
  &Line44,              
  &Line45,              
  &Line46,              
  &Line47,              
  &Line48,              
  &Line49,              
  &Line50               
};

TEveGauge *far const code ProfilingScreen_EveGauges[1] = {
  &EveGaugeProfSpeed    
};

TEveToggle *far const code ProfilingScreen_EveToggles[1] = {
  &EveToggleProfMode    
};

TEveButton *far const code ProfilingScreen_EveButtons[7] = {
  &EveButtonProfStartProfiling,
  &EveButtonProfStopProfiling,
  &EveButtonProfCreateFile,
  &EveButtonProfRough1, 
  &EveButtonProfRough2, 
  &EveButtonProfRough3, 
  &EveButtonProfRough4  
};

TEveText *far const code ProfilingScreen_EveTexts[4] = {
  &EveText1,            
  &EveTextProfFileName, 
  &EveText18,           
  &EveTextProfWaitingForCam 
};

TCEveText *far const code ProfilingScreen_CEveTexts[4] = {
  &EveTextProflabel1,   
  &EveTextProflabel4,   
  &EveTextProflabel3,   
  &EveText12            
};

TCEveNumber *far const code ProfilingScreen_CEveNumbers[3] = {
  &EveNumber1,          
  &EveNumber2,          
  &EveNumber3           
};


TScreen SettingScreen;
TEvent  SettingScreen_OnTagChange;

TEveButton  EveButtonFNfilename;
char        EveButtonFNfilename_Caption[11] = "";
TCBox_Round BoxRound2 = {
  &SettingScreen,  // BoxRound2.OwnerScreen
  1,               // BoxRound2.Order
  1,               // BoxRound2.Visible
  255,             // BoxRound2.Opacity
  255,             // BoxRound2.Tag
  4,               // BoxRound2.Left
  89,              // BoxRound2.Top
  474,             // BoxRound2.Width
  178,             // BoxRound2.Height
  1,               // BoxRound2.Pen_Width
  0x0000,          // BoxRound2.Pen_Color
  0xC618,          // BoxRound2.Color
  0xE71C,          // BoxRound2.Press_Color
  5,               // BoxRound2.Corner_Radius
  0,               // BoxRound2.Active
  0,               // BoxRound2.OnUp
  0,               // BoxRound2.OnDown
  0,               // BoxRound2.OnClick
  0                // BoxRound2.OnPress
};
TEveKeys    EveKeys1;
char        EveKeys1_Caption[11] = "1234567890";
TEveKeys    EveKeys2;
char        EveKeys2_Caption[12] = "qwertyuiop";
TEveKeys    EveKeys3;
char        EveKeys3_Caption[11] = "asdfghjkl";
TEveKeys    EveKeys4;
char        EveKeys4_Caption[10] = "zxcvbnm_";
TCEveText   EveText2 = {
  &SettingScreen,   // EveText2.OwnerScreen
  6,                // EveText2.Order
  1,                // EveText2.Visible
  255,              // EveText2.Opacity
  255,              // EveText2.Tag
  8,                // EveText2.Left
  10,               // EveText2.Top
  226,              // EveText2.Width
  21,               // EveText2.Height
  EveText2_Caption, // EveText2.Caption
  taNone,           // EveText2.TextAlign
  28,               // EveText2.FontName
  0x0148,           // EveText2.Font_Color
  28,               // EveText2.FontHandle
  -1UL,             // EveText2.Source
  0,                // EveText2.Active
  0,                // EveText2.OnUp
  0,                // EveText2.OnDown
  0,                // EveText2.OnClick
  0                 // EveText2.OnPress
};
far const code char EveText2_Caption[33] = "Enter the name of the data file:";
TCBox_Round BoxRound3 = {
  &SettingScreen,  // BoxRound3.OwnerScreen
  7,               // BoxRound3.Order
  1,               // BoxRound3.Visible
  255,             // BoxRound3.Opacity
  255,             // BoxRound3.Tag
  4,               // BoxRound3.Left
  32,              // BoxRound3.Top
  473,             // BoxRound3.Width
  54,              // BoxRound3.Height
  1,               // BoxRound3.Pen_Width
  0x0000,          // BoxRound3.Pen_Color
  0xC618,          // BoxRound3.Color
  0xE71C,          // BoxRound3.Press_Color
  5,               // BoxRound3.Corner_Radius
  0,               // BoxRound3.Active
  0,               // BoxRound3.OnUp
  0,               // BoxRound3.OnDown
  0,               // BoxRound3.OnClick
  0                // BoxRound3.OnPress
};
TEveButton  EveButtonFNBackspace;
TEvent      EveButtonFNBackspace_OnClick;
char        EveButtonFNBackspace_Caption[10] = "Backspace";
TEveButton  EveButtonFNClear;
TEvent      EveButtonFNClear_OnClick;
char        EveButtonFNClear_Caption[10] = "Clear All";
TEveButton  EveButtonFNConfirm;
TEvent      EveButtonFNConfirm_OnClick;
char        EveButtonFNConfirm_Caption[8] = "Confirm";
TEveButton  EveButtonFNGoBack;
TEvent      EveButtonFNGoBack_OnClick;
char        EveButtonFNGoBack_Caption[8] = "Go back";
TEveButton  EveButtonFNShift;
TEvent      EveButtonFNShift_OnClick;
char        EveButtonFNShift_Caption[6] = "shift";

TCBox_Round *far const code SettingScreen_CBoxes_Round[2] = {
  &BoxRound2,           
  &BoxRound3            
};

TEveKeys *far const code SettingScreen_EveKeys[4] = {
  &EveKeys1,            
  &EveKeys2,            
  &EveKeys3,            
  &EveKeys4             
};

TEveButton *far const code SettingScreen_EveButtons[6] = {
  &EveButtonFNfilename, 
  &EveButtonFNBackspace,
  &EveButtonFNClear,    
  &EveButtonFNConfirm,  
  &EveButtonFNGoBack,   
  &EveButtonFNShift     
};

TCEveText *far const code SettingScreen_CEveTexts[1] = {
  &EveText2             
};


TScreen SummaryScreen;

TCBox_Round BoxRound4 = {
  &SummaryScreen,  // BoxRound4.OwnerScreen
  0,               // BoxRound4.Order
  1,               // BoxRound4.Visible
  255,             // BoxRound4.Opacity
  255,             // BoxRound4.Tag
  5,               // BoxRound4.Left
  8,               // BoxRound4.Top
  469,             // BoxRound4.Width
  258,             // BoxRound4.Height
  1,               // BoxRound4.Pen_Width
  0x0000,          // BoxRound4.Pen_Color
  0xD6BA,          // BoxRound4.Color
  0xE71C,          // BoxRound4.Press_Color
  3,               // BoxRound4.Corner_Radius
  0,               // BoxRound4.Active
  0,               // BoxRound4.OnUp
  0,               // BoxRound4.OnDown
  0,               // BoxRound4.OnClick
  0                // BoxRound4.OnPress
};
TCEveText   EveText3 = {
  &SummaryScreen,   // EveText3.OwnerScreen
  1,                // EveText3.Order
  1,                // EveText3.Visible
  255,              // EveText3.Opacity
  255,              // EveText3.Tag
  6,                // EveText3.Left
  10,               // EveText3.Top
  155,              // EveText3.Width
  21,               // EveText3.Height
  EveText3_Caption, // EveText3.Caption
  taNone,           // EveText3.TextAlign
  28,               // EveText3.FontName
  0x0148,           // EveText3.Font_Color
  28,               // EveText3.FontHandle
  -1UL,             // EveText3.Source
  1,                // EveText3.Active
  0,                // EveText3.OnUp
  0,                // EveText3.OnDown
  0,                // EveText3.OnClick
  0                 // EveText3.OnPress
};
far const code char EveText3_Caption[21] = "Summary of this run:";
TCEveText   EveText4 = {
  &SummaryScreen,   // EveText4.OwnerScreen
  2,                // EveText4.Order
  1,                // EveText4.Visible
  255,              // EveText4.Opacity
  255,              // EveText4.Tag
  16,               // EveText4.Left
  39,               // EveText4.Top
  100,              // EveText4.Width
  17,               // EveText4.Height
  EveText4_Caption, // EveText4.Caption
  taNone,           // EveText4.TextAlign
  27,               // EveText4.FontName
  0x0148,           // EveText4.Font_Color
  27,               // EveText4.FontHandle
  -1UL,             // EveText4.Source
  1,                // EveText4.Active
  0,                // EveText4.OnUp
  0,                // EveText4.OnDown
  0,                // EveText4.OnClick
  0                 // EveText4.OnPress
};
far const code char EveText4_Caption[17] = "Time Elapsed(s):";
TCEveText   EveText5 = {
  &SummaryScreen,   // EveText5.OwnerScreen
  3,                // EveText5.Order
  1,                // EveText5.Visible
  255,              // EveText5.Opacity
  255,              // EveText5.Tag
  16,               // EveText5.Left
  80,               // EveText5.Top
  132,              // EveText5.Width
  17,               // EveText5.Height
  EveText5_Caption, // EveText5.Caption
  taNone,           // EveText5.TextAlign
  27,               // EveText5.FontName
  0x0148,           // EveText5.Font_Color
  27,               // EveText5.FontHandle
  -1UL,             // EveText5.Source
  1,                // EveText5.Active
  0,                // EveText5.OnUp
  0,                // EveText5.OnDown
  0,                // EveText5.OnClick
  0                 // EveText5.OnPress
};
far const code char EveText5_Caption[22] = "Distance Traveled(m):";
TCEveText   EveText6 = {
  &SummaryScreen,   // EveText6.OwnerScreen
  4,                // EveText6.Order
  1,                // EveText6.Visible
  255,              // EveText6.Opacity
  255,              // EveText6.Tag
  16,               // EveText6.Left
  125,              // EveText6.Top
  95,               // EveText6.Width
  17,               // EveText6.Height
  EveText6_Caption, // EveText6.Caption
  taNone,           // EveText6.TextAlign
  27,               // EveText6.FontName
  0x0148,           // EveText6.Font_Color
  27,               // EveText6.FontHandle
  -1UL,             // EveText6.Source
  1,                // EveText6.Active
  0,                // EveText6.OnUp
  0,                // EveText6.OnDown
  0,                // EveText6.OnClick
  0                 // EveText6.OnPress
};
far const code char EveText6_Caption[16] = "Data File Name:";
TCEveText   EveText7 = {
  &SummaryScreen,   // EveText7.OwnerScreen
  5,                // EveText7.Order
  1,                // EveText7.Visible
  255,              // EveText7.Opacity
  255,              // EveText7.Tag
  16,               // EveText7.Left
  206,              // EveText7.Top
  126,              // EveText7.Width
  17,               // EveText7.Height
  EveText7_Caption, // EveText7.Caption
  taNone,           // EveText7.TextAlign
  27,               // EveText7.FontName
  0x0148,           // EveText7.Font_Color
  27,               // EveText7.FontHandle
  -1UL,             // EveText7.Source
  1,                // EveText7.Active
  0,                // EveText7.OnUp
  0,                // EveText7.OnDown
  0,                // EveText7.OnClick
  0                 // EveText7.OnPress
};
far const code char EveText7_Caption[20] = "Average Speed(m/s):";
TCBox_Round BoxRound5 = {
  &SummaryScreen,  // BoxRound5.OwnerScreen
  6,               // BoxRound5.Order
  1,               // BoxRound5.Visible
  255,             // BoxRound5.Opacity
  255,             // BoxRound5.Tag
  333,             // BoxRound5.Left
  75,              // BoxRound5.Top
  131,             // BoxRound5.Width
  182,             // BoxRound5.Height
  1,               // BoxRound5.Pen_Width
  0x0000,          // BoxRound5.Pen_Color
  0xFFFF,          // BoxRound5.Color
  0xE71C,          // BoxRound5.Press_Color
  3,               // BoxRound5.Corner_Radius
  0,               // BoxRound5.Active
  0,               // BoxRound5.OnUp
  0,               // BoxRound5.OnDown
  0,               // BoxRound5.OnClick
  0                // BoxRound5.OnPress
};
TEveButton  EveButtonSUNewRun;
TEvent      EveButtonSUNewRun_OnClick;
char        EveButtonSUNewRun_Caption[12] = "new profile";
TEveButton  EveButtonSUHelp;
TEvent      EveButtonSUHelp_OnClick;
char        EveButtonSUHelp_Caption[5] = "Help";
TEveButton  EveButtonSUAbout;
TEvent      EveButtonSUAbout_OnClick;
char        EveButtonSUAbout_Caption[6] = "About";
TEveText    EveTextSUtime;
char        EveTextSUtime_Caption[12] = "0";
TEveText    EveTextSUdistance;
char        EveTextSUdistance_Caption[12] = "0";
TEveText    EveTextSUSpeed;
char        EveTextSUSpeed_Caption[15] = "0";
TEveText    EveTextSUFilename;
char        EveTextSUFilename_Caption[10] = "None";
TEveText    EveTextSUAverageSpeed;
char        EveTextSUAverageSpeed_Caption[16] = "0";
TEveText    EveText8;
char        EveText8_Caption[11] = "Handshake:";
TBox_Round  BoxRound6;
TEveText    EveText9;
char        EveText9_Caption[9] = "Credits:";
TEveText    EveText11;
char        EveText11_Caption[55] = "Electronics: Tianyang Chen, Ian McIntyre, James Weaver";
TEveText    EveText13;
char        EveText13_Caption[45] = "Mechanical Design: Eric Sinagra, John Duvall";
TEveText    EveText14;
char        EveText14_Caption[38] = "Human Engineering Research Laboratory";
TEveText    EveText15;
char        EveText15_Caption[25] = "University of Pittsburgh";
TEveText    EveText16;
char        EveText16_Caption[18] = "VA Medical Center";
TEveText    EveText17;
char        EveText17_Caption[36] = "US and International Patent Pending";
TEveButton  EveButtonSUBack;
TEvent      EveButtonSUBack_OnClick;
char        EveButtonSUBack_Caption[5] = "Back";

TBox_Round *far const code SummaryScreen_Boxes_Round[1] = {
  &BoxRound6            
};

TCBox_Round *far const code SummaryScreen_CBoxes_Round[2] = {
  &BoxRound4,           
  &BoxRound5            
};

TEveButton *far const code SummaryScreen_EveButtons[4] = {
  &EveButtonSUNewRun,   
  &EveButtonSUHelp,     
  &EveButtonSUAbout,    
  &EveButtonSUBack      
};

TEveText *far const code SummaryScreen_EveTexts[13] = {
  &EveTextSUtime,       
  &EveTextSUdistance,   
  &EveTextSUSpeed,      
  &EveTextSUFilename,   
  &EveTextSUAverageSpeed,
  &EveText8,            
  &EveText9,            
  &EveText11,           
  &EveText13,           
  &EveText14,           
  &EveText15,           
  &EveText16,           
  &EveText17            
};

TCEveText *far const code SummaryScreen_CEveTexts[5] = {
  &EveText3,            
  &EveText4,            
  &EveText5,            
  &EveText6,            
  &EveText7             
};


static char IsInsideObject(TObjInfo *AObjInfo, unsigned int X, unsigned int Y) {
  TRect  *ptrPressRect = 0;
  TRect  *ptrPressCircle = 0;
  TCRect *ptrPressRectC = 0;
  TCRect *ptrPressCircleC = 0;

  if ((AObjInfo->HitX == X) && (AObjInfo->HitY == Y))
    return 1;

  switch (AObjInfo->Type) {
    // Box
    case VTFT_OT_BOX: {
      ptrPressRect = (TRect *)&(((TBox *)AObjInfo->Obj)->Left);
      break;
    }
    // CBox
    case VTFT_OT_CBOX: {
      ptrPressRectC = (TCRect *)&(((TCBox *)AObjInfo->Obj)->Left);
      break;
    }
    // BoxRound
    case VTFT_OT_BOXROUND: {
      ptrPressRect = (TRect *)&(((TBox_Round *)AObjInfo->Obj)->Left);
      break;
    }
    // CBoxRound
    case VTFT_OT_CBOXROUND: {
      ptrPressRectC = (TCRect *)&(((TCBox_Round *)AObjInfo->Obj)->Left);
      break;
    }
    // EveGauge
    case VTFT_OT_EVEGAUGE: {
      ptrPressCircle = (TRect *)&(((TEveGauge *)AObjInfo->Obj)->Left);
      break;
    }
    // EveKeys
    case VTFT_OT_EVEKEYS: {
      ptrPressRect = (TRect *)&(((TEveKeys *)AObjInfo->Obj)->Left);
      break;
    }
    // EveProgressBar
    case VTFT_OT_EVEPROGRESSBAR: {
      ptrPressRect = (TRect *)&(((TEveProgressBar *)AObjInfo->Obj)->Left);
      break;
    }
    // EveToggle
    case VTFT_OT_EVETOGGLE: {
      ptrPressRect = (TRect *)&(((TEveToggle *)AObjInfo->Obj)->Left);
      break;
    }
    // EveButton
    case VTFT_OT_EVEBUTTON: {
      ptrPressRect = (TRect *)&(((TEveButton *)AObjInfo->Obj)->Left);
      break;
    }
    // EveText
    case VTFT_OT_EVETEXT: {
      ptrPressRect = (TRect *)&(((TEveText *)AObjInfo->Obj)->Left);
      break;
    }
    // CEveText
    case VTFT_OT_CEVETEXT: {
      ptrPressRectC = (TCRect *)&(((TCEveText *)AObjInfo->Obj)->Left);
      break;
    }
    // CEveNumber
    case VTFT_OT_CEVENUMBER: {
      ptrPressRectC = (TCRect *)&(((TCEveNumber *)AObjInfo->Obj)->Left);
      break;
    }
  }

  if (ptrPressRect) {
    if ((ptrPressRect->Left <= X) && (ptrPressRect->Left+ptrPressRect->Width-1 >= X) &&
        (ptrPressRect->Top  <= Y) && (ptrPressRect->Top+ptrPressRect->Height-1 >= Y))
      return 1;
    }
  else if (ptrPressRectC) {
    if ((ptrPressRectC->Left <= X) && (ptrPressRectC->Left+ptrPressRectC->Width-1 >= X) &&
        (ptrPressRectC->Top  <= Y) && (ptrPressRectC->Top +ptrPressRectC->Height-1 >= Y))
      return 1;
    }
   else if (ptrPressCircle) {
    if ((ptrPressCircle->Left <= X) && (ptrPressCircle->Left+ptrPressCircle->Width*2-1 >= X) &&
        (ptrPressCircle->Top  <= Y) && (ptrPressCircle->Top+ptrPressCircle->Width*2-1 >= Y))
      return 1;
    }
   else if (ptrPressCircleC) {
    if ((ptrPressCircleC->Left <= X) && (ptrPressCircleC->Left+ptrPressCircleC->Width*2-1 >= X) &&
        (ptrPressCircleC->Top  <= Y) && (ptrPressCircleC->Top+ptrPressCircleC->Width*2-1 >= Y))
      return 1;
    }

  return 0;
}

void DrawBox(TBox *ABox) {
  if (ABox->Visible) {
    if ((VTFT_OT_BOX == TouchS.ActObjInfo.Type) && (ABox == (TBox *)TouchS.ActObjInfo.Obj)) {
      if (ABox->Gradient != _FT800_BRUSH_GR_NONE) {
        FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ABox->Gradient, ABox->Press_Color, ABox->Press_ColorTo, ABox->Opacity);
      }
      else {
        FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABox->Press_Color, ABox->Opacity);
      }
    }
    else {
      if (ABox->Gradient != _FT800_BRUSH_GR_NONE) {
        FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ABox->Gradient, ABox->Color, ABox->ColorTo, ABox->Opacity);
      }
      else {
        FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABox->Color, ABox->Opacity);
      }
    }

    FT800_Canvas_Pen(ABox->Pen_Width, ABox->Pen_Color, ABox->Opacity);

    if (ABox->Tag)
      FT800_Canvas_Tag(ABox->Tag);

    FT800_Screen_Box(ABox->Left, ABox->Top, ABox->Left+ABox->Width-1, ABox->Top+ABox->Height-1);
  }
}

void DrawCBox(TCBox *ACBox) {
  if (ACBox->Visible) {
    if ((VTFT_OT_CBOX == TouchS.ActObjInfo.Type) && (ACBox == (TCBox *)TouchS.ActObjInfo.Obj)) {
      if (ACBox->Gradient != _FT800_BRUSH_GR_NONE) {
        FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ACBox->Gradient, ACBox->Press_Color, ACBox->Press_ColorTo, ACBox->Opacity);
      }
      else {
        FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBox->Press_Color, ACBox->Opacity);
      }
    }
    else {
      if (ACBox->Gradient != _FT800_BRUSH_GR_NONE) {
        FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, ACBox->Gradient, ACBox->Color, ACBox->ColorTo, ACBox->Opacity);
      }
      else {
        FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBox->Color, ACBox->Opacity);
      }
    }

    FT800_Canvas_Pen(ACBox->Pen_Width, ACBox->Pen_Color, ACBox->Opacity);

    if (ACBox->Tag)
      FT800_Canvas_Tag(ACBox->Tag);

    FT800_Screen_Box(ACBox->Left, ACBox->Top, ACBox->Left+ACBox->Width-1, ACBox->Top+ACBox->Height-1);
  }
}

void DrawBoxRound(TBox_Round *ABoxRound) {
  if (ABoxRound->Visible) {
    if ((VTFT_OT_BOXROUND == TouchS.ActObjInfo.Type) && (ABoxRound == (TBox_Round *)TouchS.ActObjInfo.Obj))
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABoxRound->Press_Color, ABoxRound->Opacity);
    else 
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ABoxRound->Color, ABoxRound->Opacity);

    FT800_Canvas_Pen(ABoxRound->Pen_Width, ABoxRound->Pen_Color, ABoxRound->Opacity);

    if (ABoxRound->Tag)
      FT800_Canvas_Tag(ABoxRound->Tag);

    FT800_Screen_BoxRound(ABoxRound->Left, ABoxRound->Top, ABoxRound->Left+ABoxRound->Width-1, ABoxRound->Top+ABoxRound->Height-1, ABoxRound->Corner_Radius);
  }
}

void DrawCBoxRound(TCBox_Round *ACBoxRound) {
  if (ACBoxRound->Visible) {
    if ((VTFT_OT_CBOXROUND == TouchS.ActObjInfo.Type) && (ACBoxRound == (TCBox_Round *)TouchS.ActObjInfo.Obj))
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBoxRound->Press_Color, ACBoxRound->Opacity);
    else 
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, ACBoxRound->Color, ACBoxRound->Opacity);

    FT800_Canvas_Pen(ACBoxRound->Pen_Width, ACBoxRound->Pen_Color, ACBoxRound->Opacity);

    if (ACBoxRound->Tag)
      FT800_Canvas_Tag(ACBoxRound->Tag);

    FT800_Screen_BoxRound(ACBoxRound->Left, ACBoxRound->Top, ACBoxRound->Left+ACBoxRound->Width-1, ACBoxRound->Top+ACBoxRound->Height-1, ACBoxRound->Corner_Radius);
  }
}

void DrawLine(TLine *ALine) {
  if (ALine->Visible) {
    FT800_Canvas_Pen(ALine->Pen_Width, ALine->Pen_Color, ALine->Opacity);

    if (ALine->Tag)
      FT800_Canvas_Tag(ALine->Tag);

    FT800_Screen_Line(ALine->First_Point_X, ALine->First_Point_Y, ALine->Second_Point_X, ALine->Second_Point_Y);
  }
}

void DrawEveGauge(TEveGauge *AEveGauge) {
  unsigned long drawOptions;
  
  if (AEveGauge->Visible) {
    if ((VTFT_OT_EVEGAUGE == TouchS.ActObjInfo.Type) && (AEveGauge == (TEveGauge *)TouchS.ActObjInfo.Obj))
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveGauge->Press_Color, AEveGauge->Opacity);
    else 
      FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveGauge->Color, AEveGauge->Opacity);

    FT800_Canvas_Pen(AEveGauge->Pen_Width, AEveGauge->Pen_Color, AEveGauge->Opacity);

    FT800_Canvas_CPGraphics_Major(AEveGauge->Major);
    FT800_Canvas_CPGraphics_Minor(AEveGauge->Minor);

    FT800_Canvas_CPGraphics_Range(AEveGauge->Range);

    FT800_Canvas_CPGraphics_Value(AEveGauge->Value);

    if (AEveGauge->Tag)
      FT800_Canvas_Tag(AEveGauge->Tag);

    drawOptions = 0;
    if (AEveGauge->Flat)
      drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
    if (AEveGauge->NoBackground)
      drawOptions |= _FT800_CP_DRAW_OPT_NOBACK;
    if (!AEveGauge->TicksVisible)
      drawOptions |= _FT800_CP_DRAW_OPT_NOTICKS;
    if (AEveGauge->NoPointer)
      drawOptions |= _FT800_CP_DRAW_OPT_NOPTR;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_GaugeCp(AEveGauge->Left+AEveGauge->Radius, 
                       AEveGauge->Top+AEveGauge->Radius, 
                       AEveGauge->Radius);
  }
}

void DrawEveToggle(TEveToggle *AEveToggle) {
  unsigned long drawOptions;
  
  if (AEveToggle->Visible) {
    if ((VTFT_OT_EVETOGGLE == TouchS.ActObjInfo.Type) && (AEveToggle == (TEveToggle *)TouchS.ActObjInfo.Obj))
      FT800_Canvas_BrushDualColor(_FT800_BRUSH_STYLE_SOLID, AEveToggle->Press_Color, AEveToggle->Color, AEveToggle->Opacity);
    else 
      FT800_Canvas_BrushDualColor(_FT800_BRUSH_STYLE_SOLID, AEveToggle->Background_Color, AEveToggle->Color, AEveToggle->Opacity);

    if (AEveToggle->FontHandle >= 16)
      FT800_Canvas_FontSystem(AEveToggle->FontHandle, AEveToggle->Font_Color, AEveToggle->Opacity);
    else
      FT800_Canvas_Font(AEveToggle->FontHandle, AEveToggle->FontName, AEveToggle->Source, AEveToggle->Font_Color, AEveToggle->Opacity);

    if (AEveToggle->Tag)
      FT800_Canvas_Tag(AEveToggle->Tag);

    drawOptions = 0;
    if (AEveToggle->Flat)
      drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_ToggleCP(AEveToggle->Left, AEveToggle->Top, AEveToggle->Width, AEveToggle->State, AEveToggle->StateOFF_Caption, AEveToggle->StateON_Caption);
  }
}

void DrawEveProgressBar(TEveProgressBar *AEveProgressBar) {
  unsigned long drawOptions;
  
  if (AEveProgressBar->Visible) {
    FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, AEveProgressBar->Background_Color, AEveProgressBar->Opacity);

    FT800_Canvas_Pen(1, AEveProgressBar->Color, AEveProgressBar->Opacity);

    FT800_Canvas_CPGraphics_Range(AEveProgressBar->Range);

    FT800_Canvas_CPGraphics_Value(AEveProgressBar->Value);

    if (AEveProgressBar->Tag)
      FT800_Canvas_Tag(AEveProgressBar->Tag);

    drawOptions = 0;
    if (AEveProgressBar->Flat)
      drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_ProgressBarCP(AEveProgressBar->Left, AEveProgressBar->Top, AEveProgressBar->Width, AEveProgressBar->Height);
  }
}

void DrawEveKeys(TEveKeys *AEveKeys) {
  unsigned long drawOptions;
  
  if (AEveKeys->Visible) {
    FT800_Canvas_Brush(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveKeys->Color, AEveKeys->ColorTo, AEveKeys->Press_Color, AEveKeys->Opacity);

    if (AEveKeys->FontHandle >= 16)
      FT800_Canvas_FontSystem(AEveKeys->FontHandle, AEveKeys->Font_Color, AEveKeys->Opacity);
    else
      FT800_Canvas_Font(AEveKeys->FontHandle, AEveKeys->FontName, AEveKeys->Source, AEveKeys->Font_Color, AEveKeys->Opacity);

    if (AEveKeys->Tag)
      FT800_Canvas_Tag(AEveKeys->Tag);

    drawOptions = 0;
    if (AEveKeys->Flat)
      drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
    if ((VTFT_OT_EVEKEYS == TouchS.ActObjInfo.Type) && (AEveKeys == (TEveKeys *)TouchS.ActObjInfo.Obj))
      drawOptions |= TouchS.Tag;
    if (AEveKeys->AutoSize)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_KeysCP(AEveKeys->Left, AEveKeys->Top, AEveKeys->Width, AEveKeys->Height, AEveKeys->Caption);
  }
}

void DrawEveButton(TEveButton *AEveButton) {
  unsigned long drawOptions;
  
  if (AEveButton->Visible) {
    if ((VTFT_OT_EVEBUTTON == TouchS.ActObjInfo.Type) && (AEveButton == (TEveButton *)TouchS.ActObjInfo.Obj)) {
      FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveButton->Press_Color, AEveButton->Press_ColorTo, AEveButton->Opacity);
    }
    else {
      FT800_Canvas_BrushGradient(_FT800_BRUSH_STYLE_SOLID, _FT800_BRUSH_GR_BOTTOM_TO_TOP, AEveButton->Color, AEveButton->ColorTo, AEveButton->Opacity);
    }

    if (AEveButton->FontHandle >= 16)
      FT800_Canvas_FontSystem(AEveButton->FontHandle, AEveButton->Font_Color, AEveButton->Opacity);
    else
      FT800_Canvas_Font(AEveButton->FontHandle, AEveButton->FontName, AEveButton->Source, AEveButton->Font_Color, AEveButton->Opacity);

    if (AEveButton->Tag)
      FT800_Canvas_Tag(AEveButton->Tag);

    drawOptions = 0;
    if (AEveButton->Flat)
      drawOptions |= _FT800_CP_DRAW_OPT_FLAT;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_ButtonCP(AEveButton->Left, AEveButton->Top, AEveButton->Width, AEveButton->Height, AEveButton->Caption);
  }
}

void DrawEveText(TEveText *AEveText) {
  unsigned long drawOptions;
  
  if (AEveText->Visible) {
    if (AEveText->FontHandle >= 16)
      FT800_Canvas_FontSystem(AEveText->FontHandle, AEveText->Font_Color, AEveText->Opacity);
    else
      FT800_Canvas_Font(AEveText->FontHandle, AEveText->FontName, AEveText->Source, AEveText->Font_Color, AEveText->Opacity);

    if (AEveText->Tag)
      FT800_Canvas_Tag(AEveText->Tag);

    drawOptions = 0;
    if (AEveText->TextAlign == taCenter)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
    else if (AEveText->TextAlign == taCenterX)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
    else if (AEveText->TextAlign == taCenterY)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
    else if (AEveText->TextAlign == taRightX)
      drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_TextCP(AEveText->Left, AEveText->Top, AEveText->Caption);
  }
}

void DrawCEveText(TCEveText *ACEveText) {
  unsigned long drawOptions;
  
  if (ACEveText->Visible) {
    if (ACEveText->FontHandle >= 16)
      FT800_Canvas_FontSystem(ACEveText->FontHandle, ACEveText->Font_Color, ACEveText->Opacity);
    else
      FT800_Canvas_Font(ACEveText->FontHandle, ACEveText->FontName, ACEveText->Source, ACEveText->Font_Color, ACEveText->Opacity);

    if (ACEveText->Tag)
      FT800_Canvas_Tag(ACEveText->Tag);

    drawOptions = 0;
    if (ACEveText->TextAlign == taCenter)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
    else if (ACEveText->TextAlign == taCenterX)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
    else if (ACEveText->TextAlign == taCenterY)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
    else if (ACEveText->TextAlign == taRightX)
      drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_TextCP_Const(ACEveText->Left, ACEveText->Top, ACEveText->Caption);
  }
}

void DrawCEveNumber(TCEveNumber *ACEveNumber) {
  unsigned long drawOptions;
  
  if (ACEveNumber->Visible) {
    if (ACEveNumber->FontHandle >= 16)
      FT800_Canvas_FontSystem(ACEveNumber->FontHandle, ACEveNumber->Font_Color, ACEveNumber->Opacity);
    else
      FT800_Canvas_Font(ACEveNumber->FontHandle, ACEveNumber->FontName, ACEveNumber->Source, ACEveNumber->Font_Color, ACEveNumber->Opacity);

    if (ACEveNumber->Tag)
      FT800_Canvas_Tag(ACEveNumber->Tag);

    drawOptions = 0;
    if (ACEveNumber->TextAlign == taCenter)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTER;
    else if (ACEveNumber->TextAlign == taCenterX)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERX;
    else if (ACEveNumber->TextAlign == taCenterY)
      drawOptions |= _FT800_CP_DRAW_OPT_CENTERY;
    else if (ACEveNumber->TextAlign == taRightX)
      drawOptions |= _FT800_CP_DRAW_OPT_RIGHTX;
    if (ACEveNumber->Signed)
      drawOptions |= _FT800_CP_DRAW_OPT_SIGNED;
    drawOptions |= ACEveNumber->Text_Length;
    FT800_Canvas_CPGraphics_DrawingOptions(drawOptions);

    FT800_Screen_NumberCP(ACEveNumber->Left, ACEveNumber->Top, ACEveNumber->Value);
  }
}

void DrawObject(TPointer aObj, char aObjType) {
  TDrawHandler drawHandler;

  drawHandler = DrawHandlerTable[aObjType];
  if (drawHandler)
    drawHandler(aObj);
}

void DrawScreenO(TScreen *aScreen, char aOptions) {
  unsigned short cOrder, saveOrder;
  signed   int   actObjOrder;
  unsigned short pwmDuty;
  // counter variables
  char cntBox;
  char cntCBox;
  char cntBoxRound;
  char cntCBoxRound;
  char cntLine;
  char cntEveGauge;
  char cntEveKeys;
  char cntEveProgressBar;
  char cntEveToggle;
  char cntEveButton;
  char cntEveText;
  char cntCEveText;
  char cntCEveNumber;
  // pointer variables
  TBox            *far const code *pBox;
  TCBox           *far const code *pCBox;
  TBox_Round      *far const code *pBoxRound;
  TCBox_Round     *far const code *pCBoxRound;
  TLine           *far const code *pLine;
  TEveGauge       *far const code *pEveGauge;
  TEveKeys        *far const code *pEveKeys;
  TEveProgressBar *far const code *pEveProgressBar;
  TEveToggle      *far const code *pEveToggle;
  TEveButton      *far const code *pEveButton;
  TEveText        *far const code *pEveText;
  TCEveText       *far const code *pCEveText;
  TCEveNumber     *far const code *pCEveNumber;

  // process screen switching effects
  if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_FADE) {
    FT800_PWM_Get(0, &pwmDuty);
    FT800_PWM_FadeOut(pwmDuty, 0, pwmDuty/32? pwmDuty/32 : 1, 1);
  }
  else if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_OFF) {
    FT800_PWM_Get(0, &pwmDuty);
    FT800_PWM_Duty(0);
  }

  // clear active object when drawing to new screen
  if (CurrentScreen != aScreen)
    memset(&TouchS.ActObjInfo, 0, sizeof(TObjInfo));

  CurrentScreen = aScreen;

  // init counter variables
  cntBox            = CurrentScreen->BoxesCount;
  cntCBox           = CurrentScreen->CBoxesCount;
  cntBoxRound       = CurrentScreen->Boxes_RoundCount;
  cntCBoxRound      = CurrentScreen->CBoxes_RoundCount;
  cntLine           = CurrentScreen->LinesCount;
  cntEveGauge       = CurrentScreen->EveGaugesCount;
  cntEveKeys        = CurrentScreen->EveKeysCount;
  cntEveProgressBar = CurrentScreen->EveProgressBarsCount;
  cntEveToggle      = CurrentScreen->EveTogglesCount;
  cntEveButton      = CurrentScreen->EveButtonsCount;
  cntEveText        = CurrentScreen->EveTextsCount;
  cntCEveText       = CurrentScreen->CEveTextsCount;
  cntCEveNumber     = CurrentScreen->CEveNumbersCount;
  // init pointer variables
  pBox            = CurrentScreen->Boxes;
  pCBox           = CurrentScreen->CBoxes;
  pBoxRound       = CurrentScreen->Boxes_Round;
  pCBoxRound      = CurrentScreen->CBoxes_Round;
  pLine           = CurrentScreen->Lines;
  pEveGauge       = CurrentScreen->EveGauges;
  pEveKeys        = CurrentScreen->EveKeys;
  pEveProgressBar = CurrentScreen->EveProgressBars;
  pEveToggle      = CurrentScreen->EveToggles;
  pEveButton      = CurrentScreen->EveButtons;
  pEveText        = CurrentScreen->EveTexts;
  pCEveText       = CurrentScreen->CEveTexts;
  pCEveNumber     = CurrentScreen->CEveNumbers;

  FT800_Screen_BeginUpdateCP();
  FT800_Canvas_BrushSingleColor(_FT800_BRUSH_STYLE_SOLID, CurrentScreen->Color, 255);
  FT800_Canvas_Tag(0);
  FT800_Screen_Clear(_FT800_CLEAR_ALL);

  actObjOrder = -1;
  if (TouchS.ActObjInfo.Obj)
    if (TouchS.ActObjInfo.Flags & VTFT_INT_BRING_TO_FRONT)
      actObjOrder = TouchS.ActObjInfo.Order;

  cOrder = 0;
  while (cOrder < CurrentScreen->ObjectsCount) {
    saveOrder = cOrder;
    if (pBox) {
      while ((*pBox)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawBox(*pBox);
        cOrder++;
        pBox++;
        cntBox--;
        if (!cntBox) {
          pBox = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pCBox) {
      while ((*pCBox)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawCBox(*pCBox);
        cOrder++;
        pCBox++;
        cntCBox--;
        if (!cntCBox) {
          pCBox = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pBoxRound) {
      while ((*pBoxRound)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawBoxRound(*pBoxRound);
        cOrder++;
        pBoxRound++;
        cntBoxRound--;
        if (!cntBoxRound) {
          pBoxRound = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pCBoxRound) {
      while ((*pCBoxRound)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawCBoxRound(*pCBoxRound);
        cOrder++;
        pCBoxRound++;
        cntCBoxRound--;
        if (!cntCBoxRound) {
          pCBoxRound = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pLine) {
      while ((*pLine)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawLine(*pLine);
        cOrder++;
        pLine++;
        cntLine--;
        if (!cntLine) {
          pLine = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveGauge) {
      while ((*pEveGauge)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveGauge(*pEveGauge);
        cOrder++;
        pEveGauge++;
        cntEveGauge--;
        if (!cntEveGauge) {
          pEveGauge = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveKeys) {
      while ((*pEveKeys)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveKeys(*pEveKeys);
        cOrder++;
        pEveKeys++;
        cntEveKeys--;
        if (!cntEveKeys) {
          pEveKeys = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveProgressBar) {
      while ((*pEveProgressBar)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveProgressBar(*pEveProgressBar);
        cOrder++;
        pEveProgressBar++;
        cntEveProgressBar--;
        if (!cntEveProgressBar) {
          pEveProgressBar = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveToggle) {
      while ((*pEveToggle)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveToggle(*pEveToggle);
        cOrder++;
        pEveToggle++;
        cntEveToggle--;
        if (!cntEveToggle) {
          pEveToggle = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveButton) {
      while ((*pEveButton)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveButton(*pEveButton);
        cOrder++;
        pEveButton++;
        cntEveButton--;
        if (!cntEveButton) {
          pEveButton = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pEveText) {
      while ((*pEveText)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawEveText(*pEveText);
        cOrder++;
        pEveText++;
        cntEveText--;
        if (!cntEveText) {
          pEveText = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pCEveText) {
      while ((*pCEveText)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawCEveText(*pCEveText);
        cOrder++;
        pCEveText++;
        cntCEveText--;
        if (!cntCEveText) {
          pCEveText = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    if (pCEveNumber) {
      while ((*pCEveNumber)->Order == cOrder) {
        if (actObjOrder != cOrder) // draw pressed object at the end
          DrawCEveNumber(*pCEveNumber);
        cOrder++;
        pCEveNumber++;
        cntCEveNumber--;
        if (!cntCEveNumber) {
          pCEveNumber = 0;
          break;
        }
      }
      if (saveOrder != cOrder)
        continue;
    }

    cOrder++;
  }

  // draw pressed object now
  if (TouchS.ActObjInfo.Obj)
    DrawObject(TouchS.ActObjInfo.Obj, TouchS.ActObjInfo.Type);

  FT800_Screen_EndUpdate();

  FT800_Screen_Show();

  // process screen switching effects
  if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_FADE) {
    FT800_PWM_FadeIn(0, pwmDuty, 1, 3);
  }
  else if (aOptions & VTFT_DISPLAY_EFF_LIGHTS_OFF) {
    FT800_PWM_Duty(pwmDuty);
  }

}

void DrawScreen(TScreen *aScreen) {
  if (aScreen != CurrentScreen)
    DrawScreenO(aScreen, VTFT_LOAD_RES_ALL | VTFT_DISPLAY_EFF_LIGHTS_FADE);
  else
    DrawScreenO(aScreen, VTFT_LOAD_RES_NONE);
}

char GetActiveObjectByXY(int X, int Y, TObjInfo *AObjInfo) {
  char i;
  int  hiOrder;
  TBox            *pBox;
  TCBox           *pCBox;
  TBox_Round      *pBoxRound;
  TCBox_Round     *pCBoxRound;
  TEveGauge       *pEveGauge;
  TEveKeys        *pEveKeys;
  TEveProgressBar *pEveProgressBar;
  TEveToggle      *pEveToggle;
  TEveButton      *pEveButton;
  TEveText        *pEveText;
  TCEveText       *pCEveText;
  TCEveNumber     *pCEveNumber;
  far const code void *far const code *ptrCO;
  void *far const code *ptrO;

  // clear current object info
  memset(AObjInfo, 0, sizeof(TObjInfo));

  // Find object with highest order at specified position.
  // Objects lists are sorted by object order ascending.
  hiOrder = -1;

  // Box
  i    = CurrentScreen->BoxesCount;
  ptrO = CurrentScreen->Boxes+CurrentScreen->BoxesCount-1;
  while (i--) {
    pBox = (TBox *)(*ptrO);
    if (pBox->Order < hiOrder)
      break;
    if (pBox->Active) {
      if ((pBox->Left <= X) && (pBox->Left+pBox->Width-1 >= X) &&
          (pBox->Top  <= Y) && (pBox->Top+pBox->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pBox;
        AObjInfo->Type  = VTFT_OT_BOX;
        AObjInfo->Order = pBox->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pBox->Press_Color != pBox->Color) ||
            ((pBox->Gradient != _FT800_BRUSH_GR_NONE) &&
             (pBox->Press_ColorTo != pBox->ColorTo)))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pBox->Order;

        break;
      }
    }
    ptrO--;
  }

  // CBox
  i    = CurrentScreen->CBoxesCount;
  ptrCO = CurrentScreen->CBoxes+CurrentScreen->CBoxesCount-1;
  while (i--) {
    pCBox = (TCBox *)(*ptrCO);
    if (pCBox->Order < hiOrder)
      break;
    if (pCBox->Active) {
      if ((pCBox->Left <= X) && (pCBox->Left+pCBox->Width-1 >= X) &&
          (pCBox->Top  <= Y) && (pCBox->Top+pCBox->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pCBox;
        AObjInfo->Type  = VTFT_OT_CBOX;
        AObjInfo->Order = pCBox->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pCBox->Press_Color != pCBox->Color) ||
            ((pCBox->Gradient != _FT800_BRUSH_GR_NONE) &&
             (pCBox->Press_ColorTo != pCBox->ColorTo)))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pCBox->Order;

        break;
      }
    }
    ptrCO--;
  }

  // BoxRound
  i    = CurrentScreen->Boxes_RoundCount;
  ptrO = CurrentScreen->Boxes_Round+CurrentScreen->Boxes_RoundCount-1;
  while (i--) {
    pBoxRound = (TBox_Round *)(*ptrO);
    if (pBoxRound->Order < hiOrder)
      break;
    if (pBoxRound->Active) {
      if ((pBoxRound->Left <= X) && (pBoxRound->Left+pBoxRound->Width-1 >= X) &&
          (pBoxRound->Top  <= Y) && (pBoxRound->Top+pBoxRound->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pBoxRound;
        AObjInfo->Type  = VTFT_OT_BOXROUND;
        AObjInfo->Order = pBoxRound->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pBoxRound->Press_Color != pBoxRound->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pBoxRound->Order;

        break;
      }
    }
    ptrO--;
  }

  // CBoxRound
  i    = CurrentScreen->CBoxes_RoundCount;
  ptrCO = CurrentScreen->CBoxes_Round+CurrentScreen->CBoxes_RoundCount-1;
  while (i--) {
    pCBoxRound = (TCBox_Round *)(*ptrCO);
    if (pCBoxRound->Order < hiOrder)
      break;
    if (pCBoxRound->Active) {
      if ((pCBoxRound->Left <= X) && (pCBoxRound->Left+pCBoxRound->Width-1 >= X) &&
          (pCBoxRound->Top  <= Y) && (pCBoxRound->Top+pCBoxRound->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pCBoxRound;
        AObjInfo->Type  = VTFT_OT_CBOXROUND;
        AObjInfo->Order = pCBoxRound->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pCBoxRound->Press_Color != pCBoxRound->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pCBoxRound->Order;

        break;
      }
    }
    ptrCO--;
  }

  // EveGauge
  i    = CurrentScreen->EveGaugesCount;
  ptrO = CurrentScreen->EveGauges+CurrentScreen->EveGaugesCount-1;
  while (i--) {
    pEveGauge = (TEveGauge *)(*ptrO);
    if (pEveGauge->Order < hiOrder)
      break;
    if (pEveGauge->Active) {
      // for circle objects common object width is its radius property
      if ((pEveGauge->Left <= X) && (pEveGauge->Left+pEveGauge->Radius*2-1 >= X) &&
          (pEveGauge->Top  <= Y) && (pEveGauge->Top+pEveGauge->Radius*2-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pEveGauge;
        AObjInfo->Type  = VTFT_OT_EVEGAUGE;
        AObjInfo->Order = pEveGauge->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pEveGauge->Press_Color != pEveGauge->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pEveGauge->Order;

        break;
      }
    }
    ptrO--;
  }

  // EveKeys
  i    = CurrentScreen->EveKeysCount;
  ptrO = CurrentScreen->EveKeys+CurrentScreen->EveKeysCount-1;
  while (i--) {
    pEveKeys = (TEveKeys *)(*ptrO);
    if (pEveKeys->Order < hiOrder)
      break;
    if (pEveKeys->Active) {
      if ((pEveKeys->Left <= X) && (pEveKeys->Left+pEveKeys->Width-1 >= X) &&
          (pEveKeys->Top  <= Y) && (pEveKeys->Top+pEveKeys->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pEveKeys;
        AObjInfo->Type  = VTFT_OT_EVEKEYS;
        AObjInfo->Order = pEveKeys->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pEveKeys->Press_Color != pEveKeys->Color) ||
            (pEveKeys->Press_ColorTo != pEveKeys->ColorTo))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pEveKeys->Order;

        break;
      }
    }
    ptrO--;
  }

  // EveToggle
  i    = CurrentScreen->EveTogglesCount;
  ptrO = CurrentScreen->EveToggles+CurrentScreen->EveTogglesCount-1;
  while (i--) {
    pEveToggle = (TEveToggle *)(*ptrO);
    if (pEveToggle->Order < hiOrder)
      break;
    if (pEveToggle->Active) {
      if ((pEveToggle->Left <= X) && (pEveToggle->Left+pEveToggle->Width-1 >= X) &&
          (pEveToggle->Top  <= Y) && (pEveToggle->Top+pEveToggle->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pEveToggle;
        AObjInfo->Type  = VTFT_OT_EVETOGGLE;
        AObjInfo->Order = pEveToggle->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        AObjInfo->Flags |= VTFT_INT_INTRINSIC_CLICK_EFF;
        if (pEveToggle->Background_Color != pEveToggle->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pEveToggle->Order;

        break;
      }
    }
    ptrO--;
  }

  // EveButton
  i    = CurrentScreen->EveButtonsCount;
  ptrO = CurrentScreen->EveButtons+CurrentScreen->EveButtonsCount-1;
  while (i--) {
    pEveButton = (TEveButton *)(*ptrO);
    if (pEveButton->Order < hiOrder)
      break;
    if (pEveButton->Active) {
      if ((pEveButton->Left <= X) && (pEveButton->Left+pEveButton->Width-1 >= X) &&
          (pEveButton->Top  <= Y) && (pEveButton->Top+pEveButton->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pEveButton;
        AObjInfo->Type  = VTFT_OT_EVEBUTTON;
        AObjInfo->Order = pEveButton->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pEveButton->Press_Color != pEveButton->Color) ||
            (pEveButton->Press_ColorTo != pEveButton->ColorTo))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

        hiOrder         = pEveButton->Order;

        break;
      }
    }
    ptrO--;
  }

  // EveText
  i    = CurrentScreen->EveTextsCount;
  ptrO = CurrentScreen->EveTexts+CurrentScreen->EveTextsCount-1;
  while (i--) {
    pEveText = (TEveText *)(*ptrO);
    if (pEveText->Order < hiOrder)
      break;
    if (pEveText->Active) {
      if ((pEveText->Left <= X) && (pEveText->Left+pEveText->Width-1 >= X) &&
          (pEveText->Top  <= Y) && (pEveText->Top+pEveText->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pEveText;
        AObjInfo->Type  = VTFT_OT_EVETEXT;
        AObjInfo->Order = pEveText->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;

        hiOrder         = pEveText->Order;

        break;
      }
    }
    ptrO--;
  }

  // CEveText
  i    = CurrentScreen->CEveTextsCount;
  ptrCO = CurrentScreen->CEveTexts+CurrentScreen->CEveTextsCount-1;
  while (i--) {
    pCEveText = (TCEveText *)(*ptrCO);
    if (pCEveText->Order < hiOrder)
      break;
    if (pCEveText->Active) {
      if ((pCEveText->Left <= X) && (pCEveText->Left+pCEveText->Width-1 >= X) &&
          (pCEveText->Top  <= Y) && (pCEveText->Top+pCEveText->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pCEveText;
        AObjInfo->Type  = VTFT_OT_CEVETEXT;
        AObjInfo->Order = pCEveText->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;

        hiOrder         = pCEveText->Order;

        break;
      }
    }
    ptrCO--;
  }

  // CEveNumber
  i    = CurrentScreen->CEveNumbersCount;
  ptrCO = CurrentScreen->CEveNumbers+CurrentScreen->CEveNumbersCount-1;
  while (i--) {
    pCEveNumber = (TCEveNumber *)(*ptrCO);
    if (pCEveNumber->Order < hiOrder)
      break;
    if (pCEveNumber->Active) {
      if ((pCEveNumber->Left <= X) && (pCEveNumber->Left+pCEveNumber->Width-1 >= X) &&
          (pCEveNumber->Top  <= Y) && (pCEveNumber->Top+pCEveNumber->Height-1 >= Y)) {
        AObjInfo->Obj   = (TPointer)pCEveNumber;
        AObjInfo->Type  = VTFT_OT_CEVENUMBER;
        AObjInfo->Order = pCEveNumber->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;

        hiOrder         = pCEveNumber->Order;

        break;
      }
    }
    ptrCO--;
  }

  if (AObjInfo->Obj) {
    AObjInfo->HitX = X;
    AObjInfo->HitY = Y;
    return 1;
  }
  else {
    return 0;
  }
}

char GetActiveObjectByTag(char ATag, TObjInfo *AObjInfo) {
  char i;
  TBox            *pBox;
  TCBox           *pCBox;
  TBox_Round      *pBoxRound;
  TCBox_Round     *pCBoxRound;
  TEveGauge       *pEveGauge;
  TEveKeys        *pEveKeys;
  TEveProgressBar *pEveProgressBar;
  TEveToggle      *pEveToggle;
  TEveButton      *pEveButton;
  TEveText        *pEveText;
  TCEveText       *pCEveText;
  TCEveNumber     *pCEveNumber;
  far const code void *far const code *ptrCO;
  void *far const code *ptrO;

  // clear current object info
  memset(AObjInfo, 0, sizeof(TObjInfo));

  // Find object with specified tag value.

  // Box
  i    = CurrentScreen->BoxesCount;
  ptrO = CurrentScreen->Boxes+CurrentScreen->BoxesCount-1;
  while (i--) {
    pBox = (TBox *)(*ptrO);
    if (pBox->Tag == ATag) {
      if (pBox->Active) {
        AObjInfo->Obj   = (TPointer)pBox;
        AObjInfo->Type  = VTFT_OT_BOX;
        AObjInfo->Order = pBox->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pBox->Press_Color != pBox->Color) ||
            ((pBox->Gradient != _FT800_BRUSH_GR_NONE) &&
             (pBox->Press_ColorTo != pBox->ColorTo)))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // CBox
  i    = CurrentScreen->CBoxesCount;
  ptrCO = CurrentScreen->CBoxes+CurrentScreen->CBoxesCount-1;
  while (i--) {
    pCBox = (TCBox *)(*ptrCO);
    if (pCBox->Tag == ATag) {
      if (pCBox->Active) {
        AObjInfo->Obj   = (TPointer)pCBox;
        AObjInfo->Type  = VTFT_OT_CBOX;
        AObjInfo->Order = pCBox->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pCBox->Press_Color != pCBox->Color) ||
            ((pCBox->Gradient != _FT800_BRUSH_GR_NONE) &&
             (pCBox->Press_ColorTo != pCBox->ColorTo)))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrCO--;
  }

  // BoxRound
  i    = CurrentScreen->Boxes_RoundCount;
  ptrO = CurrentScreen->Boxes_Round+CurrentScreen->Boxes_RoundCount-1;
  while (i--) {
    pBoxRound = (TBox_Round *)(*ptrO);
    if (pBoxRound->Tag == ATag) {
      if (pBoxRound->Active) {
        AObjInfo->Obj   = (TPointer)pBoxRound;
        AObjInfo->Type  = VTFT_OT_BOXROUND;
        AObjInfo->Order = pBoxRound->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pBoxRound->Press_Color != pBoxRound->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // CBoxRound
  i    = CurrentScreen->CBoxes_RoundCount;
  ptrCO = CurrentScreen->CBoxes_Round+CurrentScreen->CBoxes_RoundCount-1;
  while (i--) {
    pCBoxRound = (TCBox_Round *)(*ptrCO);
    if (pCBoxRound->Tag == ATag) {
      if (pCBoxRound->Active) {
        AObjInfo->Obj   = (TPointer)pCBoxRound;
        AObjInfo->Type  = VTFT_OT_CBOXROUND;
        AObjInfo->Order = pCBoxRound->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pCBoxRound->Press_Color != pCBoxRound->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrCO--;
  }

  // EveGauge
  i    = CurrentScreen->EveGaugesCount;
  ptrO = CurrentScreen->EveGauges+CurrentScreen->EveGaugesCount-1;
  while (i--) {
    pEveGauge = (TEveGauge *)(*ptrO);
    if (pEveGauge->Tag == ATag) {
      if (pEveGauge->Active) {
        AObjInfo->Obj   = (TPointer)pEveGauge;
        AObjInfo->Type  = VTFT_OT_EVEGAUGE;
        AObjInfo->Order = pEveGauge->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if (pEveGauge->Press_Color != pEveGauge->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // EveKeys
  i    = CurrentScreen->EveKeysCount;
  ptrO = CurrentScreen->EveKeys+CurrentScreen->EveKeysCount-1;
  while (i--) {
    pEveKeys = (TEveKeys *)(*ptrO);
    if (pEveKeys->Tag == ATag) {
      if (pEveKeys->Active) {
        AObjInfo->Obj   = (TPointer)pEveKeys;
        AObjInfo->Type  = VTFT_OT_EVEKEYS;
        AObjInfo->Order = pEveKeys->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pEveKeys->Press_Color != pEveKeys->Color) ||
            (pEveKeys->Press_ColorTo != pEveKeys->ColorTo))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // EveToggle
  i    = CurrentScreen->EveTogglesCount;
  ptrO = CurrentScreen->EveToggles+CurrentScreen->EveTogglesCount-1;
  while (i--) {
    pEveToggle = (TEveToggle *)(*ptrO);
    if (pEveToggle->Tag == ATag) {
      if (pEveToggle->Active) {
        AObjInfo->Obj   = (TPointer)pEveToggle;
        AObjInfo->Type  = VTFT_OT_EVETOGGLE;
        AObjInfo->Order = pEveToggle->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        AObjInfo->Flags |= VTFT_INT_INTRINSIC_CLICK_EFF;
        if (pEveToggle->Background_Color != pEveToggle->Color)
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // EveButton
  i    = CurrentScreen->EveButtonsCount;
  ptrO = CurrentScreen->EveButtons+CurrentScreen->EveButtonsCount-1;
  while (i--) {
    pEveButton = (TEveButton *)(*ptrO);
    if (pEveButton->Tag == ATag) {
      if (pEveButton->Active) {
        AObjInfo->Obj   = (TPointer)pEveButton;
        AObjInfo->Type  = VTFT_OT_EVEBUTTON;
        AObjInfo->Order = pEveButton->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
        if ((pEveButton->Press_Color != pEveButton->Color) ||
            (pEveButton->Press_ColorTo != pEveButton->ColorTo))
          AObjInfo->Flags |= VTFT_INT_REPAINT_ON_DOWN | VTFT_INT_REPAINT_ON_UP;

      }
      break;
    }
    ptrO--;
  }

  // EveText
  i    = CurrentScreen->EveTextsCount;
  ptrO = CurrentScreen->EveTexts+CurrentScreen->EveTextsCount-1;
  while (i--) {
    pEveText = (TEveText *)(*ptrO);
    if (pEveText->Tag == ATag) {
      if (pEveText->Active) {
        AObjInfo->Obj   = (TPointer)pEveText;
        AObjInfo->Type  = VTFT_OT_EVETEXT;
        AObjInfo->Order = pEveText->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
      }
      break;
    }
    ptrO--;
  }

  // CEveText
  i    = CurrentScreen->CEveTextsCount;
  ptrCO = CurrentScreen->CEveTexts+CurrentScreen->CEveTextsCount-1;
  while (i--) {
    pCEveText = (TCEveText *)(*ptrCO);
    if (pCEveText->Tag == ATag) {
      if (pCEveText->Active) {
        AObjInfo->Obj   = (TPointer)pCEveText;
        AObjInfo->Type  = VTFT_OT_CEVETEXT;
        AObjInfo->Order = pCEveText->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
      }
      break;
    }
    ptrCO--;
  }

  // CEveNumber
  i    = CurrentScreen->CEveNumbersCount;
  ptrCO = CurrentScreen->CEveNumbers+CurrentScreen->CEveNumbersCount-1;
  while (i--) {
    pCEveNumber = (TCEveNumber *)(*ptrCO);
    if (pCEveNumber->Tag == ATag) {
      if (pCEveNumber->Active) {
        AObjInfo->Obj   = (TPointer)pCEveNumber;
        AObjInfo->Type  = VTFT_OT_CEVENUMBER;
        AObjInfo->Order = pCEveNumber->Order;
        AObjInfo->Flags = VTFT_INT_BRING_TO_FRONT;
      }
      break;
    }
    ptrCO--;
  }

  if (AObjInfo->Obj) {
    AObjInfo->HitTag = ATag;
    return 1;
  }
  else {
    return 0;
  }
}

static void ProcessEvent(TEvent *pEvent) {
  if (pEvent) {
    if (pEvent->Sound.SndAct == VTFT_SNDACT_PLAY) 
      FT800_Sound_SetAndPlay(pEvent->Sound.Effect, pEvent->Sound.Pitch, pEvent->Sound.Volume);
    else if (pEvent->Sound.SndAct == VTFT_SNDACT_STOP) 
      FT800_Sound_Stop();
    if (pEvent->Action) 
      pEvent->Action();
  }
}

static void ProcessCEvent(TCEvent *pEventC) {
  if (pEventC) {
    if (pEventC->Sound.SndAct == VTFT_SNDACT_PLAY) 
      FT800_Sound_SetAndPlay(pEventC->Sound.Effect, pEventC->Sound.Pitch, pEventC->Sound.Volume);
    else if (pEventC->Sound.SndAct == VTFT_SNDACT_STOP) 
      FT800_Sound_Stop();
    if (pEventC->Action) 
      pEventC->Action();
  }
}

static void OnEvent(TObjInfo *AObjInfo, char AEventType){
  TEvent **ppEvent;
  TEvent  *pEvent = 0;
  TCEvent *far const code *ppEventC;
  TCEvent *pEventC = 0;

  switch (AObjInfo->Type) {
    // Box
    case VTFT_OT_BOX: {
      ppEvent = &(((TBox *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // CBox
    case VTFT_OT_CBOX: {
      ppEventC = &(((TCBox *)AObjInfo->Obj)->OnUp);
      pEventC  = ppEventC[AEventType];
      break;
    }
    // BoxRound
    case VTFT_OT_BOXROUND: {
      ppEvent = &(((TBox_Round *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // CBoxRound
    case VTFT_OT_CBOXROUND: {
      ppEventC = &(((TCBox_Round *)AObjInfo->Obj)->OnUp);
      pEventC  = ppEventC[AEventType];
      break;
    }
    // EveGauge
    case VTFT_OT_EVEGAUGE: {
      ppEvent = &(((TEveGauge *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // EveKeys
    case VTFT_OT_EVEKEYS: {
      ppEvent = &(((TEveKeys *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // EveToggle
    case VTFT_OT_EVETOGGLE: {
      ppEvent = &(((TEveToggle *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // EveButton
    case VTFT_OT_EVEBUTTON: {
      ppEvent = &(((TEveButton *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // EveText
    case VTFT_OT_EVETEXT: {
      ppEvent = &(((TEveText *)AObjInfo->Obj)->OnUp);
      pEvent  = ppEvent[AEventType];
      break;
    }
    // CEveText
    case VTFT_OT_CEVETEXT: {
      ppEventC = &(((TCEveText *)AObjInfo->Obj)->OnUp);
      pEventC  = ppEventC[AEventType];
      break;
    }
    // CEveNumber
    case VTFT_OT_CEVENUMBER: {
      ppEventC = &(((TCEveNumber *)AObjInfo->Obj)->OnUp);
      pEventC  = ppEventC[AEventType];
      break;
    }
  } // end switch

  if (pEvent) {
    ProcessEvent(pEvent);
  }

  if (pEventC) {
    ProcessCEvent(pEventC);
  }
}

static void ProcessIntrinsicClickEffects(TObjInfo *AObjInfo) {
  char i;
  int  toggleStepVal;
  const char TOGGLE_STEP_CNT = 15;

  if (!(AObjInfo->Flags & VTFT_INT_INTRINSIC_CLICK_EFF))
    return;

  switch (AObjInfo->Type) {
    case VTFT_OT_EVETOGGLE:
    {
      toggleStepVal = 65535/TOGGLE_STEP_CNT;
      if (((TEveToggle *)AObjInfo->Obj)->State)
      {
        toggleStepVal = -toggleStepVal;
      }
      for (i=0; i<TOGGLE_STEP_CNT; i++)
      {
        ((TEveToggle *)AObjInfo->Obj)->State += toggleStepVal;
        DrawScreen(CurrentScreen);
      }
      AObjInfo->Flags &= ~VTFT_INT_REPAINT_ON_UP;
      break;
    }
  }
}

static void Process_TP_Press() {
  // Screen Event
  if (CurrentScreen->Active)
    if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
      ProcessEvent(CurrentScreen->OnPress);

  // Object Event
  if (!TouchS.ActObjInfo.Obj)
    return;

  OnEvent(&TouchS.ActObjInfo, VTFT_EVT_PRESS);
}

static void Process_TP_Up() {
  char     isClick;
  TObjInfo actObj;

  // Screen Event
  if (CurrentScreen->Active)
    if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
      ProcessEvent(CurrentScreen->OnUp);

  actObj = TouchS.ActObjInfo;
  // Cler active object info
  memset(&TouchS.ActObjInfo, 0, sizeof(TObjInfo));

  // Object Event
  if (!actObj.Obj)
    return;

  isClick = IsInsideObject(&actObj, TouchS.X, TouchS.Y);

  if (isClick) {
    ProcessIntrinsicClickEffects(&actObj);
  }

  if (actObj.Flags & VTFT_INT_REPAINT_ON_UP)
    DrawScreen(CurrentScreen);

  OnEvent(&actObj, VTFT_EVT_UP);
  if (isClick)
    OnEvent(&actObj, VTFT_EVT_CLICK);
}

static void Process_TP_Down() {
  // Search for active object
  if (TouchS.Tag) {        // objects must not have zero for tag value
    if (TouchS.Tag != 255) // can not search objects by default tag value
      GetActiveObjectByTag(TouchS.Tag, &TouchS.ActObjInfo);
    if (!TouchS.ActObjInfo.Obj) // object not found by tag, search by coordinates
      GetActiveObjectByXY(TouchS.X, TouchS.Y, &TouchS.ActObjInfo);
  }

  // Screen Event
  if (CurrentScreen->Active)
    if ((CurrentScreen->SniffObjectEvents) || (!TouchS.ActObjInfo.Obj))
      ProcessEvent(CurrentScreen->OnDown);

  // Object Event
  if (!TouchS.ActObjInfo.Obj)
    return;

  if (TouchS.ActObjInfo.Flags & VTFT_INT_REPAINT_ON_DOWN)
    DrawScreen(CurrentScreen);

  OnEvent(&TouchS.ActObjInfo, VTFT_EVT_DOWN);
}

static void Process_TP_TagChange() {
  // Screen Event
  if (CurrentScreen->Active)
    ProcessEvent(CurrentScreen->OnTagChange);
}

void ProcessVTFTStack() {
  char         Tag, oldTag;
  unsigned int X, Y;

  oldTag = TouchS.Tag;

  if (FT800_Touch_GetTagXY(&X, &Y) == 1) {
    FT800_Touch_GetTag(&Tag);

    TouchS.Tag = Tag;
    TouchS.X = X;
    TouchS.Y = Y;

    if (!TouchS.Pressed) {
      TouchS.Pressed = 1;
      Process_TP_Down();
    }

    Process_TP_Press();
  }
  else if (TouchS.Pressed) {
    Process_TP_Up();

    TouchS.Tag = 0;
    TouchS.X   = X;
    TouchS.Y   = Y;

    TouchS.Pressed = 0;
  }

  if (oldTag != TouchS.Tag)
    Process_TP_TagChange();
}

static void InitObjects() {
  // SplashScreen: Init block start
  SplashScreen.Color                = 0xFFFF;
  SplashScreen.Width                = 480;
  SplashScreen.Height               = 272;
  SplashScreen.ObjectsCount         = 4;
  SplashScreen.BoxesCount           = 0;
  SplashScreen.Boxes                = 0;
  SplashScreen.CBoxesCount          = 0;
  SplashScreen.CBoxes               = 0;
  SplashScreen.Boxes_RoundCount     = 0;
  SplashScreen.Boxes_Round          = 0;
  SplashScreen.CBoxes_RoundCount    = 0;
  SplashScreen.CBoxes_Round         = 0;
  SplashScreen.LinesCount           = 0;
  SplashScreen.Lines                = 0;
  SplashScreen.EveGaugesCount       = 0;
  SplashScreen.EveGauges            = 0;
  SplashScreen.EveKeysCount         = 0;
  SplashScreen.EveKeys              = 0;
  SplashScreen.EveProgressBarsCount = 1;
  SplashScreen.EveProgressBars      = SplashScreen_EveProgressBars;
  SplashScreen.EveTogglesCount      = 0;
  SplashScreen.EveToggles           = 0;
  SplashScreen.EveButtonsCount      = 1;
  SplashScreen.EveButtons           = SplashScreen_EveButtons;
  SplashScreen.EveTextsCount        = 1;
  SplashScreen.EveTexts             = SplashScreen_EveTexts;
  SplashScreen.CEveTextsCount       = 1;
  SplashScreen.CEveTexts            = SplashScreen_CEveTexts;
  SplashScreen.CEveNumbersCount     = 0;
  SplashScreen.CEveNumbers          = 0;
  SplashScreen.DynResStart          = 0;
  SplashScreen.Active               = 0;
  SplashScreen.SniffObjectEvents    = 0;
  SplashScreen.OnUp                 = 0;
  SplashScreen.OnDown               = 0;
  SplashScreen.OnTagChange          = 0;
  SplashScreen.OnPress              = 0;

  // SamplingScreen: Init block start
  SamplingScreen.Color                = 0xFFFF;
  SamplingScreen.Width                = 480;
  SamplingScreen.Height               = 272;
  SamplingScreen.ObjectsCount         = 27;
  SamplingScreen.BoxesCount           = 0;
  SamplingScreen.Boxes                = 0;
  SamplingScreen.CBoxesCount          = 0;
  SamplingScreen.CBoxes               = 0;
  SamplingScreen.Boxes_RoundCount     = 2;
  SamplingScreen.Boxes_Round          = SamplingScreen_Boxes_Round;
  SamplingScreen.CBoxes_RoundCount    = 2;
  SamplingScreen.CBoxes_Round         = SamplingScreen_CBoxes_Round;
  SamplingScreen.LinesCount           = 0;
  SamplingScreen.Lines                = 0;
  SamplingScreen.EveGaugesCount       = 0;
  SamplingScreen.EveGauges            = 0;
  SamplingScreen.EveKeysCount         = 0;
  SamplingScreen.EveKeys              = 0;
  SamplingScreen.EveProgressBarsCount = 0;
  SamplingScreen.EveProgressBars      = 0;
  SamplingScreen.EveTogglesCount      = 0;
  SamplingScreen.EveToggles           = 0;
  SamplingScreen.EveButtonsCount      = 8;
  SamplingScreen.EveButtons           = SamplingScreen_EveButtons;
  SamplingScreen.EveTextsCount        = 9;
  SamplingScreen.EveTexts             = SamplingScreen_EveTexts;
  SamplingScreen.CEveTextsCount       = 6;
  SamplingScreen.CEveTexts            = SamplingScreen_CEveTexts;
  SamplingScreen.CEveNumbersCount     = 0;
  SamplingScreen.CEveNumbers          = 0;
  SamplingScreen.DynResStart          = 0;
  SamplingScreen.Active               = 0;
  SamplingScreen.SniffObjectEvents    = 0;
  SamplingScreen.OnUp                 = 0;
  SamplingScreen.OnDown               = 0;
  SamplingScreen.OnTagChange          = 0;
  SamplingScreen.OnPress              = 0;

  // ProfilingScreen: Init block start
  ProfilingScreen.Color                = 0xFFFF;
  ProfilingScreen.Width                = 480;
  ProfilingScreen.Height               = 272;
  ProfilingScreen.ObjectsCount         = 73;
  ProfilingScreen.BoxesCount           = 1;
  ProfilingScreen.Boxes                = ProfilingScreen_Boxes;
  ProfilingScreen.CBoxesCount          = 1;
  ProfilingScreen.CBoxes               = ProfilingScreen_CBoxes;
  ProfilingScreen.Boxes_RoundCount     = 0;
  ProfilingScreen.Boxes_Round          = 0;
  ProfilingScreen.CBoxes_RoundCount    = 1;
  ProfilingScreen.CBoxes_Round         = ProfilingScreen_CBoxes_Round;
  ProfilingScreen.LinesCount           = 50;
  ProfilingScreen.Lines                = ProfilingScreen_Lines;
  ProfilingScreen.EveGaugesCount       = 1;
  ProfilingScreen.EveGauges            = ProfilingScreen_EveGauges;
  ProfilingScreen.EveKeysCount         = 0;
  ProfilingScreen.EveKeys              = 0;
  ProfilingScreen.EveProgressBarsCount = 0;
  ProfilingScreen.EveProgressBars      = 0;
  ProfilingScreen.EveTogglesCount      = 1;
  ProfilingScreen.EveToggles           = ProfilingScreen_EveToggles;
  ProfilingScreen.EveButtonsCount      = 7;
  ProfilingScreen.EveButtons           = ProfilingScreen_EveButtons;
  ProfilingScreen.EveTextsCount        = 4;
  ProfilingScreen.EveTexts             = ProfilingScreen_EveTexts;
  ProfilingScreen.CEveTextsCount       = 4;
  ProfilingScreen.CEveTexts            = ProfilingScreen_CEveTexts;
  ProfilingScreen.CEveNumbersCount     = 3;
  ProfilingScreen.CEveNumbers          = ProfilingScreen_CEveNumbers;
  ProfilingScreen.DynResStart          = 0;
  ProfilingScreen.Active               = 1;
  ProfilingScreen.SniffObjectEvents    = 0;
  ProfilingScreen.OnUp                 = 0;
  ProfilingScreen.OnDown               = 0;
  ProfilingScreen.OnTagChange          = 0;
  ProfilingScreen.OnPress              = 0;

  // SettingScreen: Init block start
  SettingScreen.Color                = 0xFFFF;
  SettingScreen.Width                = 480;
  SettingScreen.Height               = 272;
  SettingScreen.ObjectsCount         = 13;
  SettingScreen.BoxesCount           = 0;
  SettingScreen.Boxes                = 0;
  SettingScreen.CBoxesCount          = 0;
  SettingScreen.CBoxes               = 0;
  SettingScreen.Boxes_RoundCount     = 0;
  SettingScreen.Boxes_Round          = 0;
  SettingScreen.CBoxes_RoundCount    = 2;
  SettingScreen.CBoxes_Round         = SettingScreen_CBoxes_Round;
  SettingScreen.LinesCount           = 0;
  SettingScreen.Lines                = 0;
  SettingScreen.EveGaugesCount       = 0;
  SettingScreen.EveGauges            = 0;
  SettingScreen.EveKeysCount         = 4;
  SettingScreen.EveKeys              = SettingScreen_EveKeys;
  SettingScreen.EveProgressBarsCount = 0;
  SettingScreen.EveProgressBars      = 0;
  SettingScreen.EveTogglesCount      = 0;
  SettingScreen.EveToggles           = 0;
  SettingScreen.EveButtonsCount      = 6;
  SettingScreen.EveButtons           = SettingScreen_EveButtons;
  SettingScreen.EveTextsCount        = 0;
  SettingScreen.EveTexts             = 0;
  SettingScreen.CEveTextsCount       = 1;
  SettingScreen.CEveTexts            = SettingScreen_CEveTexts;
  SettingScreen.CEveNumbersCount     = 0;
  SettingScreen.CEveNumbers          = 0;
  SettingScreen.DynResStart          = 0;
  SettingScreen.Active               = 1;
  SettingScreen.SniffObjectEvents    = 1;
  SettingScreen.OnUp                 = 0;
  SettingScreen.OnDown               = 0;
  SettingScreen.OnTagChange          = &SettingScreen_OnTagChange;
  SettingScreen.OnPress              = 0;

  SettingScreen_OnTagChange.Action       = SettingScreenOnTagChange;
  SettingScreen_OnTagChange.Sound.SndAct = VTFT_SNDACT_NONE;
  SettingScreen_OnTagChange.Sound.Effect = 0;
  SettingScreen_OnTagChange.Sound.Pitch  = 0;
  SettingScreen_OnTagChange.Sound.Volume = 0;

  // SummaryScreen: Init block start
  SummaryScreen.Color                = 0xFFFF;
  SummaryScreen.Width                = 480;
  SummaryScreen.Height               = 272;
  SummaryScreen.ObjectsCount         = 25;
  SummaryScreen.BoxesCount           = 0;
  SummaryScreen.Boxes                = 0;
  SummaryScreen.CBoxesCount          = 0;
  SummaryScreen.CBoxes               = 0;
  SummaryScreen.Boxes_RoundCount     = 1;
  SummaryScreen.Boxes_Round          = SummaryScreen_Boxes_Round;
  SummaryScreen.CBoxes_RoundCount    = 2;
  SummaryScreen.CBoxes_Round         = SummaryScreen_CBoxes_Round;
  SummaryScreen.LinesCount           = 0;
  SummaryScreen.Lines                = 0;
  SummaryScreen.EveGaugesCount       = 0;
  SummaryScreen.EveGauges            = 0;
  SummaryScreen.EveKeysCount         = 0;
  SummaryScreen.EveKeys              = 0;
  SummaryScreen.EveProgressBarsCount = 0;
  SummaryScreen.EveProgressBars      = 0;
  SummaryScreen.EveTogglesCount      = 0;
  SummaryScreen.EveToggles           = 0;
  SummaryScreen.EveButtonsCount      = 4;
  SummaryScreen.EveButtons           = SummaryScreen_EveButtons;
  SummaryScreen.EveTextsCount        = 13;
  SummaryScreen.EveTexts             = SummaryScreen_EveTexts;
  SummaryScreen.CEveTextsCount       = 5;
  SummaryScreen.CEveTexts            = SummaryScreen_CEveTexts;
  SummaryScreen.CEveNumbersCount     = 0;
  SummaryScreen.CEveNumbers          = 0;
  SummaryScreen.DynResStart          = 0;
  SummaryScreen.Active               = 0;
  SummaryScreen.SniffObjectEvents    = 0;
  SummaryScreen.OnUp                 = 0;
  SummaryScreen.OnDown               = 0;
  SummaryScreen.OnTagChange          = 0;
  SummaryScreen.OnPress              = 0;

  EveButtonSplashInit.OwnerScreen   = &SplashScreen;
  EveButtonSplashInit.Order         = 1;
  EveButtonSplashInit.Visible       = 1;
  EveButtonSplashInit.Opacity       = 255;
  EveButtonSplashInit.Tag           = 255;
  EveButtonSplashInit.Left          = 150;
  EveButtonSplashInit.Top           = 185;
  EveButtonSplashInit.Width         = 170;
  EveButtonSplashInit.Height        = 69;
  EveButtonSplashInit.Color         = 0x0335;
  EveButtonSplashInit.Press_Color   = 0x7E3F;
  EveButtonSplashInit.ColorTo       = 0x7E3F;
  EveButtonSplashInit.Press_ColorTo = 0x03DA;
  EveButtonSplashInit.Caption       = EveButtonSplashInit_Caption;
  EveButtonSplashInit.FontName      = 27;
  EveButtonSplashInit.Font_Color    = 0xFFFF;
  EveButtonSplashInit.FontHandle    = 27;
  EveButtonSplashInit.Source        = -1UL;
  EveButtonSplashInit.Flat          = 0;
  EveButtonSplashInit.Active        = 1;
  EveButtonSplashInit.OnUp          = 0;
  EveButtonSplashInit.OnDown        = 0;
  EveButtonSplashInit.OnClick       = &EveButtonSplashInit_OnClick;
  EveButtonSplashInit.OnPress       = 0;

  EveButtonSplashInit_OnClick.Action       = EveButtonSplashInitOnClick;
  EveButtonSplashInit_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSplashInit_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSplashInit_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSplashInit_OnClick.Sound.Volume = 255;

  EveTextSplashScreenStatus.OwnerScreen = &SplashScreen;
  EveTextSplashScreenStatus.Order       = 2;
  EveTextSplashScreenStatus.Visible     = 0;
  EveTextSplashScreenStatus.Opacity     = 255;
  EveTextSplashScreenStatus.Tag         = 255;
  EveTextSplashScreenStatus.Left        = 196;
  EveTextSplashScreenStatus.Top         = 162;
  EveTextSplashScreenStatus.Width       = 68;
  EveTextSplashScreenStatus.Height      = 15;
  EveTextSplashScreenStatus.Caption     = EveTextSplashScreenStatus_Caption;
  EveTextSplashScreenStatus.TextAlign   = taNone;
  EveTextSplashScreenStatus.FontName    = 26;
  EveTextSplashScreenStatus.Font_Color  = 0x0148;
  EveTextSplashScreenStatus.FontHandle  = 26;
  EveTextSplashScreenStatus.Source      = -1UL;
  EveTextSplashScreenStatus.Active      = 0;
  EveTextSplashScreenStatus.OnUp        = 0;
  EveTextSplashScreenStatus.OnDown      = 0;
  EveTextSplashScreenStatus.OnClick     = 0;
  EveTextSplashScreenStatus.OnPress     = 0;

  EveProgressBar1.OwnerScreen      = &SplashScreen;
  EveProgressBar1.Order            = 3;
  EveProgressBar1.Visible          = 0;
  EveProgressBar1.Opacity          = 255;
  EveProgressBar1.Tag              = 255;
  EveProgressBar1.Left             = 34;
  EveProgressBar1.Top              = 211;
  EveProgressBar1.Width            = 404;
  EveProgressBar1.Height           = 26;
  EveProgressBar1.Background_Color = 0x0000;
  EveProgressBar1.Color            = 0x65BC;
  EveProgressBar1.Value            = 0;
  EveProgressBar1.Range            = 100;
  EveProgressBar1.Flat             = 0;

  EveTextEncoderSamp.OwnerScreen = &SamplingScreen;
  EveTextEncoderSamp.Order       = 8;
  EveTextEncoderSamp.Visible     = 1;
  EveTextEncoderSamp.Opacity     = 255;
  EveTextEncoderSamp.Tag         = 255;
  EveTextEncoderSamp.Left        = 190;
  EveTextEncoderSamp.Top         = 12;
  EveTextEncoderSamp.Width       = 45;
  EveTextEncoderSamp.Height      = 17;
  EveTextEncoderSamp.Caption     = EveTextEncoderSamp_Caption;
  EveTextEncoderSamp.TextAlign   = taNone;
  EveTextEncoderSamp.FontName    = 27;
  EveTextEncoderSamp.Font_Color  = 0x0148;
  EveTextEncoderSamp.FontHandle  = 27;
  EveTextEncoderSamp.Source      = -1UL;
  EveTextEncoderSamp.Active      = 1;
  EveTextEncoderSamp.OnUp        = 0;
  EveTextEncoderSamp.OnDown      = 0;
  EveTextEncoderSamp.OnClick     = 0;
  EveTextEncoderSamp.OnPress     = 0;

  EveTextLaserSmp.OwnerScreen = &SamplingScreen;
  EveTextLaserSmp.Order       = 9;
  EveTextLaserSmp.Visible     = 1;
  EveTextLaserSmp.Opacity     = 255;
  EveTextLaserSmp.Tag         = 255;
  EveTextLaserSmp.Left        = 190;
  EveTextLaserSmp.Top         = 36;
  EveTextLaserSmp.Width       = 45;
  EveTextLaserSmp.Height      = 17;
  EveTextLaserSmp.Caption     = EveTextLaserSmp_Caption;
  EveTextLaserSmp.TextAlign   = taNone;
  EveTextLaserSmp.FontName    = 27;
  EveTextLaserSmp.Font_Color  = 0x0148;
  EveTextLaserSmp.FontHandle  = 27;
  EveTextLaserSmp.Source      = -1UL;
  EveTextLaserSmp.Active      = 1;
  EveTextLaserSmp.OnUp        = 0;
  EveTextLaserSmp.OnDown      = 0;
  EveTextLaserSmp.OnClick     = 0;
  EveTextLaserSmp.OnPress     = 0;

  EveTextPitchSmp.OwnerScreen = &SamplingScreen;
  EveTextPitchSmp.Order       = 10;
  EveTextPitchSmp.Visible     = 1;
  EveTextPitchSmp.Opacity     = 255;
  EveTextPitchSmp.Tag         = 255;
  EveTextPitchSmp.Left        = 190;
  EveTextPitchSmp.Top         = 64;
  EveTextPitchSmp.Width       = 45;
  EveTextPitchSmp.Height      = 17;
  EveTextPitchSmp.Caption     = EveTextPitchSmp_Caption;
  EveTextPitchSmp.TextAlign   = taNone;
  EveTextPitchSmp.FontName    = 27;
  EveTextPitchSmp.Font_Color  = 0x0148;
  EveTextPitchSmp.FontHandle  = 27;
  EveTextPitchSmp.Source      = -1UL;
  EveTextPitchSmp.Active      = 1;
  EveTextPitchSmp.OnUp        = 0;
  EveTextPitchSmp.OnDown      = 0;
  EveTextPitchSmp.OnClick     = 0;
  EveTextPitchSmp.OnPress     = 0;

  EveTextGPSSmp.OwnerScreen = &SamplingScreen;
  EveTextGPSSmp.Order       = 11;
  EveTextGPSSmp.Visible     = 1;
  EveTextGPSSmp.Opacity     = 255;
  EveTextGPSSmp.Tag         = 255;
  EveTextGPSSmp.Left        = 190;
  EveTextGPSSmp.Top         = 117;
  EveTextGPSSmp.Width       = 62;
  EveTextGPSSmp.Height      = 17;
  EveTextGPSSmp.Caption     = EveTextGPSSmp_Caption;
  EveTextGPSSmp.TextAlign   = taNone;
  EveTextGPSSmp.FontName    = 27;
  EveTextGPSSmp.Font_Color  = 0x0148;
  EveTextGPSSmp.FontHandle  = 27;
  EveTextGPSSmp.Source      = -1UL;
  EveTextGPSSmp.Active      = 0;
  EveTextGPSSmp.OnUp        = 0;
  EveTextGPSSmp.OnDown      = 0;
  EveTextGPSSmp.OnClick     = 0;
  EveTextGPSSmp.OnPress     = 0;

  EveTextSDSmp.OwnerScreen = &SamplingScreen;
  EveTextSDSmp.Order       = 12;
  EveTextSDSmp.Visible     = 1;
  EveTextSDSmp.Opacity     = 255;
  EveTextSDSmp.Tag         = 255;
  EveTextSDSmp.Left        = 190;
  EveTextSDSmp.Top         = 142;
  EveTextSDSmp.Width       = 4;
  EveTextSDSmp.Height      = 17;
  EveTextSDSmp.Caption     = EveTextSDSmp_Caption;
  EveTextSDSmp.TextAlign   = taNone;
  EveTextSDSmp.FontName    = 27;
  EveTextSDSmp.Font_Color  = 0x0148;
  EveTextSDSmp.FontHandle  = 27;
  EveTextSDSmp.Source      = -1UL;
  EveTextSDSmp.Active      = 1;
  EveTextSDSmp.OnUp        = 0;
  EveTextSDSmp.OnDown      = 0;
  EveTextSDSmp.OnClick     = 0;
  EveTextSDSmp.OnPress     = 0;

  EveTextRollSmp.OwnerScreen = &SamplingScreen;
  EveTextRollSmp.Order       = 13;
  EveTextRollSmp.Visible     = 1;
  EveTextRollSmp.Opacity     = 255;
  EveTextRollSmp.Tag         = 255;
  EveTextRollSmp.Left        = 354;
  EveTextRollSmp.Top         = 66;
  EveTextRollSmp.Width       = 45;
  EveTextRollSmp.Height      = 17;
  EveTextRollSmp.Caption     = EveTextRollSmp_Caption;
  EveTextRollSmp.TextAlign   = taNone;
  EveTextRollSmp.FontName    = 27;
  EveTextRollSmp.Font_Color  = 0x0148;
  EveTextRollSmp.FontHandle  = 27;
  EveTextRollSmp.Source      = -1UL;
  EveTextRollSmp.Active      = 1;
  EveTextRollSmp.OnUp        = 0;
  EveTextRollSmp.OnDown      = 0;
  EveTextRollSmp.OnClick     = 0;
  EveTextRollSmp.OnPress     = 0;

  EveTextAccx.OwnerScreen = &SamplingScreen;
  EveTextAccx.Order       = 14;
  EveTextAccx.Visible     = 1;
  EveTextAccx.Opacity     = 255;
  EveTextAccx.Tag         = 255;
  EveTextAccx.Left        = 190;
  EveTextAccx.Top         = 91;
  EveTextAccx.Width       = 45;
  EveTextAccx.Height      = 17;
  EveTextAccx.Caption     = EveTextAccx_Caption;
  EveTextAccx.TextAlign   = taNone;
  EveTextAccx.FontName    = 27;
  EveTextAccx.Font_Color  = 0x0148;
  EveTextAccx.FontHandle  = 27;
  EveTextAccx.Source      = -1UL;
  EveTextAccx.Active      = 1;
  EveTextAccx.OnUp        = 0;
  EveTextAccx.OnDown      = 0;
  EveTextAccx.OnClick     = 0;
  EveTextAccx.OnPress     = 0;

  EveTextAccy.OwnerScreen = &SamplingScreen;
  EveTextAccy.Order       = 15;
  EveTextAccy.Visible     = 1;
  EveTextAccy.Opacity     = 255;
  EveTextAccy.Tag         = 255;
  EveTextAccy.Left        = 306;
  EveTextAccy.Top         = 93;
  EveTextAccy.Width       = 45;
  EveTextAccy.Height      = 17;
  EveTextAccy.Caption     = EveTextAccy_Caption;
  EveTextAccy.TextAlign   = taNone;
  EveTextAccy.FontName    = 27;
  EveTextAccy.Font_Color  = 0x0148;
  EveTextAccy.FontHandle  = 27;
  EveTextAccy.Source      = -1UL;
  EveTextAccy.Active      = 1;
  EveTextAccy.OnUp        = 0;
  EveTextAccy.OnDown      = 0;
  EveTextAccy.OnClick     = 0;
  EveTextAccy.OnPress     = 0;

  EveTextAccz.OwnerScreen = &SamplingScreen;
  EveTextAccz.Order       = 16;
  EveTextAccz.Visible     = 1;
  EveTextAccz.Opacity     = 255;
  EveTextAccz.Tag         = 255;
  EveTextAccz.Left        = 401;
  EveTextAccz.Top         = 94;
  EveTextAccz.Width       = 45;
  EveTextAccz.Height      = 17;
  EveTextAccz.Caption     = EveTextAccz_Caption;
  EveTextAccz.TextAlign   = taNone;
  EveTextAccz.FontName    = 27;
  EveTextAccz.Font_Color  = 0x0148;
  EveTextAccz.FontHandle  = 27;
  EveTextAccz.Source      = -1UL;
  EveTextAccz.Active      = 1;
  EveTextAccz.OnUp        = 0;
  EveTextAccz.OnDown      = 0;
  EveTextAccz.OnClick     = 0;
  EveTextAccz.OnPress     = 0;

  BoxRound7.OwnerScreen   = &SamplingScreen;
  BoxRound7.Order         = 17;
  BoxRound7.Visible       = 0;
  BoxRound7.Opacity       = 255;
  BoxRound7.Tag           = 255;
  BoxRound7.Left          = 6;
  BoxRound7.Top           = 187;
  BoxRound7.Width         = 470;
  BoxRound7.Height        = 81;
  BoxRound7.Pen_Width     = 1;
  BoxRound7.Pen_Color     = 0x0000;
  BoxRound7.Color         = 0xC618;
  BoxRound7.Press_Color   = 0xE71C;
  BoxRound7.Corner_Radius = 3;
  BoxRound7.Active        = 0;
  BoxRound7.OnUp          = 0;
  BoxRound7.OnDown        = 0;
  BoxRound7.OnClick       = 0;
  BoxRound7.OnPress       = 0;

  EveButtonsmpJogRear.OwnerScreen   = &SamplingScreen;
  EveButtonsmpJogRear.Order         = 18;
  EveButtonsmpJogRear.Visible       = 0;
  EveButtonsmpJogRear.Opacity       = 255;
  EveButtonsmpJogRear.Tag           = 255;
  EveButtonsmpJogRear.Left          = 16;
  EveButtonsmpJogRear.Top           = 192;
  EveButtonsmpJogRear.Width         = 121;
  EveButtonsmpJogRear.Height        = 69;
  EveButtonsmpJogRear.Color         = 0x03DA;
  EveButtonsmpJogRear.Press_Color   = 0x7E3F;
  EveButtonsmpJogRear.ColorTo       = 0x7E3F;
  EveButtonsmpJogRear.Press_ColorTo = 0x03DA;
  EveButtonsmpJogRear.Caption       = EveButtonsmpJogRear_Caption;
  EveButtonsmpJogRear.FontName      = 27;
  EveButtonsmpJogRear.Font_Color    = 0xFFFF;
  EveButtonsmpJogRear.FontHandle    = 27;
  EveButtonsmpJogRear.Source        = -1UL;
  EveButtonsmpJogRear.Flat          = 0;
  EveButtonsmpJogRear.Active        = 0;
  EveButtonsmpJogRear.OnUp          = 0;
  EveButtonsmpJogRear.OnDown        = 0;
  EveButtonsmpJogRear.OnClick       = 0;
  EveButtonsmpJogRear.OnPress       = &EveButtonsmpJogRear_OnPress;

  EveButtonsmpJogRear_OnPress.Action       = EveButtonsmpJogRearOnPress;
  EveButtonsmpJogRear_OnPress.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonsmpJogRear_OnPress.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonsmpJogRear_OnPress.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonsmpJogRear_OnPress.Sound.Volume = 255;

  EveButtonsmpJogFront.OwnerScreen   = &SamplingScreen;
  EveButtonsmpJogFront.Order         = 19;
  EveButtonsmpJogFront.Visible       = 0;
  EveButtonsmpJogFront.Opacity       = 255;
  EveButtonsmpJogFront.Tag           = 255;
  EveButtonsmpJogFront.Left          = 143;
  EveButtonsmpJogFront.Top           = 192;
  EveButtonsmpJogFront.Width         = 136;
  EveButtonsmpJogFront.Height        = 69;
  EveButtonsmpJogFront.Color         = 0x03DA;
  EveButtonsmpJogFront.Press_Color   = 0x7E3F;
  EveButtonsmpJogFront.ColorTo       = 0x7E3F;
  EveButtonsmpJogFront.Press_ColorTo = 0x03DA;
  EveButtonsmpJogFront.Caption       = EveButtonsmpJogFront_Caption;
  EveButtonsmpJogFront.FontName      = 27;
  EveButtonsmpJogFront.Font_Color    = 0xFFFF;
  EveButtonsmpJogFront.FontHandle    = 27;
  EveButtonsmpJogFront.Source        = -1UL;
  EveButtonsmpJogFront.Flat          = 0;
  EveButtonsmpJogFront.Active        = 0;
  EveButtonsmpJogFront.OnUp          = 0;
  EveButtonsmpJogFront.OnDown        = 0;
  EveButtonsmpJogFront.OnClick       = 0;
  EveButtonsmpJogFront.OnPress       = &EveButtonsmpJogFront_OnPress;

  EveButtonsmpJogFront_OnPress.Action       = EveButtonsmpJogFrontOnPress;
  EveButtonsmpJogFront_OnPress.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonsmpJogFront_OnPress.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonsmpJogFront_OnPress.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonsmpJogFront_OnPress.Sound.Volume = 255;

  EveButtonsmpBack.OwnerScreen   = &SamplingScreen;
  EveButtonsmpBack.Order         = 20;
  EveButtonsmpBack.Visible       = 0;
  EveButtonsmpBack.Opacity       = 255;
  EveButtonsmpBack.Tag           = 255;
  EveButtonsmpBack.Left          = 308;
  EveButtonsmpBack.Top           = 192;
  EveButtonsmpBack.Width         = 163;
  EveButtonsmpBack.Height        = 69;
  EveButtonsmpBack.Color         = 0x9824;
  EveButtonsmpBack.Press_Color   = 0x7E3F;
  EveButtonsmpBack.ColorTo       = 0xF434;
  EveButtonsmpBack.Press_ColorTo = 0x03DA;
  EveButtonsmpBack.Caption       = EveButtonsmpBack_Caption;
  EveButtonsmpBack.FontName      = 27;
  EveButtonsmpBack.Font_Color    = 0xFFFF;
  EveButtonsmpBack.FontHandle    = 27;
  EveButtonsmpBack.Source        = -1UL;
  EveButtonsmpBack.Flat          = 0;
  EveButtonsmpBack.Active        = 0;
  EveButtonsmpBack.OnUp          = 0;
  EveButtonsmpBack.OnDown        = 0;
  EveButtonsmpBack.OnClick       = &EveButtonsmpBack_OnClick;
  EveButtonsmpBack.OnPress       = 0;

  EveButtonsmpBack_OnClick.Action       = EveButtonsmpBackOnClick;
  EveButtonsmpBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonsmpBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonsmpBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonsmpBack_OnClick.Sound.Volume = 255;

  BoxRound8.OwnerScreen   = &SamplingScreen;
  BoxRound8.Order         = 21;
  BoxRound8.Visible       = 1;
  BoxRound8.Opacity       = 255;
  BoxRound8.Tag           = 255;
  BoxRound8.Left          = 6;
  BoxRound8.Top           = 187;
  BoxRound8.Width         = 470;
  BoxRound8.Height        = 81;
  BoxRound8.Pen_Width     = 1;
  BoxRound8.Pen_Color     = 0x0000;
  BoxRound8.Color         = 0xC618;
  BoxRound8.Press_Color   = 0xE71C;
  BoxRound8.Corner_Radius = 3;
  BoxRound8.Active        = 0;
  BoxRound8.OnUp          = 0;
  BoxRound8.OnDown        = 0;
  BoxRound8.OnClick       = 0;
  BoxRound8.OnPress       = 0;

  EveButtonSmpStartSampling.OwnerScreen   = &SamplingScreen;
  EveButtonSmpStartSampling.Order         = 22;
  EveButtonSmpStartSampling.Visible       = 1;
  EveButtonSmpStartSampling.Opacity       = 255;
  EveButtonSmpStartSampling.Tag           = 255;
  EveButtonSmpStartSampling.Left          = 16;
  EveButtonSmpStartSampling.Top           = 192;
  EveButtonSmpStartSampling.Width         = 121;
  EveButtonSmpStartSampling.Height        = 69;
  EveButtonSmpStartSampling.Color         = 0x03DA;
  EveButtonSmpStartSampling.Press_Color   = 0x7E3F;
  EveButtonSmpStartSampling.ColorTo       = 0x7E3F;
  EveButtonSmpStartSampling.Press_ColorTo = 0x03DA;
  EveButtonSmpStartSampling.Caption       = EveButtonSmpStartSampling_Caption;
  EveButtonSmpStartSampling.FontName      = 27;
  EveButtonSmpStartSampling.Font_Color    = 0xFFFF;
  EveButtonSmpStartSampling.FontHandle    = 27;
  EveButtonSmpStartSampling.Source        = -1UL;
  EveButtonSmpStartSampling.Flat          = 0;
  EveButtonSmpStartSampling.Active        = 1;
  EveButtonSmpStartSampling.OnUp          = 0;
  EveButtonSmpStartSampling.OnDown        = 0;
  EveButtonSmpStartSampling.OnClick       = &EveButtonSmpStartSampling_OnClick;
  EveButtonSmpStartSampling.OnPress       = 0;

  EveButtonSmpStartSampling_OnClick.Action       = EveButtonSmpStartSamplingOnClick;
  EveButtonSmpStartSampling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSmpStartSampling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSmpStartSampling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSmpStartSampling_OnClick.Sound.Volume = 255;

  EveButtonSmpStopSampling.OwnerScreen   = &SamplingScreen;
  EveButtonSmpStopSampling.Order         = 23;
  EveButtonSmpStopSampling.Visible       = 0;
  EveButtonSmpStopSampling.Opacity       = 255;
  EveButtonSmpStopSampling.Tag           = 255;
  EveButtonSmpStopSampling.Left          = 16;
  EveButtonSmpStopSampling.Top           = 192;
  EveButtonSmpStopSampling.Width         = 121;
  EveButtonSmpStopSampling.Height        = 69;
  EveButtonSmpStopSampling.Color         = 0x03DA;
  EveButtonSmpStopSampling.Press_Color   = 0x7E3F;
  EveButtonSmpStopSampling.ColorTo       = 0x7E3F;
  EveButtonSmpStopSampling.Press_ColorTo = 0x03DA;
  EveButtonSmpStopSampling.Caption       = EveButtonSmpStopSampling_Caption;
  EveButtonSmpStopSampling.FontName      = 27;
  EveButtonSmpStopSampling.Font_Color    = 0xFFFF;
  EveButtonSmpStopSampling.FontHandle    = 27;
  EveButtonSmpStopSampling.Source        = -1UL;
  EveButtonSmpStopSampling.Flat          = 0;
  EveButtonSmpStopSampling.Active        = 0;
  EveButtonSmpStopSampling.OnUp          = 0;
  EveButtonSmpStopSampling.OnDown        = 0;
  EveButtonSmpStopSampling.OnClick       = &EveButtonSmpStopSampling_OnClick;
  EveButtonSmpStopSampling.OnPress       = 0;

  EveButtonSmpStopSampling_OnClick.Action       = EveButtonSmpStopSamplingOnClick;
  EveButtonSmpStopSampling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSmpStopSampling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSmpStopSampling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSmpStopSampling_OnClick.Sound.Volume = 255;

  EveButtonSmpConfigureMotor.OwnerScreen   = &SamplingScreen;
  EveButtonSmpConfigureMotor.Order         = 24;
  EveButtonSmpConfigureMotor.Visible       = 1;
  EveButtonSmpConfigureMotor.Opacity       = 255;
  EveButtonSmpConfigureMotor.Tag           = 255;
  EveButtonSmpConfigureMotor.Left          = 143;
  EveButtonSmpConfigureMotor.Top           = 192;
  EveButtonSmpConfigureMotor.Width         = 136;
  EveButtonSmpConfigureMotor.Height        = 69;
  EveButtonSmpConfigureMotor.Color         = 0xA865;
  EveButtonSmpConfigureMotor.Press_Color   = 0x7E3F;
  EveButtonSmpConfigureMotor.ColorTo       = 0xF3B5;
  EveButtonSmpConfigureMotor.Press_ColorTo = 0x03DA;
  EveButtonSmpConfigureMotor.Caption       = EveButtonSmpConfigureMotor_Caption;
  EveButtonSmpConfigureMotor.FontName      = 27;
  EveButtonSmpConfigureMotor.Font_Color    = 0xFFFF;
  EveButtonSmpConfigureMotor.FontHandle    = 27;
  EveButtonSmpConfigureMotor.Source        = -1UL;
  EveButtonSmpConfigureMotor.Flat          = 0;
  EveButtonSmpConfigureMotor.Active        = 1;
  EveButtonSmpConfigureMotor.OnUp          = 0;
  EveButtonSmpConfigureMotor.OnDown        = 0;
  EveButtonSmpConfigureMotor.OnClick       = &EveButtonSmpConfigureMotor_OnClick;
  EveButtonSmpConfigureMotor.OnPress       = 0;

  EveButtonSmpConfigureMotor_OnClick.Action       = EveButtonSmpConfigureMotorOnClick;
  EveButtonSmpConfigureMotor_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSmpConfigureMotor_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSmpConfigureMotor_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSmpConfigureMotor_OnClick.Sound.Volume = 255;

  EveButtonSmpGotoProf.OwnerScreen   = &SamplingScreen;
  EveButtonSmpGotoProf.Order         = 25;
  EveButtonSmpGotoProf.Visible       = 1;
  EveButtonSmpGotoProf.Opacity       = 255;
  EveButtonSmpGotoProf.Tag           = 255;
  EveButtonSmpGotoProf.Left          = 308;
  EveButtonSmpGotoProf.Top           = 192;
  EveButtonSmpGotoProf.Width         = 163;
  EveButtonSmpGotoProf.Height        = 69;
  EveButtonSmpGotoProf.Color         = 0x14A7;
  EveButtonSmpGotoProf.Press_Color   = 0x7E3F;
  EveButtonSmpGotoProf.ColorTo       = 0x8FB7;
  EveButtonSmpGotoProf.Press_ColorTo = 0x03DA;
  EveButtonSmpGotoProf.Caption       = EveButtonSmpGotoProf_Caption;
  EveButtonSmpGotoProf.FontName      = 27;
  EveButtonSmpGotoProf.Font_Color    = 0xFFFF;
  EveButtonSmpGotoProf.FontHandle    = 27;
  EveButtonSmpGotoProf.Source        = -1UL;
  EveButtonSmpGotoProf.Flat          = 0;
  EveButtonSmpGotoProf.Active        = 1;
  EveButtonSmpGotoProf.OnUp          = 0;
  EveButtonSmpGotoProf.OnDown        = 0;
  EveButtonSmpGotoProf.OnClick       = &EveButtonSmpGotoProf_OnClick;
  EveButtonSmpGotoProf.OnPress       = 0;

  EveButtonSmpGotoProf_OnClick.Action       = EveButtonSmpGotoProfOnClick;
  EveButtonSmpGotoProf_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSmpGotoProf_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSmpGotoProf_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSmpGotoProf_OnClick.Sound.Volume = 255;

  EveButtonsmpResetInc.OwnerScreen   = &SamplingScreen;
  EveButtonsmpResetInc.Order         = 26;
  EveButtonsmpResetInc.Visible       = 0;
  EveButtonsmpResetInc.Opacity       = 255;
  EveButtonsmpResetInc.Tag           = 255;
  EveButtonsmpResetInc.Left          = 332;
  EveButtonsmpResetInc.Top           = 8;
  EveButtonsmpResetInc.Width         = 136;
  EveButtonsmpResetInc.Height        = 53;
  EveButtonsmpResetInc.Color         = 0x03DA;
  EveButtonsmpResetInc.Press_Color   = 0x7E3F;
  EveButtonsmpResetInc.ColorTo       = 0x7E3F;
  EveButtonsmpResetInc.Press_ColorTo = 0x03DA;
  EveButtonsmpResetInc.Caption       = EveButtonsmpResetInc_Caption;
  EveButtonsmpResetInc.FontName      = 27;
  EveButtonsmpResetInc.Font_Color    = 0xFFFF;
  EveButtonsmpResetInc.FontHandle    = 27;
  EveButtonsmpResetInc.Source        = -1UL;
  EveButtonsmpResetInc.Flat          = 0;
  EveButtonsmpResetInc.Active        = 0;
  EveButtonsmpResetInc.OnUp          = 0;
  EveButtonsmpResetInc.OnDown        = 0;
  EveButtonsmpResetInc.OnClick       = &EveButtonsmpResetInc_OnClick;
  EveButtonsmpResetInc.OnPress       = 0;

  EveButtonsmpResetInc_OnClick.Action       = EveButtonsmpResetIncOnClick;
  EveButtonsmpResetInc_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonsmpResetInc_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonsmpResetInc_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonsmpResetInc_OnClick.Sound.Volume = 255;

  EveGaugeProfSpeed.OwnerScreen   = &ProfilingScreen;
  EveGaugeProfSpeed.Order         = 6;
  EveGaugeProfSpeed.Visible       = 1;
  EveGaugeProfSpeed.Opacity       = 255;
  EveGaugeProfSpeed.Tag           = 255;
  EveGaugeProfSpeed.Left          = 280;
  EveGaugeProfSpeed.Top           = 45;
  EveGaugeProfSpeed.Radius        = 40;
  EveGaugeProfSpeed.Pen_Width     = 1;
  EveGaugeProfSpeed.Pen_Color     = 0x0000;
  EveGaugeProfSpeed.Color         = 0x03DA;
  EveGaugeProfSpeed.Press_Color   = 0x7E3F;
  EveGaugeProfSpeed.Major         = 10;
  EveGaugeProfSpeed.Minor         = 5;
  EveGaugeProfSpeed.Value         = 0;
  EveGaugeProfSpeed.Range         = 100;
  EveGaugeProfSpeed.Flat          = 0;
  EveGaugeProfSpeed.NoBackground  = 0;
  EveGaugeProfSpeed.NoPointer     = 0;
  EveGaugeProfSpeed.TicksVisible  = 1;
  EveGaugeProfSpeed.Active        = 0;
  EveGaugeProfSpeed.OnUp          = 0;
  EveGaugeProfSpeed.OnDown        = 0;
  EveGaugeProfSpeed.OnClick       = 0;
  EveGaugeProfSpeed.OnPress       = 0;

  EveToggleProfMode.OwnerScreen      = &ProfilingScreen;
  EveToggleProfMode.Order            = 8;
  EveToggleProfMode.Visible          = 1;
  EveToggleProfMode.Opacity          = 255;
  EveToggleProfMode.Tag              = 255;
  EveToggleProfMode.Left             = 381;
  EveToggleProfMode.Top              = 26;
  EveToggleProfMode.Width            = 76;
  EveToggleProfMode.Height           = 18;
  EveToggleProfMode.Pen_Width        = 1;
  EveToggleProfMode.Pen_Color        = 0x0000;
  EveToggleProfMode.Background_Color = 0x03DA;
  EveToggleProfMode.Color            = 0xFFFF;
  EveToggleProfMode.Press_Color      = 0x7E3F;
  EveToggleProfMode.StateOFF_Caption = EveToggleProfMode_StateOFF_Caption;
  EveToggleProfMode.StateON_Caption  = EveToggleProfMode_StateON_Caption;
  EveToggleProfMode.FontName         = 26;
  EveToggleProfMode.Font_Color       = 0xFFFF;
  EveToggleProfMode.FontHandle       = 26;
  EveToggleProfMode.Source           = -1UL;
  EveToggleProfMode.State            = 0;
  EveToggleProfMode.Flat             = 0;
  EveToggleProfMode.Active           = 1;
  EveToggleProfMode.OnUp             = 0;
  EveToggleProfMode.OnDown           = 0;
  EveToggleProfMode.OnClick          = &EveToggleProfMode_OnClick;
  EveToggleProfMode.OnPress          = 0;

  EveToggleProfMode_OnClick.Action       = EveToggleProfModeOnClick;
  EveToggleProfMode_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveToggleProfMode_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveToggleProfMode_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveToggleProfMode_OnClick.Sound.Volume = 255;

  EveButtonProfStartProfiling.OwnerScreen   = &ProfilingScreen;
  EveButtonProfStartProfiling.Order         = 10;
  EveButtonProfStartProfiling.Visible       = 1;
  EveButtonProfStartProfiling.Opacity       = 255;
  EveButtonProfStartProfiling.Tag           = 255;
  EveButtonProfStartProfiling.Left          = 274;
  EveButtonProfStartProfiling.Top           = 210;
  EveButtonProfStartProfiling.Width         = 203;
  EveButtonProfStartProfiling.Height        = 53;
  EveButtonProfStartProfiling.Color         = 0x0C20;
  EveButtonProfStartProfiling.Press_Color   = 0x7E3F;
  EveButtonProfStartProfiling.ColorTo       = 0x7757;
  EveButtonProfStartProfiling.Press_ColorTo = 0x03DA;
  EveButtonProfStartProfiling.Caption       = EveButtonProfStartProfiling_Caption;
  EveButtonProfStartProfiling.FontName      = 27;
  EveButtonProfStartProfiling.Font_Color    = 0xFFFF;
  EveButtonProfStartProfiling.FontHandle    = 27;
  EveButtonProfStartProfiling.Source        = -1UL;
  EveButtonProfStartProfiling.Flat          = 0;
  EveButtonProfStartProfiling.Active        = 1;
  EveButtonProfStartProfiling.OnUp          = 0;
  EveButtonProfStartProfiling.OnDown        = 0;
  EveButtonProfStartProfiling.OnClick       = &EveButtonProfStartProfiling_OnClick;
  EveButtonProfStartProfiling.OnPress       = 0;

  EveButtonProfStartProfiling_OnClick.Action       = EveButtonProfStartProfilingOnClick;
  EveButtonProfStartProfiling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfStartProfiling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfStartProfiling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfStartProfiling_OnClick.Sound.Volume = 255;

  EveButtonProfStopProfiling.OwnerScreen   = &ProfilingScreen;
  EveButtonProfStopProfiling.Order         = 11;
  EveButtonProfStopProfiling.Visible       = 0;
  EveButtonProfStopProfiling.Opacity       = 255;
  EveButtonProfStopProfiling.Tag           = 255;
  EveButtonProfStopProfiling.Left          = 274;
  EveButtonProfStopProfiling.Top           = 210;
  EveButtonProfStopProfiling.Width         = 203;
  EveButtonProfStopProfiling.Height        = 53;
  EveButtonProfStopProfiling.Color         = 0xC000;
  EveButtonProfStopProfiling.Press_Color   = 0x7E3F;
  EveButtonProfStopProfiling.ColorTo       = 0xEB73;
  EveButtonProfStopProfiling.Press_ColorTo = 0x03DA;
  EveButtonProfStopProfiling.Caption       = EveButtonProfStopProfiling_Caption;
  EveButtonProfStopProfiling.FontName      = 27;
  EveButtonProfStopProfiling.Font_Color    = 0xFFFF;
  EveButtonProfStopProfiling.FontHandle    = 27;
  EveButtonProfStopProfiling.Source        = -1UL;
  EveButtonProfStopProfiling.Flat          = 0;
  EveButtonProfStopProfiling.Active        = 0;
  EveButtonProfStopProfiling.OnUp          = 0;
  EveButtonProfStopProfiling.OnDown        = 0;
  EveButtonProfStopProfiling.OnClick       = &EveButtonProfStopProfiling_OnClick;
  EveButtonProfStopProfiling.OnPress       = 0;

  EveButtonProfStopProfiling_OnClick.Action       = EveButtonProfStopProfilingOnClick;
  EveButtonProfStopProfiling_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfStopProfiling_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfStopProfiling_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfStopProfiling_OnClick.Sound.Volume = 255;

  Line1.OwnerScreen    = &ProfilingScreen;
  Line1.Order          = 12;
  Line1.Visible        = 0;
  Line1.Opacity        = 255;
  Line1.Tag            = 255;
  Line1.First_Point_X  = 40;
  Line1.First_Point_Y  = 32;
  Line1.Second_Point_X = 50;
  Line1.Second_Point_Y = 32;
  Line1.Pen_Width      = 3;
  Line1.Pen_Color      = 0x1515;

  Line2.OwnerScreen    = &ProfilingScreen;
  Line2.Order          = 13;
  Line2.Visible        = 0;
  Line2.Opacity        = 255;
  Line2.Tag            = 255;
  Line2.First_Point_X  = 40;
  Line2.First_Point_Y  = 32;
  Line2.Second_Point_X = 50;
  Line2.Second_Point_Y = 32;
  Line2.Pen_Width      = 3;
  Line2.Pen_Color      = 0x1515;

  Line3.OwnerScreen    = &ProfilingScreen;
  Line3.Order          = 14;
  Line3.Visible        = 0;
  Line3.Opacity        = 255;
  Line3.Tag            = 255;
  Line3.First_Point_X  = 40;
  Line3.First_Point_Y  = 32;
  Line3.Second_Point_X = 50;
  Line3.Second_Point_Y = 32;
  Line3.Pen_Width      = 3;
  Line3.Pen_Color      = 0x1515;

  Line4.OwnerScreen    = &ProfilingScreen;
  Line4.Order          = 15;
  Line4.Visible        = 0;
  Line4.Opacity        = 255;
  Line4.Tag            = 255;
  Line4.First_Point_X  = 40;
  Line4.First_Point_Y  = 32;
  Line4.Second_Point_X = 50;
  Line4.Second_Point_Y = 32;
  Line4.Pen_Width      = 3;
  Line4.Pen_Color      = 0x1515;

  Line5.OwnerScreen    = &ProfilingScreen;
  Line5.Order          = 16;
  Line5.Visible        = 0;
  Line5.Opacity        = 255;
  Line5.Tag            = 255;
  Line5.First_Point_X  = 40;
  Line5.First_Point_Y  = 32;
  Line5.Second_Point_X = 50;
  Line5.Second_Point_Y = 32;
  Line5.Pen_Width      = 3;
  Line5.Pen_Color      = 0x1515;

  Line6.OwnerScreen    = &ProfilingScreen;
  Line6.Order          = 17;
  Line6.Visible        = 0;
  Line6.Opacity        = 255;
  Line6.Tag            = 255;
  Line6.First_Point_X  = 40;
  Line6.First_Point_Y  = 32;
  Line6.Second_Point_X = 50;
  Line6.Second_Point_Y = 32;
  Line6.Pen_Width      = 3;
  Line6.Pen_Color      = 0x1515;

  Line7.OwnerScreen    = &ProfilingScreen;
  Line7.Order          = 18;
  Line7.Visible        = 0;
  Line7.Opacity        = 255;
  Line7.Tag            = 255;
  Line7.First_Point_X  = 40;
  Line7.First_Point_Y  = 32;
  Line7.Second_Point_X = 50;
  Line7.Second_Point_Y = 32;
  Line7.Pen_Width      = 3;
  Line7.Pen_Color      = 0x1515;

  Line8.OwnerScreen    = &ProfilingScreen;
  Line8.Order          = 19;
  Line8.Visible        = 0;
  Line8.Opacity        = 255;
  Line8.Tag            = 255;
  Line8.First_Point_X  = 40;
  Line8.First_Point_Y  = 32;
  Line8.Second_Point_X = 50;
  Line8.Second_Point_Y = 32;
  Line8.Pen_Width      = 3;
  Line8.Pen_Color      = 0x1515;

  Line9.OwnerScreen    = &ProfilingScreen;
  Line9.Order          = 20;
  Line9.Visible        = 0;
  Line9.Opacity        = 255;
  Line9.Tag            = 255;
  Line9.First_Point_X  = 40;
  Line9.First_Point_Y  = 32;
  Line9.Second_Point_X = 50;
  Line9.Second_Point_Y = 32;
  Line9.Pen_Width      = 3;
  Line9.Pen_Color      = 0x1515;

  Line10.OwnerScreen    = &ProfilingScreen;
  Line10.Order          = 21;
  Line10.Visible        = 0;
  Line10.Opacity        = 255;
  Line10.Tag            = 255;
  Line10.First_Point_X  = 40;
  Line10.First_Point_Y  = 32;
  Line10.Second_Point_X = 50;
  Line10.Second_Point_Y = 32;
  Line10.Pen_Width      = 3;
  Line10.Pen_Color      = 0x1515;

  Line11.OwnerScreen    = &ProfilingScreen;
  Line11.Order          = 22;
  Line11.Visible        = 0;
  Line11.Opacity        = 255;
  Line11.Tag            = 255;
  Line11.First_Point_X  = 40;
  Line11.First_Point_Y  = 32;
  Line11.Second_Point_X = 50;
  Line11.Second_Point_Y = 32;
  Line11.Pen_Width      = 3;
  Line11.Pen_Color      = 0x1515;

  Line12.OwnerScreen    = &ProfilingScreen;
  Line12.Order          = 23;
  Line12.Visible        = 0;
  Line12.Opacity        = 255;
  Line12.Tag            = 255;
  Line12.First_Point_X  = 40;
  Line12.First_Point_Y  = 32;
  Line12.Second_Point_X = 50;
  Line12.Second_Point_Y = 32;
  Line12.Pen_Width      = 3;
  Line12.Pen_Color      = 0x1515;

  Line13.OwnerScreen    = &ProfilingScreen;
  Line13.Order          = 24;
  Line13.Visible        = 0;
  Line13.Opacity        = 255;
  Line13.Tag            = 255;
  Line13.First_Point_X  = 40;
  Line13.First_Point_Y  = 32;
  Line13.Second_Point_X = 50;
  Line13.Second_Point_Y = 32;
  Line13.Pen_Width      = 3;
  Line13.Pen_Color      = 0x1515;

  Line14.OwnerScreen    = &ProfilingScreen;
  Line14.Order          = 25;
  Line14.Visible        = 0;
  Line14.Opacity        = 255;
  Line14.Tag            = 255;
  Line14.First_Point_X  = 40;
  Line14.First_Point_Y  = 32;
  Line14.Second_Point_X = 50;
  Line14.Second_Point_Y = 32;
  Line14.Pen_Width      = 3;
  Line14.Pen_Color      = 0x1515;

  Line15.OwnerScreen    = &ProfilingScreen;
  Line15.Order          = 26;
  Line15.Visible        = 0;
  Line15.Opacity        = 255;
  Line15.Tag            = 255;
  Line15.First_Point_X  = 40;
  Line15.First_Point_Y  = 32;
  Line15.Second_Point_X = 50;
  Line15.Second_Point_Y = 32;
  Line15.Pen_Width      = 3;
  Line15.Pen_Color      = 0x1515;

  Line16.OwnerScreen    = &ProfilingScreen;
  Line16.Order          = 27;
  Line16.Visible        = 0;
  Line16.Opacity        = 255;
  Line16.Tag            = 255;
  Line16.First_Point_X  = 40;
  Line16.First_Point_Y  = 32;
  Line16.Second_Point_X = 50;
  Line16.Second_Point_Y = 32;
  Line16.Pen_Width      = 3;
  Line16.Pen_Color      = 0x1515;

  Line17.OwnerScreen    = &ProfilingScreen;
  Line17.Order          = 28;
  Line17.Visible        = 0;
  Line17.Opacity        = 255;
  Line17.Tag            = 255;
  Line17.First_Point_X  = 40;
  Line17.First_Point_Y  = 32;
  Line17.Second_Point_X = 50;
  Line17.Second_Point_Y = 32;
  Line17.Pen_Width      = 3;
  Line17.Pen_Color      = 0x1515;

  Line18.OwnerScreen    = &ProfilingScreen;
  Line18.Order          = 29;
  Line18.Visible        = 0;
  Line18.Opacity        = 255;
  Line18.Tag            = 255;
  Line18.First_Point_X  = 40;
  Line18.First_Point_Y  = 32;
  Line18.Second_Point_X = 50;
  Line18.Second_Point_Y = 32;
  Line18.Pen_Width      = 3;
  Line18.Pen_Color      = 0x1515;

  Line19.OwnerScreen    = &ProfilingScreen;
  Line19.Order          = 30;
  Line19.Visible        = 0;
  Line19.Opacity        = 255;
  Line19.Tag            = 255;
  Line19.First_Point_X  = 40;
  Line19.First_Point_Y  = 32;
  Line19.Second_Point_X = 50;
  Line19.Second_Point_Y = 32;
  Line19.Pen_Width      = 3;
  Line19.Pen_Color      = 0x1515;

  Line20.OwnerScreen    = &ProfilingScreen;
  Line20.Order          = 31;
  Line20.Visible        = 0;
  Line20.Opacity        = 255;
  Line20.Tag            = 255;
  Line20.First_Point_X  = 40;
  Line20.First_Point_Y  = 32;
  Line20.Second_Point_X = 50;
  Line20.Second_Point_Y = 32;
  Line20.Pen_Width      = 3;
  Line20.Pen_Color      = 0x1515;

  Line21.OwnerScreen    = &ProfilingScreen;
  Line21.Order          = 32;
  Line21.Visible        = 0;
  Line21.Opacity        = 255;
  Line21.Tag            = 255;
  Line21.First_Point_X  = 40;
  Line21.First_Point_Y  = 32;
  Line21.Second_Point_X = 50;
  Line21.Second_Point_Y = 32;
  Line21.Pen_Width      = 3;
  Line21.Pen_Color      = 0x1515;

  Line22.OwnerScreen    = &ProfilingScreen;
  Line22.Order          = 33;
  Line22.Visible        = 0;
  Line22.Opacity        = 255;
  Line22.Tag            = 255;
  Line22.First_Point_X  = 40;
  Line22.First_Point_Y  = 32;
  Line22.Second_Point_X = 50;
  Line22.Second_Point_Y = 32;
  Line22.Pen_Width      = 3;
  Line22.Pen_Color      = 0x1515;

  Line23.OwnerScreen    = &ProfilingScreen;
  Line23.Order          = 34;
  Line23.Visible        = 0;
  Line23.Opacity        = 255;
  Line23.Tag            = 255;
  Line23.First_Point_X  = 40;
  Line23.First_Point_Y  = 32;
  Line23.Second_Point_X = 50;
  Line23.Second_Point_Y = 32;
  Line23.Pen_Width      = 3;
  Line23.Pen_Color      = 0x1515;

  Line24.OwnerScreen    = &ProfilingScreen;
  Line24.Order          = 35;
  Line24.Visible        = 0;
  Line24.Opacity        = 255;
  Line24.Tag            = 255;
  Line24.First_Point_X  = 40;
  Line24.First_Point_Y  = 32;
  Line24.Second_Point_X = 50;
  Line24.Second_Point_Y = 32;
  Line24.Pen_Width      = 3;
  Line24.Pen_Color      = 0x1515;

  Line25.OwnerScreen    = &ProfilingScreen;
  Line25.Order          = 36;
  Line25.Visible        = 0;
  Line25.Opacity        = 255;
  Line25.Tag            = 255;
  Line25.First_Point_X  = 40;
  Line25.First_Point_Y  = 32;
  Line25.Second_Point_X = 50;
  Line25.Second_Point_Y = 32;
  Line25.Pen_Width      = 3;
  Line25.Pen_Color      = 0x1515;

  Line26.OwnerScreen    = &ProfilingScreen;
  Line26.Order          = 37;
  Line26.Visible        = 0;
  Line26.Opacity        = 255;
  Line26.Tag            = 255;
  Line26.First_Point_X  = 40;
  Line26.First_Point_Y  = 32;
  Line26.Second_Point_X = 50;
  Line26.Second_Point_Y = 32;
  Line26.Pen_Width      = 3;
  Line26.Pen_Color      = 0x1515;

  Line27.OwnerScreen    = &ProfilingScreen;
  Line27.Order          = 38;
  Line27.Visible        = 0;
  Line27.Opacity        = 255;
  Line27.Tag            = 255;
  Line27.First_Point_X  = 40;
  Line27.First_Point_Y  = 32;
  Line27.Second_Point_X = 50;
  Line27.Second_Point_Y = 32;
  Line27.Pen_Width      = 3;
  Line27.Pen_Color      = 0x1515;

  Line28.OwnerScreen    = &ProfilingScreen;
  Line28.Order          = 39;
  Line28.Visible        = 0;
  Line28.Opacity        = 255;
  Line28.Tag            = 255;
  Line28.First_Point_X  = 40;
  Line28.First_Point_Y  = 32;
  Line28.Second_Point_X = 50;
  Line28.Second_Point_Y = 32;
  Line28.Pen_Width      = 3;
  Line28.Pen_Color      = 0x1515;

  Line29.OwnerScreen    = &ProfilingScreen;
  Line29.Order          = 40;
  Line29.Visible        = 0;
  Line29.Opacity        = 255;
  Line29.Tag            = 255;
  Line29.First_Point_X  = 40;
  Line29.First_Point_Y  = 32;
  Line29.Second_Point_X = 50;
  Line29.Second_Point_Y = 32;
  Line29.Pen_Width      = 3;
  Line29.Pen_Color      = 0x1515;

  Line30.OwnerScreen    = &ProfilingScreen;
  Line30.Order          = 41;
  Line30.Visible        = 0;
  Line30.Opacity        = 255;
  Line30.Tag            = 255;
  Line30.First_Point_X  = 40;
  Line30.First_Point_Y  = 32;
  Line30.Second_Point_X = 50;
  Line30.Second_Point_Y = 32;
  Line30.Pen_Width      = 3;
  Line30.Pen_Color      = 0x1515;

  Line31.OwnerScreen    = &ProfilingScreen;
  Line31.Order          = 42;
  Line31.Visible        = 0;
  Line31.Opacity        = 255;
  Line31.Tag            = 255;
  Line31.First_Point_X  = 40;
  Line31.First_Point_Y  = 32;
  Line31.Second_Point_X = 50;
  Line31.Second_Point_Y = 32;
  Line31.Pen_Width      = 3;
  Line31.Pen_Color      = 0x1515;

  Line32.OwnerScreen    = &ProfilingScreen;
  Line32.Order          = 43;
  Line32.Visible        = 0;
  Line32.Opacity        = 255;
  Line32.Tag            = 255;
  Line32.First_Point_X  = 40;
  Line32.First_Point_Y  = 32;
  Line32.Second_Point_X = 50;
  Line32.Second_Point_Y = 32;
  Line32.Pen_Width      = 3;
  Line32.Pen_Color      = 0x1515;

  Line33.OwnerScreen    = &ProfilingScreen;
  Line33.Order          = 44;
  Line33.Visible        = 0;
  Line33.Opacity        = 255;
  Line33.Tag            = 255;
  Line33.First_Point_X  = 40;
  Line33.First_Point_Y  = 32;
  Line33.Second_Point_X = 50;
  Line33.Second_Point_Y = 32;
  Line33.Pen_Width      = 3;
  Line33.Pen_Color      = 0x1515;

  Line34.OwnerScreen    = &ProfilingScreen;
  Line34.Order          = 45;
  Line34.Visible        = 0;
  Line34.Opacity        = 255;
  Line34.Tag            = 255;
  Line34.First_Point_X  = 40;
  Line34.First_Point_Y  = 32;
  Line34.Second_Point_X = 50;
  Line34.Second_Point_Y = 32;
  Line34.Pen_Width      = 3;
  Line34.Pen_Color      = 0x1515;

  Line35.OwnerScreen    = &ProfilingScreen;
  Line35.Order          = 46;
  Line35.Visible        = 0;
  Line35.Opacity        = 255;
  Line35.Tag            = 255;
  Line35.First_Point_X  = 40;
  Line35.First_Point_Y  = 32;
  Line35.Second_Point_X = 50;
  Line35.Second_Point_Y = 32;
  Line35.Pen_Width      = 3;
  Line35.Pen_Color      = 0x1515;

  Line36.OwnerScreen    = &ProfilingScreen;
  Line36.Order          = 47;
  Line36.Visible        = 0;
  Line36.Opacity        = 255;
  Line36.Tag            = 255;
  Line36.First_Point_X  = 40;
  Line36.First_Point_Y  = 32;
  Line36.Second_Point_X = 50;
  Line36.Second_Point_Y = 32;
  Line36.Pen_Width      = 3;
  Line36.Pen_Color      = 0x1515;

  Line37.OwnerScreen    = &ProfilingScreen;
  Line37.Order          = 48;
  Line37.Visible        = 0;
  Line37.Opacity        = 255;
  Line37.Tag            = 255;
  Line37.First_Point_X  = 40;
  Line37.First_Point_Y  = 32;
  Line37.Second_Point_X = 50;
  Line37.Second_Point_Y = 32;
  Line37.Pen_Width      = 3;
  Line37.Pen_Color      = 0x1515;

  Line38.OwnerScreen    = &ProfilingScreen;
  Line38.Order          = 49;
  Line38.Visible        = 0;
  Line38.Opacity        = 255;
  Line38.Tag            = 255;
  Line38.First_Point_X  = 40;
  Line38.First_Point_Y  = 32;
  Line38.Second_Point_X = 50;
  Line38.Second_Point_Y = 32;
  Line38.Pen_Width      = 3;
  Line38.Pen_Color      = 0x1515;

  Line39.OwnerScreen    = &ProfilingScreen;
  Line39.Order          = 50;
  Line39.Visible        = 0;
  Line39.Opacity        = 255;
  Line39.Tag            = 255;
  Line39.First_Point_X  = 40;
  Line39.First_Point_Y  = 32;
  Line39.Second_Point_X = 50;
  Line39.Second_Point_Y = 32;
  Line39.Pen_Width      = 3;
  Line39.Pen_Color      = 0x1515;

  Line40.OwnerScreen    = &ProfilingScreen;
  Line40.Order          = 51;
  Line40.Visible        = 0;
  Line40.Opacity        = 255;
  Line40.Tag            = 255;
  Line40.First_Point_X  = 40;
  Line40.First_Point_Y  = 32;
  Line40.Second_Point_X = 50;
  Line40.Second_Point_Y = 32;
  Line40.Pen_Width      = 3;
  Line40.Pen_Color      = 0x1515;

  Line41.OwnerScreen    = &ProfilingScreen;
  Line41.Order          = 52;
  Line41.Visible        = 0;
  Line41.Opacity        = 255;
  Line41.Tag            = 255;
  Line41.First_Point_X  = 40;
  Line41.First_Point_Y  = 32;
  Line41.Second_Point_X = 50;
  Line41.Second_Point_Y = 32;
  Line41.Pen_Width      = 3;
  Line41.Pen_Color      = 0x1515;

  Line42.OwnerScreen    = &ProfilingScreen;
  Line42.Order          = 53;
  Line42.Visible        = 0;
  Line42.Opacity        = 255;
  Line42.Tag            = 255;
  Line42.First_Point_X  = 40;
  Line42.First_Point_Y  = 32;
  Line42.Second_Point_X = 50;
  Line42.Second_Point_Y = 32;
  Line42.Pen_Width      = 3;
  Line42.Pen_Color      = 0x1515;

  Line43.OwnerScreen    = &ProfilingScreen;
  Line43.Order          = 54;
  Line43.Visible        = 0;
  Line43.Opacity        = 255;
  Line43.Tag            = 255;
  Line43.First_Point_X  = 40;
  Line43.First_Point_Y  = 32;
  Line43.Second_Point_X = 50;
  Line43.Second_Point_Y = 32;
  Line43.Pen_Width      = 3;
  Line43.Pen_Color      = 0x1515;

  Line44.OwnerScreen    = &ProfilingScreen;
  Line44.Order          = 55;
  Line44.Visible        = 0;
  Line44.Opacity        = 255;
  Line44.Tag            = 255;
  Line44.First_Point_X  = 40;
  Line44.First_Point_Y  = 32;
  Line44.Second_Point_X = 50;
  Line44.Second_Point_Y = 32;
  Line44.Pen_Width      = 3;
  Line44.Pen_Color      = 0x1515;

  Line45.OwnerScreen    = &ProfilingScreen;
  Line45.Order          = 56;
  Line45.Visible        = 0;
  Line45.Opacity        = 255;
  Line45.Tag            = 255;
  Line45.First_Point_X  = 40;
  Line45.First_Point_Y  = 32;
  Line45.Second_Point_X = 50;
  Line45.Second_Point_Y = 32;
  Line45.Pen_Width      = 3;
  Line45.Pen_Color      = 0x1515;

  Line46.OwnerScreen    = &ProfilingScreen;
  Line46.Order          = 57;
  Line46.Visible        = 0;
  Line46.Opacity        = 255;
  Line46.Tag            = 255;
  Line46.First_Point_X  = 40;
  Line46.First_Point_Y  = 32;
  Line46.Second_Point_X = 50;
  Line46.Second_Point_Y = 32;
  Line46.Pen_Width      = 3;
  Line46.Pen_Color      = 0x1515;

  Line47.OwnerScreen    = &ProfilingScreen;
  Line47.Order          = 58;
  Line47.Visible        = 0;
  Line47.Opacity        = 255;
  Line47.Tag            = 255;
  Line47.First_Point_X  = 40;
  Line47.First_Point_Y  = 32;
  Line47.Second_Point_X = 50;
  Line47.Second_Point_Y = 32;
  Line47.Pen_Width      = 3;
  Line47.Pen_Color      = 0x1515;

  Line48.OwnerScreen    = &ProfilingScreen;
  Line48.Order          = 59;
  Line48.Visible        = 0;
  Line48.Opacity        = 255;
  Line48.Tag            = 255;
  Line48.First_Point_X  = 40;
  Line48.First_Point_Y  = 32;
  Line48.Second_Point_X = 50;
  Line48.Second_Point_Y = 32;
  Line48.Pen_Width      = 3;
  Line48.Pen_Color      = 0x1515;

  Line49.OwnerScreen    = &ProfilingScreen;
  Line49.Order          = 60;
  Line49.Visible        = 0;
  Line49.Opacity        = 255;
  Line49.Tag            = 255;
  Line49.First_Point_X  = 40;
  Line49.First_Point_Y  = 32;
  Line49.Second_Point_X = 50;
  Line49.Second_Point_Y = 32;
  Line49.Pen_Width      = 3;
  Line49.Pen_Color      = 0x1515;

  Line50.OwnerScreen    = &ProfilingScreen;
  Line50.Order          = 61;
  Line50.Visible        = 0;
  Line50.Opacity        = 255;
  Line50.Tag            = 255;
  Line50.First_Point_X  = 40;
  Line50.First_Point_Y  = 32;
  Line50.Second_Point_X = 50;
  Line50.Second_Point_Y = 32;
  Line50.Pen_Width      = 3;
  Line50.Pen_Color      = 0x1515;

  EveText1.OwnerScreen = &ProfilingScreen;
  EveText1.Order       = 62;
  EveText1.Visible     = 1;
  EveText1.Opacity     = 255;
  EveText1.Tag         = 255;
  EveText1.Left        = 370;
  EveText1.Top         = 56;
  EveText1.Width       = 83;
  EveText1.Height      = 15;
  EveText1.Caption     = EveText1_Caption;
  EveText1.TextAlign   = taNone;
  EveText1.FontName    = 26;
  EveText1.Font_Color  = 0x0148;
  EveText1.FontHandle  = 26;
  EveText1.Source      = -1UL;
  EveText1.Active      = 1;
  EveText1.OnUp        = 0;
  EveText1.OnDown      = 0;
  EveText1.OnClick     = 0;
  EveText1.OnPress     = 0;

  EveButtonProfCreateFile.OwnerScreen   = &ProfilingScreen;
  EveButtonProfCreateFile.Order         = 63;
  EveButtonProfCreateFile.Visible       = 1;
  EveButtonProfCreateFile.Opacity       = 255;
  EveButtonProfCreateFile.Tag           = 255;
  EveButtonProfCreateFile.Left          = 274;
  EveButtonProfCreateFile.Top           = 135;
  EveButtonProfCreateFile.Width         = 200;
  EveButtonProfCreateFile.Height        = 48;
  EveButtonProfCreateFile.Color         = 0x03DA;
  EveButtonProfCreateFile.Press_Color   = 0x7E3F;
  EveButtonProfCreateFile.ColorTo       = 0x7E3F;
  EveButtonProfCreateFile.Press_ColorTo = 0x03DA;
  EveButtonProfCreateFile.Caption       = EveButtonProfCreateFile_Caption;
  EveButtonProfCreateFile.FontName      = 27;
  EveButtonProfCreateFile.Font_Color    = 0xFFFF;
  EveButtonProfCreateFile.FontHandle    = 27;
  EveButtonProfCreateFile.Source        = -1UL;
  EveButtonProfCreateFile.Flat          = 0;
  EveButtonProfCreateFile.Active        = 1;
  EveButtonProfCreateFile.OnUp          = 0;
  EveButtonProfCreateFile.OnDown        = 0;
  EveButtonProfCreateFile.OnClick       = &EveButtonProfCreateFile_OnClick;
  EveButtonProfCreateFile.OnPress       = 0;

  EveButtonProfCreateFile_OnClick.Action       = EveButtonProfCreateFileOnClick;
  EveButtonProfCreateFile_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfCreateFile_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfCreateFile_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfCreateFile_OnClick.Sound.Volume = 255;

  EveTextProfFileName.OwnerScreen = &ProfilingScreen;
  EveTextProfFileName.Order       = 64;
  EveTextProfFileName.Visible     = 1;
  EveTextProfFileName.Opacity     = 255;
  EveTextProfFileName.Tag         = 255;
  EveTextProfFileName.Left        = 383;
  EveTextProfFileName.Top         = 78;
  EveTextProfFileName.Width       = 27;
  EveTextProfFileName.Height      = 15;
  EveTextProfFileName.Caption     = EveTextProfFileName_Caption;
  EveTextProfFileName.TextAlign   = taNone;
  EveTextProfFileName.FontName    = 26;
  EveTextProfFileName.Font_Color  = 0x0148;
  EveTextProfFileName.FontHandle  = 26;
  EveTextProfFileName.Source      = -1UL;
  EveTextProfFileName.Active      = 0;
  EveTextProfFileName.OnUp        = 0;
  EveTextProfFileName.OnDown      = 0;
  EveTextProfFileName.OnClick     = 0;
  EveTextProfFileName.OnPress     = 0;

  EveButtonProfRough1.OwnerScreen   = &ProfilingScreen;
  EveButtonProfRough1.Order         = 66;
  EveButtonProfRough1.Visible       = 1;
  EveButtonProfRough1.Opacity       = 255;
  EveButtonProfRough1.Tag           = 255;
  EveButtonProfRough1.Left          = 10;
  EveButtonProfRough1.Top           = 165;
  EveButtonProfRough1.Width         = 100;
  EveButtonProfRough1.Height        = 44;
  EveButtonProfRough1.Color         = 0x03DA;
  EveButtonProfRough1.Press_Color   = 0x7E3F;
  EveButtonProfRough1.ColorTo       = 0x7E3F;
  EveButtonProfRough1.Press_ColorTo = 0x03DA;
  EveButtonProfRough1.Caption       = EveButtonProfRough1_Caption;
  EveButtonProfRough1.FontName      = 27;
  EveButtonProfRough1.Font_Color    = 0xFFFF;
  EveButtonProfRough1.FontHandle    = 27;
  EveButtonProfRough1.Source        = -1UL;
  EveButtonProfRough1.Flat          = 0;
  EveButtonProfRough1.Active        = 1;
  EveButtonProfRough1.OnUp          = 0;
  EveButtonProfRough1.OnDown        = 0;
  EveButtonProfRough1.OnClick       = &EveButtonProfRough1_OnClick;
  EveButtonProfRough1.OnPress       = 0;

  EveButtonProfRough1_OnClick.Action       = EveButtonProfRough1OnClick;
  EveButtonProfRough1_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfRough1_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfRough1_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfRough1_OnClick.Sound.Volume = 255;

  EveButtonProfRough2.OwnerScreen   = &ProfilingScreen;
  EveButtonProfRough2.Order         = 67;
  EveButtonProfRough2.Visible       = 1;
  EveButtonProfRough2.Opacity       = 255;
  EveButtonProfRough2.Tag           = 255;
  EveButtonProfRough2.Left          = 135;
  EveButtonProfRough2.Top           = 165;
  EveButtonProfRough2.Width         = 100;
  EveButtonProfRough2.Height        = 44;
  EveButtonProfRough2.Color         = 0x03DA;
  EveButtonProfRough2.Press_Color   = 0x7E3F;
  EveButtonProfRough2.ColorTo       = 0x7E3F;
  EveButtonProfRough2.Press_ColorTo = 0x03DA;
  EveButtonProfRough2.Caption       = EveButtonProfRough2_Caption;
  EveButtonProfRough2.FontName      = 27;
  EveButtonProfRough2.Font_Color    = 0xFFFF;
  EveButtonProfRough2.FontHandle    = 27;
  EveButtonProfRough2.Source        = -1UL;
  EveButtonProfRough2.Flat          = 0;
  EveButtonProfRough2.Active        = 1;
  EveButtonProfRough2.OnUp          = 0;
  EveButtonProfRough2.OnDown        = 0;
  EveButtonProfRough2.OnClick       = &EveButtonProfRough2_OnClick;
  EveButtonProfRough2.OnPress       = 0;

  EveButtonProfRough2_OnClick.Action       = EveButtonProfRough2OnClick;
  EveButtonProfRough2_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfRough2_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfRough2_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfRough2_OnClick.Sound.Volume = 255;

  EveButtonProfRough3.OwnerScreen   = &ProfilingScreen;
  EveButtonProfRough3.Order         = 68;
  EveButtonProfRough3.Visible       = 1;
  EveButtonProfRough3.Opacity       = 255;
  EveButtonProfRough3.Tag           = 255;
  EveButtonProfRough3.Left          = 10;
  EveButtonProfRough3.Top           = 220;
  EveButtonProfRough3.Width         = 100;
  EveButtonProfRough3.Height        = 44;
  EveButtonProfRough3.Color         = 0x03DA;
  EveButtonProfRough3.Press_Color   = 0x7E3F;
  EveButtonProfRough3.ColorTo       = 0x7E3F;
  EveButtonProfRough3.Press_ColorTo = 0x03DA;
  EveButtonProfRough3.Caption       = EveButtonProfRough3_Caption;
  EveButtonProfRough3.FontName      = 27;
  EveButtonProfRough3.Font_Color    = 0xFFFF;
  EveButtonProfRough3.FontHandle    = 27;
  EveButtonProfRough3.Source        = -1UL;
  EveButtonProfRough3.Flat          = 0;
  EveButtonProfRough3.Active        = 1;
  EveButtonProfRough3.OnUp          = 0;
  EveButtonProfRough3.OnDown        = 0;
  EveButtonProfRough3.OnClick       = &EveButtonProfRough3_OnClick;
  EveButtonProfRough3.OnPress       = 0;

  EveButtonProfRough3_OnClick.Action       = EveButtonProfRough3OnClick;
  EveButtonProfRough3_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfRough3_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfRough3_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfRough3_OnClick.Sound.Volume = 255;

  EveButtonProfRough4.OwnerScreen   = &ProfilingScreen;
  EveButtonProfRough4.Order         = 69;
  EveButtonProfRough4.Visible       = 1;
  EveButtonProfRough4.Opacity       = 255;
  EveButtonProfRough4.Tag           = 255;
  EveButtonProfRough4.Left          = 135;
  EveButtonProfRough4.Top           = 220;
  EveButtonProfRough4.Width         = 100;
  EveButtonProfRough4.Height        = 44;
  EveButtonProfRough4.Color         = 0x03DA;
  EveButtonProfRough4.Press_Color   = 0x7E3F;
  EveButtonProfRough4.ColorTo       = 0x7E3F;
  EveButtonProfRough4.Press_ColorTo = 0x03DA;
  EveButtonProfRough4.Caption       = EveButtonProfRough4_Caption;
  EveButtonProfRough4.FontName      = 27;
  EveButtonProfRough4.Font_Color    = 0xFFFF;
  EveButtonProfRough4.FontHandle    = 27;
  EveButtonProfRough4.Source        = -1UL;
  EveButtonProfRough4.Flat          = 0;
  EveButtonProfRough4.Active        = 1;
  EveButtonProfRough4.OnUp          = 0;
  EveButtonProfRough4.OnDown        = 0;
  EveButtonProfRough4.OnClick       = &EveButtonProfRough4_OnClick;
  EveButtonProfRough4.OnPress       = 0;

  EveButtonProfRough4_OnClick.Action       = EveButtonProfRough4OnClick;
  EveButtonProfRough4_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonProfRough4_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonProfRough4_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonProfRough4_OnClick.Sound.Volume = 255;

  EveText18.OwnerScreen = &ProfilingScreen;
  EveText18.Order       = 70;
  EveText18.Visible     = 1;
  EveText18.Opacity     = 255;
  EveText18.Tag         = 255;
  EveText18.Left        = 10;
  EveText18.Top         = 135;
  EveText18.Width       = 97;
  EveText18.Height      = 17;
  EveText18.Caption     = EveText18_Caption;
  EveText18.TextAlign   = taNone;
  EveText18.FontName    = 27;
  EveText18.Font_Color  = 0x0148;
  EveText18.FontHandle  = 27;
  EveText18.Source      = -1UL;
  EveText18.Active      = 1;
  EveText18.OnUp        = 0;
  EveText18.OnDown      = 0;
  EveText18.OnClick     = 0;
  EveText18.OnPress     = 0;

  BoxProfWaitingForCam.OwnerScreen   = &ProfilingScreen;
  BoxProfWaitingForCam.Order         = 71;
  BoxProfWaitingForCam.Visible       = 0;
  BoxProfWaitingForCam.Opacity       = 196;
  BoxProfWaitingForCam.Tag           = 255;
  BoxProfWaitingForCam.Left          = 2;
  BoxProfWaitingForCam.Top           = 4;
  BoxProfWaitingForCam.Width         = 476;
  BoxProfWaitingForCam.Height        = 266;
  BoxProfWaitingForCam.Pen_Width     = 1;
  BoxProfWaitingForCam.Pen_Color     = 0x0000;
  BoxProfWaitingForCam.Color         = 0xFFFF;
  BoxProfWaitingForCam.Press_Color   = 0xFFFF;
  BoxProfWaitingForCam.ColorTo       = 0xFFFF;
  BoxProfWaitingForCam.Press_ColorTo = 0xC618;
  BoxProfWaitingForCam.Gradient      = _FT800_BRUSH_GR_NONE;
  BoxProfWaitingForCam.Active        = 0;
  BoxProfWaitingForCam.OnUp          = 0;
  BoxProfWaitingForCam.OnDown        = 0;
  BoxProfWaitingForCam.OnClick       = 0;
  BoxProfWaitingForCam.OnPress       = 0;

  EveTextProfWaitingForCam.OwnerScreen = &ProfilingScreen;
  EveTextProfWaitingForCam.Order       = 72;
  EveTextProfWaitingForCam.Visible     = 0;
  EveTextProfWaitingForCam.Opacity     = 255;
  EveTextProfWaitingForCam.Tag         = 255;
  EveTextProfWaitingForCam.Left        = 106;
  EveTextProfWaitingForCam.Top         = 75;
  EveTextProfWaitingForCam.Width       = 265;
  EveTextProfWaitingForCam.Height      = 25;
  EveTextProfWaitingForCam.Caption     = EveTextProfWaitingForCam_Caption;
  EveTextProfWaitingForCam.TextAlign   = taNone;
  EveTextProfWaitingForCam.FontName    = 29;
  EveTextProfWaitingForCam.Font_Color  = 0x047F;
  EveTextProfWaitingForCam.FontHandle  = 29;
  EveTextProfWaitingForCam.Source      = -1UL;
  EveTextProfWaitingForCam.Active      = 0;
  EveTextProfWaitingForCam.OnUp        = 0;
  EveTextProfWaitingForCam.OnDown      = 0;
  EveTextProfWaitingForCam.OnClick     = 0;
  EveTextProfWaitingForCam.OnPress     = 0;

  EveButtonFNfilename.OwnerScreen   = &SettingScreen;
  EveButtonFNfilename.Order         = 0;
  EveButtonFNfilename.Visible       = 1;
  EveButtonFNfilename.Opacity       = 255;
  EveButtonFNfilename.Tag           = 255;
  EveButtonFNfilename.Left          = 310;
  EveButtonFNfilename.Top           = 4;
  EveButtonFNfilename.Width         = 108;
  EveButtonFNfilename.Height        = 26;
  EveButtonFNfilename.Color         = 0xD6BA;
  EveButtonFNfilename.Press_Color   = 0x7E3F;
  EveButtonFNfilename.ColorTo       = 0xC618;
  EveButtonFNfilename.Press_ColorTo = 0x03DA;
  EveButtonFNfilename.Caption       = EveButtonFNfilename_Caption;
  EveButtonFNfilename.FontName      = 28;
  EveButtonFNfilename.Font_Color    = 0x0000;
  EveButtonFNfilename.FontHandle    = 28;
  EveButtonFNfilename.Source        = -1UL;
  EveButtonFNfilename.Flat          = 1;
  EveButtonFNfilename.Active        = 0;
  EveButtonFNfilename.OnUp          = 0;
  EveButtonFNfilename.OnDown        = 0;
  EveButtonFNfilename.OnClick       = 0;
  EveButtonFNfilename.OnPress       = 0;

  EveKeys1.OwnerScreen   = &SettingScreen;
  EveKeys1.Order         = 2;
  EveKeys1.Visible       = 1;
  EveKeys1.Opacity       = 255;
  EveKeys1.Tag           = 255;
  EveKeys1.Left          = 9;
  EveKeys1.Top           = 93;
  EveKeys1.Width         = 463;
  EveKeys1.Height        = 40;
  EveKeys1.Color         = 0x03DA;
  EveKeys1.Press_Color   = 0x7E3F;
  EveKeys1.ColorTo       = 0x7E3F;
  EveKeys1.Press_ColorTo = 0x03DA;
  EveKeys1.Caption       = EveKeys1_Caption;
  EveKeys1.FontName      = 27;
  EveKeys1.Font_Color    = 0xFFFF;
  EveKeys1.FontHandle    = 27;
  EveKeys1.Source        = -1UL;
  EveKeys1.Flat          = 0;
  EveKeys1.AutoSize      = 0;
  EveKeys1.Active        = 1;
  EveKeys1.OnUp          = 0;
  EveKeys1.OnDown        = 0;
  EveKeys1.OnClick       = 0;
  EveKeys1.OnPress       = 0;

  EveKeys2.OwnerScreen   = &SettingScreen;
  EveKeys2.Order         = 3;
  EveKeys2.Visible       = 1;
  EveKeys2.Opacity       = 255;
  EveKeys2.Tag           = 255;
  EveKeys2.Left          = 9;
  EveKeys2.Top           = 136;
  EveKeys2.Width         = 464;
  EveKeys2.Height        = 40;
  EveKeys2.Color         = 0x03DA;
  EveKeys2.Press_Color   = 0x7E3F;
  EveKeys2.ColorTo       = 0x7E3F;
  EveKeys2.Press_ColorTo = 0x03DA;
  EveKeys2.Caption       = EveKeys2_Caption;
  EveKeys2.FontName      = 27;
  EveKeys2.Font_Color    = 0xFFFF;
  EveKeys2.FontHandle    = 27;
  EveKeys2.Source        = -1UL;
  EveKeys2.Flat          = 0;
  EveKeys2.AutoSize      = 0;
  EveKeys2.Active        = 1;
  EveKeys2.OnUp          = 0;
  EveKeys2.OnDown        = 0;
  EveKeys2.OnClick       = 0;
  EveKeys2.OnPress       = 0;

  EveKeys3.OwnerScreen   = &SettingScreen;
  EveKeys3.Order         = 4;
  EveKeys3.Visible       = 1;
  EveKeys3.Opacity       = 255;
  EveKeys3.Tag           = 255;
  EveKeys3.Left          = 9;
  EveKeys3.Top           = 179;
  EveKeys3.Width         = 464;
  EveKeys3.Height        = 40;
  EveKeys3.Color         = 0x03DA;
  EveKeys3.Press_Color   = 0x7E3F;
  EveKeys3.ColorTo       = 0x7E3F;
  EveKeys3.Press_ColorTo = 0x03DA;
  EveKeys3.Caption       = EveKeys3_Caption;
  EveKeys3.FontName      = 27;
  EveKeys3.Font_Color    = 0xFFFF;
  EveKeys3.FontHandle    = 27;
  EveKeys3.Source        = -1UL;
  EveKeys3.Flat          = 0;
  EveKeys3.AutoSize      = 0;
  EveKeys3.Active        = 1;
  EveKeys3.OnUp          = 0;
  EveKeys3.OnDown        = 0;
  EveKeys3.OnClick       = 0;
  EveKeys3.OnPress       = 0;

  EveKeys4.OwnerScreen   = &SettingScreen;
  EveKeys4.Order         = 5;
  EveKeys4.Visible       = 1;
  EveKeys4.Opacity       = 255;
  EveKeys4.Tag           = 255;
  EveKeys4.Left          = 62;
  EveKeys4.Top           = 222;
  EveKeys4.Width         = 410;
  EveKeys4.Height        = 40;
  EveKeys4.Color         = 0x03DA;
  EveKeys4.Press_Color   = 0x7E3F;
  EveKeys4.ColorTo       = 0x7E3F;
  EveKeys4.Press_ColorTo = 0x03DA;
  EveKeys4.Caption       = EveKeys4_Caption;
  EveKeys4.FontName      = 27;
  EveKeys4.Font_Color    = 0xFFFF;
  EveKeys4.FontHandle    = 27;
  EveKeys4.Source        = -1UL;
  EveKeys4.Flat          = 0;
  EveKeys4.AutoSize      = 0;
  EveKeys4.Active        = 1;
  EveKeys4.OnUp          = 0;
  EveKeys4.OnDown        = 0;
  EveKeys4.OnClick       = 0;
  EveKeys4.OnPress       = 0;

  EveButtonFNBackspace.OwnerScreen   = &SettingScreen;
  EveButtonFNBackspace.Order         = 8;
  EveButtonFNBackspace.Visible       = 1;
  EveButtonFNBackspace.Opacity       = 255;
  EveButtonFNBackspace.Tag           = 255;
  EveButtonFNBackspace.Left          = 10;
  EveButtonFNBackspace.Top           = 38;
  EveButtonFNBackspace.Width         = 102;
  EveButtonFNBackspace.Height        = 39;
  EveButtonFNBackspace.Color         = 0x4AEC;
  EveButtonFNBackspace.Press_Color   = 0x7E3F;
  EveButtonFNBackspace.ColorTo       = 0x7E3F;
  EveButtonFNBackspace.Press_ColorTo = 0x03DA;
  EveButtonFNBackspace.Caption       = EveButtonFNBackspace_Caption;
  EveButtonFNBackspace.FontName      = 27;
  EveButtonFNBackspace.Font_Color    = 0xFFFF;
  EveButtonFNBackspace.FontHandle    = 27;
  EveButtonFNBackspace.Source        = -1UL;
  EveButtonFNBackspace.Flat          = 0;
  EveButtonFNBackspace.Active        = 1;
  EveButtonFNBackspace.OnUp          = 0;
  EveButtonFNBackspace.OnDown        = 0;
  EveButtonFNBackspace.OnClick       = &EveButtonFNBackspace_OnClick;
  EveButtonFNBackspace.OnPress       = 0;

  EveButtonFNBackspace_OnClick.Action       = EveButtonFNBackspaceOnClick;
  EveButtonFNBackspace_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonFNBackspace_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonFNBackspace_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonFNBackspace_OnClick.Sound.Volume = 255;

  EveButtonFNClear.OwnerScreen   = &SettingScreen;
  EveButtonFNClear.Order         = 9;
  EveButtonFNClear.Visible       = 1;
  EveButtonFNClear.Opacity       = 255;
  EveButtonFNClear.Tag           = 255;
  EveButtonFNClear.Left          = 118;
  EveButtonFNClear.Top           = 38;
  EveButtonFNClear.Width         = 104;
  EveButtonFNClear.Height        = 40;
  EveButtonFNClear.Color         = 0x03DA;
  EveButtonFNClear.Press_Color   = 0x7E3F;
  EveButtonFNClear.ColorTo       = 0x7E3F;
  EveButtonFNClear.Press_ColorTo = 0x03DA;
  EveButtonFNClear.Caption       = EveButtonFNClear_Caption;
  EveButtonFNClear.FontName      = 27;
  EveButtonFNClear.Font_Color    = 0xFFFF;
  EveButtonFNClear.FontHandle    = 27;
  EveButtonFNClear.Source        = -1UL;
  EveButtonFNClear.Flat          = 0;
  EveButtonFNClear.Active        = 1;
  EveButtonFNClear.OnUp          = 0;
  EveButtonFNClear.OnDown        = 0;
  EveButtonFNClear.OnClick       = &EveButtonFNClear_OnClick;
  EveButtonFNClear.OnPress       = 0;

  EveButtonFNClear_OnClick.Action       = EveButtonFNClearOnClick;
  EveButtonFNClear_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonFNClear_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonFNClear_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonFNClear_OnClick.Sound.Volume = 255;

  EveButtonFNConfirm.OwnerScreen   = &SettingScreen;
  EveButtonFNConfirm.Order         = 10;
  EveButtonFNConfirm.Visible       = 1;
  EveButtonFNConfirm.Opacity       = 255;
  EveButtonFNConfirm.Tag           = 255;
  EveButtonFNConfirm.Left          = 358;
  EveButtonFNConfirm.Top           = 38;
  EveButtonFNConfirm.Width         = 108;
  EveButtonFNConfirm.Height        = 38;
  EveButtonFNConfirm.Color         = 0x0583;
  EveButtonFNConfirm.Press_Color   = 0x7E3F;
  EveButtonFNConfirm.ColorTo       = 0x7E3F;
  EveButtonFNConfirm.Press_ColorTo = 0x03DA;
  EveButtonFNConfirm.Caption       = EveButtonFNConfirm_Caption;
  EveButtonFNConfirm.FontName      = 27;
  EveButtonFNConfirm.Font_Color    = 0xFFFF;
  EveButtonFNConfirm.FontHandle    = 27;
  EveButtonFNConfirm.Source        = -1UL;
  EveButtonFNConfirm.Flat          = 0;
  EveButtonFNConfirm.Active        = 1;
  EveButtonFNConfirm.OnUp          = 0;
  EveButtonFNConfirm.OnDown        = 0;
  EveButtonFNConfirm.OnClick       = &EveButtonFNConfirm_OnClick;
  EveButtonFNConfirm.OnPress       = 0;

  EveButtonFNConfirm_OnClick.Action       = EveButtonFNConfirmOnClick;
  EveButtonFNConfirm_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonFNConfirm_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonFNConfirm_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonFNConfirm_OnClick.Sound.Volume = 255;

  EveButtonFNGoBack.OwnerScreen   = &SettingScreen;
  EveButtonFNGoBack.Order         = 11;
  EveButtonFNGoBack.Visible       = 1;
  EveButtonFNGoBack.Opacity       = 255;
  EveButtonFNGoBack.Tag           = 255;
  EveButtonFNGoBack.Left          = 232;
  EveButtonFNGoBack.Top           = 38;
  EveButtonFNGoBack.Width         = 118;
  EveButtonFNGoBack.Height        = 40;
  EveButtonFNGoBack.Color         = 0xB003;
  EveButtonFNGoBack.Press_Color   = 0x7E3F;
  EveButtonFNGoBack.ColorTo       = 0xF432;
  EveButtonFNGoBack.Press_ColorTo = 0x03DA;
  EveButtonFNGoBack.Caption       = EveButtonFNGoBack_Caption;
  EveButtonFNGoBack.FontName      = 27;
  EveButtonFNGoBack.Font_Color    = 0xFFFF;
  EveButtonFNGoBack.FontHandle    = 27;
  EveButtonFNGoBack.Source        = -1UL;
  EveButtonFNGoBack.Flat          = 0;
  EveButtonFNGoBack.Active        = 1;
  EveButtonFNGoBack.OnUp          = 0;
  EveButtonFNGoBack.OnDown        = 0;
  EveButtonFNGoBack.OnClick       = &EveButtonFNGoBack_OnClick;
  EveButtonFNGoBack.OnPress       = 0;

  EveButtonFNGoBack_OnClick.Action       = EveButtonFNGoBackOnClick;
  EveButtonFNGoBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonFNGoBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonFNGoBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonFNGoBack_OnClick.Sound.Volume = 255;

  EveButtonFNShift.OwnerScreen   = &SettingScreen;
  EveButtonFNShift.Order         = 12;
  EveButtonFNShift.Visible       = 1;
  EveButtonFNShift.Opacity       = 255;
  EveButtonFNShift.Tag           = 255;
  EveButtonFNShift.Left          = 10;
  EveButtonFNShift.Top           = 222;
  EveButtonFNShift.Width         = 48;
  EveButtonFNShift.Height        = 39;
  EveButtonFNShift.Color         = 0x042B;
  EveButtonFNShift.Press_Color   = 0x7E3F;
  EveButtonFNShift.ColorTo       = 0x87BA;
  EveButtonFNShift.Press_ColorTo = 0x03DA;
  EveButtonFNShift.Caption       = EveButtonFNShift_Caption;
  EveButtonFNShift.FontName      = 27;
  EveButtonFNShift.Font_Color    = 0xFFFF;
  EveButtonFNShift.FontHandle    = 27;
  EveButtonFNShift.Source        = -1UL;
  EveButtonFNShift.Flat          = 0;
  EveButtonFNShift.Active        = 1;
  EveButtonFNShift.OnUp          = 0;
  EveButtonFNShift.OnDown        = 0;
  EveButtonFNShift.OnClick       = &EveButtonFNShift_OnClick;
  EveButtonFNShift.OnPress       = 0;

  EveButtonFNShift_OnClick.Action       = EveButtonFNShiftOnClick;
  EveButtonFNShift_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonFNShift_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonFNShift_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonFNShift_OnClick.Sound.Volume = 255;

  EveButtonSUNewRun.OwnerScreen   = &SummaryScreen;
  EveButtonSUNewRun.Order         = 7;
  EveButtonSUNewRun.Visible       = 1;
  EveButtonSUNewRun.Opacity       = 255;
  EveButtonSUNewRun.Tag           = 255;
  EveButtonSUNewRun.Left          = 337;
  EveButtonSUNewRun.Top           = 198;
  EveButtonSUNewRun.Width         = 122;
  EveButtonSUNewRun.Height        = 52;
  EveButtonSUNewRun.Color         = 0x03DA;
  EveButtonSUNewRun.Press_Color   = 0x7E3F;
  EveButtonSUNewRun.ColorTo       = 0x7E3F;
  EveButtonSUNewRun.Press_ColorTo = 0x03DA;
  EveButtonSUNewRun.Caption       = EveButtonSUNewRun_Caption;
  EveButtonSUNewRun.FontName      = 27;
  EveButtonSUNewRun.Font_Color    = 0xFFFF;
  EveButtonSUNewRun.FontHandle    = 27;
  EveButtonSUNewRun.Source        = -1UL;
  EveButtonSUNewRun.Flat          = 0;
  EveButtonSUNewRun.Active        = 1;
  EveButtonSUNewRun.OnUp          = 0;
  EveButtonSUNewRun.OnDown        = 0;
  EveButtonSUNewRun.OnClick       = &EveButtonSUNewRun_OnClick;
  EveButtonSUNewRun.OnPress       = 0;

  EveButtonSUNewRun_OnClick.Action       = EveButtonSUNewRunOnClick;
  EveButtonSUNewRun_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSUNewRun_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSUNewRun_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSUNewRun_OnClick.Sound.Volume = 255;

  EveButtonSUHelp.OwnerScreen   = &SummaryScreen;
  EveButtonSUHelp.Order         = 8;
  EveButtonSUHelp.Visible       = 1;
  EveButtonSUHelp.Opacity       = 255;
  EveButtonSUHelp.Tag           = 255;
  EveButtonSUHelp.Left          = 337;
  EveButtonSUHelp.Top           = 142;
  EveButtonSUHelp.Width         = 122;
  EveButtonSUHelp.Height        = 52;
  EveButtonSUHelp.Color         = 0x03DA;
  EveButtonSUHelp.Press_Color   = 0x7E3F;
  EveButtonSUHelp.ColorTo       = 0x7E3F;
  EveButtonSUHelp.Press_ColorTo = 0x03DA;
  EveButtonSUHelp.Caption       = EveButtonSUHelp_Caption;
  EveButtonSUHelp.FontName      = 27;
  EveButtonSUHelp.Font_Color    = 0xFFFF;
  EveButtonSUHelp.FontHandle    = 27;
  EveButtonSUHelp.Source        = -1UL;
  EveButtonSUHelp.Flat          = 0;
  EveButtonSUHelp.Active        = 1;
  EveButtonSUHelp.OnUp          = 0;
  EveButtonSUHelp.OnDown        = 0;
  EveButtonSUHelp.OnClick       = &EveButtonSUHelp_OnClick;
  EveButtonSUHelp.OnPress       = 0;

  EveButtonSUHelp_OnClick.Action       = EveButtonSUHelpOnClick;
  EveButtonSUHelp_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSUHelp_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSUHelp_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSUHelp_OnClick.Sound.Volume = 255;

  EveButtonSUAbout.OwnerScreen   = &SummaryScreen;
  EveButtonSUAbout.Order         = 9;
  EveButtonSUAbout.Visible       = 1;
  EveButtonSUAbout.Opacity       = 255;
  EveButtonSUAbout.Tag           = 255;
  EveButtonSUAbout.Left          = 337;
  EveButtonSUAbout.Top           = 80;
  EveButtonSUAbout.Width         = 122;
  EveButtonSUAbout.Height        = 57;
  EveButtonSUAbout.Color         = 0x03DA;
  EveButtonSUAbout.Press_Color   = 0x7E3F;
  EveButtonSUAbout.ColorTo       = 0x7E3F;
  EveButtonSUAbout.Press_ColorTo = 0x03DA;
  EveButtonSUAbout.Caption       = EveButtonSUAbout_Caption;
  EveButtonSUAbout.FontName      = 27;
  EveButtonSUAbout.Font_Color    = 0xFFFF;
  EveButtonSUAbout.FontHandle    = 27;
  EveButtonSUAbout.Source        = -1UL;
  EveButtonSUAbout.Flat          = 0;
  EveButtonSUAbout.Active        = 1;
  EveButtonSUAbout.OnUp          = 0;
  EveButtonSUAbout.OnDown        = 0;
  EveButtonSUAbout.OnClick       = &EveButtonSUAbout_OnClick;
  EveButtonSUAbout.OnPress       = 0;

  EveButtonSUAbout_OnClick.Action       = EveButtonSUAboutOnClick;
  EveButtonSUAbout_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSUAbout_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSUAbout_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSUAbout_OnClick.Sound.Volume = 255;

  EveTextSUtime.OwnerScreen = &SummaryScreen;
  EveTextSUtime.Order       = 10;
  EveTextSUtime.Visible     = 1;
  EveTextSUtime.Opacity     = 255;
  EveTextSUtime.Tag         = 255;
  EveTextSUtime.Left        = 216;
  EveTextSUtime.Top         = 39;
  EveTextSUtime.Width       = 8;
  EveTextSUtime.Height      = 17;
  EveTextSUtime.Caption     = EveTextSUtime_Caption;
  EveTextSUtime.TextAlign   = taNone;
  EveTextSUtime.FontName    = 27;
  EveTextSUtime.Font_Color  = 0x0148;
  EveTextSUtime.FontHandle  = 27;
  EveTextSUtime.Source      = -1UL;
  EveTextSUtime.Active      = 1;
  EveTextSUtime.OnUp        = 0;
  EveTextSUtime.OnDown      = 0;
  EveTextSUtime.OnClick     = 0;
  EveTextSUtime.OnPress     = 0;

  EveTextSUdistance.OwnerScreen = &SummaryScreen;
  EveTextSUdistance.Order       = 11;
  EveTextSUdistance.Visible     = 1;
  EveTextSUdistance.Opacity     = 255;
  EveTextSUdistance.Tag         = 255;
  EveTextSUdistance.Left        = 216;
  EveTextSUdistance.Top         = 80;
  EveTextSUdistance.Width       = 8;
  EveTextSUdistance.Height      = 17;
  EveTextSUdistance.Caption     = EveTextSUdistance_Caption;
  EveTextSUdistance.TextAlign   = taNone;
  EveTextSUdistance.FontName    = 27;
  EveTextSUdistance.Font_Color  = 0x0148;
  EveTextSUdistance.FontHandle  = 27;
  EveTextSUdistance.Source      = -1UL;
  EveTextSUdistance.Active      = 1;
  EveTextSUdistance.OnUp        = 0;
  EveTextSUdistance.OnDown      = 0;
  EveTextSUdistance.OnClick     = 0;
  EveTextSUdistance.OnPress     = 0;

  EveTextSUSpeed.OwnerScreen = &SummaryScreen;
  EveTextSUSpeed.Order       = 12;
  EveTextSUSpeed.Visible     = 1;
  EveTextSUSpeed.Opacity     = 255;
  EveTextSUSpeed.Tag         = 255;
  EveTextSUSpeed.Left        = 159;
  EveTextSUSpeed.Top         = 166;
  EveTextSUSpeed.Width       = 8;
  EveTextSUSpeed.Height      = 17;
  EveTextSUSpeed.Caption     = EveTextSUSpeed_Caption;
  EveTextSUSpeed.TextAlign   = taNone;
  EveTextSUSpeed.FontName    = 27;
  EveTextSUSpeed.Font_Color  = 0x0148;
  EveTextSUSpeed.FontHandle  = 27;
  EveTextSUSpeed.Source      = -1UL;
  EveTextSUSpeed.Active      = 1;
  EveTextSUSpeed.OnUp        = 0;
  EveTextSUSpeed.OnDown      = 0;
  EveTextSUSpeed.OnClick     = 0;
  EveTextSUSpeed.OnPress     = 0;

  EveTextSUFilename.OwnerScreen = &SummaryScreen;
  EveTextSUFilename.Order       = 13;
  EveTextSUFilename.Visible     = 1;
  EveTextSUFilename.Opacity     = 255;
  EveTextSUFilename.Tag         = 255;
  EveTextSUFilename.Left        = 158;
  EveTextSUFilename.Top         = 125;
  EveTextSUFilename.Width       = 32;
  EveTextSUFilename.Height      = 17;
  EveTextSUFilename.Caption     = EveTextSUFilename_Caption;
  EveTextSUFilename.TextAlign   = taNone;
  EveTextSUFilename.FontName    = 27;
  EveTextSUFilename.Font_Color  = 0x0148;
  EveTextSUFilename.FontHandle  = 27;
  EveTextSUFilename.Source      = -1UL;
  EveTextSUFilename.Active      = 1;
  EveTextSUFilename.OnUp        = 0;
  EveTextSUFilename.OnDown      = 0;
  EveTextSUFilename.OnClick     = 0;
  EveTextSUFilename.OnPress     = 0;

  EveTextSUAverageSpeed.OwnerScreen = &SummaryScreen;
  EveTextSUAverageSpeed.Order       = 14;
  EveTextSUAverageSpeed.Visible     = 1;
  EveTextSUAverageSpeed.Opacity     = 255;
  EveTextSUAverageSpeed.Tag         = 255;
  EveTextSUAverageSpeed.Left        = 202;
  EveTextSUAverageSpeed.Top         = 208;
  EveTextSUAverageSpeed.Width       = 8;
  EveTextSUAverageSpeed.Height      = 17;
  EveTextSUAverageSpeed.Caption     = EveTextSUAverageSpeed_Caption;
  EveTextSUAverageSpeed.TextAlign   = taNone;
  EveTextSUAverageSpeed.FontName    = 27;
  EveTextSUAverageSpeed.Font_Color  = 0x0148;
  EveTextSUAverageSpeed.FontHandle  = 27;
  EveTextSUAverageSpeed.Source      = -1UL;
  EveTextSUAverageSpeed.Active      = 1;
  EveTextSUAverageSpeed.OnUp        = 0;
  EveTextSUAverageSpeed.OnDown      = 0;
  EveTextSUAverageSpeed.OnClick     = 0;
  EveTextSUAverageSpeed.OnPress     = 0;

  EveText8.OwnerScreen = &SummaryScreen;
  EveText8.Order       = 15;
  EveText8.Visible     = 1;
  EveText8.Opacity     = 255;
  EveText8.Tag         = 255;
  EveText8.Left        = 16;
  EveText8.Top         = 166;
  EveText8.Width       = 71;
  EveText8.Height      = 17;
  EveText8.Caption     = EveText8_Caption;
  EveText8.TextAlign   = taNone;
  EveText8.FontName    = 27;
  EveText8.Font_Color  = 0x0148;
  EveText8.FontHandle  = 27;
  EveText8.Source      = -1UL;
  EveText8.Active      = 1;
  EveText8.OnUp        = 0;
  EveText8.OnDown      = 0;
  EveText8.OnClick     = 0;
  EveText8.OnPress     = 0;

  BoxRound6.OwnerScreen   = &SummaryScreen;
  BoxRound6.Order         = 16;
  BoxRound6.Visible       = 0;
  BoxRound6.Opacity       = 239;
  BoxRound6.Tag           = 255;
  BoxRound6.Left          = 28;
  BoxRound6.Top           = 14;
  BoxRound6.Width         = 420;
  BoxRound6.Height        = 241;
  BoxRound6.Pen_Width     = 1;
  BoxRound6.Pen_Color     = 0x0000;
  BoxRound6.Color         = 0xC618;
  BoxRound6.Press_Color   = 0xE71C;
  BoxRound6.Corner_Radius = 3;
  BoxRound6.Active        = 0;
  BoxRound6.OnUp          = 0;
  BoxRound6.OnDown        = 0;
  BoxRound6.OnClick       = 0;
  BoxRound6.OnPress       = 0;

  EveText9.OwnerScreen = &SummaryScreen;
  EveText9.Order       = 17;
  EveText9.Visible     = 0;
  EveText9.Opacity     = 255;
  EveText9.Tag         = 255;
  EveText9.Left        = 42;
  EveText9.Top         = 20;
  EveText9.Width       = 57;
  EveText9.Height      = 21;
  EveText9.Caption     = EveText9_Caption;
  EveText9.TextAlign   = taNone;
  EveText9.FontName    = 28;
  EveText9.Font_Color  = 0x0148;
  EveText9.FontHandle  = 28;
  EveText9.Source      = -1UL;
  EveText9.Active      = 0;
  EveText9.OnUp        = 0;
  EveText9.OnDown      = 0;
  EveText9.OnClick     = 0;
  EveText9.OnPress     = 0;

  EveText11.OwnerScreen = &SummaryScreen;
  EveText11.Order       = 18;
  EveText11.Visible     = 0;
  EveText11.Opacity     = 255;
  EveText11.Tag         = 255;
  EveText11.Left        = 60;
  EveText11.Top         = 52;
  EveText11.Width       = 286;
  EveText11.Height      = 15;
  EveText11.Caption     = EveText11_Caption;
  EveText11.TextAlign   = taNone;
  EveText11.FontName    = 26;
  EveText11.Font_Color  = 0x0148;
  EveText11.FontHandle  = 26;
  EveText11.Source      = -1UL;
  EveText11.Active      = 0;
  EveText11.OnUp        = 0;
  EveText11.OnDown      = 0;
  EveText11.OnClick     = 0;
  EveText11.OnPress     = 0;

  EveText13.OwnerScreen = &SummaryScreen;
  EveText13.Order       = 19;
  EveText13.Visible     = 0;
  EveText13.Opacity     = 255;
  EveText13.Tag         = 255;
  EveText13.Left        = 60;
  EveText13.Top         = 78;
  EveText13.Width       = 228;
  EveText13.Height      = 15;
  EveText13.Caption     = EveText13_Caption;
  EveText13.TextAlign   = taNone;
  EveText13.FontName    = 26;
  EveText13.Font_Color  = 0x0148;
  EveText13.FontHandle  = 26;
  EveText13.Source      = -1UL;
  EveText13.Active      = 0;
  EveText13.OnUp        = 0;
  EveText13.OnDown      = 0;
  EveText13.OnClick     = 0;
  EveText13.OnPress     = 0;

  EveText14.OwnerScreen = &SummaryScreen;
  EveText14.Order       = 20;
  EveText14.Visible     = 0;
  EveText14.Opacity     = 255;
  EveText14.Tag         = 255;
  EveText14.Left        = 62;
  EveText14.Top         = 142;
  EveText14.Width       = 208;
  EveText14.Height      = 15;
  EveText14.Caption     = EveText14_Caption;
  EveText14.TextAlign   = taNone;
  EveText14.FontName    = 26;
  EveText14.Font_Color  = 0x0148;
  EveText14.FontHandle  = 26;
  EveText14.Source      = -1UL;
  EveText14.Active      = 0;
  EveText14.OnUp        = 0;
  EveText14.OnDown      = 0;
  EveText14.OnClick     = 0;
  EveText14.OnPress     = 0;

  EveText15.OwnerScreen = &SummaryScreen;
  EveText15.Order       = 21;
  EveText15.Visible     = 0;
  EveText15.Opacity     = 255;
  EveText15.Tag         = 255;
  EveText15.Left        = 62;
  EveText15.Top         = 124;
  EveText15.Width       = 120;
  EveText15.Height      = 15;
  EveText15.Caption     = EveText15_Caption;
  EveText15.TextAlign   = taNone;
  EveText15.FontName    = 26;
  EveText15.Font_Color  = 0x0148;
  EveText15.FontHandle  = 26;
  EveText15.Source      = -1UL;
  EveText15.Active      = 0;
  EveText15.OnUp        = 0;
  EveText15.OnDown      = 0;
  EveText15.OnClick     = 0;
  EveText15.OnPress     = 0;

  EveText16.OwnerScreen = &SummaryScreen;
  EveText16.Order       = 22;
  EveText16.Visible     = 0;
  EveText16.Opacity     = 255;
  EveText16.Tag         = 255;
  EveText16.Left        = 62;
  EveText16.Top         = 160;
  EveText16.Width       = 93;
  EveText16.Height      = 15;
  EveText16.Caption     = EveText16_Caption;
  EveText16.TextAlign   = taNone;
  EveText16.FontName    = 26;
  EveText16.Font_Color  = 0x0148;
  EveText16.FontHandle  = 26;
  EveText16.Source      = -1UL;
  EveText16.Active      = 0;
  EveText16.OnUp        = 0;
  EveText16.OnDown      = 0;
  EveText16.OnClick     = 0;
  EveText16.OnPress     = 0;

  EveText17.OwnerScreen = &SummaryScreen;
  EveText17.Order       = 23;
  EveText17.Visible     = 0;
  EveText17.Opacity     = 255;
  EveText17.Tag         = 255;
  EveText17.Left        = 62;
  EveText17.Top         = 192;
  EveText17.Width       = 185;
  EveText17.Height      = 15;
  EveText17.Caption     = EveText17_Caption;
  EveText17.TextAlign   = taNone;
  EveText17.FontName    = 26;
  EveText17.Font_Color  = 0x0148;
  EveText17.FontHandle  = 26;
  EveText17.Source      = -1UL;
  EveText17.Active      = 0;
  EveText17.OnUp        = 0;
  EveText17.OnDown      = 0;
  EveText17.OnClick     = 0;
  EveText17.OnPress     = 0;

  EveButtonSUBack.OwnerScreen   = &SummaryScreen;
  EveButtonSUBack.Order         = 24;
  EveButtonSUBack.Visible       = 0;
  EveButtonSUBack.Opacity       = 255;
  EveButtonSUBack.Tag           = 255;
  EveButtonSUBack.Left          = 340;
  EveButtonSUBack.Top           = 214;
  EveButtonSUBack.Width         = 96;
  EveButtonSUBack.Height        = 35;
  EveButtonSUBack.Color         = 0x03DA;
  EveButtonSUBack.Press_Color   = 0x7E3F;
  EveButtonSUBack.ColorTo       = 0x7E3F;
  EveButtonSUBack.Press_ColorTo = 0x03DA;
  EveButtonSUBack.Caption       = EveButtonSUBack_Caption;
  EveButtonSUBack.FontName      = 27;
  EveButtonSUBack.Font_Color    = 0xFFFF;
  EveButtonSUBack.FontHandle    = 27;
  EveButtonSUBack.Source        = -1UL;
  EveButtonSUBack.Flat          = 0;
  EveButtonSUBack.Active        = 0;
  EveButtonSUBack.OnUp          = 0;
  EveButtonSUBack.OnDown        = 0;
  EveButtonSUBack.OnClick       = &EveButtonSUBack_OnClick;
  EveButtonSUBack.OnPress       = 0;

  EveButtonSUBack_OnClick.Action       = EveButtonSUBackOnClick;
  EveButtonSUBack_OnClick.Sound.SndAct = VTFT_SNDACT_NONE;
  EveButtonSUBack_OnClick.Sound.Effect = _FT800_SOUND_XYLOPHONE;
  EveButtonSUBack_OnClick.Sound.Pitch  = _FT800_SOUND_PITCH_A5;
  EveButtonSUBack_OnClick.Sound.Volume = 255;

}

void Init_MCU() {
  PLLFBD = 68;            // PLL multiplier M=70
  CLKDIV = 0x0000;        // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;          // Convert all I/O pins to digital
  ANSELB = 0x00; 
}

void InitVTFTStack() {
  union {
    TFT800PWM       PWM;
    TFT800GPIO      GPIO;
    TFT800Audio     Audio;
    TFT800Sound     Sound;
    TFT800Touch     Touch;
    TFT800Display   Display;
    TFT800Interrupt Interrupt;
    TFT800TouchTransform TTransform;
  } cfg;

  Init_MCU();

  SPI1_Init_Advanced(_SPI_MASTER,             // Initialize SPI1 module
                     _SPI_8_BIT,              // master_mode    = _SPI_MASTER
                     _SPI_PRESCALE_SEC_2,     // data_mode      = _SPI_8_BIT
                     _SPI_PRESCALE_PRI_4,     // sec. prescaler = _SPI_PRESCALE_SEC_1
                     _SPI_SS_DISABLE,         // pri. prescaler = _SPI_PRESCALE_PRI_4
                     _SPI_DATA_SAMPLE_MIDDLE, // slave_select   = _SPI_SS_DISABLE (Only for slave mod)
                     _SPI_CLK_IDLE_LOW,       // data_sample    = _SPI_DATA_SAMPLE_END
                     _SPI_IDLE_2_ACTIVE);     // clock_idle     = _SPI_CLK_IDLE_HIGH
                                              // edge

  FT800_Init();

  // Core setup
  FT800_Core_ClockSource(_FT800_CLK_SOURCE_EXTERNAL);
  FT800_Core_ClockPLL(_FT800_CLK_PLL_48MHz);

  // Internal modules setup
  cfg.Display = VTFT_FT800_CONFIG_DISPLAY;
  FT800_Display_SetConfig(&cfg.Display);

  cfg.PWM = VTFT_FT800_CONFIG_PWM;
  FT800_PWM_SetConfig(&cfg.PWM);

  cfg.GPIO = VTFT_FT800_CONFIG_GPIO;
  FT800_GPIO_SetConfig(&cfg.GPIO);

  cfg.Audio = VTFT_FT800_CONFIG_AUDIO;
  FT800_Audio_SetConfig(&cfg.Audio);

  cfg.Sound = VTFT_FT800_CONFIG_SOUND;
  FT800_Sound_SetConfig(&cfg.Sound);

  cfg.Interrupt = VTFT_FT800_CONFIG_INTERRUPT;
  FT800_Interrupt_SetConfig(&cfg.Interrupt);

  cfg.Touch = VTFT_FT800_CONFIG_TOUCH;
  FT800_Touch_SetConfig(&cfg.Touch);

  cfg.TTransform = VTFT_FT800_CONFIG_TOUCHTRANSFORM;
  FT800_TouchTransform_SetConfig(&cfg.TTransform);

  // Init all dynamic objects
  InitObjects();

  // Draw start screen
  DrawScreen(&SplashScreen);
}