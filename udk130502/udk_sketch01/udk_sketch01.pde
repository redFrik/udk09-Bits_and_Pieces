//template - change things!

int num= 400;
float[] xpoints= new float[num];
float[] ypoints= new float[num];
float[] zpoints= new float[num];
void setup() {
  size(800, 600, P3D);
  frameRate(60);
  for (int i= 0; i<num; i++) {
    xpoints[i]= sin(i*0.13)*sin(i*0.31);
    ypoints[i]= cos(i*0.12)*sin(i*0.32);
    zpoints[i]= sin(i*0.11)*cos(i*0.33);
  }
  smooth(4);
}
void draw() {
  background(255);
  camera(width*0.5, height*0.5, (height*0.5)/tan(PI*30/180.0), mouseX, mouseY, 0, 0, 1, 0);
  fill(0, 127);
  stroke(0, 127);
  beginShape(QUADS);
  for (int i= 0; i<num; i++) {
    vertex(xpoints[i]*400+400, ypoints[i]*300+300, zpoints[i]*100);
  }
  endShape();
}

