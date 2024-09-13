/* ECE319K_Lab4main.c
 * Traffic light FSM
 * ECE319H students must use pointers for next state
 * ECE319K students can use indices or pointers for next state
 * William Wang and Jerin Andrews
 */

#include <ti/devices/msp/msp.h>
#include "../inc/LaunchPad.h"
#include "../inc/Clock.h"
#include "../inc/UART.h"
#include "../inc/Timer.h"
#include "../inc/Dump.h"  // student's Lab 3
#include <stdio.h>
#include <string.h>
// put both EIDs in the next two lines
const char EID1[] = "jta2448"; //  ;replace abc123 with your EID
const char EID2[] = "wyw82"; //  ;replace abc123 with your EID
const uint32_t in_init = 0x00040081;
const uint32_t out_init = 0x00000081;
// white: 0b00110001<<22
// red: 0x01<<26

// State Model
struct State {
    char name[12];
    uint32_t out;
    uint32_t dwell_time;
    uint32_t next[8];
} ;

typedef const struct State Traffic_State;

#define SouthG      0
#define SouthY      1
#define SouthR      2
#define WestG       3
#define WestY       4
#define WestR       5
#define WalkW       6
#define WalkR1      7
#define WalkOff1    8
#define WalkR2      9
#define WalkOff2    10
#define WalkR       11


// FSM
Traffic_State TrafficSystem[12] = {
       {"SouthG", 0x04000101,150, {SouthG, SouthY, SouthG, SouthY, SouthY, SouthY, SouthY, SouthY}},
       {"SouthY", 0x04000102, 75, {SouthR, SouthR, SouthR, SouthR, SouthR, SouthR, SouthR, SouthR}},
       {"SouthR", 0x04000104, 75, {SouthG, WestG, SouthG, WestG, WalkW, WalkW, WalkW, WalkW}},
       {"WestG", 0x04000044, 150, {WestY, WestG, WestY, WestY, WestY, WestY, WestY, WestY}},
       {"WestY", 0x04000084, 75, {WestR, WestR, WestR, WestR, WestR, WestR, WestR, WestR}},
       {"WestR", 0x04000104, 75, {SouthG, WestG, SouthG, SouthG, WalkW, WalkW, SouthG, SouthG}},
       {"WalkW", 0x0C400104, 150, {WalkR1, WalkR1, WalkR1, WalkR1, WalkW, WalkR1, WalkR1, WalkR1}},
       {"WalkR1", 0x04000104, 50, {WalkOff1, WalkOff1, WalkOff1, WalkOff1, WalkOff1, WalkOff1, WalkOff1, WalkOff1}},
       {"WalkOff1", 0x00000104, 50, {WalkR2, WalkR2, WalkR2, WalkR2, WalkR2, WalkR2, WalkR2, WalkR2}},
       {"WalkR2", 0x04000104, 50, {WalkOff2, WalkOff2, WalkOff2, WalkOff2, WalkOff2, WalkOff2, WalkOff2, WalkOff2}},
       {"WalkOff2", 0x00000104, 50, {WalkR, WalkR, WalkR, WalkR, WalkR, WalkR, WalkR, WalkR}},
       {"WalkR", 0x04000104, 100, {SouthG, WestG, SouthG, SouthG, WalkW, WestG, SouthG, WestG}}
};


// initialize 6 LED outputs and 3 switch inputs
// assumes LaunchPad_Init resets and powers A and B
void Traffic_Init(void){ // assumes LaunchPad_Init resets and powers A and B
    // LEDS
    // South (red, yellow, green)
    IOMUX->SECCFG.PINCM[PB2INDEX] = out_init;
    IOMUX->SECCFG.PINCM[PB1INDEX] = out_init;
    IOMUX->SECCFG.PINCM[PB0INDEX] = out_init;

    // West (red, yellow, green)
    IOMUX->SECCFG.PINCM[PB8INDEX] = out_init;
    IOMUX->SECCFG.PINCM[PB7INDEX] = out_init;
    IOMUX->SECCFG.PINCM[PB6INDEX] = out_init;


    // DOE
    GPIOB->DOE31_0 |= (0x1C7); // enables Pins for output

    // Switches (Walk, South, West)
    IOMUX->SECCFG.PINCM[PB17INDEX] = in_init;
    IOMUX->SECCFG.PINCM[PB16INDEX] = in_init;
    IOMUX->SECCFG.PINCM[PB15INDEX] = in_init;
}

/* Activate LEDs
* Inputs: data1,data2,data3
*   specify what these means
* Output: none
* Feel free to change this. But, if you change the way it works, change the test programs too
* Be friendly*/
void Traffic_Out(uint32_t out) {
    GPIOB->DOUT31_0 = (GPIOB->DOUT31_0 & ~0x0C4001C7) | out;
}

//void Traffic_Out(uint32_t south, uint32_t west, uint32_t walk){
//    LightOn(south);
//    LightOn(west);
//    LightOn(walk);
//
//    LightOff(south);
//    LightOff(west);
//    LightOff(walk);
//}

/* Read sensors
 * Input: none
 * Output: sensor values
*   specify what these means
* Feel free to change this. But, if you change the way it works, change the test programs too
 */
uint32_t Traffic_In(void){
    return (GPIOB->DIN31_0 & 0x00038000) >> 15;
}

// use main1 to determine Lab4 assignment
void Lab4Grader(int mode);
void Grader_Init(void);
int main1(void){ // main1
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Lab4Grader(0); // print assignment, no grading
  while(1){
  }
}

// use main2 to debug LED outputs
int main2(void){ // main2
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Grader_Init();  // execute this line before your code
  Traffic_Init(); // your Lab 4 initialization
  if((GPIOB->DOE31_0 & 0x20)==0){
    UART_OutString("access to GPIOB->DOE31_0 should be friendly.\n\r");
  }
  Debug_Init();   // Lab 3 debugging
  UART_Init();
  UART_OutString("Lab 4, Spring 2024, Step 1. Debug LEDs\n\r");
  UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
  UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");

  SysTick_Init();

  uint32_t out = 0x1;
  uint32_t i = 0;

  while(1){
      // write debug code to test your Traffic_Out
      // Call Traffic_Out testing all LED patterns
      // Lab 3 dump to record output values

      // This method loops through all FSM states to test LEDs
//      for (uint32_t i=0; i < 12; i++) {
//          Traffic_Out(TrafficSystem[i].out);
//          Debug_Dump(TrafficSystem[i].out);
//          SysTick_Wait10ms(50);
//      }

      // This method Individually Tests all the lights
      if (i == 9) {
          Traffic_Out(out << 26); // Traffic Red
          Debug_Dump(out << 26);
          SysTick_Wait10ms(25);
          i++;
          continue;

      } else if (i == 10) {
          Traffic_Out((out << 22) + (0x3 << 26)); // Traffic White
          SysTick_Wait10ms(25);
          Debug_Dump((out << 22) + (0x3 << 26));
          i = 0;
          continue;
      }

      Traffic_Out(out << i);
      Debug_Dump(out << i);
      i++;

      if (i == 3) {
          i = 6;
      }

      Clock_Delay(40000000); // 0.5s
      if((GPIOB->DOUT31_0&0x20) == 0){
      UART_OutString("DOUT not friendly\n\r");
    }
  }
}
// use main3 to debug the three input switches
int main3(void){ // main3
  uint32_t last=0,now;
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Traffic_Init(); // your Lab 4 initialization
  Debug_Init();   // Lab 3 debugging
  UART_Init();
  __enable_irq(); // UART uses interrupts
  UART_OutString("Lab 4, Spring 2024, Step 2. Debug switches\n\r");
  UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
  UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");
  while(1){
    now = Traffic_In(); // Your Lab4 input
    if(now != last){ // change
      UART_OutString("Switch= 0x"); UART_OutUHex(now); UART_OutString("\n\r");
      Debug_Dump(now);
    }
    last = now;
    Clock_Delay(800000); // 10ms, to debounce switch
  }
}
// use main4 to debug using your dump
// proving your machine cycles through all states
int main4(void){// main4
    Clock_Init80MHz(0);
    LaunchPad_Init();
    LaunchPad_LED1off();
    Traffic_Init(); // your Lab 4 initialization
    Debug_Init();   // Lab 3 debugging
    UART_Init();
    __enable_irq(); // UART uses interrupts
    UART_OutString("Lab 4, Spring 2024, Step 3. Debug FSM cycle\n\r");
    UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
    UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");
    // initialize your FSM
    uint32_t curr_state = 0;
    uint32_t input = 7;
  SysTick_Init();   // Initialize SysTick for software waits

  while(1){
      // 1) output depending on state using Traffic_Out
      Traffic_Out(TrafficSystem[curr_state].out);
      // call your Debug_Dump logging your state number and output
      // Format: bits 28-31: State, bits 0-27: LED output combination
      Debug_Dump((curr_state << 28) + TrafficSystem[curr_state].out);
      // 2) wait depending on state
      SysTick_Wait10ms(TrafficSystem[curr_state].dwell_time);
      // 3) hard code this so input always shows all switches pressed
      // 4) next depends on state and input
      curr_state = TrafficSystem[curr_state].next[input];
  }
}
// use main5 to grade
int main(void){// main5
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Grader_Init();  // execute this line before your code
  Traffic_Init(); // your Lab 4 initialization
  SysTick_Init(); // Initialize SysTick for software waits
  Debug_Init();
  // initialize your FSM
  uint32_t curr_state = 0;
  uint32_t input;
  Lab4Grader(1); // activate UART, grader and interrupts
  while(1){
      // 1) output depending on state using Traffic_Out
      Traffic_Out(TrafficSystem[curr_state].out);
      // call your Debug_Dump logging your state number and output
      // Format: bits 28-31: State, bits 0-27: LED output combination
      Debug_Dump((curr_state << 28) + TrafficSystem[curr_state].out);
      // 2) wait depending on state
      SysTick_Wait10ms(TrafficSystem[curr_state].dwell_time);
      // 3) input from switches
      input = Traffic_In();
      // 4) next depends on state and input
      curr_state = TrafficSystem[curr_state].next[input];
  }
}

