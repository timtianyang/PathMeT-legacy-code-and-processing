#ifndef FT800_TYPES
#define FT800_TYPES

#ifdef __MIKROC_PRO_FOR_DSPIC__
  #define far_ft8 far
#else
  #ifdef __MIKROC_PRO_FOR_AVR__
    #define far_ft8 far
  #else
    #define far_ft8
  #endif
#endif

#ifndef __MIKROC_PRO_FOR_PIC32__
#ifndef __MIKROC_PRO_FOR_ARM__
  #define __INCOMPATIBLE_ROM_RAM_PTR__
#endif
#endif

// typedefs
typedef unsigned char uint8_ft8;
typedef signed   char int8_ft8;
typedef unsigned int  uint16_ft8;
typedef int           int16_ft8;
typedef unsigned long uint32_ft8;
typedef long          int32_ft8;
typedef unsigned long long uint64_ft8;
typedef long long     int64_ft8;

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
  int16_ft8  Left;
  int16_ft8  Top;
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
  uint8_ft8   Width;
} TFT800Pen;

typedef struct
{
  TFT800Color ColorBg;  // background color property for coprocessor objects
  TFT800Color Color;    // foreground color property for coprocessor objects
                      // one and only color property for non-coprocessor objects
                      // (gradient start color if enabled)
  TFT800Color ColorTo;  // gradient end color (used only if gradient is enabled)
  uint8_ft8   Gradient; // gradient type (0 = no gradient)
  TFT800Alpha Alpha;
  uint8_ft8   Style;
} TFT800Brush;

/* FT800 sturcture descriptor for bilt-in fonts */
#define MAX_FONT_CHAR_COUNT 256          // built-in fonts have 128 chars, 
                                         // but we need to uphold whole ascii table for non built-in fonts
typedef struct
{
  /* All the values are in bytes */
  uint8_ft8  FontWidth[MAX_FONT_CHAR_COUNT]; // Width of each character font from 0 to MAX_FONT_CHAR_COUNT-1
  uint32_ft8 FontBitmapFormat;               // Bitmap format of font wrt bitmap formats supported by FT800
  uint32_ft8 FontLineStride;                 // Font line stride in FT800 ROM
  uint32_ft8 FontWidthInPixels;              // Width of font in pixels
  uint32_ft8 FontHeightInPixels;             // Font height in pixels
  uint32_ft8 PointerToFontGraphicsData;      // Pointer to font graphics data
} TFT800FontGraphics;

typedef struct
{
  TFT800FontGraphics GrData;
  uint16_ft8 FirstChar;
  uint16_ft8 LastChar;
} TFT800CharSetDsc;

typedef struct
{
  uint32_ft8       Name;
  uint32_ft8       Source;
  TFT800Color      Color;
  TFT800Alpha      Alpha;
  TFT800Handle     Handle;
  TFT800CharSetDsc CharSetDsc;
} TFT800Font;

typedef struct
{
  uint8_ft8  Format;
  uint16_ft8 LineStride;
  uint16_ft8 Height;
} TFT800BmpLayout;

typedef struct
{
  uint8_ft8  FwFlags;
  uint16_ft8 Width;
  uint16_ft8 Height;
} TFT800BmpSize;

typedef struct
{
  uint32_ft8      Source;
  TFT800BmpLayout Layout;
  TFT800BmpSize   Size;
} TFT800BmpConfig;

typedef struct
{
  TFT800BmpConfig Configs[16];
  uint8_ft8       Current;
} TFT800BmpHandle;

typedef struct
{
  TFT800BmpConfig Config;
  TFT800Color     BlendColor;
  TFT800Alpha     Alpha;
  TFT800Handle    Handle;
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
  TFT800Time   Time;
  uint8_ft8  Style;
} TFT800CoProcGraphics;

typedef struct
{
  TFT800Pen    Pen;
  TFT800Brush  Brush;
  TFT800Font   Font;
  TFT800Bitmap Bitmap;

  TFT800Rect   ClipRect;
  TFT800Point  Cursor;

  uint8_ft8    Stencil;
  uint8_ft8    Tag;

  TFT800CoProcGraphics CPGraphics;
} TFT800Canvas;

typedef struct
{
  TOpr       Opr;
  uint32_ft8 RWPtr;
} TFT800IO;

/* structures used for chip configurations */
typedef struct
{
  /* video display settings params */
  uint32_ft8 Frequency;          // main clock frequency - 27 bits
  uint32_ft8 OutRenderMode;      // 0 normal, 1 write, 2 read - 2 bits
  uint32_ft8 RenderReadScanLine; // scanline for read render mode - 9 bits
  uint32_ft8 RenderWriteTrigger; // trigger for write render mode - 1 bit

  uint32_ft8 hCycle;             // number if horizontal cycles for display - 10 bits
  uint32_ft8 hOffset;            // horizontal offset from starting signal - 10 bits
  uint32_ft8 hSize;              // width resolution - 10 bits
  uint32_ft8 hSync0;             // hsync falls - 10 bits
  uint32_ft8 hSync1;             // hsync rise - 10 bits

  uint32_ft8 vCycle;             // number of vertical cycles for display - 10 bits
  uint32_ft8 vOffset;            // vertical offset from start signal - 10 bits
  uint32_ft8 vSize;              // height resolution - 10 bits
  uint32_ft8 vSync0;             // vsync falls - 10 bits
  uint32_ft8 vSync1;             // vsync rise - 10 bits

  uint32_ft8 Rotate180;          // rotate display 180 degrees, 1 - rotate enable, 0 - rotate disable - 1 bit
  uint32_ft8 OutBits;            // output bits resolution - 9 bit
  uint32_ft8 OutDither;          // output number of bits - 1 bit
  uint32_ft8 OutSwizzle;         // output swizzle - 4 bits
  uint32_ft8 OutCSpread;         // output clock spread enable, - 1 bit
  uint32_ft8 PClockPolarity;     // polarity of pclock, 0 - rising edge, 1 - falling edge - 1 bit
  uint32_ft8 PClock;             // pclock of ft800 - 0 means disable and >0 means 48MHz/pclock - 8 bits
} TFT800Display;

typedef struct
{
  uint32_ft8 TouchMode;        // touch screen mode - 2 bits
  uint32_ft8 TouchADCMode;     // touch screen mode - Touch ADC mode - 1 bit
  uint32_ft8 TouchCharge;      // Touchscreen charge time, units of 6 clocks
  uint32_ft8 TouchSettle;      // touch screen settle time - 4 bits
  uint32_ft8 TouchOversample;  // touch screen oversample - 4 bits
  uint32_ft8 TouchRZThreshold; // Touchscreen resistance threshold
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
  uint8_ft8  Format;
  uint8_ft8  Loop;
  uint8_ft8  Volume;
  uint8_ft8  Play;
} TFT800Audio;

typedef struct
{
  /* PWM configurations */
  uint16_ft8 Freq; // PWM frequency - 14 bits
  uint8_ft8  Duty; // PWM duty cycle expressed in % and 0 to 128 is the range.
} TFT800PWM;

typedef struct
{
  uint8_ft8 GPIODIR; // GPIO direction - 1 output, 0 input (8bit wide)
  uint8_ft8 GPIO;    // GPIO data latch
} TFT800GPIO;

typedef struct
{
  TFT800PWM       *pPWMCfg;
  TFT800GPIO      *pGPIOCfg;
  TFT800Audio     *pAudioCfg;
  TFT800Sound     *pSoundCfg;
  TFT800Touch     *pTouchCfg;
  TFT800Display   *pDisplayCfg;
  TFT800Interrupt *pInterruptCfg;
  TFT800TouchTransform *pTTransformCfg;
} TFT800Config;
/* end of structures used for chip configurations */

/* structures used for current chip context (status) */
typedef struct
{
  struct
  {
    // ft800 graphic state (context)
    // used to keep track of the current graphic properties,
    // so that library updates them only when they need to be changed,
    // thus saving display list instruction space.
    TFT800Color Color;
    TFT800Alpha Alpha;

    uint8_ft8   Tag;

    TFT800Color ClearColor;
    TFT800Alpha ClearAlpha;
    uint8_ft8   ClearStencil;
    uint8_ft8   ClearTag;

    uint16_ft8  LineWidth;
    uint16_ft8  PointSize;

    uint16_ft8  ScissorLeft;
    uint16_ft8  ScissorTop;
    uint16_ft8  ScissorWidth;
    uint16_ft8  ScissorHeight;

    uint8_ft8   BmpHandle;
    uint8_ft8   Cell;

    struct
    {
      Color        : 1;
      Alpha        : 1;
      Tag          : 1;
      ClearColor   : 1;
      ClearAlpha   : 1;
      ClearStencil : 1;
      ClearTag     : 1;
      LineWidth    : 1;
      PointSize    : 1;
      ScissorPos   : 1;
      ScissorSize  : 1;
      BmpHandle    : 1;
      Cell         : 1;
      
      Unused       : 32-13; // make sure that this UpdateFlags are 4-byte long,
                            // (mP, mB compatibility issue)
    } UpdateFlags; // force update of the graphic properties,
                   // i.e. after restore contex command
                   // because ft800 library does not implement push stack for graphic properties
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
/* end of structures used for current chip context (status) */

// ~typedefs

#endif