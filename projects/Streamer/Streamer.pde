final color EMPTY_RECT = color(200, 200, 200);
final color PLAYER_RECT = color(50, 50, 200);
final color PLAYER_TRAIL = color(75, 75, 225);
final color SEEKER_RECT = color(200, 50, 50);
final color SEEKER_TRAIL = color(225, 75, 75);
final color COLLIDE_RECT = color(200, 50, 200);

final int MAX_VEHICLES = 30;

color wallColor;
boolean colorWallsEnabled = true;

int resolutionDivisionOptions[] = {2, 5, 10};

BG_Rect playerRect;

int scrollClock;
int vehicleAddClock;

Seeker_Grid bg;
ArrayList<Vehicle> vehicles;

void setup() {

  vehicles = new ArrayList<Vehicle>();
//  size(1280, 730);
//  size(640, 365);
//  size(960, 540);
  size(960, 600);
  // for (int i=0; i<10; i++) {
  //   int s = vehicles.size();
  //   Vehicle v = getRandomVehicle(6, 12, .2, .6);
  //   vehicles.add(v);
  // }
  square_setup(64, 38);
//    square_setup(20);
  square_draw_init();
  gameState = 1;
  scrollClock = millis();
  vehicleAddClock = scrollClock;
}

// Initializes Seeker_Grid bg
void square_setup(int division) {
  int numCols = width/division;
  int numRows = height/division;
  int rectHeight = height/numRows;
  int rectWidth = width/numCols;
  bg = new Seeker_Grid(numCols, numRows, rectWidth, rectHeight);
  playerRect = bg.getRectAtCoords(width/2, height/2);
//  enemyRect = bg.getRectAtCoords(v.location.x, v.location.y);
}
void square_setup(int numCols, int numRows) {
  println(width);
  println(height);
  int rectHeight = height/numRows;
  int rectWidth = width/numCols;
  bg = new Seeker_Grid(numCols, numRows, rectWidth, rectHeight);
  playerRect = bg.getRectAtCoords(width/2, height/2);
//  enemyRect = bg.getRectAtCoords(v.location.x, v.location.y);
}

// Draws the grid, assuming bg has been initialized
void square_draw_init() {
  background(0);
  bg.fillRects(EMPTY_RECT);
  playerRect.display(PLAYER_RECT);
  for (Vehicle v : vehicles) {
    v.bgrect = bg.getRectAtCoords(v.location.x, v.location.y);
    bg.drawRect(v.bgrect, v.c);
  }
}

void draw() {

  PVector mouse = new PVector(mouseX, mouseY);

  if (scrollTimeStep(25)) {
    scroll();
    randomizeSeekerTrailColor();
  }
  int vSize = vehicles.size();
  if (vehicleTimeStep(3000) && vSize < MAX_VEHICLES) {
    vehicles.add(getRandomVehicle(18, 24, .2+vSize*.1, .6+vSize*.1));
  }
  BG_Rect newPlayerRect = bg.getRectAtCoords(mouseX, mouseY);
  bg.drawRect(playerRect, PLAYER_RECT);

  Vehicle toDelete = null;

  for (Vehicle v : vehicles) {
    v.seek(mouse);
    v.update();
    if (v.location.x < 0) {
      toDelete = v;
    }
    BG_Rect newEnemyRect = bg.getRectAtCoords(v.location.x, v.location.y);
    if (v.bgrect != newEnemyRect) {
      bg.drawRect(v.bgrect, v.trailC);
      v.bgrect = newEnemyRect;
    }
  }
  vehicles.remove(toDelete);

  bg.drawRect(playerRect, PLAYER_TRAIL);
  playerRect = newPlayerRect;
//  }


  fill(25, 25, 150);
  fill(0);
  rect(0, height-40, 265, 40);
  fill(255);
  textSize(32);
  text("Cameron Basham", 3, height-10);
}


// Requires scrollClock to be initialized
boolean scrollTimeStep(int stepSize) {
  int currentTime = millis();
  if (currentTime - scrollClock >= stepSize) {
    scrollClock = currentTime;
    return true;
  }
  return false;
}

boolean vehicleTimeStep(int stepSize) {
  int currentTime = millis();
  if (currentTime - vehicleAddClock >= stepSize) {
    vehicleAddClock = currentTime;
    return true;
  }
  return false;
}

void scroll() {
  bg.scroll();
  if (colorWallsEnabled) {
    wallColor = bg.colorWall(wallColor, .15);
  }
  for (Vehicle v : vehicles) {
    v.location.x -= bg.rectWidth;
  }
}

void randomizeSeekerTrailColor() {
  for (Vehicle v : vehicles) {
//    if (random(1) < .2) {
      if (random(1) < .05) {
      v.trailC = color(random(256), random(256), random(256));
    }
  }
}

Vehicle getRandomVehicle(int minSpeed, int maxSpeed, float minForce, float maxForce) {
    Vehicle v = new Vehicle(width/2, height/2);
    v.maxspeed = random(minSpeed, maxSpeed);
    v.maxforce = random(minForce, maxForce);
    v.c = SEEKER_RECT;
    v.trailC = SEEKER_TRAIL;
    return v;
}
