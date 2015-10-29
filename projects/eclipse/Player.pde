class Player extends Circle {
  
  Player(int x, int y, int radius) {
    super(x, y, radius);
  }
  
  Player(Circle c) {
    super(c.x, c.y, c.radius);
    setFill(c.circleFill);
    setStroke(c.circleStroke);
  }
  
  void update() {
    setPos(mouseX, mouseY);
  }
  
}
