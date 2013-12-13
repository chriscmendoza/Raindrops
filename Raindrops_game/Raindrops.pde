class Raindrops { //this declares the class//
  PVector loc;
  PVector vel;
  PVector acc;  /*these declare PVectors. there is one for the location (where the raindrops will appear), 
   the velocity of the raindrop (how fast it will go), and the acceleration of the raindrop (essentially this is gravity, 
   because as the raindrop falls, the raindrop falls faster.*/

  float d; // the variable of how big the raindrops will be//
  PImage Rain; //this declares the variable so the raindrop image will be shown//

  Raindrops(Cloud c1) { //this is a constructor. it initializes the class//
    loc = new PVector(c1.loc.x +50, 40); /*this will position the raindrops. 
     THIS is IMPORTANT, because the raindrops will NOT fall randomly. 
     They will fall out of the moving raincloud*/
    vel = new PVector(0, 0); //This will be the speed of the raindrop falling//
    acc = new PVector(0, .07); //This allows the raindrop to fall faster as it gets closer to the ground (gravity)//
    d = 20; //the size of the raindrop//
    Rain = loadImage("Rain.png"); //the raindrop image is loaded and will now be seen//
  }

  void display() { //this will allow the raindrops to be shown in the game//
    image(Rain, loc.x, loc.y, d, d); //the raindrop will be shown and it has a location and a size//
  }

  void move() { // this will allow the raindrops to move (fall down)//
    vel.add(acc); //this allows for the raindrop to increase its speed as it falls//
    loc.add(vel); //this allows for the raindrop to actually be able to move and fall down//
  }
}

