void loadAllShapes() {
  heart = loadShape("Heart2.obj");
  world.texture(red);
  
  zombie = loadShape("Noob.obj");
  world.texture(zombieGreen);
  
  
  
  camera = new PeasyCam(this, 0, 0, 0, 50);
  
}








//This is for testing an object 
void addObject(float x, float y, float z, float sizeX, float sizeY, float sizeZ, float rotX, float rotY, float rotZ, PShape object, PImage texture){
  world.pushMatrix();
  world.translate(x, y, z);
  object.setTexture(texture);
  world.scale(sizeX,sizeY,sizeZ);
  world.rotateX( radians(rotX) );
  world.rotateY( radians(rotY) );
  world.rotateZ( radians(rotZ) );
  world.shape(object);
  world.popMatrix();
  
  
}

//scale 

//shape
