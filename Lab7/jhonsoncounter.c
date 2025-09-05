#include<stdio.h>
#include<LPC17xx.h>

int main(){
	//write an embedded c program to demonstrate an 8 bit jhonson counter;
	int i,j;
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0&=~(0xFF<<4);
	LPC_GPIO0->FIODIR|=0xFF0;
	while(1){
		for(i=0;i<8;i++){
			LPC_GPIO0->FIOSET=1<<(4+i);
			for(j=0;j<15000000;j++);
		}
		for(i=0;i<8;i++){
			LPC_GPIO0->FIOCLR=1<<(4+i);
			for(j=0;j<15000000;j++);
		}
	}
	return 0;
}