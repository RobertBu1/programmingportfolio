// Robert Bulanon | Nov _ 2022 | PlanaCalculator
Button[] numButtons = new Button[11];
Button [] opButtons = new Button[11];
String dVal ="0.0";
float l, r, result;
char op =' ';
boolean left = true;

void setup() {
  size(270, 330);
  numButtons[0]= new Button(75, 305, 135, 45, '0', color(240, 240, 0), color (200, 200, 0));
  numButtons[1]= new Button(80, 255, 40, 40, '1', color(240, 240, 0), color (200, 200, 0));
  numButtons[2]= new Button(130, 255, 40, 40, '2', color(240, 240, 0), color (200, 200, 0));
  numButtons[3]= new Button(180, 255, 40, 40, '3', color(240, 240, 0), color (200, 200, 0));
  numButtons[4]= new Button(80, 200, 40, 40, '4', color(240, 240, 0), color (200, 200, 0));
  numButtons[5]= new Button(130, 200, 40, 40, '5', color(240, 240, 0), color (200, 200, 0));
  numButtons[6]= new Button(180, 200, 40, 40, '6', color(240, 240, 0), color (200, 200, 0));
  numButtons[7]= new Button(80, 145, 40, 40, '7', color(240, 240, 0), color (200, 200, 0));
  numButtons[8]= new Button(130, 145, 40, 40, '8', color(240, 240, 0), color (200, 200, 0));
  numButtons[9]= new Button(180, 145, 40, 40, '9', color(240, 240, 0), color (200, 200, 0));
  numButtons[10] = new Button(180, 95, 40, 40, 'π', color(240, 240, 0), color (200, 200, 0));
  opButtons[0] = new Button(30, 95, 40, 40, '%', color(240, 240, 0), color (200, 200, 0));
  opButtons[1] = new Button(80, 95, 40, 40, '±', color(240, 240, 0), color (200, 200, 0));
  opButtons[2] = new Button(130, 95, 40, 40, 'C', color(240, 240, 0), color (200, 200, 0));
  opButtons[3] = new Button(230, 95, 40, 40, 'x', color(240, 240, 0), color (200, 200, 0));
  opButtons[4] = new Button(230, 145, 40, 40, '÷', color(240, 240, 0), color (200, 200, 0));
  opButtons[5] = new Button(230, 200, 40, 40, '-', color(240, 240, 0), color (200, 200, 0));
  opButtons[6] = new Button(230, 255, 40, 40, '+', color(240, 240, 0), color (200, 200, 0));
  opButtons[7] = new Button(205, 305, 100, 45, '=', color(240, 240, 0), color (200, 200, 0));
  opButtons[8] = new Button(30, 255, 40, 40, '.', color(240, 240, 0), color (200, 200, 0));
  opButtons[9] = new Button(30, 200, 40, 40, 's', color(240, 240, 0), color (200, 200, 0));
  opButtons[10] = new Button(30, 145, 40, 40, '√', color(240, 240, 0), color (200, 200, 0));
}

void draw () {
  background(160, 0, 0);
  updateDisplay();
  for (int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mousePressed () {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      numButtons[i].click = true;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      opButtons[i].click = true;
    }
  }
}

void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("x", false);
  } else if (keyCode == 47 || keyCode == 111 ) {
    handleEvent("÷", false );
  } else if (keyCode == 8 || keyCode == 12) {
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String valu, boolean num) {
  if (num && dVal.length() < 19) {
    if (dVal.equals("0.0")) {
      dVal = valu;
    } else {
      dVal += valu;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
  } else if (valu.equals("C")) {
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
    dVal = "0.0";
    l = 0.0;
    r =0.0;
    result =0.0;
    left = true;
    op = ' ';
  } else if (valu.equals("+")) {
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (valu.equals("-")) {
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
    op ='-';
    left = false;
    dVal = "0.0";
  } else if (valu.equals("x")) {
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
    op = 'x';
    left = false;
    dVal = "0.0";
  } else if (valu.equals("÷")) {
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
    op = '÷';
    left = false;
    dVal = "0.0";
  } else if (valu.equals(".")) {
    // Remeber to type 0 before decimal point otherwise it will not work
    if (!dVal.contains(".")) {
      dVal += ".";
    }
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
  } else if (valu.equals("=")) {
    performCalculation();
    for (int i =0; i<numButtons.length; i++) {
      numButtons[i].click = false;
    }
  }
}



void mouseReleased () {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 19) {
      handleEvent(str(numButtons[i].valu), true);
    }
  }
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on && numButtons[i].valu =='π' && left ==true) {
      dVal = str(PI);
      l = PI;
      numButtons[i].click = false;
      left = false;
    } else if (numButtons[i].on && numButtons[i].valu =='π' && left == false) {
      dVal = str(PI);
      r = PI;
      numButtons[i].click = false;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].valu == 'C') {
      handleEvent("C", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '+') {
      handleEvent("+", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '-') {
      handleEvent("-", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == 'x') {
      handleEvent("x", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '÷') {
      handleEvent("÷", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '=') {
      handleEvent("=", false);
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '±') {
      if (left) {
        l=l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == 's') {
      if (left) {
        l  =sq(l);
        dVal = str(l);
        opButtons[i].click = false;
      } else {
        r = sq(r);
        dVal = str(r);
        opButtons[i].click = false;
      }
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '√') {
      if (left) {
        l  =sqrt(l);
        dVal = str(l);
        opButtons[i].click = false;
      } else {
        r = sqrt(r);
        dVal = str(r);
        opButtons[i].click = false;
      }
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '%') {
      if (left) {
        l  =l*.01;
        dVal = str(l);
        opButtons[i].click = false;
      } else {
        r = r*.01;
        dVal = str(r);
        opButtons[i].click = false;
      }
      opButtons[i].click= false;
    } else if (opButtons[i].on && opButtons[i].valu == '.') {
      handleEvent(".", false);
      opButtons[i].click= false;
    }
    println("L:" + l + "Op:" + op + "R:" + r +  "Result:" + result + "Left:" + left);
  }
}
void updateDisplay () {
  fill(255);
  rect(0, 0, 270, 70);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length() < 8) {
    textSize(40);
  } else if (dVal.length() < 10) {
    textSize(37);
  } else if (dVal.length() < 12) {
    textSize(34);
  } else if (dVal.length() < 14) {
    textSize(31);
  } else {
    textSize(28);
  }
  text(dVal, width-3, 65);
}

void performCalculation() {
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].click= false;
  }
  if (op == '+') {
    result = l+r;
  } else if (op == '-') {
    result = l-r;
  } else if (op == 'x') {
    result = l*r;
  } else if (op == '÷') {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
