class Raindrops {
  PVector locs;
  PVector vels;
  int count = 1000;
  float d;
  color c;
  PImage Rain;

  Raindrops() {
    locs = new PVector(random(width), 0);
    vels = new PVector(0, 3);
    d = 30;
    c = color(255);
    Rain = loadImage("Rain.png");
  }

  void display() {
    image(Rain,locs.x, locs.y, d, d);
  }

  void move() {
    locs.add(vels);
  }
}

