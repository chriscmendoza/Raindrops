color c;
int oldTime, currentTime;
void setup() {
  size(600, 600);
  currentTime = 2000;
  oldTime = 0;
  c = color(0);
}

void draw() {
  background(c);
  if (millis() ){
   fill(255);
    ellipse(mouseX,mouseY, 50,50);
 oldTime = currentTime 
}
}
