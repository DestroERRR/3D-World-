void option() {
  pushMatrix();
  
  background(0,200,0);
  textAlign(CENTER);
  rectMode(CENTER);
  textSize(40);
  button(130,720,200,100,"INTRO");
  
  popMatrix();
}

void optionClicks() {
   if(buttonPressed(130,720,200,100)){
     mode = INTRO;
   }
}
