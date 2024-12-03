class Game {
  //set up booleans to check when the game is playing later
  boolean isActive = false;
  boolean isGameOver = false;
  //set up a starting timer to track
  int startTime = 0;
 
 
   void run() {
     //set background colour to a gray
    background(80, 80, 100);
    //set a way to check the amount of time that has passed while playing
    int elapsedTime = (millis() - startTime) / 1000;
    //Create the lose condition and win condition that will later display an indicator to the player
    //check if they won by reaching the targeted score
    if (player.score >= player.targetScore) {
      isGameOver = true;
      player.hasWon = true;
      //if they instead took too long, make a game over happen
    } else if (elapsedTime >= player.timeLimit) {
      isGameOver = true;
    }
   }
  }
