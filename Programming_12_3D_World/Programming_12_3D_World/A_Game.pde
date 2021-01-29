int time = 5999; 
void game() {
 world.beginDraw();
 world.textureMode(NORMAL);
 world.background(skyBlue);
 
 //println(time);
 time++;
 if (time == 6000) {
  objects.add(new Enemy()); 
  time = 0;
 }
 
 
// lights();
 
world.pointLight(255, 255, 255, eyex, eyey, eyez);

world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
//line(x1, y1, z1, x2, y2, z2);
drawAxis();
drawFloor(-2000, 2000, height, gridSize); // floor 
//drawFloor(-2000, 2000, height-gridSize*4, gridSize); // ceiling
move();
drawInterface();
drawMap();

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
