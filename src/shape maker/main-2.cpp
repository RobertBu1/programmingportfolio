#include <iostream>
#include <cstdlib>
#include <math.h>
#include "box.h"
#include "Sphere.h"
#include "Pyramid.h"
bool play = true;
using namespace std;
Box b1;
Pyramid p1;
Sphere s1;
int getback;

int main() {
cout << "Welcome to the shape maker! Lets find the volume and surface area for seperate shapes. Type one for Box, two for spehere, or three for pyramid.";
  cin >> getback;
  if(getback == 1 || getback == 2 || getback == 3){
play = true;
  } else { 
    play = false;}
  if (getback ==1) {
  cout << "Please enter the width of the box...";
   cin >> b1.w;
   cout << "Please enter the length of the box...";
  cin >> b1.l;
  cout << "Please enter the height of the box...";
  cin>> b1.h;
  b1.getVolume();
    b1.getArea();
    cout << "The volume of the box is " << b1.v <<" and the area of the box is " << b1.a;
  } else if(getback==2){
      cout << "Please enter the radius of the sphere...";
   cin >> s1.r;
  s1.getVolume();
    s1.getArea();
    cout << "The volume of the sphere is " << s1.v <<" and the area of the sphere is " << s1.a;
    s1.getArea();
  } else if(getback ==3) {
   cout << "Please enter the width of the pyramid...";
   cin >> p1.w;
   cout << "Please enter the length of the pyramid...";
  cin >> p1.l;
  cout << "Please enter the height of the pyramid...";
  cin>> p1.h;
  p1.getVolume();
    p1.getArea();
    cout << "The volume of the Pyramid is " << p1.v <<" and the area of the Pyramid is " << p1.a;
  } else {
    cout << "Enter a valid number.";
  }
  }
    
