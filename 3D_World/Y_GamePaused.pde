void pause(){
  
  
  //accessories 
  pushMatrix();
  textAlign(CENTER);
   fill(0);
  textSize(50);
  text("Game is Paused", 400,400);
  
  
  rectMode(CENTER);
 fill(255,2); // changes color slowly omg brooooo
 rect(400,400,400,500);
  popMatrix();
  
  pushMatrix();
  fill(0);
  text("Press any key",400,600);
  text("to resume", 400, 650);
  //button(400,600,200,100, "RESUME");
  textSize(28);
  button(720,50,100,50, "QUIT");
  
  
  
  
  popMatrix();
}

void pauseClicks(){
 

if(buttonPressed(720,50,100,50)){
     mode = GAMEOVER;
   }

}
