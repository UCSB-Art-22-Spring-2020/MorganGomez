//Morgan Gomez
//Assignment 6: Sound Visualizer
//11 May 2020

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;

// beat detector from minim
BeatDetect beat;

// FFT (fast fourier transform)
FFT fft; // get us info on the 'parts' 9frequencies) of our sound

float sailedAwayToChina;
float littleRowBoat = 500;

void setup(){
  size(600,600);
  colorMode(HSB);
  
  minim = new Minim(this);
  // an absolute masterpiece by Gwilly Edmondez from the album "Now That's What I Think I Called Music"
  song = minim.loadFile( "BreakMyStride.mp3", 1024 ); 
  song.loop();
  
  // get info about the song using fft
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  
  // setup beat detector
  beat = new BeatDetect();
  beat.setSensitivity(230); // sensitivity of beat detector (range from 0-500, default is around 300)
 
}

void draw(){
  background(250);
  colorMode(HSB);
  
  fft.forward( song.mix );
  
  // map function for "background" aka rect 2d prim that covers whole screen
  sailedAwayToChina = map(fft.getBand(150), 0, 15, 0, 360); // map fft.getBand(150) from sound range to color range
  fill(sailedAwayToChina, 600, 200);
  noStroke();
  rect(0,0,600,600); // rect that changes color to the beat
  
  // random function to add chaotic texture to background with little baby squares
  for(int i = 0; i < 200; i++) { //start counting at 0 and continue to loop while i is less than 100
    noStroke(); //no outline pls
    fill( random(0,255), random(0,255), random(0,255)); //random fill color w random opacity
    rect( random(0,width), random(0,height), random(1,10), random(1,10)); //draw random rect sizes at random positions
    //println(i);
  }
  
  beat.detect(song.mix); // listen to the sounds in our song and try to detect the beat
  
  // conditional to check if there is a beat detected
  if( beat.isOnset() ){ // is there a beat detected?
    littleRowBoat = 500; // set radius of ellipse back to original size of 500
  }
  
  // color for ellipse in hsb
  fill(150,182,147);
  noStroke();
  ellipse(width/2, height/2, littleRowBoat, littleRowBoat);
  // slowly decrease the radius everytime the draw loop occurs, gives the illusion of a fading circle
  littleRowBoat *= 0.95; // r = r * 0.95
  
  
   // loop through all frequencies in the fft and draw lines for each 'band'
  for( int i=0; i < fft.specSize(); i++){
   stroke(0);
   strokeWeight(10);
   line(i, height, i, height - fft.getBand(i)*4 ); 
  }
  
}
