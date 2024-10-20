int numBuildings = 5;
int randomSeedValue = int(random(10000000));
float fixedY = 600; 

void setup() {
  size(800, 800);
  noStroke();
}

void mousePressed() {
  randomSeedValue = int(random(10000000));
}

void draw() {
  randomSeed(randomSeedValue);
  background(9, 7, 38);

  // 달
  fill(255, 198, 11); 
  ellipse(100, 100, 80, 80); 
  // 도로 
  fill(50); 
  rect(0, fixedY, width, height - fixedY); 
  // 도로 노란 차선
  stroke(255, 204, 0); 
  strokeCap(SQUARE);
  strokeWeight(15);
  float lineY = fixedY + 90; 
  for (float x = 0; x < width; x += 90) {
    line(x, lineY, x + 45, lineY);
  }
  noStroke(); 

  // 건물
  for (int n = 0; n < numBuildings; n++) {
    drawBuilding(random(100, 700), fixedY, random(100, 200), random(200, 400));
    //위에서 fixedY를 600으로 정의했기 때문에 y축 값이 고정된 상태로 랜덤하게
  }
}

void drawBuilding(float x, float y, float width, float height) {
  //건물 
  fill(random(100, 200), random(100, 200), random(100, 200)); 
  rect(x, y - height, width, height);

  // 출입문
  fill(random(50, 100), random(50, 100), random(50, 100)); 
  rect(x + width / 4, y - 30, width / 2, 30); 

  // 창문
  fill(random(135, 185), random(206, 255), random(240, 255));
  int windowW = int(width / 4) - 5; 
  int windowH = 30;
  //창문이 3X4로만 그려지게 for구문을 사용해서
  for (int row = 0; row < 4; row++) { 
    for (int col = 0; col < 3; col++) { 
      float windowX = x + (width / 2) - (3 * (windowW + 10) / 2) + col * (windowW + 10) + 5; 
      float windowY = y - height + row * (windowH + 10) + 5;
      
      if (windowY < (y - 30)) {
        windowY += 10;
        rect(windowX, windowY, windowW, windowH); 
      }
    }
  }
}
