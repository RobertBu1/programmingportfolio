class Rock {
  int x, y, diam, speed, health, xspeed;
  PImage rock;

  //Constructor
  Rock() {
    x = int(random(width));
    xspeed = int(random(-5, 5));
    y = -100;
    diam = int(random(30, 100));
    speed = int(random(3, 10));
    health = int(random(60, 240));
    rock = loadImage("rock.png");
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y +=speed;
    x -= xspeed;
  }

  Boolean reachedBottom() {
    if (y>height+400) {
      return true;
    } else {
      return false;
    }
  }
}
