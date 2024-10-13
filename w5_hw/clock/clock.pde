void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  float clockRadius = 350;
  //시계 반지름 설정, 일단 350

  // 시계 가장자리 마커 그리기 (정시와 나머지 구분)
  strokeWeight(4);
  for (int i = 0; i < 60; i++) {
    //60개의 마커를 그려라~ i = i + 1
    float angle = map(i, 0, 60, 0, TWO_PI);
    //360도 기준으로 60등분한 각도 계산
    //TWO_PI -> 2π, 즉 360도를 라디안으로 표현한 것
    float x1 = cos(angle) * clockRadius;
    float y1 = sin(angle) * clockRadius; //바깥 마커
    //코사인=x좌표계산 삼각함수
    //사인=y좌표계산 삼각함수
    float x2 = cos(angle) * (clockRadius - (i % 5 == 0 ? 30 : 10));
    // 5분 단위로
    // ** ? = 조건이 참인지 거짓인지에 따라 두 값을 선택하는 것... **
    // 그니까 참일 때는 30을 반환하고 거짓일 땐 10을 반환
    float y2 = sin(angle) * (clockRadius - (i % 5 == 0 ? 30 : 10)); // 안쪽 마커

    stroke(0);
    if (i % 5 == 0) {
      //5분 단위마다 긴 마커 그릴지 말지
      //for구문 안에 들어있는 if다. 그니까 위의 int i = 0; i < 60; i++ 따라...
      //헷갈려서
      strokeWeight(4);
    } else {
      strokeWeight(2);
    }
    line(x1, y1, x2, y2);
  }

  //시,분,초침 이름짓기
  int h = hour(); // 시간을 가져오는 함수 hour()
  int m = minute(); // 분을
  int s = second(); // 초를

  // 초침
  float secondAngle = map(s, 0, 60, 0, TWO_PI) - HALF_PI;
  //0초에서 360도를 한바퀴돈다.
  //HALF_PI로 빼주는 이유? **0도가 3시방향에서 시작하기때문에 12시 방향으로 이동**
  //HALF_PI 는 90도를 라디안 단위로 표현한 것
  //**map(변환값, 원래-최솟값, 원래-최댓값, 변환-최솟값, 변환-최댓값)**
  stroke(255, 0, 0);
  strokeWeight(2);
  line(0, 0,
    cos(secondAngle) * clockRadius * 0.9, sin(secondAngle) * clockRadius * 0.9);
  // 중앙에서 -> 시계 반지름 0.9길이만큼(90%)
  // 밑에 다른것들도 똑같이 작용함........

  // 분침
  float minuteAngle = map(m, 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(0);
  strokeWeight(6);
  line(0, 0, cos(minuteAngle) * clockRadius * 0.75, sin(minuteAngle) * clockRadius * 0.75);

  // 시침
  float hourAngle = map(h % 12 + m / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(0);
  strokeWeight(10);
  line(0, 0, cos(hourAngle) * clockRadius * 0.5, sin(hourAngle) * clockRadius * 0.5);

  // 중심점
  fill(0);
  noStroke();
  ellipse(0, 0, 20, 20);
}
