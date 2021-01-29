class Bullet extends GameObject {
  
  PVector dir;
  float speed;
  PVector vel;

  
  Bullet(color c) {
   super(eyex, eyey, eyez, 10, c);
   if (c == white){
   speed = 50;
   float vx = cos(leftRightAngle);
   float vy = tan(upDownAngle);
   float vz = sin(leftRightAngle);
   dir = new PVector(vx, vy, vz);
   dir.setMag(speed);
   EnemyBullet = false; 
   }
 /*  if(c == ivyGreen) {
     loc = new PVector(loc.x, loc.y, loc.z);
     speed = 30;
     dir = new PVector(1,0,1);
     //dir = new PVector(eyex - loc.x, 710, eyez - loc.z);
     dir.setMag(speed);
   }
   */
  }
  
  Bullet(color c, float x, float h, float z){
    
   if(c == ivyGreen) { 
   loc = new PVector(x, h+10, z);
   speed = 5;
   dir = new PVector(eyex - x, eyey - h, eyez - z);
   dir.setMag(speed);
   EnemyBullet = true;
   }
   
   
  }

  
  
  
  
  void act() {
    int hitx = int(loc.x + 2000) / gridSize;
    int hity = int(loc.z + 2000) / gridSize;
    if (map.get(hitx, hity) != white) {
     lives = 0;
      for (int i = 0; i < 8; i++) {
        objects.add(new Particle(loc)); 
      }
      
    } else {
      loc.add(dir);
      
      }
    }
    
  }
  
