class Submarine {
  //member variable
  int x, y, health, size, turretCount;
  PImage subImage;


  //constructor
  Submarine() {
    x = width/2;
    y = height/2;
    size = 50;
    health = 100;
    turretCount += 1;
    subImage = loadImage("submarineSprite.png");
  }

  //member methods
  void display() {
    imageMode(CENTER);
    subImage.resize(size,size);
    image(subImage, x, y, 100, 100);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
}
