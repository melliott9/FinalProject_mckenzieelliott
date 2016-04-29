//McKenzie Elliott
//2261 Final Project
//Bad Blood

//- Gameplay: Collect Taylor's girl squad by progressing through the 
//levels of the Bad Blood Music Video by avoiding the suited, gray men shooting in your direction
//To Play: Use Up, Down, Left, and Right arrow keys to avoid enemies. Hitting the A button will give
//you unlimited lives and is a game cheat. Enemies are generated randomly, so some game experiences 
//may be more difficult than others.
//- Known Bugs: The third level background has a random cyan square in it that I can't get rid of.
//Sometimes an enemy will travel with Taylor's character after winning and restarting the game a few times
//- Extra Credit: I made all of the graphics myself. Backgrounds, foregrounds, and all sprites. I've also
//created a pretty cool "music video experience". Turning Tay's music video into a video game was an original
//idea of mine!

#include "myLib.h"
#include "pikachu.h"
#include "Tay.h"
#include "backbg.h"
#include "frontbg.h"
#include "taySprite.h"
#include "selSprite.h"
#include "BadBlood.h"
#include "FootStep.h"
#include "Foot.h"
#include "splashScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "splashScreen.h"
#include <stdlib.h>
#include "level1BackBG.h"
#include "level1FrontBG.h"
#include "Level2Splash2.h"
#include "level2FrontBG.h"
#include "level2BackBG.h"
#include "level3Splash.h"
#include "Instructions.h"
#include "Instructions2.h"
#include "splashScreenInst.h"
#include "taySpriteAll.h"
#include "level3BackBG.h"
#include "level3FrontBG.h"
#include "smack.h"

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;
int levMaxEnemyNum = 10;

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

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
//void loadMap(const unsigned short, unsigned short, unsigned short, unsigned short);

//FONT FOR SCREENS: Microsoft Yi Baiti
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
        
	// TODO Next, complete the following function to zero out all the sprites;
    hideSprites();
    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; //<--CHANGE THIS!
	
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;

	buttons = BUTTONS;

	setupInterrupts();
	setupSounds();
	
	//UNCHECK TO PLAY INTRO SOUND
	
	soundA.loops=1;

	initializeLevel();
	initialize();
    playSoundA(BadBlood, BADBLOODLEN, BADBLOODFREQ);
        
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
		REG_BG0HOFS = hOff;
		REG_BG1HOFS = hOff/2;
                 
	}

	return 0;
}


void hideSprites()
{
    int i;
    for (i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }

}

void game() {

	//REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(28) | BG_SIZE1 | COLOR256;
	REG_BG1CNT = CBB(1) | SBB(30) | BG_SIZE0 | COLOR256;

	if(level == L1) {
		loadPalette(level1FrontBGPal);
		DMANow(3, level1FrontBGTiles, &CHARBLOCKBASE[0], level1FrontBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		DMANow(3, level1FrontBGMap, &SCREENBLOCKBASE[28], level1FrontBGMapLen/2 | DMA_SOURCE_INCREMENT);
		DMANow(3, level1BackBGTiles, &CHARBLOCKBASE[1], level1BackBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		int sbb = 30;
		loadMap(level1BackBGMap, level1BackBGMapLen/2 , 0, sbb);
	} else if(level == L2) {
		loadPalette(level2FrontBGPal);
		DMANow(3, level2FrontBGTiles, &CHARBLOCKBASE[0], level2FrontBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		DMANow(3, level2FrontBGMap, &SCREENBLOCKBASE[28], level2FrontBGMapLen/2 | DMA_SOURCE_INCREMENT);
		DMANow(3, level2BackBGTiles, &CHARBLOCKBASE[1], level2BackBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		int sbb = 30;
		loadMap(level2BackBGMap, level2BackBGMapLen/2 , 0, sbb);

	} else if(level == L3){
		loadPalette(level3FrontBGPal);
		DMANow(3, level3FrontBGTiles, &CHARBLOCKBASE[0], level3FrontBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		DMANow(3, level3FrontBGMap, &SCREENBLOCKBASE[28], level3FrontBGMapLen/2 | DMA_SOURCE_INCREMENT);

		DMANow(3, level3BackBGTiles, &CHARBLOCKBASE[1], level3BackBGTilesLen/2 | DMA_SOURCE_INCREMENT);
		int sbb = 30;
		loadMap(level3BackBGMap, level3BackBGMapLen/2 , 0, sbb);

	}
       
	DMANow(3, taySpritePal, SPRITE_PALETTE, 256);
    DMANow(3, taySpriteTiles, &CHARBLOCKBASE[4], taySpriteTilesLen/2);

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
		
		if(BUTTON_HELD(BUTTON_UP)) {
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
					

					shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[2].attr2 = SPRITEOFFSET16(6, 2);
				} else if (level == L3) {
					shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[2].attr2 = SPRITEOFFSET16(6, 2);


					shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[1].attr2 = SPRITEOFFSET16(16, 2);

				}
			}
		}

		if(BUTTON_HELD(BUTTON_DOWN)) {
			
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
					

					shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[2].attr2 = SPRITEOFFSET16(6, 0);

				} else if (level == L3) {

					shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[2].attr2 = SPRITEOFFSET16(6, 0);


					shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
					shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
					shadowOAM[1].attr2 = SPRITEOFFSET16(16, 0);

				}
			}
		}

		if(BUTTON_HELD(BUTTON_LEFT)) {
			tay.aniState = TAYLEFT;
			hOff--;
			winCount--;

			if(hOff % 30 == 0) {
				//playSoundB(Foot, FOOTLEN, FOOTFREQ);
			}

			if (level == L1) {
		
			} else if (level == L2) {
				shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = SPRITEOFFSET16(6, 6);
			} else if (level == L3) {

				shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = SPRITEOFFSET16(6, 6);


				shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[1].attr2 = SPRITEOFFSET16(16, 6);
			}
			

		}
		if(BUTTON_HELD(BUTTON_RIGHT))
		{
			tay.aniState = TAYRIGHT;
			hOff++;
			winCount++;

			//Collision Conditions for Enemy
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
				//playSoundB(Foot, FOOTLEN, FOOTFREQ);
			}

			//draws Selena
			if (level == L1) {
				shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = SPRITEOFFSET16(26, 4);

				shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[1].attr2 = SPRITEOFFSET16(26, 4);
			} else if (level == L2) {
				shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = SPRITEOFFSET16(6, 4);

				shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[1].attr2 = SPRITEOFFSET16(26, 4);
			} else if (level == L3) {

				shadowOAM[2].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = ((tay.col - 15) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = SPRITEOFFSET16(6, 4);

				shadowOAM[1].attr0 = ((tay.row - 2) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[1].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
				shadowOAM[1].attr2 = SPRITEOFFSET16(16, 4);

			}

		}

		if(tay.aniState == TAYIDLE) {
			tay.aniState = tay.prevAniState;
			tay.currFrame = 0;
		} else {
			tay.aniCounter++;
		}

                
        //Taylor Sprite Creation, Drawing
        //NOTE TO SELF: Draw different sprites in different shadowOAMs
        shadowOAM[3].attr0 = (tay.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[3].attr1 = (tay.col & COLMASK) | ATTR1_SIZE16;
		shadowOAM[3].attr2 = SPRITEOFFSET16(tay.currFrame * 2, tay.aniState * 2);


		int j = 0;
		while( j < levMaxEnemyNum) {
		//Draws Man Enemy in shadowOAM
			if (manEnemy[j].active == 1) {
				shadowOAM[j + 8].attr0 = (manEnemy[j].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
				if(manEnemy[j].col < 0 || manEnemy[j].col > 240) shadowOAM[j+8].attr0 |=  ATTR0_HIDE;
				shadowOAM[j + 8].attr1 = (manEnemy[j].col & COLMASK) | ATTR1_SIZE16;
				shadowOAM[j + 8].attr2 = SPRITEOFFSET16(0,8);
			} else {
				shadowOAM[j + 8].attr0 = (manEnemy[j].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
				shadowOAM[j + 8].attr1 = (manEnemy[j].col & COLMASK) | ATTR1_SIZE16;
				shadowOAM[j + 8].attr2 = SPRITEOFFSET16(22,8);

			}
			j++;
		}



        REG_BG0HOFS = hOff;
        REG_BG0VOFS = vOff;
                
        // TODO Copy the shadowOAM into the OAM
        DMANow(3, shadowOAM, OAM, 128 * 4);

        if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			state = PAUSE;					
		}

		if(BUTTON_HELD(BUTTON_A))
		{
			while(!BUTTON_HELD(BUTTON_A));
			while(BUTTON_HELD(BUTTON_A));
			lives = 8000;
			//state = PAUSE;					
		}
		update();

}

void update() {

	//NEED TO WORK ON THIS
	//If the active enemy has gone off screen, make him inactive and reset his row
	for(int j = 0; j < levMaxEnemyNum; j++) {
			if(manEnemy[j].col < 0) {
				manEnemy[j].active = 0; // Make inactive so won't draw
				manEnemy[j].col = 0;
				//numInactive++;
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
		//winCount = 0;
		state = LOSE;
	}

	if(winCount == 800)
		{
			state = L2SPLASH;
			//winCount = 50;
			winCount = 801;
		}

		if(winCount == 1600)
		{
			state = L3SPLASH;
			//winCount = 50;
			winCount = 1601;
		}

		if(winCount == 2600)
		{
			state = WIN;
			//winCount = 50;
			winCount = 0;
		}

		if(winCount <= -200)
		{
			state = LOSE;
			winCount = 0;
		}

		//updateLives();

}

//Picks a random number of enemies to activate and updates rows and columns according to the distance
//the player has traveled
void enemyUpdate() {

	int rNumOfEnemies;

	rNumOfEnemies = rand() % levMaxEnemyNum;
	//numInactive = levMaxEnemyNum - rNumOfEnemies;
	for(int j = 0; j < rNumOfEnemies; j++) {

		int rRow = (rand() % (183-80)) + 95; //min:90 max: 188
		int rCol = (rand() % (800-350)) + (tay.col + 350); //max:tay.col + 1000 min:tay.col + 200
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
			shadowOAM[5].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[5].attr1 = ((tay.col - 50) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[5].attr2 = SPRITEOFFSET16(2,8);

			shadowOAM[6].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[6].attr1 = ((tay.col - 40) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[6].attr2 = SPRITEOFFSET16(2,8);

			shadowOAM[7].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[7].attr1 = ((tay.col - 30) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[7].attr2 = SPRITEOFFSET16(2,8);

		} else if(lives == 2 ) {

			shadowOAM[5].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[5].attr1 = ((tay.col - 50) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[5].attr2 = SPRITEOFFSET16(2,8);

			shadowOAM[6].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[6].attr1 = ((tay.col - 40) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[6].attr2 = SPRITEOFFSET16(2,8);

			shadowOAM[7].attr0 = ATTR0_HIDE;
			// shadowOAM[7].attr1 = (tay.col - 300 & COLMASK) | ATTR1_SIZE16;
			// shadowOAM[7].attr2 = SPRITEOFFSET16(2,12);

		} else if (lives == 1) {

			shadowOAM[5].attr0 = ((tay.row - 125) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[5].attr1 = ((tay.col - 50) & COLMASK) | ATTR1_SIZE16;
			shadowOAM[5].attr2 = SPRITEOFFSET16(2,8);

			shadowOAM[6].attr0 = ATTR0_HIDE;

			shadowOAM[7].attr0 = ATTR0_HIDE;

		} else {

			shadowOAM[5].attr0 = ATTR0_HIDE;

			shadowOAM[6].attr0 = ATTR0_HIDE;

			shadowOAM[7].attr0 = ATTR0_HIDE;

		}
}

void checkForCollision() {
	//int hit = 0;
	for(int j=0; j<levMaxEnemyNum; j++) {
		if(manEnemy[j].active == 1) {
			if(manEnemy[j].col <= tay.col + 16 && manEnemy[j].col + 16 >= tay.col) {
				if(manEnemy[j].row <= tay.row + 16 && manEnemy[j].row + 8 >= tay.row) {
					//state = LOSE;
					lives--;
					//updateLives();
					//hit = 1;
					manEnemy[j].active = 0;
					playSoundB(smack, SMACKLEN, SMACKFREQ);
				}// else if(manEnemy[j].row + 8 <= tay.row + 16 && manEnemy[j].row + 8 >= tay.row) {
				// 	lives--;
				// 	//updateLives();
				// 	//state = LOSE;
				// 	hit = 1;
				// 	manEnemy[j].active = 0;
				// }
				// if(manEnemy[j].row <= tay.colRowCounter + 16 && manEnemy[j].row >= tay.colRowCounter) {
				// 	state = LOSE;
				// }
				// if(manEnemy[j].row + 8 <= tay.colRowCounter + 16 && manEnemy[j].row + 8 >= tay.colRowCounter) {
				// 	lives--;
				// 	//state = LOSE;
				// }
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

	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	loadPalette(InstructionsPal);
	DMANow(3, InstructionsTiles, &CHARBLOCKBASE[0], InstructionsTilesLen/2);
	DMANow(3, InstructionsMap, &SCREENBLOCKBASE[30], InstructionsMapLen/2);


		if(BUTTON_HELD(BUTTON_A))
		{
			while(!BUTTON_HELD(BUTTON_A));
			while(BUTTON_HELD(BUTTON_A));
			state = INSTRUCTIONS2;					
		}
}

void instructions2() {

	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	loadPalette(Instructions2Pal);
	DMANow(3, Instructions2Tiles, &CHARBLOCKBASE[0], Instructions2TilesLen/2);
	DMANow(3, Instructions2Map, &SCREENBLOCKBASE[30], Instructions2MapLen/2);


		if(BUTTON_HELD(BUTTON_A))
		{
			while(!BUTTON_HELD(BUTTON_A));
			while(BUTTON_HELD(BUTTON_A));
			state = SPLASH;					
		}
}

void splash() {

	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    level = L1;
	

	loadPalette(splashScreenInstPal);
	DMANow(3, splashScreenInstTiles, &CHARBLOCKBASE[0], splashScreenInstTilesLen/2);
	DMANow(3, splashScreenInstMap, &SCREENBLOCKBASE[30], splashScreenInstMapLen/2);

	//deAcEnemies();
	initialize();
	initializeLevel();
	//lives = 2;


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			state = GAME;					
		}

		if(BUTTON_HELD(BUTTON_A))
		{
			while(!BUTTON_HELD(BUTTON_A));
			while(BUTTON_HELD(BUTTON_A));
			state = INSTRUCTIONS;					
		}
}

void level2Splash() {

	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	loadPalette(Level2Splash2Pal);
	DMANow(3, Level2Splash2Tiles, &CHARBLOCKBASE[0], Level2Splash2TilesLen/2);
	DMANow(3, Level2Splash2Map, &SCREENBLOCKBASE[30], Level2Splash2MapLen/2);


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			level = L2;
			deAcEnemies();
			initializeLevel();
			enemyUpdate();
			state = GAME;					
		}
}

void level3Splash() {

	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	loadPalette(level3SplashPal);
	DMANow(3, level3SplashTiles, &CHARBLOCKBASE[0], level3SplashTilesLen/2);
	DMANow(3, level3SplashMap, &SCREENBLOCKBASE[30], level3SplashMapLen/2);


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			level = L3;
			deAcEnemies();
			initializeLevel();
			enemyUpdate();
			state = GAME;					
		}
}

void win() {


	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	 loadPalette(winScreenPal);
	 DMANow(3, winScreenTiles, &CHARBLOCKBASE[0], winScreenTilesLen/2);
	 DMANow(3, winScreenMap, &SCREENBLOCKBASE[30], winScreenMapLen/2);


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			winCount = 0;
			stopSound();
    		playSoundA(BadBlood, BADBLOODLEN, BADBLOODFREQ);
			state = SPLASH;					
		}

}

void lose() {


	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	 loadPalette(loseScreenPal);
	 DMANow(3, loseScreenTiles, &CHARBLOCKBASE[0], loseScreenTilesLen/2);
	 DMANow(3, loseScreenMap, &SCREENBLOCKBASE[30], loseScreenMapLen/2);


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
			initialize();
			winCount = 0;
			stopSound();
    		playSoundA(BadBlood, BADBLOODLEN, BADBLOODFREQ);
			state = SPLASH;					
		}

	deAcEnemies();
}

void deAcEnemies() {

	//deactivate all enemies
	for(int i = 0; i < levMaxEnemyNum; i++) {
		manEnemy[i].active = 0;
	}
}

void pause() {



	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE0 | COLOR256;
	REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
	

	loadPalette(pauseScreenPal);
	DMANow(3, pauseScreenTiles, &CHARBLOCKBASE[0], pauseScreenTilesLen/2);
	DMANow(3, pauseScreenMap, &SCREENBLOCKBASE[30], pauseScreenMapLen/2);


		if(BUTTON_HELD(BUTTON_START))
		{
			while(!BUTTON_HELD(BUTTON_START));
			while(BUTTON_HELD(BUTTON_START));
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
	tay.row = 130;//160/2-tay.width/2;
	tay.col = 55;//240/2-tay.height/2;
	tay.colRowCounter = 130;
	tay.aniCounter = 0;
    tay.currFrame = 0;

	tay.aniState = TAYRIGHT; 


	sel.width = 16;
    sel.height = 16;
    sel.rdel = 1;
    sel.cdel = 1;
	sel.row = 130;//160/2-tay.width/2;
	sel.col = 75;//240/2-tay.height/2;
	sel.aniCounter = 0;
    sel.currFrame = 0;

	sel.aniState = TAYIDLE; 

	//int rRow;
	//int rCol;

	for(int i = 0; i < levMaxEnemyNum; i++) {
		manEnemy[i].active = 0;
		manEnemy[i].width = 16;
		manEnemy[i].height = 8;
		manEnemy[i].rdel = 1;
		manEnemy[i].cdel = 1;
		//manEnemy[i].active = 1;

		//FORMULA: r = (rand() % (max-min)) + min
		// rRow = (rand() % 88) + 48;
		// rCol = (rand() % 850) + 150;

		// manEnemy[i].row = rRow; //min:48 max:136
		// manEnemy[i].col = rCol;

	}
	enemyUpdate();

	// for(int i = 0; i < 3; i++) {
	// 	lifeHeart[i].row = 
	// 	lifeHeart[i].col = 
	// }
        
   
    buttons = BUTTONS;
        
	hOff = 0;
	vOff = 112;

}

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{
	unsigned short newMap[mapLen];
	int i;
	for(i = 0; i < mapLen; i++)
	{
		// TODO mask the value in the current spot so we don't lose information
		unsigned short x = map[i] &(~(PALBANK(0xF)));



		// TODO make every newMap value = to the old map value
		newMap[i] = x | PALBANK(palIndex);
		// with the appropriate palette flag set
		
	}
	// TODO DMA in the new map to the appropriate sbb
	DMANow(3, newMap, &SCREENBLOCKBASE[sbb], mapLen | DMA_SOURCE_INCREMENT);
}


void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        //soundA.loops = 1;
        soundA.vbCount = 0;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
         
}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        //soundB.loops = 0;
        soundB.vbCount = 0;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);

}

void pauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;

}

void unpauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;

}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
    dma[0].cnt = 0;
	dma[1].cnt = 0;
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;

}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
	REG_INTERRUPT = (unsigned int)interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
	
		if(soundA.vbCount >= soundA.duration) {
     		if(soundA.loops) {
     			playSoundA(soundA.data, soundA.length, soundA.frequency);
     		} else {
     			//soundA.isPlaying = 0;
     			REG_TM0CNT = 0;
     			dma[1].cnt = 0;
     		}
     	} else {
     		soundA.vbCount++;
     	}

     	if(soundB.vbCount >= soundB.duration) {
     		if(soundB.vbCount >= soundB.duration) {
     			REG_TM1CNT = 0;
     			dma[2].cnt = 0;
     			//soundB.isPlaying = 0;
     		} else {
     			playSoundB(soundB.data, soundB.length, soundB.frequency);
     		}
     	} else {
     		soundB.vbCount++;
     	}

     	REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}