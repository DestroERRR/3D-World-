void intro() {
  pushMatrix();
  
  //Music
  
  if (gameOver.isPlaying() && mode != GAMEOVER ) gameOver.pause();
  
  
    if (!intro.isPlaying() && mode == INTRO ) { //looping theme if it ends 
 intro.rewind();
 intro.play();
 }
  
  background(0,200,0);
   rectMode(CENTER);
   textSize(72);
   /*
   text("GLADIATOR!",1100,displayHeight-1000);
   textSize(52);
   button(500,900,300,130,"START");
   button(1100,900,300,130,"OPTIONS");
   button(1700,900,300,130,"QUIT");
   text("HI", 2200,800);
   */
   textAlign(CENTER);
   textSize(72);
  text("GLADIATOR!",420,350);
  textSize(28);
  text("3D World Project", 320, 390);
 
  text("Press P to Pause", 405, 525);
 
  
  fill(255);
  //rect(200,600,200,100); //start
  
  textSize(40);
  //drawing the button
  button(160,600,200,100, "START");
  button(400,600,200,100, "OPTIONS");
  button(650,600,200,100, "QUIT");
  //button(100,100,200,100, "HI");
  //button(200,100,100,100, "YES");
  
  image(warrior, -75,0);
  
  image(ninja, 550,50);
  image(ninja, 490,50);
  image(ninja, 430,50);
  image(ninja, 370,50);
  image(ninja, 370-60,50);
  image(ninja, 370-120,50);
  image(ninja, 370-180,50);
  
  popMatrix();
}


void introClicks() {
  
    if(buttonPressed(180,600,200,100)){
      //setup();
      if (intro.isPlaying() ) {
    intro.pause();
 }
     mode = GAME;
    
   }
   if(buttonPressed(650,600,200,100)){
    exit(); 
   }
   
   if(buttonPressed(400,600,200,100) ){
     mode = OPTION;
   }
   
   
}
