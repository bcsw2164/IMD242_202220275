// 색상 ver.1
color faceColor = color(29, 38, 87);
color innerEarColor = color(64, 94, 178);
color eyeColor = color(255, 188, 96);
color noseColor = color(255, 102, 128);

// 색상 ver.2
color newFaceColor = color(251, 193, 100);
color newInnerEarColor = color(229, 156, 51);
color newEyeColor = color(255);
color newNoseColor = color(31, 49, 113);

// 색상 전환 상태를 저장할 변수
boolean originalColor = true;
// boolean 함수는 특정 조건에 따라 참(true) 또는 **거짓(false)**의 값을 반환하는 함수
// 오직 두 가지 값만 가질 수 있으며, 조건이 맞으면 true, 그렇지 않으면 false를 반환
// 이 값은 주로 조건문에서 사용되어 프로그램의 흐름을 제어하거나 특정 로직을 실행할 때 사용


void setup() {
  size(600, 600);
  noStroke();
  rectMode(CENTER);
}
// !!!!!1 꼭기억해야할것 !!!!!!
// int : -1,0,1,2...
// float : 1,2,3...
// string : "text"

void draw() {
  background(255, 102, 128);

  // 얼굴
  fill(faceColor);
  rect(300, 300, 150, 250);
  circle(220, 300, 250);
  circle(360, 300, 250);

  // 귀
  fill(faceColor);
  triangle(150, 210, 220, 110, 290, 210);  // 왼
  triangle(300, 210, 370, 110, 440, 210);  // 오

  // 안쪽 귀
  fill(innerEarColor);
  triangle(190, 190, 220, 140, 250, 190);  // 왼
  triangle(340, 190, 370, 140, 400, 190);  // 오

  // 눈
  fill(eyeColor);
  circle(210, 300, 160);  // 왼
  circle(380, 300, 160);  // 오

  // 눈동자
  fill(0);
  eyeFollow(210, 300, 160);  // 왼
  eyeFollow(380, 300, 160);  // 오
  // 아래에서 eyeFollow 불러옴

  // 코
  fill(noseColor);
  triangle(280, 350, 310, 350, 295, 365);

  // 따라가는 글자
  PFont customFont;
  customFont = createFont("HelveticaRounded", 40);
  fill(255);
  textFont(customFont);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("MEOW", mouseX, mouseY);
}

void mousePressed() {
  if (originalColor) {
    // 1 -> 2
    faceColor = newFaceColor;
    innerEarColor = newInnerEarColor;
    eyeColor = newEyeColor;
    noseColor = newNoseColor;
  } else {
    // 2 -> 1
    faceColor = color(29, 38, 87);
    innerEarColor = color(64, 94, 178);
    eyeColor = color(255, 188, 96);
    noseColor = color(255, 102, 128);
  }
  
  originalColor = !originalColor;
  // boolen 값 반전
  // ! = 변수의 값 반전
  // 클릭할 때 마다 두 색상이 왔다갔다 하게 해줌
}

void eyeFollow(float eyeX, float eyeY, float eyeSize) {
  float eyeRadius = eyeSize ;
  float maxOffset = eyeRadius - 145;
  // 눈동자가 노란색 눈의 범위를 넘지 않도록 함
  // 눈동자가 이동할 수 있는 최대 거리

  float mouseX_Constrain = constrain(mouseX, eyeX - eyeRadius, eyeX + eyeRadius);
  float mouseY_Constrain = constrain(mouseY, eyeY - eyeRadius, eyeY + eyeRadius);
  // 마우스 위치를 기준으로 눈동자 위치 계산
  // constrain(value 제한값 , min 최소값 , max최대값)
  // 주어진 <value>가 min과 max사이에 있도록 강제함
  // mouseX_Constrain와 mouseY_Constrain 값을 정의

  float dx = mouseX_Constrain - eyeX;
  float dy = mouseY_Constrain - eyeY;
  float distance = dist(0, 0, dx, dy);
  // dist 함수: 두 점 사이의 거리 구할 때 사용, (0,0)과 (dx,dy) 사이의 거리 계산
  //             -> 마우스 위치와 눈 중심 사이의 거리, 눈동자가 눈 범위 넘어가지 ㄴ 조정

  // 눈동자가 눈의 범위를 넘어가지 않도록 조정
  if (distance > maxOffset) {
    dx = dx / distance * maxOffset;
    dy = dy / distance * maxOffset;
  }
  // maxoffset 거리 내에서 마우스를 따라가고 그 이상으로 이동 못하게

  float pupilX = eyeX + dx;
  float pupilY = eyeY + dy;

  circle(pupilX, pupilY, 120);
}
