// 코드를 작성하면서 네이밍이 필요한 경우 chat GPT의 도움을 받아 네이밍을함
// addInterval, waveOffset, isPersistent 등.. (아무래도 나보다 GPT가 영어를 더 잘하기 때문에)
// 입자의 운동을 제어하는 변수를 만들건데 이에 알맞은 이름을 지어줘 <- 이런 식으로 프롬포트 작성
ArrayList<Particle> particles;
int particleCount = 30; // 입자 최솟값
float lastAddedTime = 0; // 마지막으로 입자가 추가된 시간을 기록함
float addInterval = 15; // 입자를 추가할 간격

void setup() {
  fullScreen();
  particles = new ArrayList<Particle>();

  colorMode(HSB, 360, 100, 100);

  // 1. 초기 입자(30)를 생성
  for (int idx = 0; idx < particleCount; idx++) {
    float x = random(width);
    float y = random(height);
    particles.add(new Particle(x, y, true)); // 초기 입자 생성
  }
}

void draw() {
  background(0);

  // 2. 새로운 입자 생성
  for (int idx = particles.size() - 1; idx >= 0; idx--) {
    Particle p = particles.get(idx);
    p.update(mouseX, mouseY, mousePressed);
    p.display();

    if (p.isDead() && !p.isPersistent) {
      particles.remove(idx); // 입자 사라짐
    }
  }

  // ArrayList의 크기 표시
  fill(255);
  textSize(24);
  text("Count: " + particles.size(), 10, 20);
}

void mousePressed() {
  if (millis() - lastAddedTime > addInterval) {
    particles.add(new Particle(mouseX, mouseY, false)); // 새로운 입자 추가
    lastAddedTime = millis();
  }
}

void mouseDragged() {
  if (millis() - lastAddedTime > addInterval) {
    particles.add(new Particle(mouseX, mouseY, false)); // 새로운 입자 추가
    lastAddedTime = millis();
  }
}
