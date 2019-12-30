#include <stdio.h>
#include <stdlib.h>
#include <time.h>


#include "firmware.h"
#include "irq_test_lib.h"

#define ERR_CODE_WRONG_ORDER 2
#define ERR_CODE_WRONG_NUM   3

#define OUTPORT 0x10000000

#define RND_STALL_REG_10       0x16000028 // irq_mode
#define RND_STALL_REG_11       0x1600002C // irq_min_cycles
#define RND_STALL_REG_12       0x16000030 // irq_max_cycles
#define RND_STALL_REG_13       0x16000034 // irq_pc_trig
#define RND_STALL_REG_14       0x16000038 // irq_sd_lines

#define IRQ_MODE_RND     2
#define IRQ_MODE_PC_TRIG 3
#define IRQ_MODE_SD      4

#define MSTATUS_MIE_BIT 3

#define IRQ_NUM 19
#define SOFTWARE_IRQ_ID  3
#define TIMER_IRQ_ID     7
#define EXTERNAL_IRQ_ID  11
#define FAST0_IRQ_ID     16
#define FAST1_IRQ_ID     17
#define FAST2_IRQ_ID     18
#define FAST3_IRQ_ID     19
#define FAST4_IRQ_ID     20
#define FAST5_IRQ_ID     21
#define FAST6_IRQ_ID     22
#define FAST7_IRQ_ID     23
#define FAST8_IRQ_ID     24
#define FAST9_IRQ_ID     25
#define FAST10_IRQ_ID    26
#define FAST11_IRQ_ID    27
#define FAST12_IRQ_ID    28
#define FAST13_IRQ_ID    29
#define FAST14_IRQ_ID    30
#define NMI_IRQ_ID       31

#define RND_IRQ_NUM        8
#define RND_IE_NUM         13
#define RND_IRQ_MIN_CYCLES 4096
#define RND_IRQ_MAX_CYCLES 4096

#define MAT_DIM          4

volatile uint32_t irq_processed     = 1;
volatile uint32_t irq_id            = 0;
volatile uint32_t irq_pending       = 0;
volatile uint32_t prev_irq_pending  = 0;
volatile uint32_t first_irq_pending = 0;
volatile uint32_t rnd_ie_mask       = 0;
volatile uint32_t mmstatus          = 0;

uint32_t IRQ_ID_PRIORITY [IRQ_NUM] = 
{ 
  NMI_IRQ_ID      ,  // 0
  FAST14_IRQ_ID   ,  // 1
  FAST13_IRQ_ID   ,  // 2
  FAST12_IRQ_ID   ,  // 3
  FAST11_IRQ_ID   ,  // 4
  FAST10_IRQ_ID   ,  // 5
  FAST9_IRQ_ID    ,  // 6
  FAST8_IRQ_ID    ,  // 7
  FAST7_IRQ_ID    ,  // 8
  FAST6_IRQ_ID    ,  // 9
  FAST5_IRQ_ID    ,  // 10
  FAST4_IRQ_ID    ,  // 11 
  FAST3_IRQ_ID    ,  // 12 
  FAST2_IRQ_ID    ,  // 13
  FAST1_IRQ_ID    ,  // 14 
  FAST0_IRQ_ID    ,  // 15 
  EXTERNAL_IRQ_ID ,  // 16
  SOFTWARE_IRQ_ID ,  // 17
  TIMER_IRQ_ID       // 18
};


uint32_t res[MAT_DIM][MAT_DIM];
uint32_t mat1[MAT_DIM][MAT_DIM] = {{1, 1, 1, 1}, 
                              {2, 2, 2, 2}, 
                              {3, 3, 3, 3}, 
                              {4, 4, 4, 4}}; 
  
uint32_t mat2[MAT_DIM][MAT_DIM] = {{1, 1, 1, 1}, 
                              {2, 2, 2, 2}, 
                              {3, 3, 3, 3}, 
                              {4, 4, 4, 4}}; 

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

#define FAST_IRQ_GENERIC(id)                                                 \
do {                                                                         \
    irq_id = id;                                                             \
    irq_pending &= (~(1 << irq_id));                                         \
    writew(irq_pending, RND_STALL_REG_14);                                   \
    asm volatile("csrr %0, mstatus": "=r" (mmstatus));                       \
    mmstatus &= (~(1 << 7));                                                 \
    asm volatile("csrw mstatus, %[mmstatus]" : : [mmstatus] "r" (mmstatus)); \
    printf("IRQ SERVED: irq_ id = %d \n", irq_id);                           \
} while(0)

void software_irq_handler(void)
{
    FAST_IRQ_GENERIC(SOFTWARE_IRQ_ID);
}

void timer_irq_handler(void) //TODO: do this here
{
    FAST_IRQ_GENERIC(TIMER_IRQ_ID);
}

void external_irq_handler(void)
{
    FAST_IRQ_GENERIC(EXTERNAL_IRQ_ID);
}

void fast0_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST0_IRQ_ID);
}

void fast1_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST1_IRQ_ID);
}

void fast2_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST2_IRQ_ID);
}

void fast3_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST3_IRQ_ID);
}

void fast4_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST4_IRQ_ID);
}

void fast5_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST5_IRQ_ID);
}

void fast6_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST6_IRQ_ID);
}

void fast7_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST7_IRQ_ID);
}

void fast8_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST8_IRQ_ID);
}

void fast9_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST9_IRQ_ID);
}

void fast10_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST10_IRQ_ID);
}

void fast11_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST11_IRQ_ID);
}

void fast12_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST12_IRQ_ID);
}

void fast13_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST13_IRQ_ID);
}

void fast14_irq_handler(void)
{
    FAST_IRQ_GENERIC(FAST14_IRQ_ID);
}

void nmi_irq_handler(void)
{
    FAST_IRQ_GENERIC(NMI_IRQ_ID);
}

uint32_t random_num(uint32_t upper_bound, uint32_t lower_bound) 
{ 
    uint32_t num = (rand() % (upper_bound - lower_bound + 1)) + lower_bound;
    return num;
} 
void mstatus_enable(uint32_t bit_enabled)
{
    asm volatile("csrr %0, mstatus": "=r" (mmstatus));                       
    mmstatus |= (1 << bit_enabled);                                                 
    asm volatile("csrw mstatus, %[mmstatus]" : : [mmstatus] "r" (mmstatus));    
}

void mstatus_disable(uint32_t bit_disabled)
{
    asm volatile("csrr %0, mstatus": "=r" (mmstatus));                       
    mmstatus &= (~(1 << bit_disabled));                                                 
    asm volatile("csrw mstatus, %[mmstatus]" : : [mmstatus] "r" (mmstatus));    
}

// integer matrix multiplication
void mat_mult(uint32_t mat1[MAT_DIM][MAT_DIM], uint32_t mat2[MAT_DIM][MAT_DIM], uint32_t res[MAT_DIM][MAT_DIM])
{ 
    uint32_t i, j, k; 
    for (i = 0; i < MAT_DIM; i++) 
    {
        for (j = 0; j < MAT_DIM; j++) 
        {
            res[i][j] = 0;
            for (k = 0; k < MAT_DIM; k++)
                res[i][j] += mat1[i][k] *
                             mat2[k][j];
        }
    }
}

int main(int argc, char *argv[])
{

    // Use current time as  
    // seed for random generator 

    printf("TEST 1\n");
    srand(time(0)); 

    uint32_t regVal;
    volatile uint32_t* baseAddr;

    // enable mstatus.mie  
    mstatus_enable(MSTATUS_MIE_BIT);

    // Enable all mie (need to store) 
    regVal = 0xFFFFFFFF;
    asm volatile("csrw 0x304, %[regVal]"
                  : : [regVal] "r" (regVal));
    
    // set timer_irq_mask_q[TIMER_IRQ_ID] = 1
     writew(128,0x15000000);


    // software defined irq gen mode
    writew(4,0x16000028);

    // Sequential test (no masking)
    
    // disable mstatues.mie
    mstatus_disable(MSTATUS_MIE_BIT); 


    for (int i = 0; i < IRQ_NUM; i++)
    {      
        // add new pending irq
        irq_pending |= (1 << IRQ_ID_PRIORITY[i]);
        prev_irq_pending = irq_pending;

        writew(irq_pending, RND_STALL_REG_14);

        // enable mstatus.mie
        mstatus_enable(MSTATUS_MIE_BIT);

        // wait for the irq to be served
        while(prev_irq_pending == irq_pending);

        // irq_id sampling and testing
        if(IRQ_ID_PRIORITY[i] != irq_id)
        {
            printf("TEST1: IRQ served in wrong order %d %d\n", IRQ_ID_PRIORITY[i], irq_id);
            return -1;
        }
    };
    // TODO: needs to make sure preivous test finished

    printf("TEST 2: TRIGGER ALL IRQS AT ONCE\n");
    // Multiple interrupts at a time
    irq_pending |= 0xFFFFFFFF;

    // disable mstatues.mie
    mstatus_disable(MSTATUS_MIE_BIT);

    writew(irq_pending, RND_STALL_REG_14);

    for (int i = 0; i < IRQ_NUM; i++) 
    {
        // sample irq_pending
        prev_irq_pending=irq_pending;
        
        // enable mstatus.mie
        mstatus_enable(MSTATUS_MIE_BIT); 

        // wait for nex irq to be served
        while(prev_irq_pending==irq_pending);

        // irq_id sampling and testing
        if(IRQ_ID_PRIORITY[i] != irq_id)
        {
            printf("TEST2: IRQ served in wrong order %d %d\n", IRQ_ID_PRIORITY[i], irq_id);
            return ERR_CODE_WRONG_ORDER;
        }
    }


    printf("STARTING TEST 3: RANDOMIZE \n"); //TODO: improve messages
    
    ///////////////////////////////
    // Random test with masking  //
    ///////////////////////////////
    
    // Test 3 is a random test where two 32 bit-wide 
    // words are generated:
    // - a mask (rnd_ie_mask)
    // - and a value for the irq_pending
    //
    //
    
    
    irq_processed = 1;
    irq_id        = 0;
    rnd_ie_mask   = 0;
    irq_pending   = 0;

    // build ie word randomly
    for (int i = 0; i < RND_IE_NUM; ++i)
    {
        rnd_ie_mask |= (1 << IRQ_ID_PRIORITY[random_num(IRQ_NUM, 0)]) ;
    }

      
    // write the mask to mie
    asm volatile("csrw 0x304, %[rnd_ie_mask]" : : [rnd_ie_mask] "r" (rnd_ie_mask));
      
    // build irq word randomly
    for (int i = 0; i < RND_IRQ_NUM; ++i)
    {
        irq_pending |= (1 << IRQ_ID_PRIORITY[random_num(IRQ_NUM, 0)]) ;
    }
    
    first_irq_pending = irq_pending;
    
    // disable mstatues.mie
    mstatus_disable(MSTATUS_MIE_BIT);

    writew(irq_pending, RND_STALL_REG_14);

    for (int i = 0; i < IRQ_NUM; ++i)
    {
        // test if the nmi irq should be served
        if(i==0 && ((1 << IRQ_ID_PRIORITY[0]) & irq_pending))
        {
            // sample irq_pending
            prev_irq_pending=irq_pending;
            printf("received irq %d\n", irq_id);

            // enable mstatus.mie
            mstatus_enable(MSTATUS_MIE_BIT);

            // wait for next irq to be served
            while(prev_irq_pending==irq_pending);

            // irq_id sampling and testing
            if(IRQ_ID_PRIORITY[i] != irq_id)
            {
                printf("TEST3: IRQ served in wrong order %d %d\n", IRQ_ID_PRIORITY[i], irq_id);
                return ERR_CODE_WRONG_NUM;
            }
        }

        // test if the i-th irq should be served
        else if ( i !=0 && ((1 << IRQ_ID_PRIORITY[i]) & rnd_ie_mask & irq_pending))
        {
            // sample irq_pending
            prev_irq_pending=irq_pending;

            // enable mstatus.mie
            mstatus_enable(MSTATUS_MIE_BIT);

            // wait for next irq to be served
            while(prev_irq_pending==irq_pending);

            // irq_id sampling and testing
            if(IRQ_ID_PRIORITY[i] != irq_id)
            {
                printf("TEST3: IRQ served in wrong order %d %d\n", IRQ_ID_PRIORITY[i], irq_id);
                return ERR_CODE_WRONG_NUM;
            }
        }
    }

    if(irq_pending != ((~rnd_ie_mask) & first_irq_pending))
    {
        printf("TEST3: wrong number of irq served\n first_irq_pending: %u irq_pending: %u rnd_ie_mask: %u\n", first_irq_pending, irq_pending, rnd_ie_mask);
        return ERR_CODE_WRONG_NUM;
    }


    // writew(2,0x1600002C);
    
    //writew(20,0x16000030);     
    
    // set hw timer = 3
    //writew(3,0x15000004);
    



    
    ///////////////////////////////
    // TEST 4: PC Trig Test      //
    ///////////////////////////////
    
    // Test 4: a software interrupt (id = 3) is raised  
    // as the program counter assumes a desired value


    printf("\nTEST 4: PC TRIG\n");

    // Enable all mie (need to store) 
    regVal = 0xFFFFFFFF;
    asm volatile("csrw 0x304, %[regVal]"
                  : : [regVal] "r" (regVal));

    // set desired PC value
    writew(0x0000043e, RND_STALL_REG_13);
    // switch to PC_TRIG mode
    writew(IRQ_MODE_PC_TRIG, RND_STALL_REG_10);
    
    mstatus_enable(MSTATUS_MIE_BIT);

    mat_mult(mat1, mat2, res);

    printf("\nResult matrix is\n"); 
    for (int i = 0; i < MAT_DIM; i++) 
    { 
        // mstatus_enable(MSTATUS_MIE_BIT);
        for (int j = 0; j < MAT_DIM; j++)
        {
            print_dec(res[i][j]);
            mstatus_enable(MSTATUS_MIE_BIT);
            print_chr(' ');
        } 
        printf("\n"); 
    } 

    /////////////////////////////////
    // TEST 5: Random IRQs bombing //
    /////////////////////////////////
    
    // Test 5: random irqs arrive randomly 
    // while the core is executing some task (e.g. matrix mult)

    printf("\nTEST 5: Random IRQs Bombing\n");


    // Enable all mie (need to store) 
    regVal = 0xFFFFFFFF;
    asm volatile("csrw 0x304, %[regVal]"
                  : : [regVal] "r" (regVal));

    writew(RND_IRQ_MIN_CYCLES, RND_STALL_REG_11);

    writew(RND_IRQ_MAX_CYCLES, RND_STALL_REG_12);

    // software defined irq gen mode
    writew(IRQ_MODE_RND, RND_STALL_REG_10);

    for(int i = 0; i< IRQ_NUM; i++)
    {
        mstatus_enable(MSTATUS_MIE_BIT);
    };

    return EXIT_SUCCESS;
}





