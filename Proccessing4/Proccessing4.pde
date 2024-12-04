//Hello Attempt #3 of Implimenting all of this
//Declare the ghost object
Ghost ghost;

//set up booleans to check when the game is in progress or not and for the start screen
boolean startScreen = true;
boolean inGame = false;
boolean gameOver = false;
//---------------------------------------------------------------------------

//set up a start time
int startTime = 0;
//set the score limit
int targetScore = 10;
//set the players score to default 0
int score = 0;
//set the amount of time the player will have
int timeLimit = 10;
//a boolean that will check if the player won or not
boolean hasWon = false;
//Declaring the image variables needed
PImage Start;
PImage Lose;
PImage Wining;
//delcare the array that will store the machine objects with a maximum of 6 in the array
Machine[] machines = new Machine[6];


void setup() {
  size(800, 400);
  //initialize the ghost object
  ghost = new Ghost();
  //set the image mode to centre so I can haev the images set to the middle of the screen when used
  imageMode(CENTER);
  //initialize the actual image PNGs with variables to use later
  Start = loadImage("StartBut.png");
  Lose = loadImage("Over.png");
  Wining = loadImage("Win.png");
  //-----------------------------------------
  //set up the loop to for the background objects but include the a gap along the X axis depending on how far in the array you are
  //Set the y value to be random to make them less linear looking
  for (int i = 0; i < machines.length; i++) {
    machines[i] = new Machine(50 + i * 150, random(50, 300));
  }
}

void draw() {
  //set background colour to a gray
  background(80, 80, 100);

  //Connect the booleans with the functions created later to display them when they activate----------------------
  if (startScreen) {
    StartScreen();
  }
  if (inGame) {
    runGame();
  }
  if (gameOver) {
    GameOver();
  }
}
//--------------------------------------------------------------------------

//Everything that will happen while the game is running
void runGame() {
  //set a way to check the amount of time that has passed while playing. Must divide by 1000 to not be milliseconds
  int elapsedTime = (millis() - startTime) / 1000;
  //Create the lose condition and win condition that will later display an indicator to the player
  //check if they won by reaching the targeted score
  if (score >= targetScore) {
    hasWon = true;
    gameOver = true;
    inGame = false;
    //if they instead took too long, make a game over happen
  } else if (elapsedTime >= timeLimit) {
    gameOver = true;
    hasWon = false;
    inGame = false;
  }
  //while the game is playing, diplay the background shapes
  Fbackground();

  //the loop to display the machines while the gmae is playing
  for (int i = 0; i< machines.length; i++) {
    machines[i].Mdisplay();
  }

  //set the score to be located on the top left of the screen so players know when they are close to completing the game
  fill(255);
  textSize(20);
  text("Score: " + score, 10, 30);
  //Show the ghost and its update function while you are in the game
  ghost.display();
  ghost.update();
}

//function for the start screen
void StartScreen() {
  background(0);
  //display the start button in the center of the screen
  image(Start, width/2, height/2);
  //set the score back to 0 or else it will be an infite loop of winning the game with 10 + score
  score = 0;
}

//function for the gmae over screen that includes which screen to display when the game ends
void GameOver() {
  background(0);
  //Checks if you have reached the win condition. If you hev won showt he "you win" image, if not show the "you lose" image in the center of the screen
  if (hasWon) {
    image(Wining, width/2, height/2);
  } else {
    image(Lose, width/2, height/2);
  }
  //----------------------------------------------------
}
//function for the factory background
void Fbackground() {
  //loop that creates a rectangle that goes to the height of the screen
  for (int i = 0; i < height; i += 100) {
    fill(50);
    rect(0, i, width, 20);
  }
}

//function for checking if the mouse is over the ghost even when its moving. The score will increase when the function is called later
void checkghosthover() {
  if ((mouseX - 25 < ghost.position.x && mouseX + 25 > ghost.position.x) && (mouseY - 25 < ghost.position.y && mouseY + 25 > ghost.position.y)) {
    score++;
  }
}


void mouseClicked() {
  //Declare a timer variable to fix issues of restarting the gmae once you win
  int elapsedTime = (millis() - startTime) / 1000;
  if (startScreen) {
     //if you are in the start screen and you click the mouse, stop the start screen and put you in the game
    startScreen = false;
    inGame = true;
    //Reset the timer when leaving the start screen so the game will reset properly and not lose right away
    startTime = millis();
    //reset the positin, velocity, and acceleration to the center whener the game 'resets'
    //If I do not do this with the 'update' function, if the game restarts with the ghost going to the left, when the game starts again it will try going the opposite direction
    ghost.position.x = 400;
    ghost.velocity.x = 0.5;
    ghost.acceleration.x = 0.09;
  }
  if (gameOver) {
    //if the game is over wait for 3 seconds to make sure clicking the ghost to win doesn't skip this screen and starts the game right away
    if (elapsedTime > 3) {
      //if we are in the game over screen and you click, stop mkaing the gmae over screen and go back to the start screen 
      startScreen = true;
      gameOver = false;
    }
  }
}

//Whenever you click with the mouse, run the check function to see it your over the ghost which will then increase your score
void mousePressed() {
  checkghosthover();
}
