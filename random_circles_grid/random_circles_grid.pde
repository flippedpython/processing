int rows = 4;
int columns = 10;
int diameter = 60;
int cellGap = 2;

void setup()
{
  int w = columns*(diameter+cellGap);
  int h = rows*(diameter+cellGap);
  size(w, h);
  background(#eeeeee);
  noStroke();
}

void draw()
{
  for (int row = 0; row < rows; row++)
  {
    for (int column = 0; column < columns; column++)
    {
      fill(random(255),random(255),random(255),random(255));
      ellipse(cellGap+column*(diameter+cellGap), cellGap+row*(diameter+cellGap), diameter, diameter);
    }
  }
  
}
