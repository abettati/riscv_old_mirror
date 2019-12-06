#include <stdio.h>
#include <stdlib.h>



#include "firmware.h"

#define OUTPORT 0x10000000

uint32_t IRQ_SOFTWARE_CODE = 3;
uint32_t IRQ_TIMER_CODE    = 7;

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


    /* TEST WRITE IRQ*/
    writew(IRQ_SOFTWARE_CODE,0x16000038);





    /* WRITE TO RND IRQ GEN */


    //writew(2,0x1600002C);
    
    //writew(20,0x16000030);     

    // rnd irq gen mode
    //writew(2,0x16000028);

    // set timer_cnt_q = 3
    //writew(3,0x15000004);


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
    writew(3,0x15000004);
    printf("\n\n timer set \n\n");

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




