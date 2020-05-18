// base addressen, te vinden in nios_processor.qsys
//#define ADC 				(volatile int *) 0x00042040
//#define BEL_FFT_PROJECT				 (int *) 0x01005000
//#define TIMER_0				(volatile int *) 0x00042020
#define ADC 				ADC_0_BASE
#define BEL_FFT_PROJECT		BEL_FFT_PROJECT_0_BASE
#define TIMER_0				TIMER_0_BASE
#define ADC_ADDR 			ADC				/* Replace these addresses with the base addresses of the ADC and LEDs in your Platform Designer project */

// switches
#define PRINT_FFT 	// print de output van het FFT-component
#define PRINT_FREQ 	// print de ouput van de frequency separator

// includes
#include <stdio.h> 								// voor printf, kijken of je deze kan vervangen, is veel geheugen nodig
//#include <stdlib.h> 							// voor delay(), mag later weg
#include "includes.h" 							// ucosii
#include "altera_up_avalon_adc.h" 				// voor adc?
//#include "altera_up_avalon_parallel_port.h"
#include "system.h"
#include "kiss_fft.h" 							// API voor FFT

// stacks
#define	TASK_STACKSIZE	2048

OS_STK	TaskStartStack[TASK_STACKSIZE];
OS_STK	TaskADCToFFTStack[TASK_STACKSIZE];
OS_STK	TaskFFTStack[TASK_STACKSIZE];
OS_STK	TaskFrequencySeparatorStack[TASK_STACKSIZE];

// tasks
void TaskStart(void *pdata);
void TaskADCToFFT(void *pdata);
void TaskFFT(void *pdata);
void TaskFrequencySeparator(void *pdata);

// function prototypes
int Bel_FFT_Init(void);

// variables
// ...

// FFT dingen
//
// =========================================================================================
//
#define MAXFACTORS 32 // e.g. an fft of length 128 has 4 factors as far as kissfft is concerned 4*4*4*2
#define FFT_LEN 256 // vervangen door de bus (?) waarde van onze configuratie TODO
#define FFT_BASE BEL_FFT_PROJECT

struct ControlReg { // Control register
	// Starts the FFT
	int Start: 1;
	int reserved1: 7;
	// Enables the interrupt
	int Inten: 1;
	int reserved2: 7;
	// Normal or inverse FFT
	int Inv: 1;
	int reserved3: 15;
};

struct StatusReg { // Status register
	// Indicates that the FFT is running.
	int Running: 1;
	// Overflow flag
	int Ov: 1;
	// Interrupt flag. This flag is cleared after reading.
	int Int: 1;
	// Error flag. This flag indicates that an error occured while the FFT was accessing the bus. This flag is cleared after reading.
	int Err: 1;
	int reserved1: 28;
};

struct NReg { // FFT size register
	// Size of the FFT
	int N: 16;
	int reserved1: 16;
};

struct FactorsReg { // FFT size register
	// Stage's FFT length/p
	int M: 16;
	// The radix
	int P: 16;
};

struct bel_fft { // Register structure, must be mapped to base address
	// Control register
	struct ControlReg Control;
	// Status register
	struct StatusReg Status;
	// FFT size register
	struct NReg N;
	// Source address register
	void * Finadr;
	// Destination address register
	void * Foutadr;
	// FFT factor registers
	struct FactorsReg Factors[MAXFACTORS];
};
//
// =========================================================================================
//

int main(void) {
	OSInit(); // initialize ucos-ii
	OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
	OSStart(); // start multitasking
	return 0; // never executed
}

void TaskStart(void *pdata) {
//	Bel_FFT_Init(); // wordt gedaan in TaskFFT (?)

//    OSTaskCreate(TaskADCToFFT, (void *) 0, &TaskADCToFFTStack[TASK_STACKSIZE - 1], 6); // create new task
    OSTaskCreate(TaskFFT, (void *) 0, &TaskFFTStack[TASK_STACKSIZE - 1], 6); // create new task

    while (1) {
        OSTimeDly(100);
    }
}

void TaskFFT(void* pdata) {
	kiss_fft_cfg cfg;
#if 0
	kiss_fft_cpx fin[FFT_LEN];
#else
	kiss_fft_cpx fin[FFT_LEN] = { // test input
	{0x00000000, 0x00000000}, {0x00002BD1, 0x00000000}, {0x000040E8, 0x00000000}, {0x000035CE, 0x00000000},
	{0x000013D4, 0x00000000}, {0xFFFFF18D, 0x00000000}, {0xFFFFE590, 0x00000000}, {0xFFFFF92F, 0x00000000},
	{0x000022F9, 0x00000000}, {0x00004C3D, 0x00000000}, {0x00005E4A, 0x00000000}, {0x00004FB5, 0x00000000},
	{0x000029DC, 0x00000000}, {0x00000361, 0x00000000}, {0xFFFFF2EC, 0x00000000}, {0x000001DE, 0x00000000},
	{0x000026DC, 0x00000000}, {0x00004B44, 0x00000000}, {0x00005878, 0x00000000}, {0x00004522, 0x00000000},
	{0x00001AAF, 0x00000000}, {0xFFFFEFD6, 0x00000000}, {0xFFFFDB4C, 0x00000000}, {0xFFFFE687, 0x00000000},
	{0x00000834, 0x00000000}, {0x000029C3, 0x00000000}, {0x0000349F, 0x00000000}, {0x00001F7A, 0x00000000},
	{0xFFFFF3CB, 0x00000000}, {0xFFFFC849, 0x00000000}, {0xFFFFB3B1, 0x00000000}, {0xFFFFBF74, 0x00000000},
	{0xFFFFE242, 0x00000000}, {0x00000582, 0x00000000}, {0x0000129B, 0x00000000}, {0x00000037, 0x00000000},
	{0xFFFFD7C0, 0x00000000}, {0xFFFFAFE4, 0x00000000}, {0xFFFF9F4D, 0x00000000}, {0xFFFFAF62, 0x00000000},
	{0xFFFFD6BF, 0x00000000}, {0xFFFFFEBB, 0x00000000}, {0x000010A9, 0x00000000}, {0x00000322, 0x00000000},
	{0xFFFFDF7D, 0x00000000}, {0xFFFFBC54, 0x00000000}, {0xFFFFB042, 0x00000000}, {0xFFFFC499, 0x00000000},
	{0xFFFFEFE8, 0x00000000}, {0x00001B73, 0x00000000}, {0x00003084, 0x00000000}, {0x000025A3, 0x00000000},
	{0x0000041F, 0x00000000}, {0xFFFFE28C, 0x00000000}, {0xFFFFD77C, 0x00000000}, {0xFFFFEC3E, 0x00000000},
	{0x0000175E, 0x00000000}, {0x00004224, 0x00000000}, {0x000055DA, 0x00000000}, {0x0000490F, 0x00000000},
	{0x00002518, 0x00000000}, {0x00000092, 0x00000000}, {0xFFFFF21E, 0x00000000}, {0x00000313, 0x00000000},
	{0x00002A0F, 0x00000000}, {0x0000506A, 0x00000000}, {0x00005F7D, 0x00000000}, {0x00004DE9, 0x00000000},
	{0x00002518, 0x00000000}, {0xFFFFFBB9, 0x00000000}, {0xFFFFE87B, 0x00000000}, {0xFFFFF4CE, 0x00000000},
	{0x0000175E, 0x00000000}, {0x00003994, 0x00000000}, {0x000044DB, 0x00000000}, {0x00002FE2, 0x00000000},
	{0x0000041F, 0x00000000}, {0xFFFFD84D, 0x00000000}, {0xFFFFC325, 0x00000000}, {0xFFFFCE1D, 0x00000000},
	{0xFFFFEFE8, 0x00000000}, {0x000011EF, 0x00000000}, {0x00001DA1, 0x00000000}, {0x000009AA, 0x00000000},
	{0xFFFFDF7D, 0x00000000}, {0xFFFFB5CC, 0x00000000}, {0xFFFFA34A, 0x00000000}, {0xFFFFB164, 0x00000000},
	{0xFFFFD6BF, 0x00000000}, {0xFFFFFCB9, 0x00000000}, {0x00000CAC, 0x00000000}, {0xFFFFFD3B, 0x00000000},
	{0xFFFFD7C0, 0x00000000}, {0xFFFFB2E1, 0x00000000}, {0xFFFFA53C, 0x00000000}, {0xFFFFB82C, 0x00000000},
	{0xFFFFE242, 0x00000000}, {0x00000CCA, 0x00000000}, {0x00002110, 0x00000000}, {0x0000159F, 0x00000000},
	{0xFFFFF3CB, 0x00000000}, {0xFFFFD224, 0x00000000}, {0xFFFFC740, 0x00000000}, {0xFFFFDC6D, 0x00000000},
	{0x00000834, 0x00000000}, {0x000033DD, 0x00000000}, {0x000048AB, 0x00000000}, {0x00003D2C, 0x00000000},
	{0x00001AAF, 0x00000000}, {0xFFFFF7CC, 0x00000000}, {0xFFFFEB19, 0x00000000}, {0xFFFFFDEE, 0x00000000},
	{0x000026DC, 0x00000000}, {0x00004F35, 0x00000000}, {0x0000604B, 0x00000000}, {0x000050B8, 0x00000000},
	{0x000029DC, 0x00000000}, {0x0000025E, 0x00000000}, {0xFFFFF0EB, 0x00000000}, {0xFFFFFEE7, 0x00000000},
	{0x000022F9, 0x00000000}, {0x00004685, 0x00000000}, {0x000052EF, 0x00000000}, {0x00003EE3, 0x00000000},
	{0x000013D4, 0x00000000}, {0xFFFFE878, 0x00000000}, {0xFFFFD389, 0x00000000}, {0xFFFFDE7B, 0x00000000},
	{0x00000000, 0x00000000}, {0x00002185, 0x00000000}, {0x00002C77, 0x00000000}, {0x00001788, 0x00000000},
	{0xFFFFEC2C, 0x00000000}, {0xFFFFC11D, 0x00000000}, {0xFFFFAD11, 0x00000000}, {0xFFFFB97B, 0x00000000},
	{0xFFFFDD07, 0x00000000}, {0x00000119, 0x00000000}, {0x00000F15, 0x00000000}, {0xFFFFFDA2, 0x00000000},
	{0xFFFFD624, 0x00000000}, {0xFFFFAF48, 0x00000000}, {0xFFFF9FB5, 0x00000000}, {0xFFFFB0CB, 0x00000000},
	{0xFFFFD924, 0x00000000}, {0x00000212, 0x00000000}, {0x000014E7, 0x00000000}, {0x00000834, 0x00000000},
	{0xFFFFE551, 0x00000000}, {0xFFFFC2D4, 0x00000000}, {0xFFFFB755, 0x00000000}, {0xFFFFCC23, 0x00000000},
	{0xFFFFF7CC, 0x00000000}, {0x00002393, 0x00000000}, {0x000038C0, 0x00000000}, {0x00002DDC, 0x00000000},
	{0x00000C35, 0x00000000}, {0xFFFFEA61, 0x00000000}, {0xFFFFDEF0, 0x00000000}, {0xFFFFF336, 0x00000000},
	{0x00001DBE, 0x00000000}, {0x000047D4, 0x00000000}, {0x00005AC4, 0x00000000}, {0x00004D1F, 0x00000000},
	{0x00002840, 0x00000000}, {0x000002C5, 0x00000000}, {0xFFFFF354, 0x00000000}, {0x00000347, 0x00000000},
	{0x00002941, 0x00000000}, {0x00004E9C, 0x00000000}, {0x00005CB6, 0x00000000}, {0x00004A34, 0x00000000},
	{0x00002083, 0x00000000}, {0xFFFFF656, 0x00000000}, {0xFFFFE25F, 0x00000000}, {0xFFFFEE11, 0x00000000},
	{0x00001018, 0x00000000}, {0x000031E3, 0x00000000}, {0x00003CDB, 0x00000000}, {0x000027B3, 0x00000000},
	{0xFFFFFBE1, 0x00000000}, {0xFFFFD01E, 0x00000000}, {0xFFFFBB25, 0x00000000}, {0xFFFFC66C, 0x00000000},
	{0xFFFFE8A2, 0x00000000}, {0x00000B32, 0x00000000}, {0x00001785, 0x00000000}, {0x00000447, 0x00000000},
	{0xFFFFDAE8, 0x00000000}, {0xFFFFB217, 0x00000000}, {0xFFFFA083, 0x00000000}, {0xFFFFAF96, 0x00000000},
	{0xFFFFD5F0, 0x00000000}, {0xFFFFFCED, 0x00000000}, {0x00000DE2, 0x00000000}, {0xFFFFFF6E, 0x00000000},
	{0xFFFFDAE8, 0x00000000}, {0xFFFFB6F1, 0x00000000}, {0xFFFFAA26, 0x00000000}, {0xFFFFBDDC, 0x00000000},
	{0xFFFFE8A2, 0x00000000}, {0x000013C2, 0x00000000}, {0x00002884, 0x00000000}, {0x00001D74, 0x00000000},
	{0xFFFFFBE1, 0x00000000}, {0xFFFFDA5D, 0x00000000}, {0xFFFFCF7C, 0x00000000}, {0xFFFFE48D, 0x00000000},
	{0x00001018, 0x00000000}, {0x00003B67, 0x00000000}, {0x00004FBE, 0x00000000}, {0x000043AC, 0x00000000},
	{0x00002083, 0x00000000}, {0xFFFFFCDE, 0x00000000}, {0xFFFFEF57, 0x00000000}, {0x00000145, 0x00000000},
	{0x00002941, 0x00000000}, {0x0000509E, 0x00000000}, {0x000060B3, 0x00000000}, {0x0000501C, 0x00000000},
	{0x00002840, 0x00000000}, {0xFFFFFFC9, 0x00000000}, {0xFFFFED65, 0x00000000}, {0xFFFFFA7E, 0x00000000},
	{0x00001DBE, 0x00000000}, {0x0000408C, 0x00000000}, {0x00004C4F, 0x00000000}, {0x000037B7, 0x00000000},
	{0x00000C35, 0x00000000}, {0xFFFFE086, 0x00000000}, {0xFFFFCB61, 0x00000000}, {0xFFFFD63D, 0x00000000},
	{0xFFFFF7CC, 0x00000000}, {0x00001979, 0x00000000}, {0x000024B4, 0x00000000}, {0x0000102A, 0x00000000},
	{0xFFFFE551, 0x00000000}, {0xFFFFBADE, 0x00000000}, {0xFFFFA788, 0x00000000}, {0xFFFFB4BC, 0x00000000},
	{0xFFFFD924, 0x00000000}, {0xFFFFFE22, 0x00000000}, {0x00000D14, 0x00000000}, {0xFFFFFC9F, 0x00000000},
	{0xFFFFD624, 0x00000000}, {0xFFFFB04B, 0x00000000}, {0xFFFFA1B6, 0x00000000}, {0xFFFFB3C3, 0x00000000},
	{0xFFFFDD07, 0x00000000}, {0x000006D1, 0x00000000}, {0x00001A70, 0x00000000}, {0x00000E73, 0x00000000},
	{0xFFFFEC2C, 0x00000000}, {0xFFFFCA32, 0x00000000}, {0xFFFFBF18, 0x00000000}, {0xFFFFD42F, 0x00000000}};
#endif
	volatile kiss_fft_cpx fout[FFT_LEN];
	int i;

	/*
	 * Initialize the destination memory area to see that the FFT has actually calculated something.
	 */
	for (i = 0; i < FFT_LEN; i++) {
	    fout[i].i = 0xDEADDEAD;
	    fout[i].r = 0xDEADDEAD;
	}

	cfg = kiss_fft_alloc (FFT_LEN, 0, NULL, 0);
	if (! cfg) {
		printf ("Error: Cannot allocate memory for FFT control structure.\n");
	    return;
	}

	kiss_fft (cfg, fin, fout); // startup

#ifdef PRINT_FFT
	// Print out the FFT result.
	for (i = 0; i < FFT_LEN; i++) {
		printf ("%X - %X\n", (int) fout[i].r, (int) fout[i].i); // uitlezen real - imaginary (met pythagoras?)
	}
#endif

	while (1) {

	}
}

void TaskADCToFFT(void* pdata) {
	volatile int * adc = (int*)(ADC_ADDR);
//	volatile int * led = (int*)(LED_ADDR);
	unsigned int data;
	int count;
	int channel;
	data = 0;
	count = 0;
	channel = 0;

	while (1) {
//		printf("y"); // debug
		OSTimeDlyHMSM(0,0,0,100);
#if 1
		*(adc) = 0; //Start the ADC read
		count += 1;
		data = *(adc+channel); //Get the value of the selected channel
		data = data/16; //Ignore the lowest 4 bits (origineel 12 bits)
//		*(led) = data; //Display the value on the LEDs // later: verstuur data naar fft
		printf("%d ", data);
		if (count==12){
			count = 0;
			channel = !channel;
			printf("\n");
		}
#endif
	}
}

int Bel_FFT_Init(void) {
	// FFT_BASE is the base address of the FFT co-processor. Set bit 31 to bypass the cache on the NIOSII.

	volatile struct bel_fft * belFftPtr = (struct bel_fft *) (FFT_BASE + 0x80000000);

	int fin[FFT_LEN * 2] = {
		0x00000000, 0x00000000, 0x00002BD1, 0x00000000,
		0x000040E8, 0x00000000, 0x000035CE, 0x00000000 // ...
	};

	int fout[FFT_LEN * 2];

	belFftPtr->Finadr = fin;

	belFftPtr->Foutadr = fout;

	belFftPtr->Factors[0].M = 64;	// geen idee
	belFftPtr->Factors[0].P = 4;	// geen idee
	belFftPtr->Factors[1].M = 16;	// geen idee
	belFftPtr->Factors[1].P = 4;	// geen idee
	belFftPtr->Factors[2].M = 4;	// geen idee
	belFftPtr->Factors[2].P = 4;	// geen idee
	belFftPtr->Factors[3].M = 1;	// geen idee
	belFftPtr->Factors[3].P = 4;	// geen idee

	belFftPtr->Control.Start = 1;

#if 0
	while (! cfg->belFftPtr->Status.Int) {} // wacht totdat FFT is gestart?
#else
	for (int c=1; c<=32767; c++) // korte delay
		for (int d=1; d<=32767; d++) {}
#endif
	return 0;
}


// originele code, gebruikt voor snippets, mag weggehaald worden
/*
#include <stdio.h>
#include "includes.h"

// Definition of Task Stacks
#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    task2_stk[TASK_STACKSIZE];

// Definition of Task Priorities

#define TASK1_PRIORITY      1
#define TASK2_PRIORITY      2

// Prints "Hello World" and sleeps for three seconds
void task1(void* pdata)
{
  while (1)
  { 
    printf("Hello from task1\n");
    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}
// Prints "Hello World" and sleeps for three seconds
void task2(void* pdata)
{
  while (1)
  { 
    printf("Hello from task2\n");
    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}
// The main function creates two task and starts multi-tasking
int main(void)
{
  
  OSTaskCreateExt(task1,
                  NULL,
                  (void *)&task1_stk[TASK_STACKSIZE-1],
                  TASK1_PRIORITY,
                  TASK1_PRIORITY,
                  task1_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
              
               
  OSTaskCreateExt(task2,
                  NULL,
                  (void *)&task2_stk[TASK_STACKSIZE-1],
                  TASK2_PRIORITY,
                  TASK2_PRIORITY,
                  task2_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
  OSStart();
  return 0;
}
*/