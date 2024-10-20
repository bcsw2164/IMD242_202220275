int[] fruitAmt = new int[5];
String[] fruitNames = {"Mango", "Strawberry", "Kiwi", "Plum", "Banana"};

void setup() {
  size(1280, 720);

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    fruitAmt[idx] = int(random(5, 100));
  }
}

float barWidth;
float graphBegin;
float graphGap;

void draw() {
  background(239);

  barWidth = width / 10.0;
  graphBegin = width * 0.15;
  graphGap = (width * 0.7) / (fruitAmt.length - 1);

  strokeWeight(barWidth);
  stroke(255);
  strokeCap(SQUARE);
  textAlign(CENTER);
  textSize(24);
  fill(32);

  float sum = 0;

  int[] sortedAmt = sort(fruitAmt.clone());
  //sort() : 배열을 정렬하는 기능

  for (int idx = 0; idx < fruitAmt.length; idx++) {
    float x = graphBegin + idx * graphGap;

    if (fruitAmt[idx] == sortedAmt[4]) {
      stroke(15, 7, 105); // 1
    } else if (fruitAmt[idx] == sortedAmt[3]) {
      stroke(39, 28, 159); // 2
    } else if (fruitAmt[idx] == sortedAmt[2]) {
      stroke(71, 59, 205); // 3
    } else if (fruitAmt[idx] == sortedAmt[1]) {
      stroke(96, 85, 225); // 4
    } else {
      stroke(137, 127, 247); // 5
    }

    line(x, height * 0.5,
      x, height * 0.5 - fruitAmt[idx] - 10);
    text(fruitNames[idx], x, height * 0.5 + 50);
    text(fruitAmt[idx], x, height * 0.5 + 90);

    sum += fruitAmt[idx];
    //합계 표시
  }

  float average = sum / fruitAmt.length;
  //평균 표시
  textAlign(LEFT, CENTER);
  fill(32);
  textSize(30);
  text("SUM : " + int(sum), 100, height - 120);
  text("AVERAGE : " + int(average), 100, height - 80);
}
