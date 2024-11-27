//#include "stddefs.h"
#include <stdint.h>
#include <stdio.h>
#include <math.h>

//embench related
#include "support.h"
#include "beebsc.c"
#include "beebsc.h"
#define CPU_MHZ 1


//#include "md5.c"
//#include "crc_32.c"
//#include "libwikisort.c"
#include "matmult-int.c"
//#include "mont64.c"
//#include "nettle-aes.c"
//#include "nettle-sha256.c"
//#include "libedn.c"
//#include "md5.c"
//#include "libhuffbench.c"



int main() {
volatile int result;

//initialising benchmark
initialise_benchmark();
unsigned long cycles_start,cycles_end;

//counter to start measuring cycles
asm volatile ("rdcycle %0" : "=r" (cycles_start));
result=benchmark(); //benchmark
asm volatile ("rdcycle %0" : "=r" (cycles_end)); 

//printing the clock cycles spent
printf("Total cycles:%d\n",cycles_end-cycles_start);
return 0;
}

