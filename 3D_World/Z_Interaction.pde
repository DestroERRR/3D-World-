void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;  
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ') spacekey = true; 
  
    if (key == 'p' && mode == GAME ){
    mode = PAUSE;
      
    } else if (mode == PAUSE){ 
  mode = GAME;  
     
  }
  
  
}

void keyReleased() { 
  if (key == 'w' || key == 'W')wkey = false;  
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ') spacekey = false;
}

void mouseReleased(){
  
   if (mode == INTRO){
    introClicks();
  }
  else if (mode == GAME){
    gameClicks();
  }
  else if (mode == PAUSE){
    pauseClicks();
  }
  else if (mode == GAMEOVER){
    gameOverClicks();
    
  } 
  else if (mode == OPTION) {
    optionClicks(); 
  }
  else if (mode == GAMEWIN) {
    gameWinClicks(); 
  }
  
  
}
