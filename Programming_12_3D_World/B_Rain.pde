class Rain extends GameObject{
  
  PVector g;
  float speed; 
  
  Rain() {
    super(random(-2000,2000), random(-100,0),random(-2000,2000),random(3,8),1); //x, y, z, size, color
                                                                                //speed dependant on size 
  speed = size;
  g = new PVector(0,speed*2,0);
    
  }
  
  void act() {
    if(this.loc.y < 790) {
    loc.add(g);
    } else {
      this.loc.y = random(-100,0); 
    }
    
  }
  
  void show() {
   world.pushMatrix();
   world.translate(loc.x, loc.y, loc.z);
   world.fill(bloodRed);
   world.box(size);
   world.popMatrix();
  }
  
  
  
}
