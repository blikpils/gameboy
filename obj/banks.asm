;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module banks
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _checkInput
	.globl _savegame
	.globl _bank_fixed
	.globl b_func_3
	.globl _func_3
	.globl b_func_2
	.globl _func_2
	.globl b_func_1
	.globl _func_1
	.globl _puts
	.globl _printf
	.globl _wait_vbl_done
	.globl _joypad
	.globl _some_const_var_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;src\banks.c:30: void bank_fixed(void) NONBANKED
;	---------------------------------
; Function bank_fixed
; ---------------------------------
_bank_fixed::
;src\banks.c:32: puts("I'm in fixed ROM");
	ld	hl, #___str_0
	push	hl
	call	_puts
	add	sp, #2
;src\banks.c:33: }
	ret
_some_const_var_0:
	.db #0x00	; 0
___str_0:
	.ascii "I'm in fixed ROM"
	.db 0x00
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\banks.c:37: void savegame(){
;	---------------------------------
; Function savegame
; ---------------------------------
_savegame::
;src\banks.c:39: ENABLE_RAM_MBC1;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;src\banks.c:40: SWITCH_RAM_MBC1( (UINT8)&__bank_savestate );
	ld	bc, #___bank_savestate+0
	ld	a, c
	ld	h, #0x40
	ld	(hl), a
;src\banks.c:41: printf("save_var is %u in %u\n", save_var, &(__bank_savestate));
	ld	hl, #_save_var
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_1
	push	hl
	call	_printf
	add	sp, #6
;src\banks.c:42: save_var++;
	ld	hl, #_save_var
	inc	(hl)
;src\banks.c:44: big_const_4[5] = 0;
	ld	bc, #_big_const_4+5
	xor	a, a
;src\banks.c:46: printf("save_var is %u\n", big_const_4[5]);
	ld	(bc), a
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #4
;src\banks.c:49: printf("save_var is %u\n", save_var);
	ld	hl, #_save_var
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #4
;src\banks.c:51: DISABLE_RAM_MBC1;
	ld	hl, #0x0000
	ld	(hl), #0x00
;src\banks.c:53: }
	ret
___str_1:
	.ascii "save_var is %u in %u"
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "save_var is %u"
	.db 0x0a
	.db 0x00
;src\banks.c:56: void checkInput() {
;	---------------------------------
; Function checkInput
; ---------------------------------
_checkInput::
;src\banks.c:58: if (joypad() & J_A)
	call	_joypad
	bit	4, e
	ret	Z
;src\banks.c:62: savegame();
;src\banks.c:67: }
	jp  _savegame
;src\banks.c:71: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src\banks.c:75: printf("Program Start...\n\n");
	ld	hl, #___str_4
	push	hl
	call	_puts
	add	sp, #2
;src\banks.c:78: bank_fixed();
	call	_bank_fixed
;src\banks.c:82: func_1();
	ld	e, #b_func_1
	ld	hl, #_func_1
	call	___sdcc_bcall_ehl
;src\banks.c:83: func_2();
	ld	e, #b_func_2
	ld	hl, #_func_2
	call	___sdcc_bcall_ehl
;src\banks.c:84: func_3();
	ld	e, #b_func_3
	ld	hl, #_func_3
	call	___sdcc_bcall_ehl
;src\banks.c:87: printf("\n");
	ld	hl, #___str_6
	push	hl
	call	_puts
	add	sp, #2
;src\banks.c:90: printf("Var0 = %u is unbanked", some_const_var_0);
	ld	hl, #_some_const_var_0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_7
	push	hl
	call	_printf
	add	sp, #4
;src\banks.c:95: savegame();
	call	_savegame
;src\banks.c:98: SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile1 );
	ld	bc, #___bank_srcfile1+0
	ld	a, c
	ldh	(__current_bank+0),a
	ld	a, #<(___bank_srcfile1)
	ld	(#0x2000),a
;src\banks.c:99: printf("Var1 = %u in bank %u\n", some_const_var_1, &(__bank_srcfile1));
	ld	hl, #_some_const_var_1
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_8
	push	hl
	call	_printf
	add	sp, #6
;src\banks.c:100: SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile2 );
	ld	bc, #___bank_srcfile2+0
	ld	a, c
	ldh	(__current_bank+0),a
	ld	a, #<(___bank_srcfile2)
	ld	(#0x2000),a
;src\banks.c:101: printf("Var2 = %u in bank %u\n", some_const_var_2, &(__bank_srcfile2));
	ld	hl, #_some_const_var_2
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_9
	push	hl
	call	_printf
	add	sp, #6
;src\banks.c:102: SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile3 );
	ld	bc, #___bank_srcfile3+0
	ld	a, c
	ldh	(__current_bank+0),a
	ld	a, #<(___bank_srcfile3)
	ld	(#0x2000),a
;src\banks.c:103: printf("Var3 = %u in bank %u\n", some_const_var_3, &(__bank_srcfile3));
	ld	hl, #_some_const_var_3
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_10
	push	hl
	call	_printf
	add	sp, #6
;src\banks.c:109: puts("The End...");
	ld	hl, #___str_13
	push	hl
	call	_puts
	add	sp, #2
;src\banks.c:112: while(1) {
00102$:
;src\banks.c:114: checkInput();
	call	_checkInput
;src\banks.c:115: wait_vbl_done();
	call	_wait_vbl_done
;src\banks.c:118: }
	jr	00102$
___str_4:
	.ascii "Program Start..."
	.db 0x0a
	.db 0x00
___str_6:
	.db 0x00
___str_7:
	.ascii "Var0 = %u is unbanked"
	.db 0x00
___str_8:
	.ascii "Var1 = %u in bank %u"
	.db 0x0a
	.db 0x00
___str_9:
	.ascii "Var2 = %u in bank %u"
	.db 0x0a
	.db 0x00
___str_10:
	.ascii "Var3 = %u in bank %u"
	.db 0x0a
	.db 0x00
___str_13:
	.db 0x0a
	.ascii "The End..."
	.db 0x00
	.area _CODE
	.area _CABS (ABS)
