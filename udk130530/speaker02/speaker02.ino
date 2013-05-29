//f.olofsson - based on my misusepwmsyn.pde

//connect ldr to A0 and pot to A1

byte pwmPin= 5;        //mega168 pin: 11
byte adcPin= A0;       //mega168 pin: 23
byte adcPin2= A1;      //mega168 pin: 24
int outPin= 9;         //speaker output pwm9 (atmega168 pin 15)

int cnt= 42;  //default
byte freq;

void setup() {
  TCCR1A= B11110010;     //timer setup (see meg8 datasheet table39)
  TCCR1B= B00011001;     //try changing the 3 last bits (see meg8 datasheet table40)
  ICR1= 255;             //set counter maximum - sort of base freq
  DDRB= (1<<1);          //same as pinMode(outPin, OUTPUT);
  pinMode(pwmPin, OUTPUT);    //optional led / uln2803 (atmega168 pin 11)
}

void loop() {
  for(int i= 10; i<=cnt; i++) {
    int scale= analogRead(adcPin2);  //pot
    freq= analogRead(adcPin)>>2;     //ldr
    freq= (freq*scale)%255;
    ICR1= freq;
    OCR1A= freq*i%255;               //same as analogWrite(outPin, i);
  }
  analogWrite(pwmPin, freq);
  cnt++;
}

