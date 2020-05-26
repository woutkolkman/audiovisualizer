// base addressen, te vinden in nios_processor.qsys
// #define ADC_ADDR			(volatile int *) 0x00042020
#define TIMER_0				(volatile int *) 0x00042040
#define AUDIO				(volatile int *) 0x00042070
#define AUDIO_VID_ADDR		(volatile int *) 0x00042060

#define BUFFER_SIZE 128

// includes
#include <stdio.h>
#include "includes.h"
#include "altera_up_avalon_adc.h"
#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include "system.h"

// stacks
#define	TASK_STACKSIZE	2048

OS_STK	TaskStartStack[TASK_STACKSIZE];
OS_STK  TaskReadAudioDataStack[TASK_STACKSIZE];

// tasks
void TaskStart(void *pdata);
void TaskReadAudioData(void *pdata);

int main(void) {

	OSInit(); // initialize ucos-ii
	OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
	OSStart(); // start multitasking
	return 0; // never executed
}

void TaskStart(void *pdata) {

    OSTaskCreate(TaskReadAudioData, (void *) 0, &TaskReadAudioDataStack[TASK_STACKSIZE - 1], 6); // create new task

    while (1) {

        OSTimeDly(100);
    }
}

void TaskReadAudioData(void *pdata) {

	alt_up_av_config_dev * audio_video_dev; // audio_video device
	audio_video_dev = alt_up_av_config_open_dev("/dev/audio_and_video_config_0"); // open audio_video device

	alt_up_audio_dev * audio_dev; // audio device
	audio_dev = alt_up_audio_open_dev ("/dev/audio_0"); // open audio device

	unsigned int l_buf[BUFFER_SIZE]; // left buffer
	unsigned int r_buf; // right buffer
	int buffer_size = 0;

	if (audio_video_dev == NULL)
		printf("audio_video_dev is not found.\n");
	else
		printf("audio_video_dev is opened.\n");


	if (!alt_up_av_config_read_ready(audio_video_dev))
		printf("audio_video_dev is not ready.\n");


	if (audio_dev == NULL)
		printf("Error: could not open audio device.\n");
	else
		printf("Opened audio device.\n");

	alt_up_audio_reset_audio_core(audio_dev); // configure audio chip
	alt_up_av_config_reset(audio_video_dev);

	// write registers to audio codec audio-chip (?)
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x0, 0x17);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x1, 0x17);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x2, 0x79);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x3, 0x79);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x4, 0x15);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x5, 0x06);
	alt_up_av_config_write_audio_cfg_register(audio_video_dev, 0x6, 0x00);

		while (1) {

			int fifospace = alt_up_audio_read_fifo_avail(audio_dev, ALT_UP_AUDIO_RIGHT);

			// check if there's data available
			if (fifospace < 0)
				printf("There is no data available.\n");

			// read audio buffer
			buffer_size = alt_up_audio_read_fifo(audio_dev, l_buf, BUFFER_SIZE,
												 ALT_UP_AUDIO_LEFT);

		    for (int i = 0; i < buffer_size; i++) {
				l_buf[i] = l_buf[i] + 0x7FFF;
			}

			// write data to left and right buffers
			alt_up_audio_write_fifo(audio_dev, l_buf, buffer_size, ALT_UP_AUDIO_RIGHT);
			alt_up_audio_write_fifo(audio_dev, l_buf, buffer_size, ALT_UP_AUDIO_LEFT);

			printf("%d \n", *l_buf);
			OSTimeDlyHMSM(0, 0, 1, 0);
	}
}
