Raindrops[] drop = new Raindrops[1000]; //creates an array of rain drops//
Cloud c1; 
Catcher catch1; //declares a class//
PImage BadDay;
int rain;
int miss;
int oldTime;
int score; // declares a variable//

void setup() { //this will run once//
  BadDay = loadImage("Bad Day.png"); 
  size(BadDay.width, BadDay.height); //declares the size of the display screen//
  rain = 0;
  score = 0;
  miss = 0;
  oldTime = 3000; //the variables are given numbers//
  c1 = new Cloud();
  catch1 = new Catcher(); //from the class, the object will be created//
  for (int i =0; i < drop.length; i++) {
    drop[i] = new Raindrops(c1);
  } //initializes the raindrops//
}

void draw() { //this will run on a continuous loop//
  if (miss<3) {
    background(BadDay); //this gives the color of the background//
    textSize(32); //this gives the size of the text// 
    text("Score: " + score, width-170, 40); //this displays the text at specific coordinates//
    drop[rain] = new Raindrops(c1); // the raindrop will fall from the cloud//
    for (int i =0; i < rain; i++) {
      drop[i].display();
      drop[i].move();
      catch1.check(drop[i]);
      catch1.Lose(drop[i]);
    } //this allows one rain drop to fall//
    c1.display(); // the cloud will display//
    c1.move(); //the  cloud will move//
    catch1.display(); // the catcher is displayed//
    if (millis()-oldTime >=3000) {
      oldTime = millis();
      rain++;
    }
  }//this is the timer. it will allow only one rain drop to fall after a certain time interval. As of now, every three seconds, a new raindrop will fall//
  else {
    background(0);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(64);
    text("YOU LOSE", width/2, height/2);
  }//if the variable miss is greater than 3, the screen will go black and the person playing will have lost the game.//
}

