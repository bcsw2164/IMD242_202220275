class Heart {
  constructor(pts) {
    this.position = [];
    for (let i = 0; i < pts.length; i++) {
      this.position[i] = pts[i];
    }
  }

  display() {
    stroke(0);
    fill(255, 0, 0);
    beginShape();
    for (let i = 0; i < this.position.length; i++) {
      vertex(this.position[i].x, this.position[i].y);
    }
    endShape(close);
  }
}
