//f.olofsson
//based on ThingSpeak.pde by Lars Schumann (make.larsi.org)
//load the analogReadThreeSensors sketch onto your arduino
//edit the serial port and write key below and start this sketch

import processing.serial.*;

String SERVER= "http://api.thingspeak.com/update?key=FNN6ML2VKKUVFDM5";  //edit here to match your write api key
Serial port;
float f1, f2, f3;

void setup() {
  size(320, 240);
  frameRate(1);
  println("available serial ports:");
  println(Serial.list());
  port= new Serial(this, Serial.list()[10], 9600);  //edit here to match arduino serial port
  port.clear();
  port.bufferUntil(10);
}

void draw() {
  background(0);
  stroke(255);
  text("freq: "+f1, 10, 20);
  text("amp: "+f2, 10, 40);
  text("rate: "+f3, 10, 60);
}

void serialEvent(Serial p) {
  String data= trim(p.readStringUntil(10));
  if (data!=null) {
    String[] data_split= split(data, ' ');
    println(data_split);
    f1= map(float(data_split[0]), 0.0, 1023.0, 300.0, 3000.0);  //freq
    f2= map(float(data_split[1]), 0.0, 1023.0, 0.0, 1.0);       //amp
    f3= map(float(data_split[2]), 0.0, 1023.0, 0.25, 1.75);     //rate
    String url= SERVER+"&field1="+f1+"&field2="+f2+"&field3="+f3;
    println(url);
    try {
      java.io.BufferedReader reader= new java.io.BufferedReader(new java.io.InputStreamReader(new java.net.URL(url).openStream()));
      String line= reader.readLine();
      while (line != null) {
        System.out.println(line);
        line= reader.readLine();
      }
    } 
    catch (java.io.IOException e) {
      e.printStackTrace();
    }
  }
}

