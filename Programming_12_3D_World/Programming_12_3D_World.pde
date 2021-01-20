import java.awt.Robot;

//Robot for mouse control
Robot rbt;

//colors
color black = #000000;     // for oakPlanks 
color white = #FFFFFF;     // white for empty space
color steelBlue = #7092BE; //color for mossyBricks 

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
boolean wkey, akey, skey, dkey;

//Rotation variables
float leftRightAngle;
float upDownAngle; 

void setup() {
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  purPurBlock = loadImage("Purpur_Block.png");
  textureMode(NORMAL);
  
  
  noCursor();
  try {
    rbt = new Robot();
    
  }
  catch(Exception e) {
   e.printStackTrace(); 
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
 size(displayWidth,displayHeight,P3D);
 
 eyex = height/2;
 eyey = 93*height/100;
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
 background(0);
 
// lights();
 
pointLight(255, 255, 255, eyex, eyey, eyez);

camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
//line(x1, y1, z1, x2, y2, z2);
move();
drawAxis();
drawFloor(-2000, 2000, height, gridSize); // floor 
drawFloor(-2000, 2000, height-gridSize*4, gridSize); // ceiling
drawInterface();
drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
     color c = map.get(x,y); 
     if (c == steelBlue) {
       for (int i = 0; i < 3; i++){ //for stacking the blocks 
       texturedCube(x*gridSize-2000, height-gridSize*i-100, y*gridSize-2000, mossyStone, gridSize);
       }
  
    }
     if (c == black) {
       for (int i = 0; i < 3; i++){ //for stacking the blocks 
       texturedCube(x*gridSize-2000, height-gridSize*i-100, y*gridSize-2000, purPurBlock, gridSize);
       }
     }
     
     
  } //for int y
  } //for int x
  
  
}// for the function

void drawInterface() { 
  pushMatrix();
 stroke(200,0,0);
 strokeWeight(5);
 line(width/2-10, height/2, width/2+10, height/2);
 line(width/2, height/2-10, width/2, height/2+10);
 popMatrix();
}

void move() { 
  pushMatrix();
  translate(focusx,focusy,focusz);
  fill(250,0,0);
  sphere(5);
  popMatrix();
  
  
 if(akey && canMoveLeft() ) {
   eyex += cos(leftRightAngle - PI/2)*10;   //PI/2 is 90 extra degrees
   eyez += sin(leftRightAngle - PI/2)*10;;
   
 }
 
 if(dkey && canMoveRight() ) { 
    eyex += cos(leftRightAngle + PI/2)*10;   //PI/2 is 90 extra degrees
    eyez += sin(leftRightAngle + PI/2)*10;;
 }
 
 if(wkey && canMoveFoward() ) {
   eyex += cos(leftRightAngle)*10;
   eyez += sin(leftRightAngle)*10;
 }
 
 if(skey && canMoveBack() ) {
   eyex -= cos(leftRightAngle)*10;
   eyez -= sin(leftRightAngle)*10;
 }
 
 focusx = eyex + cos(leftRightAngle)*300;
 focusy = eyey + tan(upDownAngle)*300;
 focusz = eyez + sin(leftRightAngle)*300;
 
 leftRightAngle += (mouseX - pmouseX)*0.01;
 upDownAngle += (mouseY-pmouseY)*0.01;
 
 if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  
 if (mouseX > width-2) rbt.mouseMove (3, mouseY);
 if (mouseX < 2) rbt.mouseMove(width-3, mouseY); //3 so it doesn't trigger the other if statement 
 
 //leftRightAngle += 0.01;
 //upDownAngle += 0.01
}

boolean canMoveFoward() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz, rightx, rightz; ;
  int mapx, mapy, leftmapx, leftmapy, rightmapx, rightmapy;
  int extraD = 25; 
  
 fwdx = eyex + cos(leftRightAngle)*200;
 fwdy = eyey;
 fwdz = eyez + sin(leftRightAngle)*200;
 
 leftx = eyex + cos(leftRightAngle+radians(extraD))*200; //left is + right is -
 leftz = eyez + sin(leftRightAngle+radians(extraD))*200;
 
 rightx = eyex + cos(leftRightAngle-radians(extraD))*200;
 rightz = eyez + sin(leftRightAngle-radians(extraD))*200;
 
 
 mapx = int(fwdx + 2000) / gridSize; //adding because we orginally subtracted 2000
 mapy = int(fwdz + 2000) / gridSize;
 
 leftmapx = int(leftx + 2000) / gridSize; 
 leftmapy = int(leftz + 2000) / gridSize; 
 
 rightmapx = int(rightx + 2000) / gridSize;
 rightmapy = int(rightz + 2000) / gridSize; 
 
 
 if (map.get(mapx, mapy) != white || map.get(leftmapx, leftmapy) != white || map.get(rightmapx, rightmapy) != white) {
  return false;
 } else {
  return true;  
 }
 
 }
  


boolean canMoveLeft() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz, rightx, rightz; ;
  int mapx, mapy, leftmapx, leftmapy, rightmapx, rightmapy;
  int extraD = 60; 
  float becauseDirection = PI/2; // 90 degrees 
  
 fwdx = eyex + cos(leftRightAngle - becauseDirection)*200;
 fwdy = eyey;
 fwdz = eyez + sin(leftRightAngle - becauseDirection)*200;
 
 leftx = eyex + cos(leftRightAngle - becauseDirection +radians(extraD))*200; //left is + right is -
 leftz = eyez + sin(leftRightAngle - becauseDirection +radians(extraD))*200;
 
 rightx = eyex + cos(leftRightAngle - becauseDirection -radians(extraD))*200;
 rightz = eyez + sin(leftRightAngle - becauseDirection -radians(extraD))*200;
 
 
 mapx = int(fwdx + 2000) / gridSize; //adding because we orginally subtracted 2000
 mapy = int(fwdz + 2000) / gridSize;
 
 leftmapx = int(leftx + 2000) / gridSize; 
 leftmapy = int(leftz + 2000) / gridSize; 
 
 rightmapx = int(rightx + 2000) / gridSize;
 rightmapy = int(rightz + 2000) / gridSize; 
 
 
 if (map.get(mapx, mapy) != white || map.get(leftmapx, leftmapy) != white || map.get(rightmapx, rightmapy) != white) {
  return false;
 } else {
  return true;  
 }
  
}

boolean canMoveRight() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz, rightx, rightz; ;
  int mapx, mapy, leftmapx, leftmapy, rightmapx, rightmapy;
  int extraD = 60; 
  float becauseDirection = PI/2; // 90 degrees 
  
 fwdx = eyex + cos(leftRightAngle + becauseDirection)*200;
 fwdy = eyey;
 fwdz = eyez + sin(leftRightAngle + becauseDirection)*200;
 
 leftx = eyex + cos(leftRightAngle + becauseDirection +radians(extraD))*200 +becauseDirection; //left is + right is -
 leftz = eyez + sin(leftRightAngle + becauseDirection +radians(extraD))*200 +becauseDirection;
 
 rightx = eyex + cos(leftRightAngle + becauseDirection -radians(extraD))*200 +becauseDirection;
 rightz = eyez + sin(leftRightAngle + becauseDirection -radians(extraD))*200 +becauseDirection;
 
 
 mapx = int(fwdx + 2000) / gridSize; //adding because we orginally subtracted 2000
 mapy = int(fwdz + 2000) / gridSize;
 
 leftmapx = int(leftx + 2000) / gridSize; 
 leftmapy = int(leftz + 2000) / gridSize; 
 
 rightmapx = int(rightx + 2000) / gridSize;
 rightmapy = int(rightz + 2000) / gridSize; 
 
 
 if (map.get(mapx, mapy) != white || map.get(leftmapx, leftmapy) != white || map.get(rightmapx, rightmapy) != white) {
  return false;
 } else {
  return true;  
 }
  
}

boolean canMoveBack() { 
  float fwdx, fwdy, fwdz;
  float leftx, leftz, rightx, rightz; ;
  int mapx, mapy, leftmapx, leftmapy, rightmapx, rightmapy;
  int extraD = 25; 
  
 fwdx = eyex - cos(leftRightAngle)*200;
 fwdy = eyey;
 fwdz = eyez - sin(leftRightAngle)*200;
 
 leftx = eyex - cos(leftRightAngle+radians(extraD))*200; //left is + right is -
 leftz = eyez - sin(leftRightAngle+radians(extraD))*200;
 
 rightx = eyex - cos(leftRightAngle-radians(extraD))*200;
 rightz = eyez - sin(leftRightAngle-radians(extraD))*200;
 
 
 mapx = int(fwdx + 2000) / gridSize; //adding because we orginally subtracted 2000
 mapy = int(fwdz + 2000) / gridSize;
 
 leftmapx = int(leftx + 2000) / gridSize; 
 leftmapy = int(leftz + 2000) / gridSize; 
 
 rightmapx = int(rightx + 2000) / gridSize;
 rightmapy = int(rightz + 2000) / gridSize; 
 
 
 if (map.get(mapx, mapy) != white || map.get(leftmapx, leftmapy) != white || map.get(rightmapx, rightmapy) != white) {
  return false;
 } else {
  return true;  
 }
  
}

void drawAxis() {
  stroke(200,0,0);
  strokeWeight(3);
 line(0,0,0,1000,0,0); //x axis
 line(0,0,0,0,1000,0); //y axis
 line(0,0,0,0,0,1000); //z axis
  
}

void drawFloor(int start, int end, int floorHeight, int floorSpacing) { 
  stroke(255);
  //line(width/2, height, -1000, width/2, height, 1000);
  
  int x = start;
  int z = start;
  while (z < end) {
    //line(x, floorHeight, start, x, floorHeight, end);
    //line(start, floorHeight, z, end, floorHeight, z);
    texturedCube(x, floorHeight, z, oakPlanks, floorSpacing);
    x += floorSpacing;
    if(x >= end) {
    x = start;
    z += floorSpacing;
     
    }
    
  }
  
//for (int x = -2000; x < 2000; x += 100) {
 
}
