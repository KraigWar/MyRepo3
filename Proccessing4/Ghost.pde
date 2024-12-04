class Ghost {
  //initialize all the Pvectores with their parameters
  //Copied the initialization from previous in class practice
  PVector position = new PVector(400, 200);
  PVector velocity = new PVector(0.1, 0);
  PVector acceleration = new PVector(0.03, 0);
  //imitalize the size of the ghost
  int size = 50;

  //function for adding velocity and acceleration as well as reversing the ghost when it hits the side
  //Copied the basic physics from previous project
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    //if statement to reverse the velocity and acceleration whenever it hits the sides of the screen
    if (position.x > width - size / 2 || position.x < 0 + size) {
      acceleration.x *= -1;
      velocity.x *= -1;
    }
  }
    //Creating the ghost illustration
    void display() {
    fill(255);
    noStroke();
    //The Ghost Head
    ellipse(position.x, position.y, size, size);
    rect(position.x - size / 2, position.y, size, size / 2, 20);
    
    //The ghost eyes
    fill(0);
    ellipse(position.x - 10, position.y - 10, 8, 8);
    ellipse(position.x + 10, position.y - 10, 8, 8);
    
    //The ghost Smile
    noFill();
    stroke(0);
    strokeWeight(2);
    arc(position.x, position.y + 10, 20, 10, radians(0), radians(180));
  }
  
}
