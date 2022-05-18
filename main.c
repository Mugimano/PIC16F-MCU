#include<pic.h>
#define _XTAL_FREQ 20000000

// Transmitt Code_only
// I2C_Master Declaration

void I2C_Master_Start();
void I2C_Master_Stop();
void I2C_Master_Write(unsigned d);

int First_8bit();
int Second_8bits();
int Thrd_8bits();
int Fourth_8bits();
   
unsigned int i,j;
unsigned int arr[10] = {0x00,0x08,0x10,0x18};

void main()
{

  TRISC = 0xFF;
  PORTC = 0X00;
  
  // Registers for I2C Configuration 
  //SSPSTAT = 0x00;
  //SSPCON = 0b00101000; // Serial Port Enable and Master Mode Active  
  SSPADD = 0x3f;       // Speed of Dat Transmit 400kh 
  SSPM3  = 1;
  SSPM2  = 0;
  SSPM1  = 0;
  SSPM0  = 0;
  SSPEN  = 1;
 
  
  First_8bits(); // Fun_call 8bit data from First_8bits function
  //Second_8bits();
  //Thrd_8bits();
  //Fourth_8bits();
  
while(1)
{
}
 
}

int First_8bits()
{
 
  I2C_Master_Start();
  
  I2C_Master_Write(0xA0); // Slave Address +Write_only
  for(j=0;j<=4;){
  I2C_Master_Write(arr[j]); // 16bit Location Address
  }
  for(i =65; i<91; i++){
  __delay_ms(500);
  I2C_Master_Write(i); 
 if(i==73){
  j++; 
  }
  }
}
  I2C_Master_Stop();
  __delay_ms(500);  


}


void I2C_Master_Start()
{
  SEN = 1;
  while(SSPIF==0);
  SSPIF=0;
}

void I2C_Master_Stop()
{
  PEN = 1;
  while(SSPIF==0);
  SSPIF=0;
}

void I2C_Master_Write(unsigned d)
{
  SSPBUF = d;
  while(SSPIF==0);
  SSPIF=0;
}

