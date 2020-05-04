//Morgan Gomez
//Art 22, Mark Hirsch
//Assignmnet 2: texture and jpg/svg files
//13 April 2020

PImage flower; //image variable
PShape moth; // moth shape variable
PShape mothboi; // another moth shape variable
PShape mothman; // yet another moth shape variable

int x,y; // position variables of ellipse

void setup(){
  size(1024,600);
  //load field image and butterfly/moth shapes
  flower = loadImage("field.jpg");
  moth = loadShape("moth.svg");
  mothboi = loadShape("moth2.svg");
  mothman = loadShape("moth3.svg");
  
  // ellipse position
  x = width/5;
  y = height/7;
  
}

void draw(){
  image(flower,0,0); //draw field at full scale
  noCursor(); //hide that pesky cursor
  shape(moth, mouseX, mouseY, moth.width/5, moth.height/5); // first moth is controlled by mouse
  shape(mothboi, width/2, height/7, mothboi.width/16, mothboi.height/16); //second moth is near the top middle of screen
  shape(mothman, width/7, height/3, mothman.width/2, mothman.height/2); // third moth is near the middle left of screen
  
    for(int i = 0; i < 10; i++) { //start counting at 0 and continue to loop while i is less than 20
    noStroke(); //no outline pls
    fill( 255, 205, 0, 80); //random fill color w opacity 80
    ellipse( random(0,width), random(0,height), 30, 30); //draw small ellipse sizes at random positions
    //println(i)
  }
  
  for(int i = 0; i < 20; i++) { //start counting at 0 and continue to loop while i is less than 20
    noStroke(); //no outline pls
    fill( 255, 205, 0); //random fill color with full opacity
    ellipse( random(0,width), random(0,height), 20, 20); //draw smaller ellipse sizes at random positions
    //println(i);
  
  }
  
  noStroke(); // pls no stroke thank you
  fill( 255, 205, 0); // make the ellipse yellow
  ellipse( x, y, 40, 40); // ellipse for the large light bug
  
  // if conditionals to allow coded keyboard keys to control shape (ellipse)
  if(keyPressed) { // asking is a key pressed?
    if(key == CODED) {// is this a special coded key?
    if (keyCode == RIGHT) { // is the coded key the right arrow?
      x+=10; // the same as saying x = x + 10;
      }
      if(keyCode == LEFT) { // asking is the coded key the left arrow?
        x-=10; // same as x = x - 10;
      }
    }
  }

   if(x > width){ // if x (my light bug) goes out of bounds on the right of screen
     x = 0; // the ellipse will reset to the left  
   }

   if(x < 0){ // if x (my light bug) goes out of bounds on the left of screen
     x = width; // the ellipse will reset to the right  
   }
  
}
