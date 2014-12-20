int rows = 4;
int columns = 10;
int diameter = 60;
int cellGap = 2;
int w;
int h;

void setup()
{
  w = columns*(diameter+cellGap*2)+cellGap*2;
  h = rows*(diameter+cellGap*2)+cellGap*2;
  size(w, h);
  background(#cccccc);
  //noStroke();
  ellipseMode(CORNER);
  // change the frame rate to a value between 1 and 60
  frameRate(1);
}

void draw()
{
  background(#cccccc);
  fill(255,255,255);
  
  for (int row = 0; row < rows; row++)
  {
    for (int column = 0; column < columns; column++)
    {
      // fill(0,0,80+random(135),random(255)); // shades of blue
      fill(random(255), random(255), random(255)); // shades of red, green and blue, no transparency
      ellipse(cellGap*2+column*(diameter+cellGap*2), cellGap*2+row*(diameter+cellGap*2), diameter, diameter);
    }
  }
  
}
