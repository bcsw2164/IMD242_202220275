let font;
let points = [];

let r = 10; //다른 숫자 넣어보세염
let angle = 0;

function preload() {
  font = loadFont('fonts/DIN Alternate Regular.otf');
}

function setup() {
  createCanvas(800, 400);
  points = font.textToPoints('BYK', 100, 300, 300, {
    sampleFactor: 0.1, //점의 밀도를 제어, 기본값 0.1
    simplifyThreshold: 0,
  });
  angleMode(DEGREES);
  //textToPoints(text,x,y,fontSize,options <<점을 생성하는 방식 조정할 수 있음)
}

function draw() {
  background(220);
  for (let i = 0; i < points.length; i++) {
    //(points[i].x, points[i].y); //point는 캔버스에 점을 찍는 함수
    ellipse(points[i].x + r * sin(angle + i * 30), points[i].y, 10, 10); //angle + i * 10 -> 각 점에 대해 각도가 다르게 적용되도록 하기 위해, 다른 속도나 위치에서 변동함
    //i * n < 수치 변경해보세여
  }
  angle += 10; //angle값을 10씩 증가시킨다

  // let box = font.textBounds('A', 0, 300, 300);
  // print(box);
  // rect(box.x, box.y, box.w, box.h);
}
