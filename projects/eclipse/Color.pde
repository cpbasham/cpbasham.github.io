class Color {
  
  float r, g, b, a;
  
  Color(float c) {
    this.r = c;
    this.g = c;
    this.b = c;
    this.a = 255;
  }
  
  Color(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = 255;
  }
  
  Color(float r, float g, float b, float a) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
  
  color getColor() {
    return color(r, g, b, a);
  }
  
}
