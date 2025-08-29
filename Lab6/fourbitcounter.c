#include<stdio.h>
#include<LPC17xx.h>

int main(){
	int i,j;
	SystemInit();
	SystemCoreClockUpdate();
	//write a embedded c code to display 4 bit binary count on 4 leds connected to port P0.7 to P0.4
	LPC_PINCON->PINSEL0=0;
	LPC_GPIO0->FIODIR=0xF<<4;
	while(1){
		for(i=0;i<16;i++){
			LPC_GPIO0->FIOPIN=i<<4;
			for(j=0;j<100000;j++);
		}
	}
	return 0;
}