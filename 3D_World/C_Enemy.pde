class Enemy extends GameObject {
 
  PVector rise;
  float h;
  int EshotTimer;
  int Ethreshold; 
  
  
  Enemy() {
   super(random(-1000,1000),height,random(-1000,1000),1,1);
   h = 720; //where the enemy stops rising 
   rise = new PVector(0,-0.5, 0);
   EshotTimer = 0;
   Ethreshold = 60;
 
  }
  
  
  void show() {
  world.pushMatrix();
  world.translate(loc.x,loc.y,loc.z);
  world.fill(evilRed);
  world.sphere(30);
  world.popMatrix();
  }
  
  void act() {
   if(this.loc.y <= 800 && this.loc.y > h){
      loc.add(rise);
   }
       EshotTimer++;
   if (EshotTimer > Ethreshold && this.loc.y <= h) {
       EshotTimer = 0;
       objects.add(new Bullet(ivyGreen, loc.x, 710, loc.z) );
   }
    
    for(int i = 0; i < objects.size(); i++ ) {
     GameObject obj = objects.get(i);
     if (obj instanceof Bullet && !obj.EnemyBullet) {
       if(dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) < size + obj.size*4){  //to make it easier to hit...
         lives--;
         println("it hit");
       }
     }
     
     
     
    }
    
 
    
    
  }
  
  
}
