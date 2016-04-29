
//{{BLOCK(backbg)

//======================================================================
//
//	backbg, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 51 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 3264 + 4096 = 7872
//
//	Time-stamp: 2016-03-17, 00:27:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKBG_H
#define GRIT_BACKBG_H

#define backbgTilesLen 3264
extern const unsigned short backbgTiles[1632];

#define backbgMapLen 4096
extern const unsigned short backbgMap[2048];

#define backbgPalLen 512
extern const unsigned short backbgPal[256];

#endif // GRIT_BACKBG_H

//}}BLOCK(backbg)
