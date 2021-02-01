//ctrl shift r to limit to size(800,800) to make mouse wrap around code

import peasy.*;

import java.awt.Robot;
//Robot for mouse control

//For shapes
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

//For music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;




//shapes 3d by peter legar 
//Must import Shapes 3D 

Robot rbt;

PeasyCam camera;

//colors
color black = #000000;     // for oakPlanks 
color white = #FFFFFF;     // white for empty space
color steelBlue = #7092BE; //color for mossyBricks 
color skyBlue = #00CCFF;   //for the sky
color evilRed = #990000;   //for enemies
color bloodRed = #880808;  //for rain
color darkRed =  #8B0000;
color ivyGreen = #009955;


//textures
PImage mossyStone;
PImage oakPlanks;
PImage purPurBlock;

//3D Image to Object
PShape heart; 
PShape zombie; 

//3D textures for Objects
PImage red; 
PImage zombieGreen;

//Images for decoration
PImage warrior;
PImage ninja;
PImage pensive; 
PImage jimmy; 
PImage regularShow;

//Map variables
int gridSize;
PImage map;


//Camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//Interaction
boolean wkey, akey, skey, dkey, spacekey;

//Character life and shooting timer
int charLife; 
int shotTimer = 30;
int threshold = 30; 

//Spawn time
int enemyTime; 
int lifeTime; 

//Enemy bullet location
float enemyBulletX;
float enemyBulletY;

//Rotation variables
float leftRightAngle;
float upDownAngle; 

//Game Objects
ArrayList<GameObject> objects; 

//Canvases
PGraphics world;
PGraphics HUD;

//Mode Framework 
int mode = 2;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE =3;
final int GAMEOVER = 4;
final int GAMEWIN = 5; 
final int OPTION = 6; 

//minim (sound effects)
 
 Minim minim;
 AudioPlayer intro, life, shot, trumpet, mainTheme, gameOver, gameWin, oof;


void setup() {
  //Music *********************************************** NOTE: THE MUSIC WAS NOT MADE BE ME; CREDITS GO TO THEIR RESPECTIVE OWNERS ************************************
  minim = new Minim(this);
  intro = minim.loadFile("mario bros theme.mp3");              //Intro, life, and shot all from Mario franchise by Nintendo 
  life = minim.loadFile("1UP.wav");
  shot = minim.loadFile("Fireball.wav");                        
  trumpet = minim.loadFile("Trumpet_Victory.mp3");             //Credits: https://freesound.org/people/FunWithSound/sounds/456966/        
  mainTheme = minim.loadFile("Super_Mario_World.mp3");         //Credits: Super Mario World - Castle Theme Orchestral Cover (OC/DC)   By: David Chirol Link :https://www.youtube.com/watch?v=TQq7SbtlGkI&list=PLw54vxuFdKlx2OMnjEOn5CAWquyIJ41h2&index=62
  gameOver = minim.loadFile("Sailor_Moon_R_OST_Relaxing.mp3"); //Credits: https://www.youtube.com/watch?v=ALRe9MZCgYM&list=PLw54vxuFdKlx2OMnjEOn5CAWquyIJ41h2&index=63 
  oof = minim.loadFile("OOF.mp3");                             //Credits: Roblox death sound by Roblox 
  
  //Creates canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //Creates game object list
  objects = new ArrayList<GameObject>();
  
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  purPurBlock = loadImage("Purpur_Block.png");
  
  //Textures for custom PShapes
  red = loadImage("red.jpg");
  zombieGreen = loadImage("zombieGreen.jpg");
  
  //Images for decoration
  warrior = loadImage("Warrior.png");
  ninja = loadImage("Ninja.png");
  pensive = loadImage("Pensive.png");
  jimmy = loadImage("Jimmy_Neutron.png");
  regularShow = loadImage("Mordecai_and_Rigby.png");
  
  //Lives of player 
  charLife = 3; 
  
  //Timer of enemies
  enemyTime = 5999;
  lifeTime = 5999;

  
  try {
    rbt = new Robot();
    
  }
  catch(Exception e) {
   e.printStackTrace(); 
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
   //size(displayWidth,displayHeight,P2D);
   //fullScreen(P2D);
   //surface.setResizable(true);
   size(800,800,P2D);
 
 eyex = height/2;
 eyey = 90*height/100;
 eyez = height/2; 
 
 focusx = eyex;
 focusy = eyey;
 focusz = eyez - 100;
 
 upx = 0;
 upy = 1;
 upz = 0;
 
 //initalizing the map
 map = loadImage("map.png");
 gridSize = 100;
 
 //Initalizing rain 
 
 //for(int i = 0; i < 150; i++) objects.add( new Rain() ); 
  
 loadAllShapes(); 
 
}

void draw() { 

   if (mode == INTRO){
    intro();
    cursor();
  }
  else if (mode == GAME){
    game();                  //World is in game();
    noCursor();
    
  }
  else if (mode == PAUSE){
    pause();
    cursor();
  }
  else if (mode == GAMEOVER){
    gameOver();
    cursor();
  }
  else if (mode == GAMEWIN){
    gameWin();
    cursor();
  }
  else if (mode == OPTION) {
    option();
    cursor();
  }
  else{
   println("ERROR! YOUR MODE IS" + mode); 
  }

  
}


  
//for (int x = -2000; x < 2000; x += 100) {
 
