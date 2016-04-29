
//{{BLOCK(splashScreen)

//======================================================================
//
//	splashScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 581 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37184 + 2048 = 39744
//
//	Time-stamp: 2016-03-31, 14:50:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHSCREEN_H
#define GRIT_SPLASHSCREEN_H

#define splashScreenTilesLen 37184
extern const unsigned short splashScreenTiles[18592];

#define splashScreenMapLen 2048
extern const unsigned short splashScreenMap[1024];

#define splashScreenPalLen 512
extern const unsigned short splashScreenPal[256];

#endif // GRIT_SPLASHSCREEN_H

//}}BLOCK(splashScreen)
