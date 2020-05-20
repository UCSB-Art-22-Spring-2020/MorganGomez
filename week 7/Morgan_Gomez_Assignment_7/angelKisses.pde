class angelKisses {

  float x, y, z;
  float size;
  float speedX, speedY, speedZ;

  //constructor
  angelKisses(float x_, float y_, float z_, float size_, float speedX_, float speedY_, float speedZ_) {
    x = x_;
    y = y_;
    z = z_;
    size = size_;
    speedX = speedX_;
    speedY = speedY_;
    speedZ = speedZ_;
  }

  // methods
  void display() {
    strokeWeight(size);
    stroke(17);
    point(x, y, z);
    x = x + speedX;
    y = y + speedY;
    z = z + speedZ;
    }
}
