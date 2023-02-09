// Robert Bulanon | 29 Nov 2022 | spaceGame
Ship falcon;
import processing.sound.*;
SoundFile file, explosion;
Star[] stars = new Star[100];
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer rockTimer, puTimer;
int score, level;
boolean play;
PImage explode;

void setup() {
  size (800, 800);
  falcon = new Ship();
  explode = loadImage("explosion.png");

  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }

  rockTimer = new Timer(500);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  score = 0;
  level = 1;
  play = false;
  file = new SoundFile(this, "lasersound1.wav");
  explosion = new SoundFile(this, "explossound.wav");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    // Render stars
    background(0);
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();
    // Render ship
    falcon.display();
    falcon.move(mouseX, mouseY);

    // Add powerups
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    // render rock
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }
    // render laser + collison
    for (int i = 0; i<lasers.size(); i++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
        //println(lasers.size());
      }

      for (int j = 0; j<rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (l.intersect(rock)) {
          rock.health -=l.damage;
          score+=100;
          // explode sound
          // add animation
          // add
          lasers.remove(l);
          if (rock.health<=0) {
            explosion.play();
            imageMode(CENTER);
            explode.resize(100, 100);
            image(explode, rock.x, rock.y);
            rocks.remove(rock);
          }
        }
      }
    }
    // Rendr PowerUps
    for (int i = 0; i<powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(falcon)) {
        if (pu.type == 'H') {
          falcon.health+=500;
        } else if (pu.type == 'A') {
          falcon.ammo+=300;
        } else if (pu.type=='T') {
          if (falcon.turretCount<10) {
            falcon.turretCount +=1;
          } else {
            falcon.turretCount = falcon.turretCount;
          }
        }
        powerups.remove(pu);
      }

      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
        println(powerups.size());
      }
    }

    // Render rock
    for (int i = 0; i<rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (falcon.intersect(r)) {
        falcon.health-=r.diam;
        score-=100;
        rocks.remove(r);
      }

      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
        println(rocks.size());
      }
    }
    infoPanel();
    if (falcon.health<=0) {
      gameOver();
    }
  }
}
void mousePressed () {
  if (falcon.fire()) {
    file.play();
  }
  if (falcon.fire() && falcon.turretCount==1) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==2) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==3) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==4) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==5) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==6) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x+12, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==7) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x+12, falcon.y));
    lasers.add(new Laser(falcon.x-12, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==8) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x+12, falcon.y));
    lasers.add(new Laser(falcon.x-12, falcon.y));
    lasers.add(new Laser(falcon.x-16, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==9) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x+12, falcon.y));
    lasers.add(new Laser(falcon.x-12, falcon.y));
    lasers.add(new Laser(falcon.x-16, falcon.y));
    lasers.add(new Laser(falcon.x+16, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y));
    println(lasers.size());
  } else if (falcon.fire() && falcon.turretCount==10) {
    lasers.add(new Laser(falcon.x-4, falcon.y));
    lasers.add(new Laser(falcon.x+4, falcon.y));
    lasers.add(new Laser(falcon.x-8, falcon.y));
    lasers.add(new Laser(falcon.x+8, falcon.y));
    lasers.add(new Laser(falcon.x+12, falcon.y));
    lasers.add(new Laser(falcon.x-12, falcon.y));
    lasers.add(new Laser(falcon.x-16, falcon.y));
    lasers.add(new Laser(falcon.x+16, falcon.y));
    lasers.add(new Laser(falcon.x-20, falcon.y));
    lasers.add(new Laser(falcon.x, falcon.y)); 
    println(lasers.size());
  }
}
void keyPressed() {
}

void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(180);
  textSize(35);
  textAlign(CENTER);
  text("Score: " + score + " | Level : "+ level + " | Ammo : " + falcon.ammo +" | Health : "  + falcon.health, width/2, 40);
}

void startScreen() {
  background(0);
  fill(0, 0, 255);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(0, 0, 255);
  textAlign(CENTER);
  text("Game over!", width/2, height/2);
  // play = false;
  noLoop();
}
