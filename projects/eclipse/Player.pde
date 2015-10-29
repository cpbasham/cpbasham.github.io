class Player extends Circle {
  
  Player(int x, int y, int radius) {
    super(x, y, radius);
  }
  
  Player(Circle c) {
    super(c.x, c.y, c.radius);
    setFill(c.fill);
    setStroke(c.stroke);
  }
  
  void update() {
    setPos(mouseX, mouseY);
  }
  
}
