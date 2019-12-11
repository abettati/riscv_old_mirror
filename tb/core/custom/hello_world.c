#include <stdio.h>
#include <stdlib.h>
#include <time.h>


#include "firmware.h"
#include "irq_test_lib.h"

#define OUTPORT 0x10000000
#define IRQ_NUM 18

volatile uint32_t irq_processed = 1;
volatile uint32_t irq_id = 0;

uint32_t IRQ_CODE [18] = { 
  3,   // 0  - IRQ_SOFTWARE_CODE 
  7,   // 1  - IRQ_TIMER_CODE  
  11,  // 2  - IRQ_EXTERNAL_CODE  
  16,  // 3  - IRQ_FAST0_CODE 
  17,  // 4  - IRQ_FAST1_CODE 
  18,  // 5  - IRQ_FAST2_CODE 
  19,  // 6  - IRQ_FAST3_CODE 
  20,  // 7  - IRQ_FAST4_CODE 
  21,  // 8  - IRQ_FAST5_CODE 
  22,  // 9  - IRQ_FAST6_CODE 
  23,  // 10 - IRQ_FAST7_CODE 
  24,  // 11 - IRQ_FAST8_CODE 
  25,  // 12 - IRQ_FAST9_CODE 
  26,  // 13 - IRQ_FAST10_CODE 
  27,  // 14 - IRQ_FAST11_CODE 
  28,  // 15 - IRQ_FAST12_CODE 
  29,  // 16 - IRQ_FAST13_CODE 
  30   // 17 - IRQ_FAST14_CODE 
  //0    // 18 - TODO IRQ_NM_CODE
};

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


void software_irq_handler(void)
{
    irq_id = 3;
    writew(0,0x16000038);
    printf("SOFTWARE IRQ SERVED: irq_ id = %d \n", irq_id);
    irq_processed = 0;
}

void timer_irq_handler(void)
{
    irq_id = 7;
    writew(0,0x16000038);
    print_str("TIMER IRQ SERVED...\n");
    irq_processed = 0; 
}

void external_irq_handler(void)
{
    irq_id = 11;
    writew(0,0x16000038);
    print_str("EXTERNAL IRQ SERVED...\n");
    irq_processed = 0;
}



void fast0_irq_handler(void)
{
    irq_id = 16;
    writew(0,0x16000038);
    print_str("FAST0 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast1_irq_handler(void)
{
    irq_id = 17;
    writew(0,0x16000038);
    print_str("FAST1 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast2_irq_handler(void)
{
    irq_id = 18;
    writew(0,0x16000038);
    print_str("FAST2 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast3_irq_handler(void)
{
    irq_id = 19;
    writew(0,0x16000038);
    print_str("FAST3 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast4_irq_handler(void)
{
    irq_id = 20;
    writew(0,0x16000038);
    print_str("FAST4 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast5_irq_handler(void)
{
    irq_id = 21;
    writew(0,0x16000038);
    print_str("FAST5 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast6_irq_handler(void)
{
    irq_id = 22;
    writew(0,0x16000038);
    print_str("FAST6 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast7_irq_handler(void)
{
    irq_id = 23;    
    writew(0,0x16000038);
    print_str("FAST7 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast8_irq_handler(void)
{
    irq_id = 24;    
    writew(0,0x16000038);
    print_str("FAST8 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast9_irq_handler(void)
{
    irq_id = 25;    
    writew(0,0x16000038);
    print_str("FAST9 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast10_irq_handler(void)
{
    irq_id = 26;    
    writew(0,0x16000038);
    print_str("FAST10 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast11_irq_handler(void)
{
    irq_id = 27;    
    writew(0,0x16000038);
    print_str("FAST11 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast12_irq_handler(void)
{
    irq_id = 28;    
    writew(0,0x16000038);
    print_str("FAST12 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast13_irq_handler(void)
{
    irq_id = 29;    
    writew(0,0x16000038);
    print_str("FAST13 IRQ SERVED...\n");
    irq_processed = 0;
}

void fast14_irq_handler(void)
{
    irq_id = 30;
    writew(0,0x16000038);
    print_str("FAST14 IRQ SERVED...\n");
    irq_processed = 0;
}


uint32_t random_num(uint32_t upper_bound, uint32_t lower_bound) 
{ 
    uint32_t num = (rand() % (upper_bound - lower_bound + 1)) + lower_bound;
    return num;
} 

int main(int argc, char *argv[])
{
    /* inline assembly */
    //asm volatile("ecall");

    // Use current time as  
    // seed for random generator 
    srand(time(0)); 

    uint32_t regVal;
    volatile uint32_t* baseAddr;

    // Enable mstatus.mie
    asm volatile("csrwi 0x300, 0x8");

    // Enable all mie (need to store) 
    regVal = 0xFFFFFFFF;
    asm volatile("csrw 0x304, %[regVal]"
                  : : [regVal] "r" (regVal));
    
    // set timer_irq_mask_q[TIMER_IRQ_ID] = 1
     writew(128,0x15000000);


    // software defined irq gen mode
    writew(4,0x16000028);

    // Sequential test (no masking)
    uint32_t i = 0;
    while(i < 18){
      irq_processed = 1;
      irq_id = 0;
      writew(IRQ_CODE[i],0x16000038);
      
      while(irq_processed){
        printf("waiting \n");
      };
  
      if(irq_id == IRQ_CODE[i]){
          printf("OK: correct id");
      } else {
          printf("ERR: wrong id\n Expected %d Got %d", IRQ_CODE[i], irq_id);
      };
      printf("\n\n");

      i=i+1;
    };


    // Random test with masking
    
    //// uint32_t random_ie_word;
    //// uint32_t random_irq_code;
    //// uint32_t random_ie_num;
    //// 
    //// i = 0;
    //// //TODO finish this
    //// while(i < 10)
    //// {
    //// 
    ////   irq_processed = 1;
    ////   irq_id = 0;
    ////   random_ie_word = 0;
    ////   random_irq_code = 0;
    ////   
    ////   // build ie word randomly
    ////   random_ie_num = random_num(IRQ_NUM, 0);
    ////   
    ////   if(random_ie_num != 0)
    ////   {
    ////      while(random_ie_num > 0)
    ////      {
    ////         // generate one random irq code and add (OR) it with current ie value
    ////         random_ie_word |= (1 << IRQ_CODE[random_num(IRQ_NUM, 0)]) ;
    ////         --random_ie_num;
    ////      }
    ////   }
    ////   
    ////   // write the mask to mie
    ////   asm volatile("csrw 0x304, %[regVal]"
    ////               : : [regVal] "r" (random_ie_word));
    ////   
    ////   // evaluate random irq id
    ////   random_irq_code = IRQ_CODE[random_num(IRQ_NUM, 0)];
    ////   printf("irq id: %d\n", random_irq_code);
    ////   
    ////   writew(random_irq_code,0x16000038);
    ////   
    ////   // if the interrupt is enabled, we expect it to be served
    ////   if((1 << random_irq_code) & random_ie_word)
    ////   {
    ////     while(irq_processed)
    ////     {
    ////       printf("waiting \n");
    ////     };
    ////     
    ////     if(irq_id == random_irq_code)
    ////     {
    ////         printf("OK: correct id");
    ////     }
    ////     else 
    ////     {
    ////         printf("ERR: wrong id\n Expected %d Got %d", random_irq_code, irq_id);
    ////     }
    ////     printf("\n\n");
    ////   }
    ////   //TODO add masking detection 
    ////   else 
    ////   {
    ////     
    ////   }
    //// 
    ////   ++i;
    //// }


    //writew(2,0x1600002C);
    
    //writew(20,0x16000030);     
    
    // set hw timer = 3
    //writew(3,0x15000004);
    


    return EXIT_SUCCESS;
}





