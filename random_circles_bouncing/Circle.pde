public class Circle
{
  // properties of circle
  float posX;
  float posY;
  float diameter;
  color colour;
  float alpha;
  // velocity in x, y
  float speedX;
  float speedY;
  
  // create circle with random data
  Circle()
  {
    diameter = 20 + random(80);
    posX = random(width-diameter);
    posY = random(height-diameter);
    colour = color(random(255),random(255),random(255));
    alpha = random(255);
    
    speedX = 0;
    while (speedX >= -2 && speedX <= 2)
    {
      //speedX = 0;  
      speedX = -5 + random(10);
    }
    
    speedY = 0;
    while (speedY >= -2 && speedY <= 2)
    {
      speedY = -5 + random(10);
    }
  }
  
  // create circle with set data
  Circle(float x, float y, float d, color c, float a, float sx, float sy)
  {
    posX = x;
    posY = y;
    diameter = d;
    colour = c;
    alpha = a;
    speedX = sx;
    speedY = sy;
  }
  
  // update position of circle with velocity in x, y direction
  // and check for collision with frame boundaries
  void update()
  {
    // increment speed with velocity vector in x, y
    posX += speedX;
    posY += speedY;
    
    // check collisions with left and right boundaries
    if ((posX + diameter) > width || posX < 0)
    {
      // flip velocity in x direction
      speedX = -speedX;
    }
    // check collisions with top and bottom boundaries
    if ((posY + diameter) > height || posY < 0)
    {
      //flip velocity in y direction
      speedY = -speedY;
    }
  }
  
  // draw circle
  void display()
  {
    fill(colour, alpha);
    ellipse(posX, posY, diameter, diameter);
  }
  
}
