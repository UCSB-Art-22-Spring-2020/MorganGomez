//Morgan Gomez
//Midterm Part 1
//7 May 2020
//Art 22


float x, y; // declare position and size variables fro 2D prim
int h, s, b; // color variables
float noisePosX, noisePosY; // mapping variables

void setup() {
  size(600, 600); // window size 600x600

  x = width/2; // set x and y to middle of the screen
  y = height/2;

  background(255);
  
  noisePosX = 0; // delcare mapping variables equal to 0 and 100
  noisePosY = 100;
}

void draw() {
  //background(255);

  colorMode(HSB); // use hue, saturation, and brightness color mode

  strokeWeight(30); // weight of 2D prim
  stroke(200, 30, 20, 100);
  fill(x, s, b);
  rect(x, y, 20, 20); // declare 2D prim rectangle w position and size variables

  x = x + 1; // move rect to the right by 1 pixel continuously
  y = y + 1;

  h = 200; // hue 
  s = 300; // saturation
  b = 200; // brightness

  if (keyPressed) { //is a key pressed?
    if (key == CODED) {// is it a special coded key?
      if (keyCode == RIGHT) { //is the coded key the right arrow?
        x+=5; 
      }
      if (keyCode == LEFT) { //is the coded key the left arrow?
        x-=10; 
      }
    }
  }

  if (x > width) { // if x goes out of bounds on the right of screen
    x = 0; // the ellipse will reset to the left
  }

  if (x < 0) { // if x goes out of bounds on the left of screen
    x = width; // the ellipse will reset to the right
  }

  if (y > height) { // if x goes out of bounds on the top
    y = 0; // the ellipse will reset to the bottom
  }

  if (y < 0) { // if x goes out of bounds on the bottom
    x = height; // the ellipse will reset to the top
  }

  float m = noise(noisePosX); // get a noise value fo x and y position
  float n = noise(noisePosY);
  
  x = map(m, 0, 1, 0, width); // map out the x and y positions
  y = map(n, 0, 1, 0, height); 

  noisePosX = noisePosX + 0.005; // the movement size of the map function
  noisePosY = noisePosY + 0.001;
  
  }
