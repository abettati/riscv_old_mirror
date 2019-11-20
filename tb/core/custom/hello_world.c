#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    /* inline assembly */
    asm volatile("ecall");
    int regVal = 0x88;
    asm volatile("csrw 0x304, %[regTmp]"
                  : : [regTmp] "r" (regVal));

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
