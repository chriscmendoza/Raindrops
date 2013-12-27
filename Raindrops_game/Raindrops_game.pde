import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;



Minim minim;
AudioPlayer player;


Raindrops[] drop = new Raindrops[1000];                                     //creates an array of rain drops//
Cloud c1; 
Catcher catch1;                                                             //declares a class//
PImage BadDay;
PImage Button;
int ButtonS;
int rain;
int lives;
int oldTime;
int imagex, imagey;
int score; // declares a variable//
boolean go;
boolean win;
boolean gameover;

void setup() {                                                             //this will go once//
  BadDay = loadImage("Bad Day.png"); 
  size(BadDay.width, BadDay.height);                                         //declares the size of the display screen//
  Button = loadImage("Rain Button.png");
  ButtonS = 100;
  rain = 0;
  score = 0;
  imagex = width/2;
  imagey = height/2;
  lives = 3;
  oldTime = 3000;                                                                   //the variables are given numbers//
  c1 = new Cloud();
  catch1 = new Catcher();                                                                   //from the class, the object will be created//
  for (int i =0; i < drop.length; i++) {
    drop[i] = new Raindrops(c1);
  } //initializes the raindrops//
  minim = new Minim(this);
  player = minim.loadFile("Bad Day.mp3");
  player.loop();
  go = false;
  gameover = false;
  win = false;
}

void draw() {                                                                   //this will go on a continuous loop//
  if (go == false) {
    background(0); 
    textAlign(CENTER);
    textSize(16);
    text("CLICK THE BUTTON TO START", imagex, imagey-50);
    imageMode(CENTER);
    image(Button, imagex, imagey, ButtonS, ButtonS);
  }
  if (go == true && gameover == false) {
    background(BadDay);                                                                   //this gives the color of the background//
    textSize(32);                                                                   //this gives the size of the text// 
    text("Lives: " + lives, width-170, 100);
    text("Score: " + score, width-170, 40);                                                                   //this displays the text at specific coordinates//
    drop[rain] = new Raindrops(c1);                                                                   // the raindrop will fall from the cloud//
    for (int i =0; i < rain; i++) {
      drop[i].display();
      drop[i].move();
      catch1.check(drop[i]);
      catch1.Lose(drop[i]);
    }                                                                                                    //this allows one rain drop to fall//
    c1.display();                                                                   // the cloud will display//
    c1.move();                                                                   //the  cloud will move//
    catch1.display();                                                                   // the catcher is displayed//
    if (millis()-oldTime >=3000) {
      oldTime = millis();
      rain++;
    }
  }                                                                  //this is the timer. it will allow only one rain drop to fall after a certain time interval. As of now, every three seconds, a new raindrop will fall//
  if (gameover == true) {
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
  }
  if (score == 3) {
    win = true;
    if (win==true) {
      background(0);
      fill(255);
      textSize(16);
      text("YOU WIN", width/2, height/2);
      text("CLICK THE BUTTON TO RESTART", imagex, imagey+150);
      imageMode(CENTER);
      image(Button, imagex, imagey, ButtonS, ButtonS);
    }
  }
}                                                                  //if the variable miss is greater than 3, the screen will go black and the person playing will have lost the game.//



void mousePressed() {
  if (go == false && gameover == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = !go;
  }
  if (go == false && gameover == true && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = true;
    gameover = false;
    lives = 3;
    score = 0;
  }
  if (win == true && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = true;
    gameover = false;
    lives = 3;
    score = 0;
  }
}

