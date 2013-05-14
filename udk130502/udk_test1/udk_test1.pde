void setup() {
  size(500, 600);
  background(0);
  println("staring...");
}
void draw() {
  fill(random(255), 0, 0);  //red colour
  //println(frameCount);
  rect(10, 20, width-20, frameCount%height);
}
