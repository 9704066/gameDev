// Jonah Gong | 17 Sept 2026 | SubmarineGame
//import processing.sound.*; | Sound was not working for this project
//SoundFile laserSound;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Seaweed> seaweeds = new ArrayList<Seaweed>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Submarine s1;
Boss boss01;
Timer seaweedDist, puDist;
int score, seaweedCount, seaweedsOffScreen, laserDamage, level, maxPossibleSpeed;
boolean play;
PImage gameOverImage, gameStartImage;
//import processing.sound;

void setup() {
//  laserSound = new SoundFile(this,"laserSound1.mp3");
  size(500, 500);
  boss01 = new Boss(-200,200,1);
  s1 = new Submarine();
  seaweedDist = new Timer(2000);
  maxPossibleSpeed = 5;
  puDist = new Timer(5000);
  seaweedDist.start();
  puDist.start();
  score = 0;
  seaweedCount = 0;
  seaweedsOffScreen = 0;
  laserDamage = 50;
  play = false;
  gameOverImage = loadImage("gameOver.png");
  gameStartImage = loadImage("gameStart.png");
}

void draw() {
  noCursor();
  
  //check for start screen
  if(play == false) {
    startScreen();
  } else {
    background(0, 30, 70);
    
    s1.display();
    s1.move(mouseX, mouseY);
  
    //display and move seaweed + collision detection with ship
    for (int i = 0; i <seaweeds.size(); i++) {
      Seaweed s = seaweeds.get(i);
      s.display();
      s.move();
      if (s.isHit(s1) == true) {
        seaweeds.remove(s);
        s1.health -= s.damage;
      }
      if (s.health <= 0) {
        seaweeds.remove(s);
        score += s.size;
        score += seaweedCount*10;
      }
      if (s.isOffScreen() == true){
        seaweeds.remove(s);
        seaweedsOffScreen += 1;
      }
    }
    //display and move powerups + collision detection and power up effects
    for (int i = 0; i <powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      p.display();
      p.move();
      if (p.isHit(s1) == true) {
        if (p.type == 'h') {
          s1.health += 10;
        } else if (p.type == 'd') {
          laserDamage += 5;
        } else {
          if (s1.turretCount < 3) {
            s1.turretCount += 1;
          } else {
            laserDamage += 5;
          }
        }
        powerups.remove(p);
      }
      if (p.isOffScreen() == true)
        powerups.remove(p);
      //println(powerups.size());
    }
    boss01.display();
    boss01.move();
    for (int i = 0; i <lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j <seaweeds.size(); j++) {
        Seaweed s = seaweeds.get(j);
        if (l.isHit(s)) {
          s.health -= laserDamage;
          lasers.remove(l);
          
        }
      }
      l.display();
      l.move();
      if (l.isOffScreen() == true)
        lasers.remove(l);
      println(lasers.size());
    }
    //add seaweed
    if (seaweedDist.isFinished() == true) {
      seaweedDist.start();
      seaweeds.add(new Seaweed(int(random(width)), -60, maxPossibleSpeed));
      seaweedCount += 1;
    }
    if (puDist.isFinished() == true) {
      puDist.start();
      powerups.add(new PowerUp(int(random(width)), -60 ));
    }
    if (s1.health <= 0 || seaweedsOffScreen > 9){
      gameOver();
    }
    infoPanel();
  }
}

void mousePressed() {
  if(s1.turretCount == 1){
    lasers.add(new Laser(s1.x, s1.y));
//  laserSound.play();
  } else if(s1.turretCount == 2){
    lasers.add(new Laser(s1.x + 20, s1.y));
    lasers.add(new Laser(s1.x - 20, s1.y));
//  laserSound.play();
  } else {
    lasers.add(new Laser(s1.x + 20, s1.y));
    lasers.add(new Laser(s1.x - 20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  }
  
}
void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textAlign(LEFT);
  textSize(15);
  text("Score : "+score, 20, 35);
  if (s1.health <= 10){
    fill(255,0,0);
  } else {
    fill(255);
  }
  text("Health : "+s1.health, 400, 35);
  if (seaweedsOffScreen >= 9){
    fill(255,0,0);
  } else {
    fill(255);
  }
  text("Seaweeds Missed : "+ seaweedsOffScreen, 250, 35);
  fill(255);
  text("Laser Damage : "+ laserDamage, 120, 35);
}

void startScreen() {
  background(0,50,150);
  imageMode(CENTER);
  textSize(50);
  textAlign(CENTER);
  s1.subImage.resize(200,200);
  image(s1.subImage, width/2, height/2);
  text("Submarine Game", width/2, 100);
  text("Press any Key to Start", width/2, 400);
  fill(255);
  if (keyPressed == true){
    play = true;
  }
}

void gameOver() {
  imageMode(CENTER);
  background(gameOverImage);
  //add game over graphic
  fill(255);
  noLoop();
}
