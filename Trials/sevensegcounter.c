#include<stdio.h>
#include<LPC17xx.h>

int sevenseg[]={0x3f,0x06,0x5b,0x8f,0x66, 0x6d, 0x7d, 0x27, 0x7f, 0x67,0x77, 0x7c, 0x3d, 0x5e, 0x79,0x71};

void display_fourbit(int num){
    int n, i, j, digit;
    if(num==0){
        LPC_GPIO1->FIOPIN=1<<23;
        LPC_GPIO0->FIOPIN=sevenseg[digit]<<4;
        for(j=0;j<1000;j++);
        return;
    }
    n=num;
    i=0;
    while(n!=0){
        digit=n%10;
        LPC_GPIO1->FIOPIN=i<<23;
        i++;
        LPC_GPIO0->FIOPIN=sevenseg[digit];
        n/=10;
        for(j=0;j<1000;j++);
    }
}

int main(){
    int i, j;
    SystemInit();
    SystemCoreClockUpdate();
    LPC_PINCON->PINSEL0=0;
    LPC_PINCON->PINSEL3=0;
    LPC_GPIO0->FIODIR=0xff<<4;
    LPC_GPIO1->FIODIR=0xf<<23;
    while(1){
        for(i=0;i<10000;i++){
            for(j=0;j<1000;j++){
                display_fourbit(i);
            }
        }
    }
    return 0;
}