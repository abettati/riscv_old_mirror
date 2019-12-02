#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    /* inline assembly */
    asm volatile("ecall");
    uint32_t regVal;
    volatile uint32_t* baseAddr;
    //asm volatile("sw %[regVal], 0x0, %[baseAddr]"
    //              : 
    //              : [regVal] "r" (regVal),
    //                [baseAddr]  "r" (baseAddr)
    //            );

    // Enable mstatus,mie
    asm volatile("csrwi 0x300, 0x8");
    // Enable all mie (need to store) 
    regVal = 0xFFFFFFFF;
    asm volatile("csrw 0x304, %[regVal]"
                  : : [regVal] "r" (regVal));
    
    baseAddr = 0x15000000;
    regVal = 8;        // set timer_irq_mask_q[TIMER_IRQ_ID] = 1
    
    asm volatile("sw %0, 0(%1)" : : "r"(regVal), "r"(baseAddr));
    
    baseAddr = 0x15000004;
    regVal = 3;        // set timer_cnt_q = 3

    asm volatile("sw %0, 0(%1)" : : "r"(regVal), "r"(baseAddr));


    // int a, b, c;
    // asm volatile("add %[res], %[a], %[b]"
    //               // ouput          // input          
    //               : [res] "+r" (c) : [a] "r" (a), [b] "r" (b))

    // asm volatile("csrwi 0x304, 0x88");

    int a = 5;
    int count = 10;


    for (int i = 0; i < count; ++i)
    {
    	if( a > 0)
    	{
    		a = a - 1;
    		printf("%d\n",i);
    	}
    	else
    	{	
    		a = a + 1;
    		printf("%d\n",a);
    	};

    }
    
    
    return EXIT_SUCCESS;
}


// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

#include "firmware.h"

#define OUTPORT 0x10000000

void print_chr(char ch)
{
    *((volatile uint32_t *)OUTPORT) = ch;
}

void print_str(const char *p)
{
    while (*p != 0)
        *((volatile uint32_t *)OUTPORT) = *(p++);
}

void print_dec(unsigned int val)
{
    char buffer[10];
    char *p = buffer;
    while (val || p == buffer) {
        *(p++) = val % 10;
        val = val / 10;
    }
    while (p != buffer) {
        *((volatile uint32_t *)OUTPORT) = '0' + *(--p);
    }
}

void print_hex(unsigned int val, int digits)
{
    for (int i = (4 * digits) - 4; i >= 0; i -= 4)
        *((volatile uint32_t *)OUTPORT) = "0123456789ABCDEF"[(val >> i) % 16];
}

void timer_irq_handler(void)
{
    print_str("\n\nTEST TIMEOUT...\n\n");
}