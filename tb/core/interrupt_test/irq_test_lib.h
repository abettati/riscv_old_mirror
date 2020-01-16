// IRQ HANDLERS
// adding the attribute interrupt is telling GCC to execute the mret instruction

#define MAT_DIM          4

uint32_t res[MAT_DIM][MAT_DIM];
uint32_t mat1[MAT_DIM][MAT_DIM] = {{1, 1, 1, 1}, 
                                   {2, 2, 2, 2}, 
                                   {3, 3, 3, 3}, 
                                   {4, 4, 4, 4}}; 
  
uint32_t mat2[MAT_DIM][MAT_DIM] = {{1, 1, 1, 1}, 
                              	   {2, 2, 2, 2}, 
                              	   {3, 3, 3, 3}, 
                              	   {4, 4, 4, 4}};

uint32_t res_expected[MAT_DIM][MAT_DIM] = {{10, 10, 10, 10},
								           {20, 20, 20, 20},
								           {30, 30, 30, 30},
								           {40, 40, 40, 40}};