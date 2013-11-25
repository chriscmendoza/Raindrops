class Cloud {

  PVector loc;
  int cloudS;
  PVector vel;
  PImage Cloud;

  Cloud() {
    loc = new PVector(0, 20);  
    vel = new PVector(3, 0);
    cloudS = 50;
    Cloud = loadImage("Cloud.png");
  }
  
  void display() {
    image(Cloud, loc.x, loc.y, cloudS, cloudS-20);
  }
  
  void move() {
    loc.add(vel);
    if (loc.x > width && loc.x <0) {
      vel.mult(-1);
    }
  }
}

