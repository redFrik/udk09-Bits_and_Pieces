//simple test with one analog sensor (pot) and one pwm (led)

byte pwmPin= 5;        //mega168 pin: 11
byte adcPin= A0;       //mega168 pin: 23

void setup() {
  pinMode(pwmPin, OUTPUT);  //enable pwm pin as an output. pins are input by default
}
void loop() {
  int val= analogRead(adcPin);  //read a value from the analog sensor (0-1023)
  analogWrite(pwmPin, val/4);   //we need to scale down from 0-1023 to 0-255
  delay(20);
}

