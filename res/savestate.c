#include <gb/gb.h>
#include <stdio.h>

// In this source file a non-auto bank (2) is used (no auto-banking)
#pragma bank 2
const void __at(2) __bank_savestate;


const UINT8 some_const_var_4 = 4;
UINT8 save_var;


void some_4() BANKED
{
    printf("Func4 not autobanked"
           " is in ROM bank %u\n", _current_bank);
}

// A big constant array to take up space
unsigned char big_const_4[] = {

        // 512
        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
};


