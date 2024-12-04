class Machine {
  float x, y;
  
  Machine(float posX, float posY) {
    //constructors for varition of the mcahines x and y
    x = posX;
    y = posY;
  }
  //function for what he machine will look like
  void Mdisplay() {
    fill(100, 100, 120);
    rect(x, y-100, 100, 150);

    fill(200, 50, 50);
    ellipse(x + 50, y + 20, 20, 20);
  }
}
