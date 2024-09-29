float rectWidth = 10;
float rectHeight = 100;
float angle = 0;

void setup() {
  size(1200, 600);
  background(0);
  noStroke();
  rectMode(CENTER);
}

void mousePressed() {
  rectWidth = 10;
  rectHeight = 100;
}

void draw() {
  if (mousePressed) {
    mirrorRect(mouseX, mouseY);
    mirrorRect(width - mouseX, mouseY);
  }
}

void mirrorRect(float x, float y) {
  fill(random(29, 70), random(90, 255), random(10, 255), random(25, 100));
  translate(x, y);

  rotate(angle);
  angle = angle + .1;

  //rect(mouseX, mouseY, rectWidht, rectHeight);
  //**실수한것**
  //사각형의 좌표를 (0,0)으로 설정해 translate()로 이동한 위치에서 직사각형을 그려야 하기 때문
  //코드의 순서를 의식하기...
  rect(0, 0, rectWidth, rectHeight);
  rectWidth = rectWidth * 1.002;
  rectHeight = rectHeight * 1.002;

  resetMatrix();
  //추가 도형이 생성될 때 그 전의 변환 적용 초기화(사각형그리기 -> 미러링효과)
}
