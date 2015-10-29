class Menu {
  
  int tSize = 1;
  float titleX, titleY;
  
  Circle button;
  Circle player;
  
  boolean start;
  
  void setup() {
    // Scale game title
    tSize = 1;
    textSize(tSize);
    while (textWidth(GAME_TITLE) < width/2) {
      tSize++;
      textSize(tSize);
    }
    
    // Center game title
    titleX = (width/2) - (textWidth(GAME_TITLE)/2);
    titleY = height/4;
    
    // Create button
    button = new Circle(width*7/10, height*7/10, height/4);
    print(button.circleStroke);
    button.setFill(new Color(255));
    button.setStroke(new Color(0));
    print(button.circleStroke);
    
    // Create player
    player = new Circle(width-button.x, button.y, button.radius+20);
    player.setFill(new Color(0));
    
    // Start player circle in desired location
    mouseX = (int) player.x;
    mouseY = (int) player.y;
    
    // Set button-eclipsed value to false
    start = false;
  }
  
  void update() {
    player.setPos(mouseX, mouseY);
    if (player.encompasses(button)) {
      start = true;
    }
  }
  
  void transitionDisplay() {
    background(255);
    textSize(tSize);
    fill(0);
    text(GAME_TITLE, titleX, titleY);
    player.display();
    button.display();
  }
  
  void display() {
    background(255);
    player.display();
    button.display();
    fill(255);
    textSize(tSize+1);
    text(GAME_TITLE, titleX, titleY);
    textSize(tSize);
    fill(0);
    text(GAME_TITLE, titleX, titleY);
  }
  
  void clearObjects() {
    button = null;
    player = null;
  }
}
