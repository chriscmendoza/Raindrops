class Catcher { //this declares the class//
  PVector loc; //this declares a PVector. this will help to declare the location of the 0object of the class//
  int S; //this is a vairable for the size of the catcher//
  PImage Guy; //this declares a name for a picture//

  Catcher() { //this is a constructor. it initializes the class//
    loc = new PVector(mouseX, height-S); //the location is now given numbers to appear at a specific point. in this PVector, the catcher will move in the x direction of wheveer the mouse is//
    S = 100; //this is the size of the catcher//
    Guy = loadImage("SadGuy.png"); //this will load a picture of the catcher//
  }

  void display() { //this function will make the catcher appear//
    loc.set(mouseX, height-(S/2)); //this sets the location//
    imageMode(CENTER); //the image is aligned in the center//
    image(Guy, loc.x, loc.y, S, S); //this is the catcher//
  }

  void check(Raindrops drop) { //this function will make the catcher actually catch the raindrops//
    if (loc.dist(drop.loc) < S/2 + drop.d/2) { //if the raindrop comes in contact with the catcher//
      drop.loc.set(-width, 0); //the raindrop disappears from the screen//
      drop.vel.set(0, 0); //the raindrop will no longer move//
      drop.acc.set(0, 0); //the raindrop will no longer move//
      score++; //the score will increase each time the catcher catches a raindrop//
      if (score%5 == 0) { 
        oldTime-= 20; //if the score value is divisible by five, the time interval fro another raindrop to fall will decrease slightly//
      }
    } /*when the raindrops touch the catcher, the raindrops will disappear. what actually happens is that the raindrops will go off the screen when it touches the catcher. 
     this gives the impression that the raindrops are disappearing*/
  }

  void Lose(Raindrops drop) { //function that will allow for the game to have a loser//
    if (drop.loc.y > height) { //if the raindrop goes off the screen//
      drop.loc.set(-width, height*200000000); //the raindrop will disapper completely from the screen//
      drop.vel.set(0, 0); //the raindrop will no longer move//
      lives--; //if a raindrop is missed and goes off the screen, the variable lives will decrease by one//
      if (lives == 0) { //if the player has no more lives//
        gameover = true; //booleans change to go to loser screen//
        go = false; //booleans change to go to loser screen//
      }
    }
  }
} 

