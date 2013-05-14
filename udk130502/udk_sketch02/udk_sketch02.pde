//template - change things!

//mouse mouse and click

float[] xpoints= new float[100];
float[] ypoints= new float[100];
float[] zpoints= new float[100];
void setup() {
  size(800, 600, P3D);
  frameRate(60);
  for (int i= 0; i<100; i++) {
    xpoints[i]= random(-1.0, 1.0);
    ypoints[i]= random(-1.0, 1.0);
    zpoints[i]= random(-1.0, 1.0);
  }
  smooth(4);
  lights();
}
void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  camera(width*0.5, height*0.5, (height*0.5)/tan(PI*30/180.0), mouseX, mouseY, 0, 0, 1, 0);
  fill(255, 100);
  noStroke();
  beginShape(QUADS);
  for (int i= 0; i<100; i++) {
    vertex(xpoints[i]*400+400, ypoints[i]*300+300, zpoints[i]*100);
  }
  endShape(CLOSE);
  for (int i= 0; i<100; i++) {
    xpoints[i]= sin(xpoints[i]);
    ypoints[i]= sin(ypoints[i]);
    zpoints[i]= sin(zpoints[i]);
  }
  if (mousePressed) {
    for (int i= 0; i<100; i++) {
      if (random(100)<2) {
        xpoints[i]= random(-2.0, 2.0);
        ypoints[i]= random(-2.0, 2.0);
        zpoints[i]= random(-2.0, 2.0);
      }
    }
  }
}

