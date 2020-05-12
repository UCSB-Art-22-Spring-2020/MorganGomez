//Morgan Gomez
//Midterm Part 2
//7 May 2020
//Art 22

float[] midterm = new float[40]; // new array named midterm

void setup(){
  size(600,600);
  
  midterm[0] = 133; // set first element to 133
  midterm[38] = 266; // set second to last element to 266
  println( "The first element of the array is: ", int(midterm[0]));
  println( "The third to last element of the array is: ", int(midterm[38]));
  
  for(int i = 0; i < midterm.length; i = i + 1){ 
    midterm[i] = int(random(1,599)); // set random numbers from 1 to 599
  }
  println("The tenth element of the array is: ", int(midterm[9]));
}
void draw(){
}
