//template - change things!

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  background(255);
  smooth(4);
  strokeWeight(0.1);
}
void draw() {
  //camera(width*0.5, height*0.5, (height*0.5)/tan(PI*10/180.0), mouseX, mouseY, 0, 0, 1, 0);
  //stroke(255, sin(frameCount*0.011)*127+127);
  stroke();  //greyscale colour 0-255
  line(50, 40, 400, (sin(frameCount*0.01)*300)+300);
  line(150, 140, 400, (sin(frameCount*0.02)*300)+300);
  line(250, 240, 400, (cos(frameCount*0.03)*300)+300);
  line(350, 340, 400, (sin(frameCount*0.04)*300)+300);
}
