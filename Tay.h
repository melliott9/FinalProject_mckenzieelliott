
//{{BLOCK(Tay)

//======================================================================
//
//	Tay, 64x64@4, 
//	+ palette 256 entries, not compressed
//	+ 24 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 8x8 
//	Total size: 512 + 768 + 128 = 1408
//
//	Time-stamp: 2016-03-16, 18:51:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TAY_H
#define GRIT_TAY_H

#define TayTilesLen 768
extern const unsigned short TayTiles[384];

#define TayMapLen 128
extern const unsigned short TayMap[64];

#define TayPalLen 512
extern const unsigned short TayPal[256];

#endif // GRIT_TAY_H

//}}BLOCK(Tay)
