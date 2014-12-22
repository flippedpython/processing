// random circles that bounce off the inside of the window
// december 2014
// https://github.com/flippedpython/processing

int robots = 10;
int maxRobots = 10;

Robot[] robotList;
//bigRob, mediumRob, smallRob;

void setup()
{
  size(800, 600);
  smooth();
  noStroke();
  frameRate(30);
  background(#dddddd);
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  rectMode(CENTER);
  point(width/2,height/2);
  
  robotList = new Robot[10];
  
  for (int r = 0; r < maxRobots; r++)
  {
    robotList[r] = new Robot(0.2+random(1.2),width/2,height/2);
  }

  
  frameRate(60);
}

void draw()
{
  background(#dddddd);
  noStroke();
  for (int r = 0; r < maxRobots; r++)
  {
    robotList[r].display();
    robotList[r].update();
  }
  //noLoop();
}
