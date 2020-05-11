// base addressen, te vinden in nios_processor.qsys
#define ADC 				(volatile int *) 0x00022040
#define BEL_FFT_PROJECT				 (int *) 0x00020000

// includes
#include <stdio.h>
//#include <stdlib.h> // voor delay(), mag later weg
#include "includes.h"

// stacks
#define	TASK_STACKSIZE	2048

OS_STK	TaskStartStack[TASK_STACKSIZE];
OS_STK	TaskADCToFFTStack[TASK_STACKSIZE];

// tasks
void TaskStart(void *pdata);
void TaskADCToFFT(void *pdata);

// function prototypes
int Bel_FFT_Init(void);

// variables
int ADC_value;

// FFT dingen
//
// =========================================================================================
//
#define MAXFACTORS 32 // e.g. an fft of length 128 has 4 factors as far as kissfft is concerned 4*4*4*2
#define FFT_LEN 256
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
	Bel_FFT_Init();

	OSInit(); // initialize ucos-ii
	OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
	OSStart(); // start multitasking
	return 0; // never executed
}

void TaskStart(void *pdata) {
    OSTaskCreate(TaskADCToFFT, (void *) 0, &TaskADCToFFTStack[TASK_STACKSIZE - 1], 6); // create new task

    while (1) {
        OSTimeDly(10000);
    }
}

void TaskADCToFFT(void* pdata) {
	while (1) {
		//ADC_value = *ADC;
		//*BEL_FFT_PROJECT = ADC_value;
		OSTimeDlyHMSM(0,0,1,0);
		printf("y");
	}
}

int Bel_FFT_Init(void) {
	// FFT_BASE is the base address of the FFT co-processor. Set bit 31 to bypass the cache on the NIOSII.
	volatile struct bel_fft * belFftPtr = (struct bel_fft *) (FFT_BASE + 0x80000000);

	int fin[FFT_LEN * 2] = {
		0x00000000, 0x00000000, 0x00002BD1, 0x00000000,
		0x000040E8, 0x00000000, 0x000035CE, 0x00000000
	};

	int fout[FFT_LEN * 2];

	belFftPtr->Finadr = fin;

	belFftPtr->Foutadr = fout;

	belFftPtr->Factors[0].M = 64;
	belFftPtr->Factors[0].P = 4;
	belFftPtr->Factors[1].M = 16;
	belFftPtr->Factors[1].P = 4;
	belFftPtr->Factors[2].M = 4;
	belFftPtr->Factors[2].P = 4;
	belFftPtr->Factors[3].M = 1;
	belFftPtr->Factors[3].P = 4;

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
