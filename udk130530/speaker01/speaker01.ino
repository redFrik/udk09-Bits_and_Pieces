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
  int freq= map(val, 0, 1023, 80, 2000);  //try different values here
  
  //--play around with values below - copy and paste more
  analogWrite(pwmPin, val/4);  //start led in sync with tone
  tone(outPin, freq, 10);
  analogWrite(pwmPin, 0);  //stop led in sync with pause
  delay(100);
  analogWrite(pwmPin, val/4);  //start led in sync with tone
  tone(outPin, freq, 5);
  analogWrite(pwmPin, 0);  //stop led in sync with pause
  delay(200);
  analogWrite(pwmPin, val/4);  //start led in sync with tone
  tone(outPin, freq, 50);
  delay(50);
  analogWrite(pwmPin, 0);  //stop led in sync with pause
}

