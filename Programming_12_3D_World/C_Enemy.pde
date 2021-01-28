class Enemy extends GameObject {
 
  PVector rise;

  
  Enemy() {
   super(random(-1000,1000),height,random(-1000,1000),1,1);
   
   rise = new PVector(0,-2, 0);
 
  }
  
  
  void show() {
  world.pushMatrix();
  world.translate(loc.x,loc.y,loc.z);
  world.fill(evilRed);
  world.sphere(30);
  world.popMatrix();
  }
  
  void act() {
   if(this.loc.y <= 800 && this.loc.y > 760){
      loc.add(rise);
   }
    
    
    
  }
  
  
}
