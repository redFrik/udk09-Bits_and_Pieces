//template - change things!

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  background(0);
  smooth(4);
  strokeWeight(0.1);
}
void draw() {
  //camera(width*0.5, height*0.5, (height*0.5)/tan(PI*10/180.0), mouseX, mouseY, 0, 0, 1, 0);
  //stroke(255, sin(frameCount*0.011)*127+127);
  stroke(255);  //greyscale colour 0-255
  line(width*0.5, height*0.5, (sin(frameCount*0.01)*300)+300, (cos(frameCount*0.01)*300)+300);
}
