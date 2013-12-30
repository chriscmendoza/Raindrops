int oldTime, raain;
Raindrops[] drop = new Raindrops[1000];
void setup() {
  size(600, 600);
  oldTime = 3000;
  raain = 0;
  for (int i =0; i < drop.length; i++) {
    drop[i] = new Raindrops();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < raain; i++) {
    drop[i].display();
    drop[i].move();
  }
  if (millis()-oldTime >=3000) {
    oldTime = millis();
    raain++;
  }
}

