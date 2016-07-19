import codeanticode.syphon.*;
import jsyphon.*;
import java.util.List;
import java.util.ArrayList;

float t;

PImage img;
SyphonClient client;

List<DraggableShape> shapes;
DraggableShape inShape;
DraggableShape outShape;
Mesh mesh;


void settings() {
  size(960, 540, P3D);
  PJOGL.profile = 1;
}

void setup() {
  mesh = new Mesh(10, 300, 200);
  
  ((PGraphicsOpenGL)g).textureSampling(3);
  
  shapes = new ArrayList<DraggableShape>();
  
  client = new SyphonClient(this, "VDMX5", "Layer 1");
  img = createImage(600, 600, RGB);
  
  inShape = new DraggableShape(0, 0, 300, 200);
  outShape = new DraggableShape(width/2, 0, 300, 200);
  
  shapes.add(inShape);
  shapes.add(outShape);
  
  smooth();
}

void draw() {
  background(0);
  
  if (client.active()) {
    img = client.getImage(img);
    image(img, 0, 0, width/2, (float) img.height / img.width * width / 2);
  }
  
  outShape.pShape.setTexture(img);
  for (int i = 0; i < inShape.pShape.getVertexCount(); i++) {
    PVector inV = inShape.pShape.getVertex(i);
   
    float scale = (width / 2.0) / img.width;
    outShape.pShape.setTextureUV(i,
        inV.x / scale, inV.y / scale);
  }

  stroke(255);
  line(width/2, 0, width/2, height);
    
  for (DraggableShape shape : shapes) {
    shape.draw();
  }
  
  mesh.draw();
}

void mousePressed() {
  for (DraggableShape shape : shapes) {
    shape.mouseDown(new PVector(mouseX, mouseY));
  } 
}

void mouseDragged() {
  for (DraggableShape shape : shapes) {
    shape.mouseMoved(new PVector(mouseX, mouseY));
  }
  
  mesh.setOutputCorners(
      outShape.get(DraggableShape.TOP_LEFT),
      outShape.get(DraggableShape.TOP_RIGHT),
      outShape.get(DraggableShape.BOTTOM_RIGHT),
      outShape.get(DraggableShape.BOTTOM_LEFT));
}

void mouseReleased() {
  for (DraggableShape shape : shapes) {
    shape.mouseUp();
  }   
}