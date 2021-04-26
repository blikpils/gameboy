;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module savestate
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_some_4
	.globl _some_4
	.globl _printf
	.globl _big_const_4
	.globl _save_var
	.globl _some_const_var_4
	.globl ___bank_savestate
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA_0
_save_var::
	.ds 1
_big_const_4::
	.ds 16
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;res\savestate.c:20: unsigned char big_const_4[] = {
	ld	hl, #_big_const_4
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0001)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0002)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0006)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0007)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0008)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x0009)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000a)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000b)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000c)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000d)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000e)
	ld	(hl), #0x01
	ld	hl, #(_big_const_4 + 0x000f)
	ld	(hl), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;res\savestate.c:13: void some_4() BANKED
;	---------------------------------
; Function some_4
; ---------------------------------
	b_some_4	= 2
_some_4::
;res\savestate.c:16: " is in ROM bank %u\n", _current_bank);
	ldh	a, (__current_bank+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	hl, #___str_0
	push	hl
	call	_printf
	add	sp, #4
;res\savestate.c:17: }
	ret
___bank_savestate	=	0x0002
_some_const_var_4:
	.db #0x04	; 4
___str_0:
	.ascii "Func4 not autobanked is in ROM bank %u"
	.db 0x0a
	.db 0x00
	.area _CODE_2
	.area _CABS (ABS)
