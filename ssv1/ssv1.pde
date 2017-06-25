import peasy.*;

PShader vertexShader;
PShader fragmentShader;
PShader sceneShader;
PeasyCam cam;

boolean disableDepthTest;

void setup(){
  size(600,600,P3D);
  cam = new PeasyCam(this, width/2, height/2, width/2, 100);
  sceneShader = new PShader(this, "vertShader.glsl", "fragShader.glsl");
  
  sceneShader.set("u_time", 0.0);
}

float m;

void draw(){
  background(0);
  reloadFragmentShader();
  m = map(mouseY, 0, height, 0, 1);
  sceneShader.set("u_resolution", float(width), float(height));
  sceneShader.set("u_mouse", float(mouseX), float(mouseY));
  sceneShader.set("u_time", millis() / 1000.0);
  sceneShader.set("u_spd", m);

  fill(0);
  stroke(255);
  
  pushMatrix(); 
  resetShader();  
  shader(sceneShader);
  if(disableDepthTest){
   hint(DISABLE_DEPTH_TEST);
  } else {
    hint(ENABLE_DEPTH_TEST);
  }
  translate(width/2, height/2, width/2); 
  scale(10);
  shape(createCube());
  popMatrix();
}

void reloadFragmentShader(){
  sceneShader = loadShader("fragShader.glsl", "vertShader.glsl");
}

PShape createCube(){
  PShape c = createShape();
  resetShader();
  c.beginShape(QUADS);
 // +Z "front" face
  shader(sceneShader);
  c.vertex(-1, -1,  1, 0, 0);
  c.vertex( 1, -1,  1, 1, 0);
  c.vertex( 1,  1,  1, 1, 1);
  c.vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  c.vertex( 1, -1, -1, 0, 0);
  c.vertex(-1, -1, -1, 1, 0);
  c.vertex(-1,  1, -1, 1, 1);
  c.vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  c.vertex(-1,  1,  1, 0, 0);
  c.vertex( 1,  1,  1, 1, 0);
  c.vertex( 1,  1, -1, 1, 1);
  c.vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  c.vertex(-1, -1, -1, 0, 0);
  c.vertex( 1, -1, -1, 1, 0);
  c.vertex( 1, -1,  1, 1, 1);
  c.vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  c.vertex( 1, -1,  1, 0, 0);
  c.vertex( 1, -1, -1, 1, 0);
  c.vertex( 1,  1, -1, 1, 1);
  c.vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  c.vertex(-1, -1, -1, 0, 0);
  c.vertex(-1, -1,  1, 1, 0);
  c.vertex(-1,  1,  1, 1, 1);
  c.vertex(-1,  1, -1, 0, 1);

  c.endShape();
  return c;
}

void keyPressed(){
  switch(key){
  case 'd':
    disableDepthTest = !disableDepthTest;
  }
}
