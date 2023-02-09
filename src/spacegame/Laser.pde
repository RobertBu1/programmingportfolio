class Laser {
  int x, y, w, h, speed, damage;
  PImage laser1;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y=y;
    w = 14;
    h = 25;
    speed = 9;
    damage = 60;
    laser1 = loadImage("laser1.png");
  }

  void display () {

    imageMode(CENTER);
    laser1.resize(w, h);
    image(laser1, x, y);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    if (dist(x, y, rock.x, rock.y)<(rock.diam)/2) {
      return true;
    } else {
      return false;
    }
  }
}
