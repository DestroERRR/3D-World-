class GameObject {
  
  PVector loc; 
  float size;
  float lives;
  color myColor;
  boolean EnemyBullet;
  
  boolean touchingHeart;
  
  //Default
  GameObject() {
   loc = new PVector(0,0,0);
   size = 10;
   lives = 1;
  }
  
  GameObject(float x, float y, float z, float s, color c) {
   lives = 1;
   loc = new PVector(x, y, z);
   size = s;
   myColor = c;
  }
  
  void act() {
   
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x , loc.y, loc.z);
    world.fill(myColor);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
 
  
  
 
 
  
}
