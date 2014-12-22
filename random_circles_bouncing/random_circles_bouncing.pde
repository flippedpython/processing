// random circles that bounce off the inside of the window
// december 2014
// https://github.com/flippedpython/processing

float circleMax = 100;
float circleMin = 30;
Circle[] circles;
int population = 200;
int counter = 0;
boolean firstDraw = true;

void setup()
{
  ellipseMode(CORNER);
  size(1024, 600);
  smooth();
  noStroke();
  frameRate(30);
  background(#dddddd);
  // create circle array constructor sets random values for
  // position, size, colour, transparency, and velocity in x, y
  circles = new Circle[population];
}

void draw()
{
  
  noStroke();
  
  // draw the static cicles while firstdraw is true
  if (firstDraw == true)
  {
    circles[counter] = new Circle();
    circles[counter].display();
    
    counter++;
    
    // if population created set firstdraw false
    if (counter >= population)
    {
      firstDraw = false;
    }
  }

  // move the circles after whole population created
  if (firstDraw == false)
  {
    background(#dddddd);
    for (int x = 0 ; x < circles.length; x++)
    {
      circles[x].update();
      circles[x].display();
    }
  }
}
