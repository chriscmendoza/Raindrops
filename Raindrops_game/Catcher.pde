class Catcher { //this declares the class//
  PVector loc; //this declares a PVector. this will help to declare the location of the 0object of the class//
  int S;
  //  int miss; //this declares a variable//
  PImage Guy; //this declares a name for a picture//

  Catcher() { //this is a constructor. it initializes the class//
    loc = new PVector(mouseX, height-S); //the location is now given numbers to appear at a specific point. in this PVector, the catcher will move in the x direction of wheveer the mouse is//
    S = 100; //this is the size of the catcher//
    //    miss = 0;
    Guy = loadImage("SadGuy.png"); //this will load a picture of the catcher//
  }

  void display() { //this function will make the catcher appear//
    loc.set(mouseX, height-(S/2)); //this sets the location//
    imageMode(CENTER);
    image(Guy, loc.x, loc.y, S, S); //this is the catcher//
  }
  void check(Raindrops drop) { //this function will make the catcher actually catch the raindrops//
    if (loc.dist(drop.loc) < S/2 + drop.d/2) {
      drop.loc.set(-width, 0);
      drop.vel.set(0, 0);
      drop.acc.set(0, 0);
      score++;
      if(score%5 == 0){
      oldTime-= 20;
      }
    } /*when the raindrops touch the catcher, the raindrops will disappear. what actually happens is that the raindrops will go off the screen when it touches the catcher. 
     this gives the impression that the raindrops are disappearing*/
  }

  void Lose(Raindrops drop) {
    if (drop.loc.y > height) {
      drop.loc.set(-width, height*200000000);
      drop.vel.set(0, 0);
      lives--;
      if (lives == 0) {
        gameover = true;
        go = false;
      }
    }
  }//if a raindrop is missed and goes off the screen, the variable miss will increase by one//
} 

