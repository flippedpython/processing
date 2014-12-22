// random circles version 1
// december 2014
// https://github.com/flippedpython/processing

float maxDiameter = 100;
float minDiameter = 30;
int width = 800;
int height = 600;
int circles = 0;
int maxCircles = 100;

void setup()
{
  size(width, height);
  smooth();
  background(#ffffff);
  noStroke();
  frameRate(30);
}

void draw()
{
  circles++;
  if (circles > maxCircles)
  {
    circles = 0;
    background(#ffffff);
  }
  
  // random diameter
  float diameter = minDiameter+random(maxDiameter);
  
  // random fill muted colour with random transparency
  fill(random(170),random(195),random(100),random(100));
  
  // draw circle
  ellipse(random(width), random(height), diameter, diameter);
}
