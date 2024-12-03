//Hello Attempt #3 of Implimenting all of this
Ghost ghost;
//set up booleans to check when the game is playing later
boolean inGame = false;
boolean gameOver = false;
//set up a starting timer to track
int startTime = 0;
//set the score limit
int targetScore = 10;
//set the players score to 0
int score = 0;
//set the amount of time the player will have
int timeLimit = 10;
//a boolean that will check if the player won or not
boolean hasWon = false;
PImage Start;
PImage Lose;
PImage Wining;


void setup() {
  size(800, 400);
  ghost = new Ghost();
  imageMode(CENTER);
  Start = loadImage("StartBut.png");
  Lose = loadImage("Over.png");
  Wining = loadImage("Win.png");
}

void draw() {
  //set background colour to a gray
  background(80, 80, 100);
  if (!inGame) {
    StartScreen();
  } else if (gameOver) {
    GameOver();
  } else {
    runGame();
  }
}

void runGame() {
  //set a way to check the amount of time that has passed while playing
  int elapsedTime = (millis() - startTime) / 1000;
  //Create the lose condition and win condition that will later display an indicator to the player
  //check if they won by reaching the targeted score
  if (score >= targetScore) {
    hasWon = true;
    gameOver = true;
    //if they instead took too long, make a game over happen
  } else if (elapsedTime >= timeLimit) {
    gameOver = true;
    hasWon = false;
  }
  fill(255);
  textSize(20);
  text("Score: " + score, 10, 30);
  ghost.display();
  ghost.update();
  println(elapsedTime);
}


void StartScreen() {
  background(0);
  image(Start, width/2, height/2);
}


void GameOver() {
  background(0);
  if(hasWon){
    image(Wining, width/2, height/2);
  }else {
  image(Lose, width/2, height/2);
}
}
