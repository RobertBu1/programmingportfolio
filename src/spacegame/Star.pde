class Star {
  int x, y, diam, speed;

  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(5,10));
    speed = int(random(3, 8));
  }

  void display() {
    fill(225, 215 );
    circle(x, y, diam);
  }

  void move() {
    if (y>height+5) {
      y=-10;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
