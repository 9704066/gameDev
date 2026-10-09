class PowerUp {
  //Member Variable
  int x, y, size, xSpeed, ySpeed;
  float rand;
  PImage powerUpImage;
  char type;
  //Constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = 100;
    rand = random(1);
    ySpeed = int(random(1, 3));
    if (rand > 0.55) {
      type = 'h';
      powerUpImage = loadImage("healthPowerUp.png");
    } else if(rand < 0.45){
      type = 'd';
      powerUpImage = loadImage("turretPowerUp.png");
    } else{
      type = 't';
      powerUpImage = loadImage("turretPowerUp.png");
    }
  }
  //Member Methods
  void display() {
    powerUpImage.resize(size,size);
    image(powerUpImage, x, y);
    textSize(20);
    textAlign(CENTER);
    text(type, x, y);
  }

  void move() {
    y += ySpeed;
  }

  boolean isOffScreen() {
    if (y > height+size) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Submarine s) {
    float d = dist(x,y,s.x,s.y);
    if(d<size/2+25) {
      return true;
    } else {
      return false;
    }
  }
}
