# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 16 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 42 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 90 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 100 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 139 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 233 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 354 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct{
    int row;
    int col;
    int active;
    int collision;
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
} ManObs;

typedef struct {
    int row;
    int col;
} Sprite;
# 17 "main.c" 2
# 1 "pikachu.h" 1
# 21 "pikachu.h"
extern const unsigned short pikachuTiles[16384];


extern const unsigned short pikachuPal[256];
# 18 "main.c" 2
# 1 "Tay.h" 1
# 22 "Tay.h"
extern const unsigned short TayTiles[384];


extern const unsigned short TayMap[64];


extern const unsigned short TayPal[256];
# 19 "main.c" 2
# 1 "backbg.h" 1
# 22 "backbg.h"
extern const unsigned short backbgTiles[1632];


extern const unsigned short backbgMap[2048];


extern const unsigned short backbgPal[256];
# 20 "main.c" 2
# 1 "frontbg.h" 1
# 22 "frontbg.h"
extern const unsigned short frontbgTiles[3552];


extern const unsigned short frontbgMap[1024];


extern const unsigned short frontbgPal[256];
# 21 "main.c" 2
# 1 "taySprite.h" 1
# 21 "taySprite.h"
extern const unsigned short taySpriteTiles[16384];


extern const unsigned short taySpritePal[256];
# 22 "main.c" 2
# 1 "selSprite.h" 1
# 21 "selSprite.h"
extern const unsigned short selSpriteTiles[16384];


extern const unsigned short selSpritePal[256];
# 23 "main.c" 2
# 1 "BadBlood.h" 1
# 20 "BadBlood.h"
extern const unsigned char BadBlood[2313008];
# 24 "main.c" 2
# 1 "FootStep.h" 1
# 20 "FootStep.h"
extern const unsigned char FootStep[12238];
# 25 "main.c" 2
# 1 "Foot.h" 1
# 20 "Foot.h"
extern const unsigned char Foot[6333];
# 26 "main.c" 2
# 1 "splashScreen.h" 1
# 22 "splashScreen.h"
extern const unsigned short splashScreenTiles[18592];


extern const unsigned short splashScreenMap[1024];


extern const unsigned short splashScreenPal[256];
# 27 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[19232];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 28 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[19232];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 29 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[19136];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 30 "main.c" 2


# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 16 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 216 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4

# 216 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 149 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 12 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 27 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 41 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 63 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 89 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 120 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 146 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 168 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 186 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 200 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 8 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3
# 13 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 1 3 4
# 9 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 3 4
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 14 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;




typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 74 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 84 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 94 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 104 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 153 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 162 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 10 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 2 3 4
# 6 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 14 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long _off_t;



typedef int __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 55 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 67 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 357 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 68 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 91 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 179 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 317 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 762 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 46 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 29 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;




typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 124 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);



float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);

int system (const char *__string);
# 161 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));
# 180 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 211 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);







long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);







unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);
# 246 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 279 "/Users/mckenzieelliott/Documents/GT/2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double strtold (const char *restrict, char **restrict);




# 33 "main.c" 2
# 1 "level1BackBG.h" 1
# 22 "level1BackBG.h"

# 22 "level1BackBG.h"
extern const unsigned short level1BackBGTiles[4352];


extern const unsigned short level1BackBGMap[1024];


extern const unsigned short level1BackBGPal[256];
# 34 "main.c" 2
# 1 "level1FrontBG.h" 1
# 22 "level1FrontBG.h"
extern const unsigned short level1FrontBGTiles[4512];


extern const unsigned short level1FrontBGMap[2048];


extern const unsigned short level1FrontBGPal[256];
# 35 "main.c" 2
# 1 "Level2Splash2.h" 1
# 22 "Level2Splash2.h"
extern const unsigned short Level2Splash2Tiles[19136];


extern const unsigned short Level2Splash2Map[1024];


extern const unsigned short Level2Splash2Pal[256];
# 36 "main.c" 2
# 1 "level2FrontBG.h" 1
# 22 "level2FrontBG.h"
extern const unsigned short level2FrontBGTiles[6144];


extern const unsigned short level2FrontBGMap[2048];


extern const unsigned short level2FrontBGPal[256];
# 37 "main.c" 2
# 1 "level2BackBG.h" 1
# 22 "level2BackBG.h"
extern const unsigned short level2BackBGTiles[3808];


extern const unsigned short level2BackBGMap[1024];


extern const unsigned short level2BackBGPal[256];
# 38 "main.c" 2
# 1 "level3Splash.h" 1
# 22 "level3Splash.h"
extern const unsigned short level3SplashTiles[19232];


extern const unsigned short level3SplashMap[1024];


extern const unsigned short level3SplashPal[256];
# 39 "main.c" 2
# 1 "Instructions.h" 1
# 22 "Instructions.h"
extern const unsigned short InstructionsTiles[8544];


extern const unsigned short InstructionsMap[1024];


extern const unsigned short InstructionsPal[256];
# 40 "main.c" 2
# 1 "Instructions2.h" 1
# 22 "Instructions2.h"
extern const unsigned short Instructions2Tiles[8960];


extern const unsigned short Instructions2Map[1024];


extern const unsigned short Instructions2Pal[256];
# 41 "main.c" 2
# 1 "splashScreenInst.h" 1
# 22 "splashScreenInst.h"
extern const unsigned short splashScreenInstTiles[18592];


extern const unsigned short splashScreenInstMap[1024];


extern const unsigned short splashScreenInstPal[256];
# 42 "main.c" 2
# 1 "taySpriteAll.h" 1
# 21 "taySpriteAll.h"
extern const unsigned short taySpriteAllTiles[16384];


extern const unsigned short taySpriteAllPal[256];
# 43 "main.c" 2
# 1 "level3BackBG.h" 1
# 22 "level3BackBG.h"
extern const unsigned short level3BackBGTiles[16896];


extern const unsigned short level3BackBGMap[1024];


extern const unsigned short level3BackBGPal[256];
# 44 "main.c" 2
# 1 "level3FrontBG.h" 1
# 22 "level3FrontBG.h"
extern const unsigned short level3FrontBGTiles[3200];


extern const unsigned short level3FrontBGMap[2048];


extern const unsigned short level3FrontBGPal[256];
# 45 "main.c" 2
# 1 "smack.h" 1
# 20 "smack.h"
extern const unsigned char smack[4563];
# 46 "main.c" 2

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;
int levMaxEnemyNum = 10;

OBJ_ATTR shadowOAM[128];




typedef struct
{
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int colRowCounter
} MOVOBJ;

typedef struct
{
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int active;
    int faster;
} MOVOBJ2;

MOVOBJ tay;
MOVOBJ sel;
MOVOBJ lifeHeart[5];
MOVOBJ2 manEnemy[500];

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;

void hideSprites();
void update();
void draw();
void game();
void lose();
void win();
void instructions();
void pause();
void splash();
void level2Splash();
void enemyUpdate();
void level3Splash();
void initializeLevel();
void instructions2();
void updateLives();
void checkForCollision();
void deAcEnemies();



void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

enum { PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};
enum { TAYFRONT, TAYBACK, TAYRIGHT, TAYLEFT, TAYIDLE};
enum { SELFRONT, SELBACK, SELRIGHT, SELLEFT, SELIDLE};
enum {GAME, SPLASH, PAUSE, WIN, LOSE, INSTRUCTIONS, INSTRUCTIONS2, L2SPLASH, L3SPLASH};
enum {L1, L2, L3};
int state = SPLASH;
int level = L1;
int lives;
int numInactive = 0;

int winCount = 50;
int fastProb;

int main()
{


    hideSprites();

    *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);

 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 3<<14 | 1 << 7;

 buttons = *(volatile unsigned int *)0x04000130;

 setupInterrupts();
 setupSounds();



 soundA.loops=1;

 initializeLevel();
 initialize();
    playSoundA(BadBlood, 2313008, 11025);

 while(1)
 {
  switch(state) {
   case SPLASH:
    splash();
    break;
   case GAME:
    game();
    break;
   case L2SPLASH:
    level2Splash();
    break;
   case L3SPLASH:
    level3Splash();
    break;
   case WIN:
    win();
    break;
   case LOSE:
    lose();
    break;
   case PAUSE:
    pause();
    break;
   case INSTRUCTIONS:
    instructions();
    break;
   case INSTRUCTIONS2:
    instructions2();
    break;
  }
  waitForVblank();
  *(volatile unsigned short *)0x04000010 = hOff;
  *(volatile unsigned short *)0x04000014 = hOff/2;

 }

 return 0;
}


void hideSprites()
{
    int i;
    for (i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2 << 8);
    }

}

void game() {


 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 28 << 8 | 1<<14 | 1 << 7;
 *(volatile unsigned short*)0x400000A = 1 << 2 | 30 << 8 | 0<<14 | 1 << 7;

 if(level == L1) {
  loadPalette(level1FrontBGPal);
  DMANow(3, level1FrontBGTiles, &((charblock *)0x6000000)[0], 9024/2 | (0 << 23));
  DMANow(3, level1FrontBGMap, &((screenblock *)0x6000000)[28], 4096/2 | (0 << 23));
  DMANow(3, level1BackBGTiles, &((charblock *)0x6000000)[1], 8704/2 | (0 << 23));
  int sbb = 30;
  loadMap(level1BackBGMap, 2048/2 , 0, sbb);
 } else if(level == L2) {
  loadPalette(level2FrontBGPal);
  DMANow(3, level2FrontBGTiles, &((charblock *)0x6000000)[0], 12288/2 | (0 << 23));
  DMANow(3, level2FrontBGMap, &((screenblock *)0x6000000)[28], 4096/2 | (0 << 23));
  DMANow(3, level2BackBGTiles, &((charblock *)0x6000000)[1], 7616/2 | (0 << 23));
  int sbb = 30;
  loadMap(level2BackBGMap, 2048/2 , 0, sbb);

 } else if(level == L3){
  loadPalette(level3FrontBGPal);
  DMANow(3, level3FrontBGTiles, &((charblock *)0x6000000)[0], 6400/2 | (0 << 23));
  DMANow(3, level3FrontBGMap, &((screenblock *)0x6000000)[28], 4096/2 | (0 << 23));

  DMANow(3, level3BackBGTiles, &((charblock *)0x6000000)[1], 33792/2 | (0 << 23));
  int sbb = 30;
  loadMap(level3BackBGMap, 2048/2 , 0, sbb);

 }

 DMANow(3, taySpritePal, ((unsigned short*)(0x5000200)), 256);
    DMANow(3, taySpriteTiles, &((charblock *)0x6000000)[4], 32768/2);

    updateLives();

  tay.prevAniState = tay.aniState;
  tay.aniState = TAYIDLE;


  if(tay.aniCounter % 20 == 0) {

   if(tay.currFrame == 2) {
    tay.currFrame = 0;
   } else {
    tay.currFrame++;
   }
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<6)))) {
   tay.aniState = TAYBACK;
   if(vOff > 88) {
    vOff--;
    tay.colRowCounter--;


    int j;
    for(j = 0; j < levMaxEnemyNum; j++) {
     if(manEnemy[j].active == 1) {
      manEnemy[j].row++;
     }
    }
    if (level == L1) {


    } else if (level == L2) {


     shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
     shadowOAM[2].attr2 = (6)*32+(2);
    } else if (level == L3) {
     shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
     shadowOAM[2].attr2 = (6)*32+(2);


     shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
     shadowOAM[1].attr2 = (16)*32+(2);

    }
   }
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<7)))) {

   tay.aniState = TAYFRONT;
   if(vOff < 150) {
    vOff++;
    tay.colRowCounter++;


    for(int j = 0; j < levMaxEnemyNum; j++) {
     if(manEnemy[j].active == 1) {
      manEnemy[j].row--;
     }
    }
    if (level == L1) {


    } else if (level == L2) {


     shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
     shadowOAM[2].attr2 = (6)*32+(0);

    } else if (level == L3) {

     shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
     shadowOAM[2].attr2 = (6)*32+(0);


     shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
     shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
     shadowOAM[1].attr2 = (16)*32+(0);

    }
   }
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
   tay.aniState = TAYLEFT;
   hOff--;
   winCount--;

   if(hOff % 30 == 0) {

   }

   if (level == L1) {

   } else if (level == L2) {
    shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = (6)*32+(6);
   } else if (level == L3) {

    shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = (6)*32+(6);


    shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
    shadowOAM[1].attr2 = (16)*32+(6);
   }


  }
  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
  {
   tay.aniState = TAYRIGHT;
   hOff++;
   winCount++;


   int j = 0;
   while(j < levMaxEnemyNum) {
    checkForCollision();
     if(manEnemy[j].faster == 1) {
      manEnemy[j].col -=2;
     } else {
      manEnemy[j].col--;
     }
    j++;
   }


   if(hOff % 30 == 0) {

   }


   if (level == L1) {
    shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = (26)*32+(4);

    shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
    shadowOAM[1].attr2 = (26)*32+(4);
   } else if (level == L2) {
    shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = (6)*32+(4);

    shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
    shadowOAM[1].attr2 = (26)*32+(4);
   } else if (level == L3) {

    shadowOAM[2].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = ((tay.col - 15) & 0x1FF) | (1 << 14);
    shadowOAM[2].attr2 = (6)*32+(4);

    shadowOAM[1].attr0 = ((tay.row - 2) & 0xFF) | (0 << 13) | (0 << 14);
    shadowOAM[1].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
    shadowOAM[1].attr2 = (16)*32+(4);

   }

  }

  if(tay.aniState == TAYIDLE) {
   tay.aniState = tay.prevAniState;
   tay.currFrame = 0;
  } else {
   tay.aniCounter++;
  }




        shadowOAM[3].attr0 = (tay.row & 0xFF) | (0 << 13) | (0 << 14);
  shadowOAM[3].attr1 = (tay.col & 0x1FF) | (1 << 14);
  shadowOAM[3].attr2 = (tay.currFrame * 2)*32+(tay.aniState * 2);


  int j = 0;
  while( j < levMaxEnemyNum) {

   if (manEnemy[j].active == 1) {
    shadowOAM[j + 8].attr0 = (manEnemy[j].row & 0xFF) | (0 << 13) | (0 << 14);
    if(manEnemy[j].col < 0 || manEnemy[j].col > 240) shadowOAM[j+8].attr0 |= (2 << 8);
    shadowOAM[j + 8].attr1 = (manEnemy[j].col & 0x1FF) | (1 << 14);
    shadowOAM[j + 8].attr2 = (0)*32+(8);
   } else {
    shadowOAM[j + 8].attr0 = (manEnemy[j].row & 0xFF) | (0 << 13) | (0 << 14) | (2 << 8);
    shadowOAM[j + 8].attr1 = (manEnemy[j].col & 0x1FF) | (1 << 14);
    shadowOAM[j + 8].attr2 = (22)*32+(8);

   }
   j++;
  }



        *(volatile unsigned short *)0x04000010 = hOff;
        *(volatile unsigned short *)0x04000012 = vOff;


        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

        if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   state = PAUSE;
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<0))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   lives = 8000;

  }
  update();

}

void update() {



 for(int j = 0; j < levMaxEnemyNum; j++) {
   if(manEnemy[j].col < 0) {
    manEnemy[j].active = 0;
    manEnemy[j].col = 0;

   }
 }

 int j = 0;
 while((manEnemy[j].active = 0) && (j < levMaxEnemyNum)) {
  j++;
  if(j == (levMaxEnemyNum)) {
   enemyUpdate();
  }
 }




 if(lives <= 0) {

  state = LOSE;
 }

 if(winCount == 800)
  {
   state = L2SPLASH;

   winCount = 801;
  }

  if(winCount == 1600)
  {
   state = L3SPLASH;

   winCount = 1601;
  }

  if(winCount == 2600)
  {
   state = WIN;

   winCount = 0;
  }

  if(winCount <= -200)
  {
   state = LOSE;
   winCount = 0;
  }



}



void enemyUpdate() {

 int rNumOfEnemies;

 rNumOfEnemies = rand() % levMaxEnemyNum;

 for(int j = 0; j < rNumOfEnemies; j++) {

  int rRow = (rand() % (183-80)) + 95;
  int rCol = (rand() % (800-350)) + (tay.col + 350);
  manEnemy[j].row = rRow;
  manEnemy[j].col = rCol;

  manEnemy[j].active = 1;
  if(j % fastProb == 0) {
   manEnemy[j].faster = 1;
  } else {
   manEnemy[j].faster = 0;
  }
 }

}

void updateLives() {

 if(lives == 3) {
   shadowOAM[5].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[5].attr1 = ((tay.col - 50) & 0x1FF) | (1 << 14);
   shadowOAM[5].attr2 = (2)*32+(8);

   shadowOAM[6].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[6].attr1 = ((tay.col - 40) & 0x1FF) | (1 << 14);
   shadowOAM[6].attr2 = (2)*32+(8);

   shadowOAM[7].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[7].attr1 = ((tay.col - 30) & 0x1FF) | (1 << 14);
   shadowOAM[7].attr2 = (2)*32+(8);

  } else if(lives == 2 ) {

   shadowOAM[5].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[5].attr1 = ((tay.col - 50) & 0x1FF) | (1 << 14);
   shadowOAM[5].attr2 = (2)*32+(8);

   shadowOAM[6].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[6].attr1 = ((tay.col - 40) & 0x1FF) | (1 << 14);
   shadowOAM[6].attr2 = (2)*32+(8);

   shadowOAM[7].attr0 = (2 << 8);



  } else if (lives == 1) {

   shadowOAM[5].attr0 = ((tay.row - 125) & 0xFF) | (0 << 13) | (0 << 14);
   shadowOAM[5].attr1 = ((tay.col - 50) & 0x1FF) | (1 << 14);
   shadowOAM[5].attr2 = (2)*32+(8);

   shadowOAM[6].attr0 = (2 << 8);

   shadowOAM[7].attr0 = (2 << 8);

  } else {

   shadowOAM[5].attr0 = (2 << 8);

   shadowOAM[6].attr0 = (2 << 8);

   shadowOAM[7].attr0 = (2 << 8);

  }
}

void checkForCollision() {

 for(int j=0; j<levMaxEnemyNum; j++) {
  if(manEnemy[j].active == 1) {
   if(manEnemy[j].col <= tay.col + 16 && manEnemy[j].col + 16 >= tay.col) {
    if(manEnemy[j].row <= tay.row + 16 && manEnemy[j].row + 8 >= tay.row) {

     lives--;


     manEnemy[j].active = 0;
     playSoundB(smack, 4563, 11025);
    }
# 651 "main.c"
   }
  }
 }
}

void initializeLevel() {
 if(level == L1) {

  levMaxEnemyNum = 30;
  fastProb = 4;

 } else if(level == L2) {

  levMaxEnemyNum = 40;
  fastProb = 3;

 } else {

  levMaxEnemyNum = 45;
  fastProb = 2;

 }
}

void instructions() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


 loadPalette(InstructionsPal);
 DMANow(3, InstructionsTiles, &((charblock *)0x6000000)[0], 17088/2);
 DMANow(3, InstructionsMap, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<0))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   state = INSTRUCTIONS2;
  }
}

void instructions2() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


 loadPalette(Instructions2Pal);
 DMANow(3, Instructions2Tiles, &((charblock *)0x6000000)[0], 17920/2);
 DMANow(3, Instructions2Map, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<0))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   state = SPLASH;
  }
}

void splash() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;

    level = L1;


 loadPalette(splashScreenInstPal);
 DMANow(3, splashScreenInstTiles, &((charblock *)0x6000000)[0], 37184/2);
 DMANow(3, splashScreenInstMap, &((screenblock *)0x6000000)[30], 2048/2);


 initialize();
 initializeLevel();



  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   state = GAME;
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<0))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<0))));
   state = INSTRUCTIONS;
  }
}

void level2Splash() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


 loadPalette(Level2Splash2Pal);
 DMANow(3, Level2Splash2Tiles, &((charblock *)0x6000000)[0], 38272/2);
 DMANow(3, Level2Splash2Map, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   level = L2;
   deAcEnemies();
   initializeLevel();
   enemyUpdate();
   state = GAME;
  }
}

void level3Splash() {

 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


 loadPalette(level3SplashPal);
 DMANow(3, level3SplashTiles, &((charblock *)0x6000000)[0], 38464/2);
 DMANow(3, level3SplashMap, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   level = L3;
   deAcEnemies();
   initializeLevel();
   enemyUpdate();
   state = GAME;
  }
}

void win() {


 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


  loadPalette(winScreenPal);
  DMANow(3, winScreenTiles, &((charblock *)0x6000000)[0], 38464/2);
  DMANow(3, winScreenMap, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   winCount = 0;
   stopSound();
      playSoundA(BadBlood, 2313008, 11025);
   state = SPLASH;
  }

}

void lose() {


 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


  loadPalette(loseScreenPal);
  DMANow(3, loseScreenTiles, &((charblock *)0x6000000)[0], 38272/2);
  DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   initialize();
   winCount = 0;
   stopSound();
      playSoundA(BadBlood, 2313008, 11025);
   state = SPLASH;
  }

 deAcEnemies();
}

void deAcEnemies() {


 for(int i = 0; i < levMaxEnemyNum; i++) {
  manEnemy[i].active = 0;
 }
}

void pause() {



 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 0<<14 | 1 << 7;
 *(volatile unsigned short *)0x04000010 = 0;
    *(volatile unsigned short *)0x04000012 = 0;


 loadPalette(pauseScreenPal);
 DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 38464/2);
 DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[30], 2048/2);


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<3))))
  {
   while(!(~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   while((~(*(volatile unsigned int *)0x04000130) & ((1<<3))));
   state = GAME;
  }

}


void initialize()
{

 lives = 3;

    tay.width = 16;
    tay.height = 16;
    tay.rdel = 1;
    tay.cdel = 1;
 tay.row = 130;
 tay.col = 55;
 tay.colRowCounter = 130;
 tay.aniCounter = 0;
    tay.currFrame = 0;

 tay.aniState = TAYRIGHT;


 sel.width = 16;
    sel.height = 16;
    sel.rdel = 1;
    sel.cdel = 1;
 sel.row = 130;
 sel.col = 75;
 sel.aniCounter = 0;
    sel.currFrame = 0;

 sel.aniState = TAYIDLE;




 for(int i = 0; i < levMaxEnemyNum; i++) {
  manEnemy[i].active = 0;
  manEnemy[i].width = 16;
  manEnemy[i].height = 8;
  manEnemy[i].rdel = 1;
  manEnemy[i].cdel = 1;
# 936 "main.c"
 }
 enemyUpdate();







    buttons = *(volatile unsigned int *)0x04000130;

 hOff = 0;
 vOff = 112;

}

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{
 unsigned short newMap[mapLen];
 int i;
 for(i = 0; i < mapLen; i++)
 {

  unsigned short x = map[i] &(~(((0xF) << 12)));




  newMap[i] = x | ((palIndex) << 12);


 }

 DMANow(3, newMap, &((screenblock *)0x6000000)[sbb], mapLen | (0 << 23));
}


void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     0 |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);



        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;

        soundA.vbCount = 0;
        soundA.duration = (((59.727)*length)/frequency);

}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);



        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;

        soundB.vbCount = 0;
        soundB.duration = (((59.727)*length)/frequency);

}

void pauseSound()
{

 soundA.isPlaying = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}

void unpauseSound()
{

 soundA.isPlaying = 1;
 soundB.isPlaying = 1;
 *(volatile unsigned short*)0x4000102 = (1<<7);
 *(volatile unsigned short*)0x4000106 = (1<<7);

}

void stopSound()
{

    dma[0].cnt = 0;
 dma[1].cnt = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;



 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;

 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {

  if(soundA.vbCount >= soundA.duration) {
       if(soundA.loops) {
        playSoundA(soundA.data, soundA.length, soundA.frequency);
       } else {

        *(volatile unsigned short*)0x4000102 = 0;
        dma[1].cnt = 0;
       }
      } else {
       soundA.vbCount++;
      }

      if(soundB.vbCount >= soundB.duration) {
       if(soundB.vbCount >= soundB.duration) {
        *(volatile unsigned short*)0x4000106 = 0;
        dma[2].cnt = 0;

       } else {
        playSoundB(soundB.data, soundB.length, soundB.frequency);
       }
      } else {
       soundB.vbCount++;
      }

      *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
