#include<stdio.h>
#include<LPC17xx.h>

int main(){
    int i,j,x,a;
    SystemInit();
    SystemCoreClockUpdate();
    LPC_PINCON->PINSEL0&=~(0xFF0);
    LPC_PINCON->PINSEL4&=~(1<<12);
    LPC_GPIO0->FIODIR|=(0xFF0);
    LPC_GPIO2->FIODIR&=~(1<<12);
    while(1){
        x=LPC_GPIO2->FIOPIN & (1<<12);
        a=1;
        for(i=0;i<256;i=i+a){
            x=LPC_GPIO2->FIOPIN & (1<<12);
            LPC_GPIO0->FIOPIN=(i<<4);
            for(j=0;j<15000000;j++);
            if(x!=0){
                a=1;
            }else{
                a=-1;
            }
            if(i==0 && a==-1){
                i=255;
            }
        }
    }
    return 0;
}