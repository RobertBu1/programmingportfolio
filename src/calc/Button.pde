class Button {
  // Member variable
  int x, y, w, h;
  color c1, c2;
  char valu;
  boolean on, click;

  // Constructor
  Button(int x, int y, int w, int h, char valu, color c1, color c2) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h = h;
    this.valu = valu;
    this.c1 = c1;
    this.c2 = c2;
    click = false;
  }

  //Member methods
  void display() {
    if (click) {
      fill(c2);
    } else {
      fill(c1);
    }
    ellipse(x, y, w, h);
    fill(20);
    textSize(25);
    textAlign(CENTER);
    if (valu == 'C') {
      textSize(17);
      text("Clear", x, y+8);
    } else if (valu == 's') {
      text("x²", x, y+8);
    } else {
      text(valu, x, y+8);
    }
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
