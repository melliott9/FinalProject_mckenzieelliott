
//{{BLOCK(winScreen)

//======================================================================
//
//	winScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 601 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 38464 + 2048 = 41024
//
//	Time-stamp: 2016-03-31, 13:53:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winScreenTilesLen 38464
extern const unsigned short winScreenTiles[19232];

#define winScreenMapLen 2048
extern const unsigned short winScreenMap[1024];

#define winScreenPalLen 512
extern const unsigned short winScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winScreen)
