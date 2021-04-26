#include <gb/gb.h>
#include <stdio.h>

// Bank number references from the other source files
extern const void __bank_srcfile1;
extern const void __bank_srcfile2; 
extern const void __bank_srcfile3;
extern const void __bank_srcfile4; 
extern const void __bank_savestate;  

// Banked const vars from the other source files
extern const UINT8 some_const_var_1;
extern UINT8 save_var;
extern unsigned char big_const_4[];

extern const UINT8 some_const_var_2;
extern const UINT8 some_const_var_3;
extern const UINT8 some_const_var_4;

// Banked functions from the other source files
void func_1() BANKED;
void func_2() BANKED;
void func_3() BANKED;
//void some_4() BANKED;

// Non-banked const
const UINT8 some_const_var_0 = 0;

// Non-banked function
void bank_fixed(void) NONBANKED
{
  puts("I'm in fixed ROM");
}



void savegame(){

ENABLE_RAM_MBC1;
  SWITCH_RAM_MBC1( (UINT8)&__bank_savestate );
  printf("save_var is %u in %u\n", save_var, &(__bank_savestate));
  save_var++;

  big_const_4[5] = 0;

  printf("save_var is %u\n", big_const_4[5]);
  //for (INT8 i = 0; (big_const_4[i]); i++) putchar(big_const_4[i]); 

  printf("save_var is %u\n", save_var);

  DISABLE_RAM_MBC1;

}


void checkInput() {
	
	if (joypad() & J_A)
	{
    //printf("A");

    savegame();
		//player_screenspace[0]++;
		//direction[2] = (INT8)1;
	}

}



void main(void)
{


  printf("Program Start...\n\n");

  // Call the functions, unbanked first then the banked ones
  bank_fixed();



  func_1();
  func_2();
  func_3();
  //some_4();

  printf("\n");

  // Print the const vars, unbanked first then the banked ones
  printf("Var0 = %u is unbanked", some_const_var_0);



  
  savegame();


  SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile1 );
  printf("Var1 = %u in bank %u\n", some_const_var_1, &(__bank_srcfile1));
  SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile2 );
  printf("Var2 = %u in bank %u\n", some_const_var_2, &(__bank_srcfile2));
  SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile3 );
  printf("Var3 = %u in bank %u\n", some_const_var_3, &(__bank_srcfile3));
  //SWITCH_ROM_MBC1( (UINT8)&__bank_srcfile4 );
  //printf("Var4 = %u in bank %u\n", some_const_var_4, &(__bank_savestate//));


  printf("\n");
  puts("The End...");

  // Loop endlesslu
  while(1) {
    // Yield CPU till the end of each frame
    checkInput();
    wait_vbl_done();
    
  }
}
