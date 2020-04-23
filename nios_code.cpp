#include <FreeRTOS.h>
//#include <Arduino_FreeRTOS.h>
//#include <event_groups.h>
//#include <semphr.h>
//#include <queue.h>

// poorten, te vinden in nios_processor.qsys
#define adc 				(volatile int *) 0x00009000
#define bel_fft_project				 (int *) 0x00008000

// stack sizes
#define STCK_SIZE_TASK1 64

// function prototypes
void init();

int main()
{
	init();
	
	xTaskCreate(Task1, "Tsk1", STCK_SIZE_TASK1, NULL, 3, NULL);
	
	vTaskStartScheduler();
	return(0); // never reached
}

void Task1(void *pvParameters) {
	EventBits_t getEvents;
	
	for (;;) {
		
	}
}

void init() {
	// ddrd etc
}

void loop() {} // nodig?
