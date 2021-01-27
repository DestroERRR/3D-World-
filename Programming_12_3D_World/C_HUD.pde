void drawCrosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2-20, height/2, width/2+20, height/2);
  HUD.line(width/2, height/2-20, width/2, height/2+20);
  
   
}

void drawMinimap() {
  HUD.image(map, 50, 50, 160, 160); //image x4 
  
  int miniX = int(eyex+2000)/gridSize;
  int miniY = int(eyez+2000)/gridSize;
  
  HUD.textSize(18);
  HUD.fill(white);
  HUD.text("X: " + miniX,  50, 240);
  HUD.text("Y: " + miniY,  50, 260);
  
  HUD.strokeWeight(0);
  HUD.stroke(255,0,0);
  HUD.fill(255,0,0);
  HUD.rect(miniX*4+50, miniY*4+50, 6, 6); //indicator of where char is on map
                                      //also must multiply by 4 because image is 4x bigger
}
