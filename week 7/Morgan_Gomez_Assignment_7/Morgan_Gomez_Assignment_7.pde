// Morgan Gomez
// week 7 assignment
// art 22

import peasy.*; // import PeasyCam
PeasyCam cam; // initialize camera

float rotX, rotY, rotZ, camX, camY, camZ; // rotations and translations of navigation

int boundary = 200;
int total = 1000; 

ArrayList<angelKisses> tlist = new ArrayList<angelKisses>(); // arraylist

PShape venom;
PShape elsa;
PShape teKa;
PShape zeus;


void setup() {
  size(600, 600, P3D); 
  
  venom = createShape(SPHERE, 200);

  elsa = createShape(SPHERE, 100);
  noStroke();

  teKa = createShape(SPHERE, 100);
  noStroke();   

  zeus = createShape(SPHERE, 100);
  noStroke();

  cam = new PeasyCam(this, 600);

  for (int i=0; i < total; i++) {
    tlist.add(new angelKisses(
      random(-10000, 10000), // initial x location
      random(-10000, 10000), // initial y location
      random(-10000, 10000), // initial z location
      100, // size 
      0, // xspeed
      0, // yspeed
      0)); // zspeed
  }
}

void draw() {
  background(0);

  bigBang(); // run function
  nav(); // run the navigation function
    
  colore(); // run the interactive function

  for (angelKisses t : tlist) {
    t.display(); // run its update() function
  }
} 
