void gameOver() {
  pushMatrix();
  
  if (mainTheme.isPlaying() && mode != GAME ) mainTheme.pause();
  
   if (!gameOver.isPlaying() && mode == GAMEOVER ) { //looping theme if it ends 
 gameOver.rewind();
 gameOver.play();
 }
  
  background(255);
  textAlign(CENTER);
  rectMode(CENTER);
  
//for rec pattern 
int a = 0;
int b = 0;
int c = 20;
  
  a = 40;
b = 40;

while (b <= 800){
  fill(random(255),random(255),random(255));
rect(a,b,c,c,5);

a = a + 100;
if ( a > 800){
  a = 40;
 b = b + 100; 
}
  
  textSize(40);
button(600,650,200,100, "INTRO");
button(200,650,200,100, "EXIT");
text("YOU DIED!", 400,100);
text("HOW COULD THE HERO DIE???" ,400,200);

image(pensive, 10, 250);
image(pensive, 285, 250);
image(pensive, 285*2, 250);



}


popMatrix();
}

void gameOverClicks() {
  if(buttonPressed(600,650,200,100)){
   setup();
  intro.rewind();
  //gameOver.pause();
  mode = INTRO; 
  
 }
 if (buttonPressed(200,650,200,100)){
  exit(); 
 }
}
