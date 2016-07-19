class Mesh {
  int res = 10; 
  MeshPoint[] mesh;

  Mesh(int res, float inWidth, float inHeight) {
    this.res = res;
    this.mesh = new MeshPoint[res * res];
    
    float xStep = inWidth / res;
    float yStep = inHeight / res;
    
    for (int i = 0; i < mesh.length; i++) {
      float x = i % res;
      float y = i / res;
      println(x, y);
      this.mesh[i] = new MeshPoint();
      this.mesh[i].x = this.mesh[i].u = x * xStep;
      this.mesh[i].y = this.mesh[i].v = y * yStep;
    }
  }

  void setOutputCorners(PVector tl, PVector tr, PVector br, PVector bl) {
    for (int i = 0; i < mesh.length; i++) {
      // this.mesh[i]
    }
  }
  
  void draw() {
    stroke(255);
    noFill();
    beginShape(QUADS);
    for (int x = 0; x < res - 1; x++) {
      for (int y = 0; y < res - 1; y++) {
        MeshPoint tl = mesh[x + y * res];
        vertex(tl.x, tl.y);
        MeshPoint tr = mesh[(x + 1) + y * res];
        vertex(tr.x, tr.y);
        MeshPoint br = mesh[(x + 1) + (y + 1) * res];
        vertex(br.x, br.y);
        MeshPoint bl = mesh[x + (y + 1) * res];
        vertex(bl.x, bl.y);
      }
    }
    endShape(CLOSE);
  }
}