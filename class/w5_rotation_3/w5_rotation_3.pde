float rectW, rectH;
float aX, aY, aA, bX, bY, bA;

void setup() {
  size(640, 480);
  rectW = 160;
  rectH = 20;
  aA = 30;
  bX = width * .5;
  bY = height * .5;
  bA = 60;

  background(0);
  rectMode(CENTER);
}

void draw () {
  aX = mouseX;
  aY = mouseY;
  background(0);
  //push 와 pop의 개념이해...
  pushMatrix();
  translate(aX, aY);
  rotate(radians(aA));
  fill(255, 0, 0);
  rect(0, 0, rectW, rectH);
  popMatrix();
  //rotate(radians(-aA));
  //translate(-aX, -aY);
  
  translate(bX, bY);
  rotate(radians(bA));
  fill(0, 255, 0);
  rotate(radians(bA));
  rect(0, 0, rectW, rectH);
}
