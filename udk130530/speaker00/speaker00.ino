//connect ldr to A0 and speaker to atmega168 pin 15

byte pwmPin= 5;        //mega168 pin: 11
byte adcPin= A0;       //mega168 pin: 23
int outPin= 9;         //speaker output pwm9 (atmega168 pin 15)

void setup() {
  Serial.begin(9600);
  pinMode(pwmPin, OUTPUT);    //optional led / uln2803 (atmega168 pin 11)
}

void loop() {
  int val= analogRead(adcPin);  //read a value from the analog sensor (0-1023)
  Serial.println(val);
  analogWrite(pwmPin, val/4);
  int freq= map(val, 0, 1023, 100, 1000);  //try different values here
  tone(outPin, freq, 10);  //10 is duration - try to change
  delay(1);
}

