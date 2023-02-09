#ifndef PYRAMID_H
#define PYRAMID_H
#include <string>
#include <ctgmath>

  struct Pyramid{
double h,w, l,a,v ;
public:
Pyramid (){
w = 0;
l = 0;
h = 0;
 a =0;
v=0;
  }
void getVolume(){
  v = (l*w*h)/3;
}
void getArea(){
  a = l*w + l*sqrt((w/2)*(w/2)+(h*h))+ w*sqrt((l/2)*(l/2) +(h*h));
}
}; 
#endif