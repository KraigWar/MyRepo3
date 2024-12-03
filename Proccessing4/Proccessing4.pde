//Hello Attempt #3 of Implimenting all of this
Ghost ghost;
Player player;
 //set up booleans to check when the game is playing later
  boolean inGame = false;
  boolean GameOver = false;
  //set up a starting timer to track
  int startTime = 0;


void setup() {
  size(800, 400);
  ghost = new Ghost();
  player = new Player();

}

void draw(){
   //set background colour to a gray
   background(80, 80, 100);
  ghost.display();
  ghost.update();
  
  
}

void runGame() {

    //set a way to check the amount of time that has passed while playing
    int elapsedTime = (millis() - startTime) / 1000;
    //Create the lose condition and win condition that will later display an indicator to the player
    //check if they won by reaching the targeted score
    if (player.score >= player.targetScore) {
      GameOver = true;
      player.hasWon = true;
      //if they instead took too long, make a game over happen
    } else if (elapsedTime >= player.timeLimit) {
      GameOver = true;
    }
   }
