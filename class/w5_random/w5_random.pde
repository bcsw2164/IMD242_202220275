float tileW, tileH;
int seedNum = 0;

void setup() {
  size(640, 480);
  tileW = 20;
  tileH = 40;
  stroke(0);
  //frameRate(2);
}
void mousePressed() {

  //if (seedNum == 0) {
  //  seedNum =1;
  //} else {
  //  seedNum =0;
  //5
  seedNum = int(random(5000));
  println(seedNum);
}

void draw() {
  randomSeed(seedNum);
  for (float y = 0; y < height; y += tileH) {
    for (float x = 0; x < width; x += tileW) {
      fill(random(255));
      rect(x, y, tileW, tileH);
    }
  }
}
