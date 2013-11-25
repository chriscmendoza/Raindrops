class Catcher {
  int y, d;

  Catcher() {
    y = 550;
    d = 50;
  }

  void display() {
    ellipse(mouseX, y, d, d);
  }
}

