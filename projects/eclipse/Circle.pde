class Circle {
  
  final int MAX_RADIUS_NEEDED = ceil(sqrt(sq(width) + sq(height)));
  
  float x, y, radius;
  Color circleFill, circleStroke;
  
  Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.circleFill = new Color(255);
    this.circleStroke = null;
//    this.circleStroke = new Color(255);
  }
  
  void display() {
    if (this.circleStroke == null) {
      noStroke();
    } else {
      stroke(this.circleStroke.getColor());
    }
    fill(this.circleFill.getColor());
    ellipse(x, y, radius*2, radius*2);
  }
  
  void setPos(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setRadius(float r) {
    this.radius = radius;
  }
  
  void setFill(Color cFill) {
    this.circleFill = cFill;
  }
  
  void setStroke(Color cStroke) {
    this.circleStroke = cStroke;
  }
  
  float getLeftX() {
    return x - radius;
  }
  float getRightX() {
    return x + radius;
  }
  float getTopY() {
    return y - radius;
  }
  float getBotY() {
    return y + radius;
  }
  
  boolean encompasses(Circle other) {
    return (radius >= other.radius && dist(this.x, this.y, other.x, other.y) < radius-other.radius);
  }
  boolean sees(Circle other) {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2)) < radius + other.radius;
  }
  
  boolean encompassesScreen() { // There's surely some math I can do to make this better
    return radius >= MAX_RADIUS_NEEDED;
  }
}
