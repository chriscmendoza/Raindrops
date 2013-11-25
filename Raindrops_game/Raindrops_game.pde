Raindrops[] drop = new Raindrops[1000];
Cloud c1;
Catcher catch1;
int raain;

void setup() {
  raain = 0;
  size(600, 600);
}

void draw() {
  background(0);
  c1.display();
  c1.move();
  catch1.display();
  drop[raain] = new Raindrops();
  for (int i =0; i < raain; i++) {
    drop[i].display();
    drop[i].move();
  }
  raain++;
  if (raain>= 1000) {
    raain = 500;
  }
}

