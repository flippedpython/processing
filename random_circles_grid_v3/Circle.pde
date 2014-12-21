class Circle
{
  float destinationX;
  float destinationY;
  float x;
  float y;
  color colour;
  float alpha;
  int status; // 0 initial, 1 moving 2 finished
  
  Circle(float xx, float yy, color c, float a)
  {
    destinationX = xx;
    destinationY = yy;
    x = xx;
    colour = c;
    alpha = a;
    status = 0;
  }
}
