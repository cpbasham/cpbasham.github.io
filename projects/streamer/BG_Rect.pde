class BG_Rect {
  
  float x, y, w, h;
  color c;
  BG_Rect leftNeighbor;
  
  BG_Rect(float x, float y, float w, float h, BG_Rect leftNeighbor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.leftNeighbor = leftNeighbor;
  }
  
  void display(color c) {
    noStroke();
    fill(c);
    rect(x, y, w, h);
//    ellipse(x, y, w, h);
//    ellipse(x, y, w*3/4, h*3/4);
  }
  
}
