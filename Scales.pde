void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
  background(35, 15, 5);
  int Width = 55;  
  int Height = 35; 
  for (int x = -Width; x <= width + Width; x += 20) {
    int yOffset = 0;
    if ((x / 20) % 2 != 0) {
      yOffset = Height / 2;
    }
    for (int y = -Height; y <= height + Height; y += Height) {
      scale(x, y + yOffset);
    }
  }
}

void scale(int x, int y) {
  pushMatrix();
  translate(x, y);
  stroke(120, 30, 0);
  strokeWeight(2);
  fill(180, 50, 0); 
  
  beginShape();
  vertex(-25, -10);
  bezierVertex(-25, 15, -10, 25, 0, 25);
  bezierVertex(10, 25, 25, 15, 25, -10);   
  bezierVertex(15, -20, -15, -20, -25, -10); 
  endShape(CLOSE);

  noStroke();
  int layers = 15;
  for (int i = 0; i < layers; i++) {
    float j = (float) i / (layers - 1);
  
    int r = (int) (230 + (255 - 230) * j);
    int g = (int) (90 + (210 - 90) * j);
    int b = (int) (0 + (60 - 0) * j);
    fill(r, g, b, 200);
    
    float scaleFactor = 1.0 - (0.75 * j);
    float yShift = -2 + (10 - (-2)) * j;
    
    pushMatrix();
    translate(0, yShift);
    scale(scaleFactor);
    beginShape();
    vertex(-22, -8);
    bezierVertex(-22, 12, -8, 22, 0, 22);
    bezierVertex(8, 22, 22, 12, 22, -8);
    bezierVertex(12, -18, -12, -18, -22, -8);
    endShape(CLOSE);
    popMatrix();
  }
  fill(255, 250, 210);
  noStroke();
  ellipse(0, 16, 5, 5);
  popMatrix();
}
