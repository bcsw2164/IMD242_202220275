class Particle {
  float x, y;
  float vx, vy;
  float angle;
  float size;
  float waveOffset; // 입자 운동
  float creationTime; // 생성 시간
  float opacity;
  boolean isPersistent; // 초기 입자인지 새로운 입자인지 구분하는 변수, 참or거짓이기 때문에 boolean 사용
  float hue;

  Particle(float x, float y, boolean isPersistent) {
    this.x = x;
    this.y = y;
    this.vx = random(-3, 3);
    this.vy = random(-3, 3);
    this.angle = random(TWO_PI); // -> 0부터 360도 사이의 무작위 각도를 생성해 입자의 회전 방향 결정함
    this.size = random(50, 250);
    this.waveOffset = random(TWO_PI);
    this.creationTime = millis();
    this.opacity = 255;
    this.isPersistent = isPersistent;
    this.hue = random(360);
  }

  //**chat GPT**
  // 마우스를 누르고 있을 때, 입자가 마우스를 향해 이동하도록 설정하는 코드를 구현해달라고 요청,
  // 더해서 입자와 마우스의 거리가 가까울 수록 더 큰 힘을 받아 빠르게 따라가고 멀수록 천천히 가도록 조건을 부여해서 질문함
  void update(float mx, float my, boolean pressed) {
    if (pressed) {
      float angleToMouse = atan2(my - y, mx - x);
      // atan2 -> 마우스 위치(mx,my)와 압자의 현재위치(x,y)간의 각도를 구하는 함수
      float force = map(dist(x, y, mx, my), 0, width, 5, 1);
      // map()을 이용함으로써 힘의 세기를 조정해 가까운 거리에서는 큰 힘을, 멀리 떨어진 거리에서는 적은 힘을 적용함
      vx += cos(angleToMouse) * force;
      vy += sin(angleToMouse) * force;
      // 각도에 따른 속도 추가, 입자가 마우스를 향해 이동함(힘을 받아서 마치 블랙홀에 이끌려가듯이?)
    } else {
      float wave = sin(frameCount * 0.1 + waveOffset) * 2;
      vx += cos(angle) * wave * 0.1;
      vy += sin(angle) * wave * 0.1;
      // 입자의 운동을 표현하기 위함
      vx += random(-0.5, 0.5);
      vy += random(-0.5, 0.5);
      // 속도를 랜덤하게 설정
    }

    // 입자들이 어떤 저항을 받아 점차 느려지는 현상을 구현함
    // 이동 범위나 속도가 과도하게 빠르고 커지는 것을 방지하기 위함
    x += vx * 0.98;
    y += vy * 0.98;
    // 0.98로 설정해서 속도를 조금씩 감소시킴
    vx *= 0.95;
    vy *= 0.95;
    // 위와 마찬가지

    // 3. 초기 입자를 제외한 추가 입자들은 5초 뒤 투명도가 감소하면서 서서히 사라짐
    if (!isPersistent) {
      float elapsedTime = millis() - creationTime;
      if (elapsedTime > 5000) {
        opacity = map(elapsedTime, 5000, 7000, 255, 0); // 5초가 지나면(5000) 이후 2초(7초)(7000)동안 255->0 된다는 의미
      }
    }
  }

  void display() {
    push();
    translate(x, y);
    rotate(angle);
    noStroke();
    fill(hue, 60, 80, opacity);
    circle(0, 0, size);
    fill(hue + 20, 60, 80, opacity);
    circle(0, 0, size - 20);
    pop();
  }

  boolean isDead() {
    return opacity <= 0;
  } // 투명도가 0일 경우 true 값을 반환 -> 아예 사라진 것으로 간주함(남아있지 않음)
}
