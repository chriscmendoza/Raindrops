color c;
void setup() {
  size(600, 600);
  c = color(0);
}

void draw() {
  background(c);
  if (frameCount%100 == 0) {
    c = color(random(255), random(255), random(255));
  }
}
