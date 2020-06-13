//Morgan Gomez
//Final Project
//11 June 2020
//Mark Hirsch
//Art 22
//Spring 2020

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;
AudioPlayer song;

// FFT (fast fourier transform)
FFT fft; // get us info on the 'parts' frequencies) of our sound

float sciFi; // fft float variable for sound visualization

PImage alienLandscape; //image variable

int x, y; // position variables of ellipse

void setup() {
  size(1500, 700); //set size as background image size

  alienLandscape = loadImage("alienLandscape.jpg"); //load image (original work)

  minim = new Minim(this);
  
  // alien music lol
  song = minim.loadFile( "alienJams.mp3", 1024 ); //load sound file sourced from https://soundimage.org/amb-sci-fi-ambience/
  song.loop(); //loop song

  // get info about the song using fft
  fft = new FFT( song.bufferSize(), song.sampleRate() );

  // ellipse position
  x = width/5;
  y = height/7;
}


void draw() {
  image(alienLandscape, 0, 0, alienLandscape.width, alienLandscape.height); //display image

  fft.forward( song.mix ); //fft

  // loop through all frequencies in the fft and draw lines for each 'band'
  for ( int i=0; i < fft.specSize(); i++) {
    stroke(0); //color black
    strokeWeight(20); //thick stroke
    line(i, height, i, height - fft.getBand(i)*40 ); //height of sound bar
  }

//ellipse
  noStroke(); //no outline
  fill( 36, 35, 38); // make the ellipse greyish brown
  ellipse( x, y, 100, 100); // ellipse

  // if conditionals to allow coded keyboard keys to control shape (ellipse)
  if (keyPressed) { // asking is a key pressed?
    if (key == CODED) {// is this a special coded key?
      if (keyCode == RIGHT) { // is the coded key the right arrow?
        x+=10; // the same as saying x = x + 10;
      }
      if (keyCode == LEFT) { // asking is the coded key the left arrow?
        x-=10; // same as x = x - 10;
      }
    }
  }

  if (x > width) { // if x (ellipse) goes out of bounds on the right of screen
    x = 0; // the ellipse will reset to the left
  }

  if (x < 0) { // if x (ellipse) goes out of bounds on the left of screen
    x = width; // the ellipse will reset to the right
  }
  
   for (int i = 0; i < 100; i++) { //random texture
    noStroke(); //no outline
    fill(random(0, 50), random (0, 50), random (0, 50), 80); //colors
    rect (random (0, 1500), random (0, 100), random(10, 100), random (10, 100)); //position random texture above the horizon line
  }
  
}
