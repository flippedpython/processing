// random arcs version 1
// january 2015
// https://github.com/flippedpython/processing

float maxDiameter = 100;
float minDiameter = 30;
int width = 800;
int height = 600;


void setup()
{
  size(width, height);
  smooth();
  background(#ffffff);
  frameRate(30);
}

void draw()
{
  float d;
  
  for (int x = 0; x < 200; x++)
  {
    d = minDiameter + random(maxDiameter);
    strokeWeight(3+random(5));
    stroke(random(255), random(255), random(255));
    arc(random(width), random(height), d, d, random(2*PI), random(2*PI));
  }
  
  noLoop();

}
