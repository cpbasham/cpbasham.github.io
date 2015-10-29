class Target extends Circle {
  
  float xAngle;
  float yAngle;
  float xScalar;
  float yScalar;
  float xSpeed;
  float ySpeed;
  
  Target(Player player, Color b) {
    super(0, 0, player.radius*3/4);
    setFill(b);
    
    while (true) {
      initRandValues();
      if (! player.sees(this)) {
        break;
      }
    }
  }
  
  void initRandValues() {
    xAngle = random(3.14159);
    yAngle = random(3.14159);
    xScalar = random(width/2);
    yScalar = random(height/2);
    xSpeed = random(.05);
    ySpeed = random(.04);
    x = width/2 + cos(xAngle) * xScalar;
    y = height/2 + sin(yAngle) * yScalar;
  }
  
  void update() {
    xAngle += xSpeed;
    yAngle += ySpeed;
    x = width/2 + cos(xAngle) * xScalar;
    y = height/2 + sin(yAngle) * yScalar;
  }
  
}
