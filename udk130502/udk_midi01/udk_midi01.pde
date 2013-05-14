import promidi.*;

MidiIO midiIO;

int ctl2= 10;
int ctl3= 20;
int ctl4= 30;
int ctl5= 40;
int ctl6= 60;
float myWidth= 10.0;

void setup() {
  size(800, 600, P3D);
  smooth(4);
  frameRate(60);
  midiIO= MidiIO.getInstance(this);
  midiIO.printDevices();
  midiIO.openInput(0, 0);  //change to index of SLIDER/KNOB to use nanoKontroll
}
void draw() {
  //background(ctl6*2);
  fill(0, 50);
  rect(0, 0, width, height);
  
  strokeWeight(myWidth);
  stroke(255);
  line(map(ctl2, 0, 127, 0, width), map(ctl3, 0, 127, 0, height), map(ctl4, 0, 127, 0, width), map(ctl5, 0, 127, 0, height));
}
void controllerIn(Controller controller, int device, int channel) {
  int num= controller.getNumber();
  int val= controller.getValue();
  switch(num) {
  case 2:
    ctl2= val;
    break;
  case 3:
    ctl3= val;
    break;
  case 4:
    ctl4= val;
    break;
  case 5:
    ctl5= val;
    break;
  case 6:
    ctl6= val;
    break;
  }
}
void noteOn(Note note, int device, int channel) {
  int vel= note.getVelocity();
  int pch= note.getPitch();
  //println("received:"+pch+" with velocity "+vel);
  myWidth= map(pch, 0, 50, 1, 100);
}

