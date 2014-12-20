int rows = 20; // change rows
int columns = 40;  // change columns
int diameter = 10; // change cell diameter
int cellGap = 2; // used to create a gap between each circle and the edge of the window
int w; // window width
int h; // window height

void setup()
{
  // setup frame dimensions
  w = cellGap + columns*(diameter + cellGap*2) + cellGap;
  h = cellGap + rows*(diameter + cellGap*2) + cellGap;
  size(w, h);
  
  noStroke();
  ellipseMode(CORNER); // set ellipse to top left corner
  
  // change the frame rate to a value between 1 and 60
  frameRate(1);
}

void draw()
{
  // background white
  background(#ffffff);
  
  for (int row = 0; row < rows; row++)
  {
    for (int column = 0; column < columns; column++)
    {
      fill(0, 0, 80 + random(100), random(255)); // shades of blue
      // fill(random(255), random(255), random(255)); // shades of red, green and blue, no transparency
      ellipse(cellGap*2 + column*(diameter + cellGap*2), cellGap*2 + row*(diameter + cellGap*2), diameter, diameter);
    }
  }
  
}
