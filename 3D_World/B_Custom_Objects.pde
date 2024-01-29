class customObjects extends GameObject{ 
  
  float speed;
  PVector g;
  PVector chase; 
  
  float sizeX, sizeY, sizeZ;
  float rotX, rotY, rotZ;
  PImage texture;
  PShape object;
  
  boolean heartRotation = false;
  boolean zombieChase = false; 
  
  customObjects(PShape customObject) {
      //super(random(-1000,1000),height,random(-1000,1000),1,1);
    if (customObject == heart) {
      lives = 1;
      loc = new PVector(random(-1000,1000),0,random(-1000,1000) );
      g = new PVector(0,2,0);
      
      sizeX = sizeY = sizeZ = 4;
      rotX = 90;
      rotY = 0;
      rotZ = 0;
      object = heart;
      texture = red;
      heartRotation = true;
      touchingHeart = true;
    
     // addObject(1000,760,1000, 4, 4, 4, 90, 0, heartRotation, heart,red); //x,y,z,sizeX,sizeY,sizeZ,rotX,rotY,rotZ, shape, texture
    }
    
    if (customObject == zombie) {
      /*
      loc = new PVector(random(-1000,1000),height-10,random(-1000,1000) );
      chase = new PVector(eyex - loc.x, eyey - loc.y, eyez - loc.z);
      chase.setMag(5);
      sizeX = 10;
      sizeY = 10;
      sizeZ = 10;
      rotX = 90;
      rotY = 45;
      rotZ = 0;
      heartRotation = false;
      zombieChase = true; 
      touchingHeart = false; 
      texture = red; 
      object = zombie; 
      */
    }
    
  }
  
  void show() {
  world.pushMatrix();
  world.translate(loc.x, loc.y, loc.z);
  object.setTexture(texture);
  world.scale(sizeX,sizeY,sizeZ);
  world.rotateX( radians(rotX) );
  world.rotateY( radians(rotY) );
  world.rotateZ( radians(rotZ) );
  world.shape(object);
  world.popMatrix();
  
  }
  
  void act() {
    
    if(heartRotation == true){ // For only the heart to rotate
    rotZ += 4; 
      if(this.loc.y <= 765 && heartRotation == true) {
    loc.add(g);                // So heart can float down 
      }
      
     /* if (zombieChase  == true) {
       loc.add(chase); 
      }
    */
    }
    
    
  }
  
}
