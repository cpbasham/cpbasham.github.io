class Ghost extends Circle {
  
  Ghost(Circle circle) {
    super(circle.x, circle.y, circle.radius);
    setFill(circle.circleFill);
    mutateColor();
    setStroke(circle.circleStroke);
  }
  
  Ghost(Circle circle, Circle colorSource) {
    super(circle.x, circle.y, circle.radius);
    setFill(colorSource.circleFill);
    mutateColor();
    setStroke(colorSource.circleStroke);
  }
  
  void mutateColor() {
    int lower, higher;
    float avg = (circleFill.r + circleFill.g + circleFill.b) / 3;
    if (avg < 200) {
      lower = -15;
      higher = 30;
    } else {
      lower = -30;
      higher = 15;
    }
    float r = bound(circleFill.r + (int)random(lower,higher));
    float g = bound(circleFill.g + (int)random(lower,higher));
    float b = bound(circleFill.b + (int)random(lower,higher));
    setFill(new Color(r, g, b, 200));
  }
  
  float bound(float f) {
    if (f < 0) return 0;
    else if (f > 255) return 255;
    else return f;
  }
  
}
