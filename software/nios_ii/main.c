#include <stdio.h>
#include "includes.h"

// stacks
#define   TASK_STACKSIZE       2048

OS_STK      TaskStartStack[TASK_STACKSIZE];
OS_STK    TaskADCToFFTStack[TASK_STACKSIZE];

// tasks
void TaskStart(void *pdata);
void TaskADCToFFT(void *pdata);

int main(void) {
  OSInit(); // initialize ucos-ii
  OSTaskCreate(TaskStart, (void *) 0, &TaskStartStack[TASK_STACKSIZE - 1], 5); // create new task
  OSStart(); // start multitasking
  return 0; // never executed
}

void TaskStart(void *pdata) {
    OSTaskCreate(TaskADCToFFT, (void *) 0, &TaskADCToFFTStack[TASK_STACKSIZE - 1], 6); // create new task

    while (1) {
        OSTimeDly(10);
    }
}

void TaskADCToFFT(void* pdata) {
  while (1) {
  }
}

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