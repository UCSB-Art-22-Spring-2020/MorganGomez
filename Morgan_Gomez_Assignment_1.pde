// Project 1
// Author: Morgan Gomez
// Art 22 April 4 2020

int x,y,w,h; // state the variables of the ellipse


void setup(){
  size(800,400); // window size 800x400
  background(204,134,162); // background pink
  
// place the ellipse centered on the y-axis, but to the right on the x-axis
  x = width/3;
  y = height/2;
  
// width and height of ellipse 
  w = 100;
  h = 400;
}
void draw(){
  
if( mouseX < 150 || mouseX > 400){ // if mouse is in between 150 and 400 of x axis, large point should be white
  stroke(255,255,255,100); // white with opacity of 100
} else{ //if the mouse is anywhere else outside of these parameters, the large point should be yellow
  stroke(240,226,85,40); // yellow with opacity of 40
}
  strokeWeight(60); // declaring as a large stroke weight (60)
  point(mouseX,mouseY); // large point controlled by mouse


if( mouseY < 50 || mouseY > 150 ){ // if mouse is in between 50 and 150 of y axis, small point should be orange
  stroke(232,159,68,200); // orange with opacity of 200
} else{ // if the mouse is anywhere else outside of these parameters, the small point should be pink
  stroke(157,36,107,60); // pink with opacity of 60
}
  strokeWeight(20); // declaring as a smaller stroke weight (20)
  point(mouseX,mouseY); // smaller point is also controlled by mouse
  
  strokeWeight(10); // stroke weight 10 pixels
  stroke(232,159,68,70); // set stroke to orange with opacity 70
  fill(240,226,85,20); //set fill to yellow with opacity 50
  ellipse(x, y, w, h); // make an ellipse with variables as parameters
}
