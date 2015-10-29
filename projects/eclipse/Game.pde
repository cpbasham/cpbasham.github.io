class Game {
  
  Player player;
  Target target;

  Color gameBackground = new Color(0);

  ArrayList<Ghost> ghosts = new ArrayList<Ghost>();
  
  int counter = 0;
  
  void update() {
    player.update();
    target.update();
    if (target.radius < player.radius*3/4) {
      target.radius += .1;
    }
  }
  
  void display() {
    background(gameBackground.getColor());
    player.display();
    target.display();
    for (Ghost g : ghosts) {
      g.display();
    }
  }
  
  void setBackground(Color c) {
    this.gameBackground = c;
  }
  
}
