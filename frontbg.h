
//{{BLOCK(frontbg)

//======================================================================
//
//	frontbg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 111 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7104 + 2048 = 9664
//
//	Time-stamp: 2016-03-17, 00:22:31
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FRONTBG_H
#define GRIT_FRONTBG_H

#define frontbgTilesLen 7104
extern const unsigned short frontbgTiles[3552];

#define frontbgMapLen 2048
extern const unsigned short frontbgMap[1024];

#define frontbgPalLen 512
extern const unsigned short frontbgPal[256];

#endif // GRIT_FRONTBG_H

//}}BLOCK(frontbg)
