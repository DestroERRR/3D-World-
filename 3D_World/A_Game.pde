
void game() {
 world.beginDraw();
 world.textureMode(NORMAL);
 world.background(skyBlue);
 
 if (intro.isPlaying() && mode != INTRO ) intro.pause(); //pausing intro music
 
 //Playing game music
 if (!mainTheme.isPlaying() && mode == GAME ) { //looping theme if it ends 
 mainTheme.rewind();
 mainTheme.play();
 }
 //mainTheme.play();
  
 

 enemyTime++;
 if (enemyTime == 6000) {
  objects.add(new Enemy()); 
  objects.add(new customObjects(heart) );
  //objects.add(new customObjects(zombie) );
  enemyTime = 0;
 }
 
 lifeTime++;
 if (lifeTime == 6000) {
   objects.add(new customObjects(heart) ); 
 }
 
 
// lights();
 
world.pointLight(255, 255, 255, eyex, eyey, eyez);

world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
//line(x1, y1, z1, x2, y2, z2);
//drawAxis();
drawFloor(-2000, 2000, height, gridSize); // floor 
//drawFloor(-2000, 2000, height-gridSize*4, gridSize); // ceiling
move();
drawInterface();
drawMap();

//This is for testing out objects 
//addObject(1000,760,1000, 4, 4, 4, 90, 0, heartRotation, heart,red); //x,y,z,sizeX,sizeY,sizeZ,rotX,rotY,rotZ, shape, texture



for(int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
       objects.remove(i);
    }
}
  world.endDraw();
  image(world,0,0);
  
  
  HUD.beginDraw();
  HUD.clear(); //erases all pixels 
  drawCrosshair();
  drawMinimap();
  
  HUD.endDraw();
  image(HUD,0,0);

}

void gameClicks() {
  
}
