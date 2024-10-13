//3*3 에서 16*16으로
//노이즈이용해서
int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;

void setup() {
  size(800, 800);
}
void draw() {
  noiseSeed(randomSeed);
  randomSeed(randomSeed);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  background(0);

  float tileSize = width / float(tileNum);
  for (int row = 0; row < tileNum; row ++) {
    for (int col = 0; col < tileNum; col ++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);
      noFill();
      stroke(255);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      rotate(radians(360 * noiseVal));
      line(0, 0, tileSize * 0.8 * 0.5, 0);
      fill(255);
      circle(tileSize * 0.8 * 0.5, 0, tileSize * 0.2);
      popMatrix();
    }
  }
}
