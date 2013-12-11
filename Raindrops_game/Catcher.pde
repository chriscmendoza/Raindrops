class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX, 550);
    d = 50;
  }

  void display() {
    loc.set(mouseX, 550);
    ellipse(loc.x, loc.y, d, d);
  }
  void check(Raindrops drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.loc.set(-width, height*200000000);
      drop.vel.set(0, 0);
      score++;
    }
  }
}

