//목표
//1. 마우스 위치에 따라 최소 3개에서 최대 16개의 사각타일로 채운다
int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;

void setup() {
  size(600, 600);
}
void draw() {
  noiseSeed(randomSeed);
  randomSeed(randomSeed);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  background(0);
  //내가 원하는 목표값 보다 1 더 크게 설정해야한다. 17로
  float tileSize = width / float(tileNum);
  for (int row = 0; row < tileNum; row ++) {
    for (int col = 0; col < tileNum; col ++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      //float randomVal = random(1);
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);
      fill(255);
      rect(rectX, rectY, tileSize, tileSize);
      //fill(255 * randomVal);
      //fill(255 * noiseVal);
      //fill(255);
      circle(centerX, centerY, tileSize * 0.8);
      pushMatrix();
      translate(centerX, centerY);
      //rotate(radians(30 * randomVal));
      rotate(radians(360 * noiseVal));
      line(0, 0, tileSize * 0.8 * 0.5, 0);
      popMatrix();
    }
  }
}
