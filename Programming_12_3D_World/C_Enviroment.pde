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

void drawAxis() {
  world.stroke(200,0,0);
  world.strokeWeight(3);
  world.line(0,0,0,1000,0,0); //x axis
  world.line(0,0,0,0,1000,0); //y axis
  world.line(0,0,0,0,0,1000); //z axis
  
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
  
}
