#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    /* inline assembly */
    asm volatile("ecall");
    int regVal;
    int* baseAddr;
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
    *(baseAddr) = 8;        // set timer_irq_mask_q[TIMER_IRQ_ID] = 1
    baseAddr = 0x15000004;
    *(baseAddr) = 3;        // set timer_cnt_q = 3





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
