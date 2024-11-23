const density = 'N@#W$9876543210?!abc;:+=-,._  ';
//const : 변수 선언, 가능한 const를 기본적으로 사용하나 필요할 때만 let을 사용
//denstiy : 픽셀 밝기 계산 후 해당 배열의 문자로 매핑한다

let capture;
let asciiDiv;

function setup() {
  //createCanvas(400, 400);
  noCanvas();

  capture = createCapture(VIDEO);
  capture.size(52, 52); //픽셀 크기
  capture.hide(); //비디오를 캔버스에서만 사용할 때(html페이지ㄴ)
  asciiDiv = createDiv();
}

function draw() {
  //카메라 좌우반전
  translate(width, 0);
  scale(-1, 1);

  capture.loadPixels();
  let asciiImage = '';
  for (let j = 0; j < capture.height; j++) {
    let row = '';
    for (let i = 0; i < capture.width; i++) {
      const pixelIndex = (i + j * capture.width) * 4;
      const r = capture.pixels[pixelIndex + 0];
      const g = capture.pixels[pixelIndex + 1];
      const b = capture.pixels[pixelIndex + 2];
      const avg = (r + g + b) / 3; //밝기 구하는 공식
      const len = density.length;
      const charIndex = floor(map(avg, 0, 255, len, 0));

      const c = density.charAt(charIndex);
      if (c == ' ') row += '&nbsp;';
      else asciiImage += c;
    }
    asciiImage += '<br/>';
    //createDiv(row);
  }
  asciiDiv.html(asciiImage);
}
