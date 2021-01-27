class Enemy extends GameObject {
 
  Enemy() {
   super(/*x,y,z*/);
   //float x = random(-1000,1000);
   //float y = height;
  // float z = random(-1000,1000);
   //loc = new PVector(x,y,z);
 
  }
  
  
  void show() {
  world.pushMatrix();
  world.translate(loc.x,loc.y,loc.z);
  world.sphere(30);
  world.popMatrix();
  }
  
  void act() {
    /*
    for(int i = 0; i < 50; i++) {
    this.y -= 5;
    } 
    */
    
    
    
  }
  
  
}
