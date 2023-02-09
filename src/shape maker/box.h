#ifndef BOX_H
#define BOX_H
#include <string>
struct Box{
double h,w, l,a,v;
public:
Box (){
  w = 0;
l = 0;
h = 0;
  a = 0;
  v= 0;
  }
void getVolume(){
  v = l*w*h;
}
void getArea(){
  a = 2*(l*w + h*w + l*h);
}
};
#endif // BOX_H