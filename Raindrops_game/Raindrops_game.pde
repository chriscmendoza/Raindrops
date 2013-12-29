import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; //this allows for te music to be imported from the data file//



Minim minim;
AudioPlayer player;  //this allows for music to be played throughout the game//


Raindrops[] drop = new Raindrops[1000];  //creates an array of rain drops//
Cloud c1; 
Catcher catch1;   //declares a class//
PImage BadDay;
PImage Button;  //declares a variable for images to be loaded//
int ButtonS;
int rain;
int lives;
int oldTime;
int imagex, imagey;
int score; // declares a variable to be given a numerical value//
boolean go;
boolean win;
boolean gameover;
boolean music; // declares booleans that will allow the game to start and restart after winning or losing. declare true and false statements//

void setup() {    //this will run once//
  BadDay = loadImage("Bad Day.png"); //loads an image//
  size(BadDay.width, BadDay.height);    //declares the size of the display screen//
  Button = loadImage("Rain Button.png");   //loads an image//
  ButtonS = 100;
  rain = 0;
  score = 0;
  imagex = width/2;
  imagey = height/2;
  lives = 3;
  oldTime = 3000;       //the variables are given numberical values//
  c1 = new Cloud();
  catch1 = new Catcher();      //from the class, the object will be created//
  for (int i =0; i < drop.length; i++) {
    drop[i] = new Raindrops(c1);
  } //initializes the raindrops//
  minim = new Minim(this);
  player = minim.loadFile("Bad Day.mp3"); //declares what music will be playing as the player plays the game//
  player.loop(); //this allows the music to play on a continuous loop so that the song does NOT only play once//
  go = false;
  gameover = false;
  win = false;
  music = false; //the booleans to run the game are given values//
}

void draw() {     //this will run on a continuous loop//
  if (go == false) {
    background(0); //background color for the starting screen//
    textAlign(CENTER); // the text will be aligned in the center//
    textSize(16); //this is the size of the text// 
    text("CLICK THE BUTTON TO START", imagex, imagey-50); 
    text("To Win, You Must Catch Thirty Raindrops", imagex, imagey+150);
    text("You Have Three Lives, Good Luck!", imagex, imagey+170); //these declare what the text will say and where on the screen it will be located//
    imageMode(CENTER); //the image is aligned in the center//
    image(Button, imagex, imagey, ButtonS, ButtonS); // this allows for the image to be shown. this is the button to start the game//
  }   // this is the starting screen//
  if (go == true && gameover == false) {
    background(BadDay); //this gives the color of the background//
    textSize(32);  //this gives the size of the text// 
    text("Lives: " + lives, width-170, 100);
    text("Score: " + score, width-170, 40);     //this displays the text at specific coordinates//
    drop[rain] = new Raindrops(c1);     //the raindrop will fall from the cloud//
    for (int i =0; i < rain; i++) {
      drop[i].display();
      drop[i].move();
      catch1.check(drop[i]);
      catch1.Lose(drop[i]);
    }  //this allows one rain drop to fall//

    c1.display();   // the cloud will display//
    c1.move();     //the  cloud will move//
    catch1.display();  // the catcher is displayed//
    if (millis()-oldTime >=3000) {
      oldTime = millis();
      rain++;
    }
  }    //this is the timer. it will allow only one rain drop to fall after a certain time interval. As of now, every three seconds, a new raindrop will fall//
  if (gameover == true) {
    if (music == false) {
      player.close();
      player = minim.loadFile("Heartbreaker.mp3");
      player.loop();
    } /*this allows for music to change when the player loses the game. a new song will play and the song before it will stop. 
     the new song will now play on a continuous loop until the player restarts the game*/
    music = true;
    background(0);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(64);
    text("YOU LOSE", width/2, (height/2)-50);
    fill(255);
    textSize(16);
    text("CLICK THE BUTTON TO RESTART", imagex, imagey+50);
    imageMode(CENTER);
    image(Button, imagex, imagey, ButtonS, ButtonS);
  } // this is the gameover screen//
  if (score == 30) {
    win = true;
    if (win==true) {
      if (music == false) {
        player.close();
        player = minim.loadFile("Roller Coaster.mp3");
        player.loop();
      } /*this allows for music to change when the player wins the game. a new song will play and the song before it will stop. 
       the new song will now play on a continuous loop until the player restarts the game*/
      music = true;
      go = false;
      background(0);
      fill(255);
      textSize(16);
      text("YOU WIN", width/2, (height/2)-100);
      text("CLICK THE BUTTON TO RESTART", imagex, imagey+150);
      imageMode(CENTER);
      image(Button, imagex, imagey, ButtonS, ButtonS);
    } // this is the winning screen//
  }
}    //if the variable miss is greater than 3, the screen will go black and the person playing will have lost the game.//



void mousePressed() {
  if (go == false && gameover == false && win == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = !go;
  }
  if (go == false && gameover == true && win == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = true;
    gameover = false;
    lives = 3;
    score = 0;
    music = false;
    player.close();
    player = minim.loadFile("Bad Day.mp3");
    player.loop();
  } //this allows for the game to go from the winning screen to the actual game//
  if (win == true && go == false && gameover == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = true;
    gameover = false;
    win = false;
    lives = 3;
    score = 0;
    music = false;
    player.close();
    player = minim.loadFile("Bad Day.mp3");
    player.loop();
  } //this allows for the game to go from the losing screen to the actual game//
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
} // this allows for the music to be stopped. this is needed so that the music playing before will stop in the transition of winning or losing//

