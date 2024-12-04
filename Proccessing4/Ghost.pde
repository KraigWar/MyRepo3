class Ghost {
  PVector position = new PVector(400, 200);
  PVector velocity = new PVector(0.5, 0);
  PVector acceleration = new PVector(0.09, 0);
  int size = 50;

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    println(velocity);
    println(position);
    if (position.x > width - size / 2 || position.x < 0 + size) {
      acceleration.x *= -1;
      velocity.x *= -1;
    }
  }
  
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
