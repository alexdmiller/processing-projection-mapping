import codeanticode.syphon.*;
import jsyphon.*;

float t;

PImage img;
SyphonClient client;
DraggableShape shape;

void settings() {
  size(960, 540, P3D);
  PJOGL.profile = 1;
  
}

void setup() {
  client = new SyphonClient(this, "VDMX5", "Layer 1");
  img = createImage(600, 600, RGB);
  shape = new DraggableShape(0, 0, 100, 100);
  smooth();
}

void draw() {
  background(0);
  
  if (client.active()) {
    img = client.getImage(img);
    
    image(img, 0, 0, width/2, (float) img.height / img.width * width / 2);
  }
  
  //translate(width / 2, height / 2);
  //rotateY(t);
  //beginShape();
  //texture(img);
  //vertex(-100, -100, 0, 0,   0);
  //vertex( 100, -100, 0, 400, 0);
  //vertex( 100,  100, 0, 400, 400);
  //endShape();
  
  //t += 0.01;
  
  stroke(255);
  line(width/2, 0, width/2, height);
    
  shape.draw();
  
}

void mousePressed() {
  shape.mouseDown(new PVector(mouseX, mouseY));
}

void mouseDragged() {
  shape.mouseMoved(new PVector(mouseX, mouseY));
}

void mouseReleased() {
  shape.mouseUp(); 
}