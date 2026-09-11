void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
  background(35, 15, 5);
  int sWidth = 55;  
  int sHeight = 35; 
  for (int x = -sWidth; x <= width + sWidth; x += 20) {
    int yOffset = 0;
    if ((x / 20) % 2 != 0) {
      yOffset = sHeight / 2;
    }
    for (int y = -sHeight; y <= height + sHeight; y += sHeight) {
      scale(x, y + yOffset);
    }
  }
}

void scale(int x, int y) {
  float sizeVar = (float)(Math.random() * 0.3 + 0.85);
  float xMove = (float)(Math.random() * 4 - 2);
  float yMove = (float)(Math.random() * 4 - 2);
  float curveVar = (float)(Math.random() * 6 - 3);     
  
  pushMatrix();
  translate(x + xMove, y + yMove);
  stroke(120, 30, 0);
  strokeWeight(2);
  fill(180, 50, 0); 
  
  beginShape();
  vertex(-10 * sizeVar, -25 * sizeVar);
  bezierVertex(15 * sizeVar, -25 * sizeVar, (25 + curveVar) * sizeVar, -10 * sizeVar, (25 + curveVar) * sizeVar, 0); 
  bezierVertex((25 + curveVar) * sizeVar, 10 * sizeVar, 15 * sizeVar, 25 * sizeVar, -10 * sizeVar, 25 * sizeVar);    
  bezierVertex(-20 * sizeVar, 15 * sizeVar, -20 * sizeVar, -15 * sizeVar, -10 * sizeVar, -25 * sizeVar); 
  endShape(CLOSE);
  
  noStroke();
  int layers = 15;
  for (int i = 0; i < layers; i++) {
    float j = (float) i / (layers - 1);
    int r = (int) (230 + (255 - 230) * j);
    int g = (int) (90 + (210 - 90) * j);
    int b = (int) (0 + (60 - 0) * j);
    fill(r, g, b, 200);
    float factor = (1.0 - (0.75 * j)) * sizeVar;
    float xShift = (-2 + (10 - (-2)) * j) * sizeVar;
    float y1 = -22 * factor;
    float x1 = (-8 * factor) + xShift;
    float y2 = 22 * factor;
    float x2 = ((22 + curveVar * 0.5) * factor) + xShift;
    
    beginShape();
    vertex(x1, y1);
    bezierVertex(12 * factor + xShift, y1, x2, -8 * factor, x2, 0);
    bezierVertex(x2, 8 * factor, 12 * factor + xShift, y2, x1, y2);
    bezierVertex(-18 * factor + xShift, 12 * factor, -18 * factor + xShift, -12 * factor, x1, y1);
    endShape(CLOSE);
  }
  fill(255, 250, 210);
  noStroke();
  ellipse(16 * sizeVar, 0, 5 * sizeVar, 5 * sizeVar);
  popMatrix();
}
