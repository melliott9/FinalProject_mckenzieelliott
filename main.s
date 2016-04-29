	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L5
.L2:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L24
	ldr	r1, [lr]
	ldr	ip, .L24+4
	cmp	r1, #0
	addgt	r1, r1, r1, lsl #1
	movgt	r0, #0
	movgt	r3, ip
	addgt	r1, ip, r1, lsl #4
	ble	.L13
.L12:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	strlt	r0, [r3, #40]
	strlt	r0, [r3, #4]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L12
.L13:
	mov	r3, #0
	ldr	r2, .L24+8
	ldr	r2, [r2]
	cmp	r2, r3
	str	r3, [ip, #40]
	ble	.L21
.L10:
	ldr	r2, [lr, #8]
	cmp	r2, #800
	ldr	r3, .L24
	beq	.L22
	cmp	r2, #1600
	beq	.L23
	ldr	r1, .L24+12
	cmp	r2, r1
	bne	.L17
	mov	r1, #3
	mov	r2, #0
	ldr	lr, [sp], #4
	stmib	r3, {r1, r2}
	bx	lr
.L23:
	mov	r1, #8
	add	r2, r2, #1
	stmib	r3, {r1, r2}
	ldr	lr, [sp], #4
	bx	lr
.L22:
	mov	r1, #7
	add	r2, r2, #1
	stmib	r3, {r1, r2}
	ldr	lr, [sp], #4
	bx	lr
.L21:
	mov	r3, #4
	str	r3, [lr, #4]
	b	.L10
.L17:
	cmn	r2, #199
	movlt	r1, #4
	movlt	r2, #0
	ldr	lr, [sp], #4
	stmltib	r3, {r1, r2}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	manEnemy
	.word	lives
	.word	2600
	.size	update, .-update
	.global	__aeabi_idivmod
	.align	2
	.global	enemyUpdate
	.type	enemyUpdate, %function
enemyUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L34
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+4
	ldr	r6, .L34+8
	ldr	r1, [r3]
	mov	lr, pc
	bx	r6
	subs	r7, r1, #0
	ble	.L26
	mov	fp, #0
	mov	r5, #1
	ldr	r10, .L34+12
	ldr	r8, .L34+16
.L30:
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	ldr	r2, .L34+20
	smull	r3, r2, r0, r2
	ldr	r3, .L34+24
	smull	r1, r3, r9, r3
	add	r2, r2, r0
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #8
	mov	r1, r9, asr #31
	rsb	r1, r1, r3, asr #3
	add	r3, r1, r1, lsl #1
	ldr	ip, [r8, #4]
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #4
	add	ip, ip, #348
	add	r3, r1, r3, lsl #1
	rsb	r2, r2, r2, lsl #4
	ldr	r1, .L34+28
	sub	r2, r0, r2, asl #1
	rsb	r3, r3, r9
	add	r0, ip, #2
	add	r3, r3, #95
	add	r2, r0, r2
	ldr	r1, [r1]
	mov	r0, fp
	str	r3, [r10]
	str	r5, [r10, #40]
	str	r2, [r10, #4]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	movne	r3, #0
	moveq	r3, r5
	add	fp, fp, #1
	cmp	r7, fp
	str	r3, [r10, #44]
	add	r10, r10, #48
	bne	.L30
.L26:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	rand
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	manEnemy
	.word	tay
	.word	-1851608123
	.word	333589693
	.word	fastProb
	.size	enemyUpdate, .-enemyUpdate
	.align	2
	.global	updateLives
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L45
	ldr	r3, [r3]
	cmp	r3, #3
	str	lr, [sp, #-4]!
	beq	.L42
	cmp	r3, #2
	beq	.L43
	cmp	r3, #1
	beq	.L44
	mov	r2, #512
	ldr	r3, .L45+4
	ldr	lr, [sp], #4
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L42:
	mov	ip, #72
	ldr	r2, .L45+8
	ldrh	r3, [r2, #4]
	ldr	r0, [r2]
	sub	lr, r3, #50
	sub	r1, r3, #40
	sub	r3, r3, #30
	mov	lr, lr, asl #23
	mov	r1, r1, asl #23
	mov	r3, r3, asl #23
	ldr	r2, .L45+4
	sub	r0, r0, #125
	mov	lr, lr, lsr #23
	mov	r1, r1, lsr #23
	mov	r3, r3, lsr #23
	and	r0, r0, #255
	orr	lr, lr, #16384
	orr	r1, r1, #16384
	orr	r3, r3, #16384
	strh	lr, [r2, #42]	@ movhi
	strh	r0, [r2, #40]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	r0, [r2, #56]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	strh	r3, [r2, #58]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	strh	ip, [r2, #52]	@ movhi
	strh	ip, [r2, #60]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L43:
	mov	lr, #512
	mov	ip, #72
	ldr	r2, .L45+8
	ldrh	r3, [r2, #4]
	ldr	r0, [r2]
	sub	r1, r3, #50
	sub	r3, r3, #40
	mov	r1, r1, asl #23
	mov	r3, r3, asl #23
	ldr	r2, .L45+4
	sub	r0, r0, #125
	mov	r1, r1, lsr #23
	mov	r3, r3, lsr #23
	and	r0, r0, #255
	orr	r1, r1, #16384
	orr	r3, r3, #16384
	strh	lr, [r2, #56]	@ movhi
	strh	r1, [r2, #42]	@ movhi
	strh	r3, [r2, #50]	@ movhi
	strh	r0, [r2, #40]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	strh	ip, [r2, #52]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L44:
	mov	r0, #512
	mov	ip, #72
	ldr	r2, .L45+8
	ldmia	r2, {r1, r3}
	sub	r3, r3, #50
	mov	r3, r3, asl #23
	ldr	r2, .L45+4
	mov	r3, r3, lsr #23
	sub	r1, r1, #125
	orr	r3, r3, #16384
	and	r1, r1, #255
	strh	r3, [r2, #42]	@ movhi
	strh	r1, [r2, #40]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	r0, [r2, #56]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	lives
	.word	shadowOAM
	.word	tay
	.size	updateLives, .-updateLives
	.align	2
	.global	initializeLevel
	.type	initializeLevel, %function
initializeLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L51
	cmp	r3, #1
	moveq	r0, #40
	moveq	r2, #3
	movne	r0, #45
	movne	r2, #2
	ldr	r1, .L52+4
	ldr	r3, .L52+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L51:
	mov	r0, #30
	mov	r2, #4
	ldr	r1, .L52+4
	ldr	r3, .L52+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	fastProb
	.size	initializeLevel, .-initializeLevel
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L63
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L63+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L63+8
	ldr	r3, .L63+12
	mov	r2, #100663296
	ldr	r1, .L63+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L63+20
	ldr	r1, .L63+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L54
.L56:
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L56
	mov	r2, #67108864
.L57:
	ldr	r3, [r2, #304]
	tst	r3, #1
	beq	.L57
	mov	r2, #6
	ldr	r3, .L63+28
	str	r2, [r3, #4]
.L54:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	InstructionsPal
	.word	loadPalette
	.word	DMANow
	.word	8544
	.word	InstructionsTiles
	.word	100724736
	.word	InstructionsMap
	.word	.LANCHOR0
	.size	instructions, .-instructions
	.align	2
	.global	instructions2
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L74
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L74+8
	mov	r3, #8960
	mov	r2, #100663296
	ldr	r1, .L74+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L74+16
	ldr	r1, .L74+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L65
.L67:
	ldr	r3, [r4, #304]
	tst	r3, #1
	bne	.L67
	mov	r2, #67108864
.L68:
	ldr	r3, [r2, #304]
	tst	r3, #1
	beq	.L68
	mov	r2, #1
	ldr	r3, .L74+24
	str	r2, [r3, #4]
.L65:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	Instructions2Pal
	.word	loadPalette
	.word	DMANow
	.word	Instructions2Tiles
	.word	100724736
	.word	Instructions2Map
	.word	.LANCHOR0
	.size	instructions2, .-instructions2
	.align	2
	.global	level2Splash
	.type	level2Splash, %function
level2Splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L93
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L93+8
	ldr	r3, .L93+12
	mov	r2, #100663296
	ldr	r1, .L93+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L93+20
	ldr	r1, .L93+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L76
	mov	r3, r4
.L89:
	ldr	r2, [r3, #304]
	tst	r2, #8
	bne	.L89
	mov	r3, #67108864
.L86:
	ldr	r2, [r3, #304]
	mvn	r2, r2
	ands	r2, r2, #8
	bne	.L86
	mov	r0, #1
	ldr	r4, .L93+28
	ldr	r1, [r4]
	ldr	r3, .L93+32
	cmp	r1, #0
	str	r0, [r3]
	ble	.L82
	ldr	r3, .L93+36
	add	r1, r1, r1, lsl #1
	add	r1, r3, r1, lsl #4
.L81:
	str	r2, [r3, #40]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L81
.L82:
	mov	r1, #40
	mov	r2, #3
	ldr	r3, .L93+40
	str	r1, [r4]
	str	r2, [r3]
	bl	enemyUpdate
	mov	r3, #0
	str	r3, [r4, #4]
.L76:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	Level2Splash2Pal
	.word	loadPalette
	.word	DMANow
	.word	19136
	.word	Level2Splash2Tiles
	.word	100724736
	.word	Level2Splash2Map
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	manEnemy
	.word	fastProb
	.size	level2Splash, .-level2Splash
	.align	2
	.global	level3Splash
	.type	level3Splash, %function
level3Splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L112
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L112+8
	ldr	r3, .L112+12
	mov	r2, #100663296
	ldr	r1, .L112+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L112+20
	ldr	r1, .L112+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L95
	mov	r3, r4
.L108:
	ldr	r2, [r3, #304]
	tst	r2, #8
	bne	.L108
	mov	r3, #67108864
.L105:
	ldr	r2, [r3, #304]
	mvn	r2, r2
	ands	r2, r2, #8
	bne	.L105
	mov	r0, #2
	ldr	r4, .L112+28
	ldr	r1, [r4]
	ldr	r3, .L112+32
	cmp	r1, #0
	str	r0, [r3]
	ble	.L101
	ldr	r3, .L112+36
	add	r1, r1, r1, lsl #1
	add	r1, r3, r1, lsl #4
.L100:
	str	r2, [r3, #40]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L100
.L101:
	mov	r1, #45
	mov	r2, #2
	ldr	r3, .L112+40
	str	r1, [r4]
	str	r2, [r3]
	bl	enemyUpdate
	mov	r3, #0
	str	r3, [r4, #4]
.L95:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	level3SplashPal
	.word	loadPalette
	.word	DMANow
	.word	19232
	.word	level3SplashTiles
	.word	100724736
	.word	level3SplashMap
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	manEnemy
	.word	fastProb
	.size	level3Splash, .-level3Splash
	.align	2
	.global	deAcEnemies
	.type	deAcEnemies, %function
deAcEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L119
	ldr	r2, [r3]
	cmp	r2, #0
	bxle	lr
	mov	r1, #0
	ldr	r3, .L119+4
	add	r2, r2, r2, lsl #1
	add	r2, r3, r2, lsl #4
.L116:
	str	r1, [r3, #40]
	add	r3, r3, #48
	cmp	r3, r2
	bne	.L116
	bx	lr
.L120:
	.align	2
.L119:
	.word	.LANCHOR0
	.word	manEnemy
	.size	deAcEnemies, .-deAcEnemies
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L134
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L134+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L134+8
	ldr	r3, .L134+12
	mov	r2, #100663296
	ldr	r1, .L134+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L134+20
	ldr	r1, .L134+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L121
	mov	r3, r4
.L130:
	ldr	r2, [r3, #304]
	tst	r2, #8
	bne	.L130
	mov	r2, #67108864
.L128:
	ldr	r3, [r2, #304]
	mvn	r3, r3
	ands	r3, r3, #8
	bne	.L128
	ldr	r2, .L134+28
	str	r3, [r2, #4]
.L121:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L135:
	.align	2
.L134:
	.word	pauseScreenPal
	.word	loadPalette
	.word	DMANow
	.word	19232
	.word	pauseScreenTiles
	.word	100724736
	.word	pauseScreenMap
	.word	.LANCHOR0
	.size	pause, .-pause
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r8, #3
	mov	lr, #2
	mov	r0, #0
	mov	r1, #16
	mov	r2, #1
	mov	r4, #130
	mov	r7, #55
	mov	r6, #75
	mov	r5, #4
	ldr	r3, .L143
	ldr	ip, [r3]
	ldr	r3, .L143+4
	str	r8, [r3]
	ldr	r3, .L143+8
	str	lr, [r3, #28]
	ldr	lr, .L143+12
	cmp	ip, r0
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r7, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3]
	str	r4, [r3, #40]
	str	r4, [lr]
	str	r1, [lr, #16]
	str	r1, [lr, #20]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r6, [lr, #4]
	str	r5, [lr, #28]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r0, [lr, #24]
	str	r0, [lr, #36]
	ble	.L139
	mov	lr, #8
	ldr	r3, .L143+16
	add	ip, ip, ip, lsl #1
	add	ip, r3, ip, lsl #4
.L138:
	str	r0, [r3, #40]
	str	r1, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L138
.L139:
	bl	enemyUpdate
	mov	r3, #67108864
	mov	r1, #0
	mov	r2, #112
	ldr	ip, [r3, #304]
	ldr	r0, .L143+20
	ldr	r3, .L143+24
	str	ip, [r0]
	stmib	r3, {r1, r2}
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	lives
	.word	tay
	.word	sel
	.word	manEnemy
	.word	buttons
	.word	.LANCHOR1
	.size	initialize, .-initialize
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #256
	mov	r0, #7808
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L168
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r0, .L168+4
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L168+8
	str	r2, [r4]
	ldr	r5, .L168+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+16
	mov	r2, #100663296
	ldr	r1, .L168+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L168+24
	ldr	r1, .L168+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	bl	initialize
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L146
	mov	r0, #30
	mov	r2, #4
	ldr	r1, .L168+32
	ldr	r3, .L168+36
	str	r0, [r1]
	str	r2, [r3]
.L147:
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	tst	r3, #8
	beq	.L163
.L149:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #1
	bne	.L145
.L153:
	ldr	r2, [r3, #304]
	tst	r2, #1
	bne	.L153
	mov	r2, #67108864
.L154:
	ldr	r3, [r2, #304]
	tst	r3, #1
	beq	.L154
	mov	r3, #5
	str	r3, [r1, #4]
.L145:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L163:
	ldr	r3, [r2, #304]
	tst	r3, #8
	bne	.L163
	mov	r2, #67108864
.L160:
	ldr	r3, [r2, #304]
	mvn	r3, r3
	ands	r3, r3, #8
	bne	.L160
	str	r3, [r1, #4]
	b	.L149
.L146:
	cmp	r3, #1
	moveq	r0, #40
	moveq	r2, #3
	movne	r0, #45
	movne	r2, #2
	ldr	r1, .L168+32
	ldr	r3, .L168+36
	str	r0, [r1]
	str	r2, [r3]
	b	.L147
.L169:
	.align	2
.L168:
	.word	.LANCHOR1
	.word	splashScreenInstPal
	.word	loadPalette
	.word	DMANow
	.word	18592
	.word	splashScreenInstTiles
	.word	100724736
	.word	splashScreenInstMap
	.word	.LANCHOR0
	.word	fastProb
	.size	splash, .-splash
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	mov	r6, r1, asl #1
	add	ip, r6, #8
	cmp	r1, #0
	bic	ip, ip, #7
	add	fp, sp, #20
	movne	r4, r2, asl #28
	sub	sp, sp, ip
	mov	r5, sp
	addne	r6, r0, r6
	movne	r4, r4, lsr #16
	subne	lr, sp, #2
	beq	.L173
.L172:
	ldrh	ip, [r0], #2
	mov	ip, ip, asl #20
	orr	ip, r4, ip, lsr #20
	cmp	r0, r6
	strh	ip, [lr, #2]!	@ movhi
	bne	.L172
.L173:
	mov	r2, r3, asl #11
	add	r2, r2, #100663296
	mov	r3, r1
	mov	r0, #3
	mov	r1, r5
	ldr	r4, .L177
	mov	lr, pc
	bx	r4
	sub	sp, fp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	DMANow
	.size	loadMap, .-loadMap
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L180
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L181:
	.align	2
.L180:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r3, .L184+8
	ldr	r3, [r3]
	ldr	r7, .L184+12
	mov	r8, r1
	mov	r9, r0
	str	r6, [r3, #20]
	mov	r1, r0
	ldr	r2, .L184+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L184+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L184+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L184+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r8
	ldr	r7, .L184+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r7
	ldr	r6, .L184+36
	adr	r3, .L184
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L184+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L184+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L185:
	.align	3
.L184:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L199
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L199+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L199+8
	ldr	r3, .L199+12
	mov	r2, #100663296
	ldr	r1, .L199+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L199+20
	ldr	r1, .L199+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L186
	mov	r3, r4
.L195:
	ldr	r2, [r3, #304]
	tst	r2, #8
	bne	.L195
	mov	r2, #67108864
.L193:
	ldr	r3, [r2, #304]
	mvn	r3, r3
	ands	r3, r3, #8
	bne	.L193
	ldr	r2, .L199+28
	ldr	ip, .L199+32
	ldr	r1, [r2]
	ldr	r4, .L199+36
	str	r3, [r1, #8]
	ldr	r2, .L199+40
	str	r3, [r1, #20]
	ldr	r0, .L199+44
	strh	r3, [ip, #2]	@ movhi
	ldr	r1, .L199+48
	strh	r3, [ip, #6]	@ movhi
	str	r3, [r4, #8]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r4, #4]
.L186:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	winScreenPal
	.word	loadPalette
	.word	DMANow
	.word	19232
	.word	winScreenTiles
	.word	100724736
	.word	winScreenMap
	.word	dma
	.word	67109120
	.word	.LANCHOR0
	.word	11025
	.word	BadBlood
	.word	2313008
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, #7808
	mov	r4, #67108864
	mov	r2, #256
	mov	r3, #0
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r0, .L218
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, .L218+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L218+8
	ldr	r3, .L218+12
	mov	r2, #100663296
	ldr	r1, .L218+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L218+20
	ldr	r1, .L218+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #304]
	tst	r3, #8
	beq	.L214
	ldr	r5, .L218+28
.L202:
	ldr	r2, [r5]
	cmp	r2, #0
	ble	.L201
	mov	r1, #0
	ldr	r3, .L218+32
	add	r2, r2, r2, lsl #1
	add	r2, r3, r2, lsl #4
.L206:
	str	r1, [r3, #40]
	add	r3, r3, #48
	cmp	r3, r2
	bne	.L206
.L201:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L214:
	ldr	r3, [r4, #304]
	tst	r3, #8
	bne	.L214
	mov	r2, #67108864
.L211:
	ldr	r3, [r2, #304]
	mvn	r3, r3
	ands	r4, r3, #8
	bne	.L211
	bl	initialize
	ldr	r3, .L218+36
	ldr	r5, .L218+28
	ldr	r2, [r3]
	ldr	r3, .L218+40
	str	r4, [r2, #8]
	str	r4, [r5, #8]
	str	r4, [r2, #20]
	ldr	r1, .L218+44
	strh	r4, [r3, #2]	@ movhi
	ldr	r2, .L218+48
	strh	r4, [r3, #6]	@ movhi
	ldr	r0, .L218+52
	bl	playSoundA
	mov	r3, #1
	str	r3, [r5, #4]
	b	.L202
.L219:
	.align	2
.L218:
	.word	loseScreenPal
	.word	loadPalette
	.word	DMANow
	.word	19136
	.word	loseScreenTiles
	.word	100724736
	.word	loseScreenMap
	.word	.LANCHOR0
	.word	manEnemy
	.word	dma
	.word	67109120
	.word	2313008
	.word	11025
	.word	BadBlood
	.size	lose, .-lose
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r3, .L222+8
	ldr	r3, [r3]
	ldr	r7, .L222+12
	mov	r8, r1
	mov	r9, r0
	str	r6, [r3, #32]
	mov	r1, r0
	ldr	r2, .L222+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L222+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L222+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L222+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r8
	ldr	r7, .L222+32
	str	r9, [r4]
	str	r8, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r7
	ldr	r6, .L222+36
	adr	r3, .L222
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L222+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L222+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L223:
	.align	3
.L222:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	checkForCollision
	.type	checkForCollision, %function
checkForCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L231
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L224
	mov	r5, #0
	ldr	r4, .L231+4
	mov	r8, r5
	ldr	r7, .L231+8
	ldr	r9, .L231+12
	b	.L227
.L226:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	ble	.L224
.L227:
	ldr	r3, [r4, #40]
	cmp	r3, #1
	add	r5, r5, #1
	bne	.L226
	ldr	r2, [r7, #4]
	ldr	r3, [r4, #4]
	add	r1, r2, #16
	cmp	r3, r1
	add	r0, r3, #16
	bgt	.L226
	cmp	r2, r0
	bgt	.L226
	ldr	r2, [r7]
	ldr	r3, [r4]
	add	r1, r2, #16
	cmp	r3, r1
	add	r0, r3, #8
	bgt	.L226
	cmp	r2, r0
	bgt	.L226
	ldr	r3, [r9]
	ldr	r2, .L231+16
	sub	r3, r3, #1
	ldr	r1, .L231+20
	ldr	r0, .L231+24
	str	r8, [r4, #40]
	str	r3, [r9]
	bl	playSoundB
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #48
	bgt	.L227
.L224:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L232:
	.align	2
.L231:
	.word	.LANCHOR0
	.word	manEnemy
	.word	tay
	.word	lives
	.word	11025
	.word	4563
	.word	smack
	.size	checkForCollision, .-checkForCollision
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4864
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L335
	ldr	r4, [r5]
	ldr	r0, .L335+4
	ldr	r2, .L335+8
	cmp	r4, #0
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	beq	.L322
	cmp	r4, #1
	beq	.L323
	cmp	r4, #2
	beq	.L310
	ldr	r6, .L335+12
.L235:
	mov	r3, #256
	ldr	r2, .L335+16
	ldr	r1, .L335+20
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #16384
	ldr	r2, .L335+24
	ldr	r1, .L335+28
	mov	r0, #3
	mov	lr, pc
	bx	r6
	bl	updateLives
	mov	r0, #4
	ldr	r9, .L335+32
	ldr	r3, .L335+36
	ldr	r1, [r9, #24]
	smull	ip, r2, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r2, [r9, #28]
	subs	r3, r1, r3, asl #2
	str	r2, [r9, #32]
	str	r0, [r9, #28]
	bne	.L237
	ldr	r2, [r9, #36]
	cmp	r2, #2
	addne	r2, r2, #1
	streq	r3, [r9, #36]
	strne	r2, [r9, #36]
.L237:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	beq	.L239
	ldr	r4, .L335+40
	ldr	r10, .L335+44
	ldr	r0, [r4]
.L240:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L249
	mov	r2, #0
	ldr	r3, [r5, #8]
	cmp	r3, #149
	str	r2, [r9, #28]
	ldr	lr, .L335
	ldr	r2, .L335+32
	bgt	.L249
	ldr	ip, [r2, #40]
	add	r3, r3, #1
	add	ip, ip, #1
	cmp	r0, #0
	str	r3, [lr, #8]
	str	ip, [r2, #40]
	ble	.L255
	ldr	r3, .L335+48
	add	ip, r0, r0, lsl #1
	add	ip, r3, ip, lsl #4
.L254:
	ldr	r2, [r3]
	cmp	r2, #1
	ldreq	r2, [r3, #-40]
	subeq	r2, r2, #1
	streq	r2, [r3, #-40]
	add	r3, r3, #48
	cmp	ip, r3
	bne	.L254
.L255:
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L324
.L249:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #32
	bne	.L257
	mov	lr, #3
	ldr	r3, [r5, #4]
	ldr	ip, [r4, #8]
	ldr	r2, [r5]
	sub	r3, r3, #1
	sub	ip, ip, #1
	cmp	r2, #0
	str	lr, [r9, #28]
	str	r3, [r5, #4]
	str	ip, [r4, #8]
	ldr	lr, .L335+32
	bne	.L325
.L258:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L326
.L286:
	mov	r2, #2
	cmp	r0, #0
	add	r3, r3, #1
	add	r1, ip, #1
	str	r3, [r5, #4]
	str	r1, [r4, #8]
	str	r2, [r9, #28]
	movgt	r8, #0
	ldrgt	r7, .L335+52
	ble	.L268
.L267:
	bl	checkForCollision
	ldr	r3, [r7, #44]
	cmp	r3, #1
	ldr	r3, [r7, #4]
	subeq	r3, r3, #2
	subne	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r4]
	add	r8, r8, #1
	cmp	r3, r8
	add	r7, r7, #48
	bgt	.L267
.L268:
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L327
	mov	r1, #836
	ldr	r3, [r9, #4]
	mov	r2, r3, asl #16
	mov	r2, r2, lsr #16
	ldrh	lr, [r9]
	sub	r0, r2, #15
	sub	r2, r2, #30
	mov	r0, r0, asl #23
	mov	r2, r2, asl #23
	and	ip, lr, #255
	mov	r0, r0, lsr #23
	mov	r2, r2, lsr #23
	sub	lr, lr, #2
	orr	r0, r0, #16384
	orr	r2, r2, #16384
	and	lr, lr, #255
	strh	r0, [r10, #18]	@ movhi
	strh	r2, [r10, #10]	@ movhi
	strh	ip, [r10, #16]	@ movhi
	strh	lr, [r10, #8]	@ movhi
	strh	r1, [r10, #20]	@ movhi
	strh	r1, [r10, #12]	@ movhi
	ldr	r0, [r4]
.L261:
	ldr	lr, [r9, #28]
	ldr	r1, .L335+32
	cmp	lr, #4
	ldrne	r1, [r1, #24]
	beq	.L328
.L287:
	add	r1, r1, #1
	ldr	r2, [r9, #36]
	str	r1, [r9, #24]
	mov	r2, r2, asl #5
.L272:
	mov	r3, r3, asl #23
	mov	r1, r3, lsr #23
	add	r3, r2, lr
	mov	r3, r3, asl #1
	orr	r2, r1, #16384
	cmp	r0, #0
	strh	r2, [r10, #26]	@ movhi
	strh	r3, [r10, #28]	@ movhi
	strh	ip, [r10, #24]	@ movhi
	ble	.L280
	mov	r0, #0
	mov	r7, #712
	mov	r8, #8
	ldr	lr, [r4]
	ldr	r1, .L335+48
	ldr	r2, .L335+44
	b	.L279
.L276:
	ldr	r3, [r1, #-36]
	ldrb	ip, [r1, #-40]	@ zero_extendqisi2
	mov	r3, r3, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	orr	ip, ip, #512
	strh	r7, [r2, #68]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	ip, [r2, #64]	@ movhi
.L278:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #48
	add	r2, r2, #8
	ble	.L280
.L279:
	ldr	r3, [r1]
	cmp	r3, #1
	bne	.L276
	ldr	r9, [r1, #-36]
	ldrb	ip, [r1, #-40]	@ zero_extendqisi2
	mov	r3, r9, asl #23
	cmp	r9, #240
	mov	r3, r3, lsr #23
	strh	ip, [r2, #64]	@ movhi
	orr	r3, r3, #16384
	orrhi	ip, ip, #512
	strhih	ip, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r8, [r2, #68]	@ movhi
	b	.L278
.L257:
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L329
	ldr	r3, [r5, #4]
	ldr	ip, [r4, #8]
	b	.L286
.L239:
	mov	r2, #1
	ldr	r3, [r5, #8]
	cmp	r3, #88
	str	r2, [r9, #28]
	ldr	r4, .L335+40
	ldr	r2, .L335+32
	ldr	lr, .L335
	ble	.L330
	ldr	ip, [r2, #40]
	ldr	r0, [r4]
	sub	r3, r3, #1
	sub	ip, ip, #1
	cmp	r0, #0
	str	r3, [lr, #8]
	str	ip, [r2, #40]
	ble	.L246
	ldr	r3, .L335+48
	add	ip, r0, r0, lsl #1
	add	ip, r3, ip, lsl #4
.L245:
	ldr	r2, [r3]
	cmp	r2, #1
	ldreq	r2, [r3, #-40]
	addeq	r2, r2, #1
	streq	r2, [r3, #-40]
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L245
.L246:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L317
	cmp	r3, #1
	beq	.L331
	cmp	r3, #2
	beq	.L312
.L317:
	ldr	r10, .L335+44
	b	.L240
.L327:
	cmp	r3, #1
	beq	.L332
	cmp	r3, #2
	beq	.L270
	ldrb	ip, [r9]	@ zero_extendqisi2
	ldr	r3, [r9, #4]
	ldr	r0, [r4]
	b	.L261
.L326:
	ldrb	ip, [r9]	@ zero_extendqisi2
	ldr	r3, [r9, #4]
	mov	lr, #3
	b	.L287
.L325:
	cmp	r2, #1
	beq	.L333
	cmp	r2, #2
	bne	.L258
	mov	r7, #198
	ldrh	r2, [lr, #4]
	sub	r8, r2, #15
	sub	r2, r2, #30
	mov	r8, r8, asl #23
	mov	r2, r2, asl #23
	ldrh	lr, [lr]
	mov	r8, r8, lsr #23
	mov	r2, r2, lsr #23
	orr	r8, r8, #16384
	orr	r2, r2, #16384
	strh	r8, [r10, #18]	@ movhi
	strh	r2, [r10, #10]	@ movhi
	sub	r8, lr, #2
	ldr	r2, .L335+56
	and	r8, r8, #255
	and	lr, lr, #255
	strh	r8, [r10, #8]	@ movhi
	strh	lr, [r10, #16]	@ movhi
	strh	r7, [r10, #20]	@ movhi
	strh	r2, [r10, #12]	@ movhi
	b	.L258
.L330:
	ldr	r10, .L335+44
	ldr	r0, [r4]
	b	.L240
.L329:
	ldrb	ip, [r9]	@ zero_extendqisi2
	ldr	r3, [r9, #4]
	b	.L261
.L280:
	mov	r7, #67108864
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #8]
	ldr	r1, .L335+44
	strh	r3, [r7, #16]	@ movhi
	mov	r0, #3
	mov	r3, #512
	strh	r2, [r7, #18]	@ movhi
	mov	r2, #117440512
	mov	lr, pc
	bx	r6
	ldr	r3, [r7, #304]
	tst	r3, #8
	bne	.L275
	mov	r2, r7
.L305:
	ldr	r3, [r2, #304]
	tst	r3, #8
	bne	.L305
	mov	r2, #67108864
.L298:
	ldr	r3, [r2, #304]
	tst	r3, #8
	beq	.L298
	mov	r3, #2
	str	r3, [r4, #4]
.L275:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #1
	bne	.L282
.L283:
	ldr	r2, [r3, #304]
	tst	r2, #1
	bne	.L283
	mov	r3, #67108864
.L284:
	ldr	r2, [r3, #304]
	tst	r2, #1
	beq	.L284
	mov	r2, #8000
	ldr	r3, .L335+60
	str	r2, [r3]
.L282:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	b	update
.L322:
	ldr	r0, .L335+64
	ldr	r3, .L335+68
	mov	lr, pc
	bx	r3
	ldr	r6, .L335+12
	ldr	r3, .L335+72
	mov	r2, #100663296
	ldr	r1, .L335+76
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	ldr	r2, .L335+80
	ldr	r1, .L335+84
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #4352
	ldr	r2, .L335+88
	ldr	r1, .L335+92
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, #30
	mov	r1, #1024
	ldr	r0, .L335+96
	bl	loadMap
	b	.L235
.L328:
	mov	r2, #0
	ldr	lr, [r1, #32]
	str	r2, [r1, #36]
	str	lr, [r1, #28]
	b	.L272
.L324:
	cmp	r3, #1
	beq	.L334
	cmp	r3, #2
	bne	.L249
	mov	ip, #192
	mov	r2, #512
	ldrh	r3, [r9, #4]
	sub	lr, r3, #15
	sub	r3, r3, #30
	mov	r3, r3, asl #23
	ldrh	r7, [r9]
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	mov	lr, lr, asl #23
	mov	lr, lr, lsr #23
	strh	r3, [r10, #10]	@ movhi
	sub	r3, r7, #2
	orr	lr, lr, #16384
	and	r3, r3, #255
	and	r7, r7, #255
	strh	lr, [r10, #18]	@ movhi
	strh	r3, [r10, #8]	@ movhi
	strh	r7, [r10, #16]	@ movhi
	strh	ip, [r10, #20]	@ movhi
	strh	r2, [r10, #12]	@ movhi
	b	.L249
.L333:
	mov	r7, #198
	ldr	r2, [lr, #4]
	sub	r2, r2, #15
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #23
	ldrb	lr, [lr]	@ zero_extendqisi2
	orr	r2, r2, #16384
	strh	r2, [r10, #18]	@ movhi
	strh	lr, [r10, #16]	@ movhi
	strh	r7, [r10, #20]	@ movhi
	b	.L258
.L332:
	mov	r0, #196
	mov	r1, #836
	ldrh	lr, [r9]
	and	ip, lr, #255
.L318:
	ldr	r3, [r9, #4]
	mov	r2, r3, asl #16
	mov	r2, r2, lsr #16
	sub	r7, r2, #15
	sub	r2, r2, #30
	mov	r7, r7, asl #23
	mov	r2, r2, asl #23
	mov	r7, r7, lsr #23
	mov	r2, r2, lsr #23
	sub	lr, lr, #2
	orr	r7, r7, #16384
	orr	r2, r2, #16384
	and	lr, lr, #255
	strh	r0, [r10, #20]	@ movhi
	strh	r7, [r10, #18]	@ movhi
	strh	r2, [r10, #10]	@ movhi
	strh	ip, [r10, #16]	@ movhi
	strh	lr, [r10, #8]	@ movhi
	strh	r1, [r10, #12]	@ movhi
	ldr	r0, [r4]
	b	.L261
.L323:
	ldr	r0, .L335+100
	ldr	r3, .L335+68
	mov	lr, pc
	bx	r3
	ldr	r6, .L335+12
	mov	r3, #6144
	mov	r2, #100663296
	ldr	r1, .L335+104
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	ldr	r2, .L335+80
	ldr	r1, .L335+108
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #3808
	ldr	r2, .L335+88
	ldr	r1, .L335+112
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #30
	mov	r2, #0
	mov	r1, #1024
	ldr	r0, .L335+116
	bl	loadMap
	b	.L235
.L310:
	ldr	r0, .L335+120
	ldr	r3, .L335+68
	mov	lr, pc
	bx	r3
	ldr	r6, .L335+12
	mov	r3, #3200
	mov	r2, #100663296
	ldr	r1, .L335+124
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	ldr	r2, .L335+80
	ldr	r1, .L335+128
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #16896
	ldr	r2, .L335+88
	ldr	r1, .L335+132
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #30
	mov	r2, #0
	mov	r1, #1024
	ldr	r0, .L335+136
	bl	loadMap
	b	.L235
.L270:
	ldrh	lr, [r9]
	mov	r0, #196
	and	ip, lr, #255
	mov	r1, #516
	b	.L318
.L312:
	mov	ip, #194
	ldrh	r3, [r9, #4]
	sub	r2, r3, #15
	mov	r2, r2, asl #23
	sub	r3, r3, #30
	ldr	r10, .L335+44
	ldrh	lr, [r9]
	mov	r3, r3, asl #23
	mov	r2, r2, lsr #23
	orr	r2, r2, #16384
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r2, [r10, #18]	@ movhi
	and	r2, lr, #255
	strh	r3, [r10, #10]	@ movhi
	strh	r2, [r10, #16]	@ movhi
	sub	r3, lr, #2
	ldr	r2, .L335+140
	and	r3, r3, #255
	strh	r3, [r10, #8]	@ movhi
	strh	ip, [r10, #20]	@ movhi
	strh	r2, [r10, #12]	@ movhi
	b	.L240
.L334:
	mov	r2, #192
	ldr	r3, [r9, #4]
	sub	r3, r3, #15
	mov	r3, r3, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r10, #18]	@ movhi
	ldrb	r3, [r9]	@ zero_extendqisi2
	strh	r2, [r10, #20]	@ movhi
	strh	r3, [r10, #16]	@ movhi
	b	.L249
.L331:
	mov	r2, #194
	ldr	r3, [r9, #4]
	sub	r3, r3, #15
	mov	r3, r3, asl #23
	ldr	r10, .L335+44
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r10, #18]	@ movhi
	ldrb	r3, [r9]	@ zero_extendqisi2
	strh	r2, [r10, #20]	@ movhi
	strh	r3, [r10, #16]	@ movhi
	b	.L240
.L336:
	.align	2
.L335:
	.word	.LANCHOR1
	.word	23680
	.word	7812
	.word	DMANow
	.word	83886592
	.word	taySpritePal
	.word	100728832
	.word	taySpriteTiles
	.word	tay
	.word	1717986919
	.word	.LANCHOR0
	.word	shadowOAM
	.word	manEnemy+40
	.word	manEnemy
	.word	518
	.word	lives
	.word	level1FrontBGPal
	.word	loadPalette
	.word	4512
	.word	level1FrontBGTiles
	.word	100720640
	.word	level1FrontBGMap
	.word	100679680
	.word	level1BackBGTiles
	.word	level1BackBGMap
	.word	level2FrontBGPal
	.word	level2FrontBGTiles
	.word	level2FrontBGMap
	.word	level2BackBGTiles
	.word	level2BackBGMap
	.word	level3FrontBGPal
	.word	level3FrontBGTiles
	.word	level3FrontBGMap
	.word	level3BackBGTiles
	.word	level3BackBGMap
	.word	514
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L356
.L338:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L338
	mov	r3, #67108864
	mov	r2, #4352
	stmfd	sp!, {r4, r7, fp, lr}
	mov	lr, #128
	mov	ip, #1
	mov	r4, #0
	ldr	r1, .L356+4
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L356+8
	ldr	r0, [r3, #304]
	strh	r2, [r3]	@ movhi
	str	r0, [r1]
	ldr	r2, .L356+12
	ldrh	r0, [r3, #4]
	ldrh	r1, [r2]
	orr	r0, r0, #8
	strh	lr, [r3, #132]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldr	r5, .L356+16
	ldr	lr, .L356+20
	ldr	r0, .L356+24
	orr	r1, r1, ip
	strh	r5, [r3, #130]	@ movhi
	strh	r4, [r3, #128]	@ movhi
	ldr	r6, .L356+28
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	str	r0, [lr, #4092]
	ldr	r3, [r6]
	ldr	r2, .L356+32
	cmp	r3, r4
	str	ip, [r2, #16]
	bne	.L339
	mov	r1, #30
	mov	r2, #4
	ldr	r5, .L356+36
	ldr	r3, .L356+40
	str	r1, [r5]
	str	r2, [r3]
.L340:
	ldr	r3, .L356+44
	mov	lr, pc
	bx	r3
	ldr	r2, .L356+48
	ldr	r1, .L356+52
	ldr	r0, .L356+56
	ldr	r3, .L356+60
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	ldr	fp, .L356+64
	ldr	r10, .L356+68
	ldr	r9, .L356+72
	ldr	r8, .L356+76
	ldr	r7, .L356+80
.L353:
	ldr	r3, [r5, #4]
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L342
.L344:
	.word	.L343
	.word	.L345
	.word	.L346
	.word	.L347
	.word	.L348
	.word	.L349
	.word	.L350
	.word	.L351
	.word	.L352
.L352:
	mov	lr, pc
	bx	r8
.L342:
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #4]
	add	r2, r3, r3, lsr #31
	mov	r2, r2, asl #15
	mov	r3, r3, asl #16
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #16]	@ movhi
	strh	r2, [r4, #20]	@ movhi
	b	.L353
.L351:
	mov	lr, pc
	bx	r9
	b	.L342
.L350:
	ldr	r3, .L356+84
	mov	lr, pc
	bx	r3
	b	.L342
.L349:
	ldr	r3, .L356+88
	mov	lr, pc
	bx	r3
	b	.L342
.L348:
	ldr	r3, .L356+92
	mov	lr, pc
	bx	r3
	b	.L342
.L345:
	mov	lr, pc
	bx	fp
	b	.L342
.L343:
	mov	lr, pc
	bx	r10
	b	.L342
.L347:
	ldr	r3, .L356+96
	mov	lr, pc
	bx	r3
	b	.L342
.L346:
	ldr	r3, .L356+100
	mov	lr, pc
	bx	r3
	b	.L342
.L339:
	cmp	r3, #1
	moveq	r1, #40
	moveq	r2, #3
	movne	r1, #45
	movne	r2, #2
	ldr	r5, .L356+36
	ldr	r3, .L356+40
	str	r1, [r5]
	str	r2, [r3]
	b	.L340
.L357:
	.align	2
.L356:
	.word	shadowOAM
	.word	-9344
	.word	buttons
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	.LANCHOR1
	.word	soundA
	.word	.LANCHOR0
	.word	fastProb
	.word	initialize
	.word	11025
	.word	2313008
	.word	BadBlood
	.word	playSoundA
	.word	splash
	.word	game
	.word	level2Splash
	.word	level3Splash
	.word	waitForVblank
	.word	instructions2
	.word	instructions
	.word	lose
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L376
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L372
	ldr	r3, .L376+4
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	cmp	r2, r1
	addlt	r2, r2, #1
	stmfd	sp!, {r4, lr}
	strlt	r2, [r3, #28]
	blt	.L362
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L374
	ldr	r3, .L376+8
	ldr	r1, .L376+12
	ldr	r3, [r3]
	strh	r2, [r1, #2]	@ movhi
	str	r2, [r3, #20]
.L362:
	ldr	r2, .L376+16
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	cmp	r1, r3
	addgt	r3, r3, #1
	strgt	r3, [r2, #28]
	ble	.L375
.L363:
	mov	r2, #1
	ldr	r3, .L376
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L376
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L375:
	mov	r3, #0
	ldr	r2, .L376+8
	ldr	r1, .L376+12
	ldr	r2, [r2]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r2, #32]
	b	.L363
.L372:
	mov	r2, #1
	ldr	r3, .L376
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L374:
	ldmia	r3, {r0, r1, r2}
	bl	playSoundA
	b	.L362
.L377:
	.align	2
.L376:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L379
	ldr	r0, .L379+4
	ldr	r1, .L379+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L380:
	.align	2
.L379:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L382
	ldr	ip, .L382+4
	ldr	r0, .L382+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L383:
	.align	2
.L382:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L385
	ldr	r2, .L385+4
	ldr	r1, [r1]
	str	r3, [r1, #8]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L386:
	.align	2
.L385:
	.word	dma
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L389
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L389+4
	ldr	ip, .L389+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L390:
	.align	2
.L389:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	fastProb,4,4
	.global	winCount
	.global	numInactive
	.comm	lives,4,4
	.global	level
	.global	state
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	manEnemy,24000,4
	.comm	lifeHeart,220,4
	.comm	sel,44,4
	.comm	tay,44,4
	.comm	shadowOAM,1024,4
	.global	levMaxEnemyNum
	.global	vOff
	.global	hOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	levMaxEnemyNum, %object
	.size	levMaxEnemyNum, 4
levMaxEnemyNum:
	.word	10
	.type	state, %object
	.size	state, 4
state:
	.word	1
	.type	winCount, %object
	.size	winCount, 4
winCount:
	.word	50
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	level, %object
	.size	level, 4
level:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	numInactive, %object
	.size	numInactive, 4
numInactive:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
