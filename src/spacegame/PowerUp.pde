class PowerUp {
  int x, y, diam, speed, xspeed;
  char type;
  PImage rock, heal, turret, ammo;

  //Constructor
  PowerUp() {
    x = int(random(width));
    xspeed = int(random(-5, 5));
    y = -100;
    diam = 35;
    speed = 2;
    ammo = loadImage("ammo.png");
    heal = loadImage("health.png");
    turret = loadImage("turretcount.png");
    int rand = int(random(3));
    if (rand ==0) {
      type = 'H';
    } else if (rand == 1) {
      type = 'A';
    } else {
      type = 'T';
    }
  }

  void display() {
    if (type =='T') {
      imageMode(CENTER);
      turret.resize(100, 100);
      image(turret, x, y);
    } else if (type == 'H') {
      imageMode(CENTER);
      heal.resize(100, 100);
      image(heal, x, y);
    } else {
      imageMode(CENTER);
      ammo.resize(100, 100);
      image(ammo, x, y);
    }
  }

  void move() {
    y +=speed;
  }

  Boolean reachedBottom() {
    if (y>height+400) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }
}
