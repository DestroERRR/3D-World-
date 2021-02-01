void gameWin() {
  pushMatrix();
  
  if (mainTheme.isPlaying() && mode != GAME ) mainTheme.pause();
  
  trumpet.play();
  
    background(200,0,0);
   textAlign(CENTER);
   rectMode(CENTER);

  textSize(40);
button(600,700,200,100, "INTRO");
button(200,700,200,100, "EXIT");
text("YOU WIN! CONGRATIUALTIONS" ,400,200-120);
text("YOU HAVE SLAIN ALL THE MONSTERS,", 400,260-120);
text("CLEARLY, YOU ARE THE CHOSEN ONE" , 400,320-120);

textSize(28);
button(250,340,150,70, "HOORAY");

image(jimmy, 0, 200);

regularShow.resize(400,420);
image(regularShow, 380,230);

popMatrix();
}

void gameWinClicks() {
   if(buttonPressed(600,700,200,100) ){
 
  setup();
  mode = INTRO;
  intro.rewind();
  //gameWin.pause();
 }
 if (buttonPressed(200,700,200,100) ){
  exit(); 
 }
 
 if (buttonPressed(250,340,150,70) ){
   //play the victory music  
   trumpet.rewind();
   trumpet.play();
   
 }
 
}
