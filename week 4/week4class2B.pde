PImage img;

void setup(){
  size(800,800);
  img = loadImage("waterColor.JPG");
  
  loadPixels();
  for(int x = 0; x < width; x++){ // nested loop to dcan through all pixel locations in terms of x and y
    for(int y = 0; y < height; y++){
     int index = x + y * width; // fav formula 
     
     // extract color from the image
     float r = red(img.pixels[index]);
     float g = green(img.pixels[index]);
     float b = blue(img.pixels[index]);
     
     // set pixel for display
     pixels[index] = color(r,g,b);
     
    }
  }
  updatePixels();
}


void draw(){
  float x1 = random(0, width); // x location of copy
  float y1 = 0; // y location of copy
  
  int w = 10; // width of the section
  int h = height; // height of section
  
  float x2 = x1 + random(-100,100); // random pixel location in the section (up to 10 pixels away from x1)
  float y2 = y1 + random(-10,10); // "" but for y
  
  
  copy(int(x1), int(y1), w, h, int(x2), int(y2), w, h);
}
