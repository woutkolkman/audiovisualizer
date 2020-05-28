#define ADC_RECHTS			(volatile int *) 0x00042050
#define ADC_LINKS			(volatile int *) 0x00042060
#define ADC_DATA			(int *)			 0x00042040
#define TIMER_0				(volatile int *) 0x00042020

// includes
#include <stdio.h>
#include <stdlib.h>
#include "includes.h"
#include "altera_up_avalon_adc.h"
#include "altera_up_avalon_parallel_port.h"
#include "system.h"

// stacks
#define	TASK_STACKSIZE	2048

OS_STK	TaskStartStack[TASK_STACKSIZE];
OS_STK	TaskADCStack[TASK_STACKSIZE];

void TaskStart(void *pdata);
void TaskADC(void *pdata);

int main(void) {

	OSInit();
	OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
	OSStart();
	return 0;
}

void TaskStart(void *pdata) {

    OSTaskCreate(TaskADC, (void *) 0, &TaskADCStack[TASK_STACKSIZE - 1], 6); // create new task

    while (1) {

        OSTimeDly(1000);
    }
}


void TaskADC(void* pdata) {

	//	volatile int * adc = (int*)(ADC_ADDR);
	//	unsigned int data;
	//	int count;
	//	int channel;
	//	data = 0;
	//	count = 0;
	//	channel = 0;

	while (1) {

		OSTimeDlyHMSM(0,0,0,100);

		*ADC_DATA = 0x09;
//		*ADC_DATA |= 0x01;
		printf("ADC_DATA: %x \n", *ADC_DATA);

//		*ADC_DATA = 0x09;
		printf("%i - ", *ADC_RECHTS);
		printf("%i\n", *ADC_LINKS);
#if 0
		*(adc) = 0;
		count += 1;
		data = *(adc + channel);
		data = data / 16;
//		*(led) = data;
		printf("%d ", data);

		if (count == 12) {
			count = 0;
			channel = !channel;
			printf("\n");
		}
#endif
	}
}
