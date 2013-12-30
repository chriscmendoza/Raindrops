import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; //this allows for te music to be imported from the data file//



Minim minim; //this allows for music to be played throughout the game//
AudioPlayer player;  //this allows for music to be played throughout the game//


Raindrops[] drop = new Raindrops[1000];  //creates an array of rain drops//
Cloud c1; //declares a class//
Lives l1, l2, l3; //declares a class//
Catcher catch1;   //declares a class//
PImage BadDay; //declares a variable for the background of the game to be loaded//
PImage Button; //declares a variable for the button to be loaded//
PImage Winner; //declares a variable for the background of the winning screen to be loaded//
PImage Loser; //declares a variable for the background of the losing screen images to be loaded//
int ButtonS; // declares a variable to be given a numerical value//
int rx; // declares a variable to be given a numerical value//
int ry; // declares a variable to be given a numerical value//
int rw; // declares a variable to be given a numerical value//
int rh; // declares a variable to be given a numerical value//
int rain; // declares a variable to be given a numerical value//
int lives; // declares a variable to be given a numerical value//
int level; // declares a variable to be given a numerical value//
int oldTime; // declares a variable to be given a numerical value//
int imagex, imagey; // declares a variable to be given a numerical value//
int score; // declares a variable to be given a numerical value//
boolean run; // declares booleans that will allow the game to pause and unpause. declare true and false statements//
boolean go; // declares booleans that will allow the game to start and restart after winning or losing. declare true and false statements//
boolean win; // declares booleans that will allow the game to start and restart after winning or losing. declare true and false statements//
boolean gameover; // declares booleans that will allow the game to start and restart after winning or losing. declare true and false statements//
boolean music; // declares booleans that will allow the game to play music and change it inbetween winning and losing. declare true and false statements//

void setup() {    //this will run once//
  BadDay = loadImage("Bad Day.png"); //loads the image of the game's background//
  size(BadDay.width, BadDay.height);    //declares the size of the display screen//
  Button = loadImage("Rain Button.png");  //loads the image of the game's button// 
  Winner = loadImage("Happy Day.png"); //loads the image of the game's winning background//
  Loser = loadImage("Loser.png"); //loads the image of the game's losing background//
  ButtonS = 100; //the button size//
  rx = 510; //x location of the pause button//
  ry = 90; //y location of the pause button//
  rw = 60; //width  of the pause button//
  rh = 40; //height of the pause button//
  rain = 0; //raindrops//
  score = 0; //the score of the game starts at 0//
  imagex = width/2; //x location of the start/restart button//
  imagey = height/2; //y location of the start/restart button//
  lives = 3; //how many lives the player has//
  level = 1; //what level the player is on (game starts at level 1)//
  oldTime = 3000;  //the variables are given numberical values//
  c1 = new Cloud(); //allows for a cloud to be used from its class//
  l1 = new Lives(120, 1); //allows for a life to be used from its class//
  l2 = new Lives(90, 2); //allows for a life to be used from its class//
  l3 = new Lives(60, 3); //allows for a life to be used from its class//
  catch1 = new Catcher(); //from the class, the object will be created//
  for (int i = 0; i < drop.length; i++) {
    drop[i] = new Raindrops(c1); //the raindrop will fall from the moving cloud//
  } //initializes the raindrops//
  minim = new Minim(this); //nitializes the music// 
  player = minim.loadFile("Bad Day.mp3"); //declares what music will be playing as the player plays the game//
  player.loop(); //this allows the music to play on a continuous loop so that the song does NOT only play once//
  run = true; //the booleans to run the game are given values//
  go = false; //the booleans to run the game are given values//
  gameover = false; //the booleans to run the game are given values//
  win = false; //the booleans to run the game are given values//
  music = false; //the booleans to run the game are given values//
}

void draw() { //this will run on a continuous loop//
  if (go == false) { //this is the start screen//
    background(0); //background color for the starting screen//
    textAlign(CENTER); // the text will be aligned in the center//
    textSize(16); //this is the size of the text// 
    text("CLICK THE BUTTON TO START", imagex, imagey-50); //instructions on how to play the game//
    text("INSTRUCTIONS:", imagex, imagey+60); //instructions on how to play the game//
    text("You Will Use Your Mouse To Move The Catcher", imagex, imagey+80); //instructions on how to play the game//
    text("You Must Catch Thirty Raindrops To Win", imagex, imagey+100); //instructions on how to play the game//
    text("You Have Three Lives, Good Luck!", imagex, imagey+120); //instructions on how to play the game//
    textSize(10); //this is the size of the text// 
    text("*Hint: Use The Pause Button to Your Advantage ;)", imagex, imagey+180); //these declare what the text will say and where on the screen it will be located//
    imageMode(CENTER); //the image is aligned in the center//
    image(Button, imagex, imagey, ButtonS, ButtonS); // this allows for the image to be shown. this is the button to start the game//
  }  
  if (go == true && gameover == false) { //the game will be played//
    background(BadDay); //this is the background for the game//
    textSize(32);  //this gives the size of the text// 
    fill(255); //this gives the color of the text//
    text("Lives: ", width-180, 220); //this displays the text at specific coordinates//
    text("Score: " + score, width-170, 160); //this displays the text at specific coordinates//
    drop[rain] = new Raindrops(c1); //the raindrop will fall from the cloud//
    for (int i =0; i < rain; i++) { //this allows one rain drop to fall//
      drop[i].display(); //this displays the raindrop//
      drop[i].move(); //this allows the raindrop to move (fall)//
      catch1.check(drop[i]); //this allows the catcher to catch the raindrop//
      catch1.Lose(drop[i]); //if the raindrop falls and the catcher doesnt catch it, the raindrop will go off screen and the player will lose a life//
    } 
    l1.display(); //displays a life (raindrop)//
    l2.display(); //displays a life (raindrop)//
    l3.display(); //displays a life (raindrop)//
    c1.display(); // the cloud will display//
    c1.move();  //the  cloud will move//
    catch1.display();  // the catcher is displayed//
    if (millis()-oldTime >=3000) { /*this is the timer. it will allow only one rain drop to fall after a certain time interval. 
     Specifically every three seconds, a new raindrop will fall*/
      oldTime = millis(); //restarts timer//
      rain++; //another drop will fall//
    }
  } 

  if (gameover == true) { //Loser screen//
    if (music == false) {
      player.close(); //stops the game's music//
      player = minim.loadFile("Heartbreaker.mp3"); //now the loser music will play//
      player.loop(); //the music will play on a continuous loop until the game is restarted//
    } /*this allows for music to change when the player loses the game. a new song will play and the song before it will stop. 
     the new song will now play on a continuous loop until the player restarts the game*/
    music = true; //booleans change to help run the game//
    background(Loser); //the background for the losing screen will be displayed//
    textAlign(CENTER); // the text will be aligned in the center//
    fill(255, 0, 0); //this gives the color of the text//
    textSize(64); //this is the size of the text// 
    text("YOU LOSE", width/2, (height/2)-50); //Loser text//
    fill(255); //this gives the color of the text//
    textSize(20); //this is the size of the text// 
    fill(255, 0, 0); //this gives the color of the text//
    text("CLICK THE BUTTON TO RESTART", imagex, imagey+50); //instructions on restarting the game//
    imageMode(CENTER); //the image is aligned in the center//
    image(Button, imagex, imagey, ButtonS, ButtonS); //this is the restart button//
  } 

  if (run==false && go == true) { //this is used so the pause button will work//
    textSize(10); //this is the size of the text// 
    textAlign(CENTER); // the text will be aligned in the center//
    fill(0, 255, 0); //this gives the color of the pause button//
    rect(rx, ry, rw, rh); //pause button//
    fill(0); //this gives the color of the text//
    text("CONTINUE", (rw/2) + rx, (rh/2) + ry); //instructions for tha pause button to continue the game//
    oldTime = millis(); //restart the timer//
  }
  else if (run == true && go == true) { //this is used so the pause button will work//
    textSize(14); //this is the size of the text// 
    textAlign(CENTER); // the text will be aligned in the center//
    fill(255, 0, 0); //this gives the color of the pause button//
    rect(rx, ry, rw, rh); //pause button//
    fill(0); //this gives the color of the text//
    text("PAUSE", (rw/2) + rx, (rh/2) + ry); //instructions for tha pause button to pause the game//
  }

  if (score == 30) { //this is the score the player needs to reach to win the game//
    win = true; //allows for the winning screen to appear//
    if (win==true) { //Winner screen//
      if (music == false) {
        player.close(); //stops the game's music//
        player = minim.loadFile("Roller Coaster.mp3"); //now the winner music will play//
        player.loop(); //the music will play on a continuous loop until the game is restarted//
      } /*this allows for music to change when the player wins the game. a new song will play and the song before it will stop. 
       the new song will now play on a continuous loop until the player restarts the game*/
      music = true; //booleans change to help run the game//
      go = false; //booleans change to help run the game//
      background(Winner); //the background for the winning screen will be displayed//
      textSize(64); //this is the size of the text// 
      fill(random(255), random(255), random(255)); //this gives the color of the text//
      text("YOU WIN", width/2, (height/2)-50); //Winner text//
      fill(255); //this gives the color of the text//
      textSize(26); //this gives the size of the text// 
      text("CLICK THE BUTTON TO PLAY AGAIN :)", imagex, imagey+75); //instructions on restarting the game//
      imageMode(CENTER); //the image is aligned in the center//
      image(Button, imagex, imagey, ButtonS, ButtonS); //this is the restart button//
    }
  }
} 



void mousePressed() {
  if (go == false && gameover == false && win == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    go = !go; //parameters of the start button. Mouse must be inside the button. when clicked, the game will work//
  }

  if (go == false && gameover == true && win == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    //parameters of the restart button. Mouse must be inside the button. when clicked, it will work//
    go = true; //booleans change to restart the game//
    gameover = false; //booleans change to restart the game//
    lives = 3; //start off with three lives again//
    score = 0; //start off with a score of zero again//
    music = false; //boolean changes to restart the game's music//
    player.close(); //stops the winner music//
    player = minim.loadFile("Bad Day.mp3"); //game's music will be loaded again//
    player.loop(); //game's music will be played on a continuous loop again//
  } //this allows for the game to go from the winning screen to the actual game//

  if (win == true && go == false && gameover == false && mouseX>imagex-(ButtonS/2)&&mouseX<imagex+(ButtonS/2)&&mouseY>imagey-(ButtonS/2)&&mouseY<imagey+(ButtonS/2)) {
    //parameters of the restart button. Mouse must be inside the button. when clicked, it will work//
    go = true; //booleans change to restart the game//
    gameover = false; //booleans change to restart the game//
    win = false; //booleans change to restart the game//
    lives = 3; //start off with three lives again//
    score = 0; //start off with a score of zero again//
    music = false; //boolean changes to restart the game's music//
    player.close(); //stops the loser music//
    player = minim.loadFile("Bad Day.mp3"); //game's music will be loaded again//
    player.loop(); //game's music will be played on a continuous loop again//
  } //this allows for the game to go from the losing screen to the actual game//

  if (go == true && gameover == false && win == false && mouseX>rx&&mouseX<rx+rw&&mouseY>ry&&mouseY<ry+rh) {
    run = !run; //parameters of the pause button. Mouse must be inside the button. when clicked, it will pause or continue the game//
  }
}

void stop() { // this allows for the music to be stopped. this is needed so that the music playing before will stop in the transition of winning or losing//
  player.close();
  minim.stop();
  super.stop();
} 

