class DraggableShape {
  final float HANDLE_SIZE = 15;
  
  private PShape pShape;
  private int selectedVertex = -1;
  
  public DraggableShape(float x, float y, float w, float h) {
    this();
    pShape.beginShape();
    pShape.vertex(x, y);
    pShape.vertex(x + w, y);
    pShape.vertex(x + w, y + h);
    pShape.vertex(x, y + h);
    pShape.endShape(CLOSE);
  }
  
  public DraggableShape() {
    pShape = createShape();
  }
  
  public void draw() {
    pShape.setFill(color(0, 0, 0, 0));
    pShape.setStroke(color(100));
    pShape.setStrokeWeight(2);
    shape(pShape);
    
    for (int i = 0; i < pShape.getVertexCount(); i++) {
      PVector v = pShape.getVertex(i);
      if (i == selectedVertex) {
        fill(255, 255, 255, 100);
      } else {
        noFill();
      }
      strokeWeight(2);
      stroke(200);
      ellipse(v.x, v.y, HANDLE_SIZE, HANDLE_SIZE);
    }
  }
  
  public void mouseDown(PVector mouse) {
    for (int i = 0; i < pShape.getVertexCount(); i++) {
      PVector v = pShape.getVertex(i);
      if (mouse.dist(v) <= HANDLE_SIZE) {
        selectedVertex = i;
        break;
      }
    } 
  }
  
  public void mouseMoved(PVector mouse) {
    if (selectedVertex >= 0) {
      pShape.setVertex(selectedVertex, new PVector(mouse.x, mouse.y));
    }
  }
  
  public void mouseUp() {
    selectedVertex = -1;
  }
}