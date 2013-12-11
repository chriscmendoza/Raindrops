class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  float d;
  PImage Rain;

  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, .07);
    d = 20;
    Rain = loadImage("Rain.png");
  }

  void display() {
    image(Rain, loc.x, loc.y, d, d);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

}
