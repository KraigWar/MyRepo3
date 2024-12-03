//Hello Attempt #3
Game game;
Ghost ghost;
Player player;


void setup() {
  size(800, 400);
  //make the game itself be an object to use later for the boolean to start and end it when condition is met
  game = new Game();
  ghost = new Ghost();
  player = new Player();
  background(0);
}
