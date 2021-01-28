void move() { 
 if (frameCount < 2) {
  rbt.mouseMove(width/2, height/2);
  mouseX = width/2;
  mouseY = height/2;
}
if (mouseX < 1) {
  rbt.mouseMove(width-2, mouseY);
} else if (mouseX > width-2) {
  rbt.mouseMove(1, mouseY);
} 
leftRightAngle += (mouseX - pmouseX)*0.01;
upDownAngle    += (mouseY - pmouseY)*0.005;
if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  
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
 
 if (spacekey) {
  objects.add(new Bullet(white)); 
  
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
  int extraD = 30; 
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
  int extraD = 30; 
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
