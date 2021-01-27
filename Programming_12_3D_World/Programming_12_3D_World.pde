import java.awt.Robot;

//Robot for mouse control
Robot rbt;

//colors
color black = #000000;     // for oakPlanks 
color white = #FFFFFF;     // white for empty space
color steelBlue = #7092BE; //color for mossyBricks 
color skyBlue = #00CCFF;   //for the sky

//textures
PImage mossyStone;
PImage oakPlanks;
PImage purPurBlock;

//Map variables
int gridSize;
PImage map;


//Camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//Interaction
boolean wkey, akey, skey, dkey, spacekey;

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

void setup() {
  //Creates canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //Creates game object list
  objects = new ArrayList<GameObject>();
  
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  purPurBlock = loadImage("Purpur_Block.png");
 
  
  
  noCursor();
  try {
    rbt = new Robot();
    
  }
  catch(Exception e) {
   e.printStackTrace(); 
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
 size(displayWidth,displayHeight,P2D);
 
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
 
}

void draw() { 

   if (mode == INTRO){
    intro();
  }
  else if (mode == GAME){
    game();                  //World is in game();
  }
  else if (mode == PAUSE){
    pause();
  }
  else if (mode == GAMEOVER){
    gameOver();
  }
  else if (mode == GAMEWIN){
    
  }
  else{
   println("ERROR! YOUR MODE IS" + mode); 
  }

  
}


  
//for (int x = -2000; x < 2000; x += 100) {
 
