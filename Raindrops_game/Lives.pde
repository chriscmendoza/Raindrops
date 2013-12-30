class Lives { //this declares the class//
  PImage Life; //this declares the variable so the life image will be shown
  PVector loc; /*this declares the PVector for the location of the lives. 
   There will be three lives and this allows for the three lives to be shown,
   on the same axis, with space inbetween each*/
  int LifeS;
  int life; //these declare variables for the size of the raindrop, and the lives//

  Lives(int x, int _life) { //this is the lives constructor. it initializes the class//
    loc = new PVector(width-x, 212); //this is the location of where the lives (raindrops) will be)//
    Life = loadImage("Life.png"); //this loads the image of the life (raindrop)//
    LifeS = 50; //this is the size of the raindrop//
    life = _life; // the life variable is declared//
  }

  void display() { //this will allow the lives to be shown in the game//
    if (lives >= life) { //this allows the lives pictures (raindrops) to be removed when a life is lost//
      image(Life, loc.x, loc.y, LifeS, LifeS); //the life (raindrop) will be shown and it has a location and a size//
    }
  }
}

