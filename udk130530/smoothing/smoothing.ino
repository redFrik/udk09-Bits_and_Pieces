//simple test with one analog sensor (pot) and one pwm (led)

//same as analogInOut but with added Serial port to send back values.
//open Arduino IDE serial monitor and set baudrate there to 9600.
//you should see the values 0-1023 printed there as you turn the pot.

//and also with added smooth or slide functionallity. test to adjust up and down values.

byte pwmPin= 5;        //mega168 pin: 11
byte adcPin= A0;       //mega168 pin: 23
float up= 10;          //how fast to react / how much smoothing on increasing values
float down= 10;        //how fast to react / how much smoothing on decreasing values


float prev= 512;       //default reading

void setup() {
  Serial.begin(9600);
  pinMode(pwmPin, OUTPUT);  //enable pwm pin as an output. pins are input by default
}
void loop() {
  float val= analogRead(adcPin);  //read a value from the analog sensor (0-1023)
  
  if(val>prev) {
    val= prev+((val-prev)/up);
  } else {
    val= prev+((val-prev)/down);
  }
  prev= val;  //remember until next reading
  
  Serial.println(val);
  analogWrite(pwmPin, map(val, 0, 1023, 0, 255));   //we need to scale down from 0-1023 to 0-255
  //if dimming is weak try to calibrate the input range (0-1023) to match the min/max values you read in
  delay(20);
}

