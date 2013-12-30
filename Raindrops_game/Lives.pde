class Lives {
  PImage Life;
  PVector loc;
  int LifeS;
  int life;
  Lives(int x, int _life) {
    loc = new PVector(width-x, 212);
    Life = loadImage("Life.png");
    LifeS = 50;
    life = _life;
  }
  void display() {
    if (lives >= life) {
      image(Life, loc.x, loc.y, LifeS, LifeS);
    }
  }
}
