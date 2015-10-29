//import processing.sound.*;
//SoundFile soundFile;

final String GAME_TITLE = "Eclipse";

Menu menu;
Game game;

int display_mode;
final int MENU = 0;
final int TRANS_ONE = 1;
final int GAME = 2;
final int TRANS_TWO = 3;

int timer;

float nextPlayerRadius;

void setup() {
//  orientation(LANDSCAPE);
  size(1280, 730);
  
  display_mode = MENU;
  timer = millis();
  
  menu = new Menu();
  menu.setup();
}

void draw() {
  
  switch(display_mode) {
    
    case MENU:
      menu.update();
      menu.display();
      if (menu.start) {
        display_mode = TRANS_ONE;
        menu.button.setPos((menu.button.x + menu.player.x)/2,
                           (menu.button.y + menu.player.y)/2);
        menu.button.setStroke(null);
      }
      break;
    case TRANS_ONE:
      menu.player.radius += 10;
      menu.button.setPos(mouseX, mouseY);
      menu.transitionDisplay();
      if (menu.player.encompassesScreen()) {
        display_mode = GAME;
        game = new Game();
        game.setBackground(menu.player.fill);
        game.player = new Player(menu.button);
        game.target = new Target(game.player, game.background);
        menu.clearObjects();
      }
      break;
    case GAME:
      game.update();
      game.display();
      if (game.player.encompasses(game.target)) {
        nextPlayerRadius = game.player.radius;
        display_mode = TRANS_TWO;
        game.ghosts.add(new Ghost(game.player, game.target));
        game.player.fill.a = 255;
      } else {
        Ghost toRemove = null;
        for (Ghost g : game.ghosts) {
          if (g.radius > game.player.radius && g.encompasses(game.player)) {
            toRemove = g;
            break;
          }
        }
        if (toRemove != null) {
          game.ghosts.remove(toRemove);
          game.ghosts.add(new Ghost(game.player));
          game.player = new Player(toRemove);
        }
      }
      break;
    case TRANS_TWO:
      game.player.radius += 10;
      game.target.setPos(mouseX, mouseY);
      game.display();
      if (game.player.encompassesScreen()) {
        display_mode = GAME;
        game.setBackground(game.player.fill);
        game.player = new Player(game.target);
        game.player.setRadius(nextPlayerRadius);
        game.target = new Target(game.player, game.background);
      }
      break;
    default:
      throw new RuntimeException("Display mode '" + display_mode + "' not handled.");
  }
}


