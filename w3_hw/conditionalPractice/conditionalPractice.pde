void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  if (mouseY < height / 4) {
    circle(width * .5, height / 8 , 80);
  } else if (mouseY < height / 4 * 2) {
    square(width * .5, 135 , 80);
  } else if (mouseY < height / 4 * 3) {
    line(width * .5 - 50, height * .5 , width * .5 + 50, height * .5 + 90 );
  } else {
    rect(width * .5, 315, 150, 60, 15);
  }

  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);
  line(0, 2 * height / 4, width, 2 * height / 4);
  line(0, 3 * height / 4, width, 3 * height / 4);
}
