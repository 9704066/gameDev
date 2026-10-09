class Seaweed {
  //Member Variable
  int x, y, size, health, damage, xSpeed, ySpeed, maxPossibleSpeed;
  color c1, c2;
  PImage seaweedImage;
  //Constructor
  Seaweed(int x, int y, int maxPossibleSpeed) {
    this.x = x;
    this.y = y;
    health = int(random(50,150));
    this.maxPossibleSpeed = maxPossibleSpeed;
    if (random(2)>1) {
      seaweedImage = loadImage("seaweedImageV1.png");
    } else {
      seaweedImage = loadImage("seaweedImageV2.png");
    }
    
    // make proportional to player health
    damage = int(random(30,60));
    ySpeed = int(random(1, maxPossibleSpeed));
    size = int(random(60,120));
  }
  //Member Methods
  void display() {
    seaweedImage.resize(size,size);
    image(seaweedImage,x,y);
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
