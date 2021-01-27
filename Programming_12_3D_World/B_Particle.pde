class Particle extends GameObject {
 
   PVector vel;
   PVector g;
   float speed;
   float time;
   
   Particle(PVector newLocation) {
     super();
     time = 200;
     loc = newLocation.copy();
     speed = 30;
     float vx = random(-3, 3);
     float vy = random(-3, 0);
     float vz = random(-3, 3);
     vel = new PVector(vx, vy, vz);
     vel.setMag(speed);
     g = new PVector(0, 3, 0);
   }
   
   void act() {
    if (loc.y >= height) {
      loc.y = height;
    } else if (loc.y <= height-gridSize*3) {
     loc.y = height-gridSize*3; 
    } else {
      vel.add(g);
      loc.add(vel);
      }
    
   }
   
   
   void show() {
   world.pushMatrix();
   world.translate(loc.x, loc.y, loc.z);
   world.fill(white, time);
   world.box(size);
   world.popMatrix();
   time--;
   }
  
}
