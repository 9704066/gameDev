class Laser {
  //membervariables
  int x, y, w, h, speed;
  PImage laserImage;

  //constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 8;
    h = 12;
    speed = 5;
    laserImage = loadImage("laserImage.png");
  }

  //member methods
  void display() {
    laserImage.resize(w,h);
    image(laserImage,x,y);
  }

  void move() {
    y = y-speed;
  }

  boolean isOffScreen() {
    if (y < 0-h) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Seaweed s) {
    float d = dist(x, y, s.x, s.y);
    if (d<(s.size/2) + w) {
      return true;
    } else {
      return false;
    }
  }
}
