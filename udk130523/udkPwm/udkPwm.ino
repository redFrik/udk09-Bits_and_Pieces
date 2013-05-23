//arduino sketch that takes serial input and sends it out on 6 pwm channels
//specially for our bare bone arduino, but should also work on any normal
//look at supercollider file 'udkPwm.scd' or puredata patch 'udkPwm.pd'
//use it with for example with and an uln2803 to control leds or motors

//--serial protocol
// pwm:      10 nn nn nn nn nn nn 11 (nn bytes 1-6= pwm channels 0-5)

//--settings
byte pwmPins[]= {5, 3, 9, 6, 11, 10};        //mega168 pins: 11, 5, 15, 12, 17, 16

//--variables
byte val, cnt= 0;
byte data[]= {0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  Serial.begin(38400);    //baudrate must match sc/pd patch
  for(byte i= 0; i<6; i++) {
    pinMode(pwmPins[i], OUTPUT);
  }
}
void loop() {
  while(Serial.available()) {
    val= Serial.read();
    if(cnt==0) {
      if(val==10) {  //beginning of message found
        cnt= 1;  //start counter
      }
    } else if(cnt<7) {  //between 1 and 6 means message started and that bytes should be saved
      data[cnt-1]= val;  //saving incoming bytes in temporary data array
      cnt++;
    } else {
      if(val==11) {
        for(byte i= 0; i<6; i++) {
          analogWrite(pwmPins[i], data[i]);  //output read message to pwm pins
        }
      } else {
        //serial read error
      }
      cnt= 0;  //reset byte counter
    }
  }
}




