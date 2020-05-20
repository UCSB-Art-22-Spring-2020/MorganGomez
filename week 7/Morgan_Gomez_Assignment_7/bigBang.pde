void bigBang(){

  // global translation and rotation
  translate(camX, camY, camZ);

  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  
  strokeWeight(0);
  noStroke();
  noFill();
  sphere(boundary*2);

  shape(venom, 0, 0);

  strokeWeight(0);
  noStroke();
  noFill();
  sphere(boundary*2);

  shape(elsa, 0, 0);

  strokeWeight(0);
  noStroke();
  noFill();
  sphere(boundary);

  shape(teKa, 1000, 1000);
  
  strokeWeight(0);
  noStroke();
  noFill();
  sphere(boundary*.5);
  
  shape(zeus, -1000,-1250);
}
