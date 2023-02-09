#ifndef SPHERE_H
#define SPHERE_H
#include<string>
#include<math.h>

struct Sphere{
double  r,a,v ;
public:
Sphere (){
r = 0;
a = 0;
v= 0;
  }
void getVolume(){
  v =(4/3)*3.142*(r*r*r);
}
void getArea(){
  a = 4*3.14*(r*r);
}
}; 
#endif