#include<stdio.h>
#include<LPC17xx.h>

int main(){
	//write an embedded c program to display an 8 bit binary up counter on the leds
	int i,j;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0&=~(0xFF<<4);
	LPC_GPIO0->FIODIR=0xFF<<4;
	while(1){
		for(i=0;i<256;i++){
			LPC_GPIO0->FIOPIN=i<<4;
			for(j=0;j<15000000;j++);
		}
	}
	return 0;
}