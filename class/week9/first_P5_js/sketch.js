let tileNumX = 16;
let tileNumY = 12;

function setup() {
  createCanvas(640, 480);
}

function draw() {
  background('#333333');
  //js에선 무조건 let으로 시작, int와 float를 구분하지않는다
  noStroke();
  fill('cornflowerblue');

  for (let row = 0; row < tileNumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / tileNumX;
      let tileH = height / tileNumY;
      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }
}
