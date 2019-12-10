#include <stdio.h>
#include <stdlib.h>



#include "firmware.h"

#define OUTPORT 0x10000000

uint32_t IRQ_SOFTWARE_CODE = 3;
uint32_t IRQ_TIMER_CODE    = 7;
uint32_t IRQ_EXTERNAL_CODE = 11;
uint32_t IRQ_FAST0_CODE    = 16;
uint32_t IRQ_FAST1_CODE    = 17;
uint32_t IRQ_FAST2_CODE    = 18;
uint32_t IRQ_FAST3_CODE    = 19;
uint32_t IRQ_FAST4_CODE    = 20;
uint32_t IRQ_FAST5_CODE    = 21;
uint32_t IRQ_FAST6_CODE    = 22;
uint32_t IRQ_FAST7_CODE    = 23;
uint32_t IRQ_FAST8_CODE    = 24;
uint32_t IRQ_FAST9_CODE    = 25;
uint32_t IRQ_FAST10_CODE   = 26;
uint32_t IRQ_FAST11_CODE   = 27;
uint32_t IRQ_FAST12_CODE   = 28;
uint32_t IRQ_FAST13_CODE   = 29;
uint32_t IRQ_FAST14_CODE   = 30;

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


/*R/W to memory*/

void writew(uint32_t val, volatile uint32_t *addr)
{
    asm volatile("sw %0, 0(%1)" : : "r"(val), "r"(addr));
}


void timer_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n TIMER IRQ SERVED...\n\n");
}

void software_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n SOFTWARE IRQ SERVED...\n\n");
}

void fast0_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST0 IRQ SERVED...\n\n");
}

void fast1_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST1 IRQ SERVED...\n\n");
}

void fast2_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST2 IRQ SERVED...\n\n");
}

void fast3_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST3 IRQ SERVED...\n\n");
}

void fast4_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST4 IRQ SERVED...\n\n");
}

void fast5_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST5 IRQ SERVED...\n\n");
}

void fast6_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST6 IRQ SERVED...\n\n");
}

void fast7_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST7 IRQ SERVED...\n\n");
}

void fast8_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST8 IRQ SERVED...\n\n");
}

void fast9_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST9 IRQ SERVED...\n\n");
}

void fast10_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST10 IRQ SERVED...\n\n");
}

void fast11_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST11 IRQ SERVED...\n\n");
}

void fast12_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST12 IRQ SERVED...\n\n");
}

void fast13_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST13 IRQ SERVED...\n\n");
}

void fast14_irq_handler(void)
{
    writew(0,0x16000038);
    print_str("\n\n FAST14 IRQ SERVED...\n\n");
}

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
    
    // set timer_irq_mask_q[TIMER_IRQ_ID] = 1
     writew(128,0x15000000);


    // software defined irq gen mode
    writew(4,0x16000028);


    /* TEST WRITE IRQ*/
    //writew(IRQ_SOFTWARE_CODE,0x16000038);

    /* TEST t IRQ*/
    writew(IRQ_EXTERNAL_CODE,0x16000038);


    /* WRITE TO RND IRQ GEN */


    //writew(2,0x1600002C);
    
    //writew(20,0x16000030);     


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
    
    // set hw timer = 3
    //writew(3,0x15000004);
    //printf("\n\n timer set \n\n");
    
    writew(IRQ_FAST10_CODE,0x16000038);

    a = 5;
    count = 10;


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




