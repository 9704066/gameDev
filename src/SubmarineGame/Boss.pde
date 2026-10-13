class Boss {
  int x, y, size, duration, health, lvl, speed;
  boolean isHit, isOnScreen;
  PImage b1;


  Boss(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    size = 200;
    duration = 10000;
    health = lvl*2000;
    speed = 1;
    isOnScreen = true;
    isHit = false;
    if(lvl == 1){
      b1 = loadImage("");
    } else if (lvl == 2) {
      b1 = loadImage("");
    }
    else {
      b1 = loadImage(""); 
    }  
  }
  
  
  //display *replace ellipse with image
  void display() {
    //image(b1,x,y);
    fill (255,0,0);
    ellipse(x,y,size,size);
    fill(255);
    text(health,x,y); 
  }
  
  void move() {
    x += speed;
  }
  
  
  
  
}
