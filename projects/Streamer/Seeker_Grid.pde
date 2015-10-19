class Seeker_Grid {
  
//  final int COLOR_DISTANCE = 50;
  int rMixer;
  int gMixer;
  int bMixer;
  
  int numCols, numRows;
  int rectWidth, rectHeight;
  int xOffset, yOffset;
  
  float rotation = 0;
  
  BG_Rect outOfBoundsRect;
  ArrayList<BG_Rect> grid;
  ArrayList<BG_Rect> colorChanged;
  ArrayList<BG_Rect> colorChangedTemp;
  
  Seeker_Grid(int numCols, int numRows, int rectWidth, int rectHeight) {
    this.numCols = numCols;
    this.numRows = numRows;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
//    outOfBoundsRect = new BG_Rect(width+1, height+1, 0, 0);
//    outOfBoundsRect = new BG_Rect(-width, -height, 0, 0);
    
    xOffset = (width - (numCols * rectWidth)) / 2;
    yOffset = (height - (numRows * rectHeight)) / 2;
    colorChanged = new ArrayList<BG_Rect>();
    colorChangedTemp = new ArrayList<BG_Rect>();
    grid = new ArrayList<BG_Rect>();
    for (int row=0; row<numRows; row++) {
      BG_Rect leftNeighbor = null;
      for (int col=0; col<numCols; col++) {
        BG_Rect r = new BG_Rect(col*rectWidth+xOffset, row*rectHeight+yOffset, rectWidth, rectHeight, leftNeighbor);
        r.c = EMPTY_RECT;
        leftNeighbor = r;
        grid.add(r);
      }
    }
    
    rMixer = 128;
    gMixer = 128;
    bMixer = 128;
  }
  
  BG_Rect getRect(int x, int y) {
    if (x < 0 || x >= numCols || y < 0 || y >= numRows) {
      return null;//outOfBoundsRect;
    }
    return grid.get(y*numCols+x);
  }
  
  BG_Rect getRectAtCoords(float x, float y) {
    if (x < xOffset || y < yOffset || x > numCols * rectWidth + xOffset || y > numRows * rectHeight + yOffset) {
      return null;//outOfBoundsRect;
    }
    return getRect(int((x-xOffset)/rectWidth), int((y-yOffset)/rectHeight));
  }
  
  void fillRects(color c) {
    fill(c);
    for (BG_Rect r : grid) {
      r.display(c);
    }
  }
  
  void drawRect(BG_Rect rect, color c) {
    if (rect != null) {
      rect.c = c;
      rect.display(c);
    }
  }
  
  void undrawRect(BG_Rect rect) {
    if (rect != null) {
      rect.c = EMPTY_RECT;
      rect.display(EMPTY_RECT);
    }
  }

//  void scroll() {
//    BG_Rect nextRect;
//    for (BG_Rect rect : grid) {
//      undrawRect(rect);
////      if (rect.x < (xOffset + (rectWidth * numCols))) {
//        nextRect = getRectAtCoords(rect.x + rectWidth, rect.y);
//        if (nextRect != null) {
//          drawRect(rect, nextRect.c);
//        }
////      }
//    }
//  }
void scroll() {
  BG_Rect leftRect;
  for (BG_Rect rect : colorChanged) {
    drawRect(rect, rect.c);
    if (rect.leftNeighbor != null) {
      colorChangedTemp.add(rect.leftNeighbor);
      rect.leftNeighbor.c = rect.c;
    }
  }
  colorChanged = colorChangedTemp;
  colorChangedTemp = new ArrayList<BG_Rect>();
}

  
  color colorWall(color c, float changeChance) {
    int yIndex = 0;
    int xIndex = numCols - 1;
    BG_Rect rect;
    while (yIndex < numRows) {
      rect = getRect(xIndex, yIndex);
      colorChanged.add(rect);
      rect.c = c;
      yIndex++;
    }
    if (random(1) < changeChance) {
      int rMixer = 255;
      int gMixer = 255;
      int bMixer = 255;
      int randMix = (int) random(4);
      if (randMix == 0) {
        gMixer = 0;
        bMixer = 0;
      } else if (randMix == 1) {
        rMixer = 0;
        bMixer = 0;
      } else if (randMix == 2) {
        rMixer = 0;
        gMixer = 0;
      }
//      c = color(random(256), random(256), random(256));
      c = color((random(256)+rMixer)/2, (random(256)+gMixer)/2, (random(256)+bMixer)/2);
    }
    return c;
  }
//  void scroll() {
//    BG_Rect nextRect;
//    for (BG_Rect rect : grid) {
//      if (rect.x == xOffset) {
//        undrawRect(rect);
//      }
//      if (rect.x < (xOffset + (rectWidth * numCols))) {
//        nextRect = getRectAtCoords(rect.x + rectWidth, rect.y);
//        if (nextRect.drawn) {
////          println("" + int((rect.x-xOffset)/numCols) + ", " + int((rect.y-yOffset)/numRows) + "  ---  " + int((nextRect.x-xOffset)/numCols) + ", " + int((nextRect.y-yOffset)/numRows));
//          drawRect(rect, nextRect.c);
//        }
//        undrawRect(nextRect);
//      }
//    }
//  }

  
}
