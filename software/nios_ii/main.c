// includes
#include <stdio.h> 									// voor printf, kijken of je deze kan vervangen, is veel geheugen nodig
#include <math.h>
#include "includes.h" 								// ucosii
#include "altera_up_avalon_adc.h" 					// voor adc?
#include "system.h"
#include "kiss_fft.h" 								// API voor FFT
//#include "altera_up_avalon_parallel_port.h"

// base addressen, te vinden in nios_processor.qsys
#define FREQSEP_1			(int *) 0x00042090 /*vervang door FREQSEP_1_BASE*/		// uit system.h
#define FREQSEP_2			(int *) 0x00042080 /*vervang door FREQSEP_2_BASE*/		// uit system.h
#define ADC 				ADC_0_BASE				// uit system.h
#define BEL_FFT_PROJECT		BEL_FFT_PROJECT_0_BASE	// uit system.h
#define TIMER_0				TIMER_0_BASE			// uit system.h
#define ADC_ADDR 			ADC						/* Replace these addresses with the base addresses of the ADC and LEDs in your Platform Designer project */

// switches
//#define PRINT_FFT 									// print de output van het FFT-component
//#define PRINT_FREQ 									// print de ouput van de frequency separator
#define PRINT_FREQ_SCALED							// print de ouput van de frequency separator nadat het op schaal is gebracht
#define SCALE_MAX_RESETTEN							// de output constant op schaal brengen t.o.v. max per frame

// defines
#define	TASK_STACKSIZE	2048
#define AANTAL_OUTPUT_FREQSEP 8
#define FREQSEP_OUTPUT_SCALE 32						// maximale waarde per signaal, gaat samen met aantal bits per signaal en de pio

OS_STK	TaskStartStack[TASK_STACKSIZE];
OS_STK	TaskADCToFFTStack[TASK_STACKSIZE];
OS_STK	TaskFFTStack[TASK_STACKSIZE];
OS_STK	TaskFrequencySeparatorStack[TASK_STACKSIZE];

void TaskStart(void *pdata);
void TaskADCToFFT(void *pdata);
void TaskFFT(void *pdata);
void TaskFrequencySeparator(void *pdata);

OS_FLAG_GRP *flags;
OS_EVENT *sem_fftoutput;

#define FLAG_FFTOUTPUT 0x01
// #define FLAG_2 0x02
// #define FLAG_3 0x04
// #define FLAG_4 0x08
// #define FLAG_5 0x10
// #define FLAG_6 0x20
// #define FLAG_7 0x40

// function prototypes
int Bel_FFT_Init(void);
long map(long x, long in_min, long in_max, long out_min, long out_max);

// FFT dingen
// =========================================================================================
#define MAXFACTORS 32 				// e.g. an fft of length 128 has 4 factors as far as kissfft is concerned 4*4*4*2
#define FFT_LEN 256 				// vervangen door de bus (?) waarde van onze configuratie (gedaan, default (?))
#define FFT_BASE BEL_FFT_PROJECT

volatile kiss_fft_cpx fout[FFT_LEN]; // output array

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
// =========================================================================================

int main(void){
	INT8U err;

	OSInit(); // initialize ucos-ii

	sem_fftoutput = OSSemCreate(1);
	flags = OSFlagCreate(0x00, &err);

	OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
	OSStart(); // start multitasking
	return 0; // never executed
}

void TaskStart(void *pdata) {
//	Bel_FFT_Init(); // wordt gedaan in TaskFFT (?)

//    OSTaskCreate(TaskADCToFFT, (void *) 0, &TaskADCToFFTStack[TASK_STACKSIZE - 1], 5);
    OSTaskCreate(TaskFFT, (void *) 0, &TaskFFTStack[TASK_STACKSIZE - 1], 6);
    OSTaskCreate(TaskFrequencySeparator, (void *) 0, &TaskFrequencySeparatorStack[TASK_STACKSIZE - 1], 7);

    while (1) {
        OSTimeDly(100);
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

void TaskFFT(void* pdata) {
	INT8U err;

	kiss_fft_cfg cfg;
#if 0
	// normale initialisatie voor met ADC
	kiss_fft_cpx fin[FFT_LEN];
	// nog semafoor aanmaken?
#else
	// test/simulatie input, structs van 32 bits real & 32 bits imaginary waarden
	// 64 regels * 4 per regel = 256 input lengte
	kiss_fft_cpx fin[FFT_LEN] = {
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

	// Initialize the destination memory area to see that the FFT has actually calculated something.
	for (int i=0; i<FFT_LEN; i++) {
		// fout[] is nu een globale variabele
	    fout[i].i = 0xDEADDEAD;
	    fout[i].r = 0xDEADDEAD;
	}

	cfg = kiss_fft_alloc (FFT_LEN, 0, NULL, 0);
	if (! cfg) {
		printf ("Error: Cannot allocate memory for FFT control structure.\n");
	    return;
	}

	OSSemPend(sem_fftoutput, 0, &err);
	kiss_fft (cfg, fin, fout); // startup
	// klaar met output genereren
	OSSemPost(sem_fftoutput);

	// geef aan dat output klaar is
	err = OSFlagPost(flags, FLAG_FFTOUTPUT, OS_FLAG_SET, &err);

	while (1) {
		// onderzoek of je de FFTCore telkens aanroept of maar 1x activeert?

		OSTimeDlyHMSM(0,0,0,100); // vervangen door fft starten, output genereren en flag posten
	}
}

void TaskFrequencySeparator(void* pdata) {
	INT8U err;
	OS_FLAGS value;
	int freqOutput[AANTAL_OUTPUT_FREQSEP], scale_max = 1;
	const int aantal_x = FFT_LEN / AANTAL_OUTPUT_FREQSEP; // aantal waarden van "fout" per bin in "freqOutput"

	while (1) {
		// wacht op FFT output
		value = OSFlagPend(flags, FLAG_FFTOUTPUT, OS_FLAG_WAIT_SET_ALL + OS_FLAG_CONSUME, 0, &err);

		OSSemPend(sem_fftoutput, 0, &err);
		// opvragen output
#ifdef PRINT_FFT
		// Print out the FFT result.
		for (int i=0; i<FFT_LEN; i++) {
			printf ("%X - %X\n", (int) fout[i].r, (int) fout[i].i); // uitlezen real - imaginary (met pythagoras?)
		}
#endif

		// output verwerken
		/* De magnitude wordt berekend voor elke bin van FFT, de hoogste magnitude
		 * in een groep bins wordt gebruikt als output
		 * De grootte van de groep wordt bepaald door het aantal gegenereerde balken
		 * door de frame generator
		 */
		uint8_t offset;
		int hoogst, temp;
		for (int i=0; i<AANTAL_OUTPUT_FREQSEP; i++) { // per bin output frequency separator
			// bepaal de hoogste waarden
			offset = aantal_x*i;
			hoogst = 0;
#ifndef SCALE_MAX_RESETTEN
			// variabele voor het automatisch op schaal brengen van alle
			// signalen in verhouding tot het de grootste waarde van die signalen
			scale_max = 0;
#endif
			for (int j=offset; j<(offset+aantal_x); j++) {
				// magnitude berekenen met sqrt(real^2 + imaginary^2)
				// phase berekenen met atan2(imaginary, real)
				temp = pow(((int) fout[j].r), 2) + pow(((int) fout[j].i), 2);
				if (0 < temp) { // geen wortel trekken met =< 0
					temp = sqrt(temp);

					// kijk of de magnitude van de huidige bin hoger is
					if (temp > hoogst) {
						hoogst = temp;
					}
				}
				// TODO aantal bins van fft (output) aanpassen zodat er minder berekeningen nodig zijn?
			}
			// sla de hoogste magnitude van deze groep bins op
			freqOutput[i] = hoogst;
			if (scale_max < hoogst) {
				scale_max = hoogst;
			}
		}
		OSSemPost(sem_fftoutput);

		/* Een signaal hoeft maximaal de waarde 32 te bevatten door de
		 * hoogte van de matrix, dit is 6 bits.
		 * Een pio kan maximaal 32 bits bevattten.
		 * 6 bits per signaal * 8 signalen = 48 bits.
		 * Die 48 bits worden verdeeld over 2 pio blokken, 24 bits per blok.
		 */
		// output op schaal brengen
		for (int i=0; i<AANTAL_OUTPUT_FREQSEP; i++) {
#ifdef PRINT_FREQ
			printf("Signaal %X: %X\n", i, freqOutput[i]); 	// print ruwe output
#endif
//			printf("%X, scale_max: %X\n", freqOutput[i], scale_max);
			freqOutput[i] = map(freqOutput[i], 0, scale_max, 0, FREQSEP_OUTPUT_SCALE);
#ifdef PRINT_FREQ_SCALED
			printf("S %X: %X\n", i, freqOutput[i]); 		// print de output op schaal
#endif
		}

		// signalen samenvoegen en output naar vhdl component frame generator sturen
		int deel1 = 0;
		int deel2 = 0;
		for (int i=0; i<4; i++) {
			// 4 signalen worden achter elkaar gezet als 1 variabele per pio (2 pio's = 2 variabelen)
			deel1 |= (freqOutput[i] << (6*i));
			deel2 |= (freqOutput[i+4] << (6*i));
		}
		*FREQSEP_1 = deel1;
		*FREQSEP_2 = deel2;
		// nog ervoor zorgen dat de output correct wordt gemapt van 0 t/m 32 (max)
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

long map(long x, long in_min, long in_max, long out_min, long out_max) {
	return (((x - in_min) * (out_max - out_min)) / ((in_max - in_min) + out_min));
}
