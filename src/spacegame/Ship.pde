class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship1;

  // Constructor
  Ship() {
    x = 0;
    y =0;
    w =90;
    ammo = 350;
    turretCount = 2;
    health = 600;
    ship1 = loadImage("ship1.png");
  }

  void display() {
    ship1.resize(90, 90);
    imageMode(CENTER);
    image(ship1, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d=dist(x, y, rock.x, rock.y);
    if (d<90) {
      return true;
    } else {
      return false;
    }
  }
}
