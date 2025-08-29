//Write an embedded c program to blink an led

#include<stdio.h>
#include<LPC17xx.h>

int main(){
    int i;
    SystemInit();
    SystemCoreClockUpdate();
    LPC_PINCON->PINSEL0=0;
    LPC_GPIO0->FIODIR=1<<4;
    while(1){
        LPC_GPIO0->FIOSET=1<<4;
        for(i=0;i<1200;i++);
        LPC_GPIO0->FIOCLR=1<<4;
        for(i=0;i<1200;i++);
    }
    return 0;
}