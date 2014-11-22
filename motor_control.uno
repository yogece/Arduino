

int led = 12;           //LED is connected with Pin 12 of Arduino uno
int motor= 9;          //Motor is connected with Pin 9 of Arduino uno
int switch_ON=2;      //ON SWITCH is connected with pin 2 Arduino uno
int switch_OFF=3;    //ON SWITCH is connected with pin 2 Arduino uno
int on,off;         //Varibles are used to store the status of ON SWITCH & OFF SWITCH 

void setup() {                
  pinMode(led, OUTPUT);       //Initialize LED as output
  pinMode(motor,OUTPUT);      //Initialize MOTOR as output
  pinMode(switch_ON,INPUT);   //Initialize ON SWITCH as input
  pinMode(switch_OFF,INPUT);  //Initialize OFF SWITCH as input
  on=off=0;  //Initialize with '0' otherwise it would throw garbage value 
}


void loop() {
  
  digitalWrite(led,LOW);    //turn Off LED
  digitalWrite(motor,LOW); //turn Off MOTOR
  //Since PULL UP resistors are connected with both the switches '0' corresponds to 'SWITCH IS PRESSED' & '1'corresponds to 'SWITCH IS NOT PRESSED'
  on=digitalRead(switch_ON); //Read the Status of ON SWITCH and Store it in the variable 'on'
  off=digitalRead(switch_OFF);//Read the Status of OFF SWITCH and Store it in the variable 'off'
  
  if(on==0)// Check whether ON SWICH is Pressed i.e on=0 then execute the code else continuously monitor the status of the ON SWITCH
  {
    
    digitalWrite(motor,HIGH);  //Turn ON the MOTOR
    digitalWrite(led,HIGH);   //Turn ON the LED to indicate MOTOR is running
    while((off)!=0)
  {
  off=digitalRead(switch_OFF);//Wait untill OFF switch is Pressed if it is pressed get out from here and goto loop()
  delay(50); //This small delay eliminates the false triggering of OFF SWITCH 
  }  
  
}

}
