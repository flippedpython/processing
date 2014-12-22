// random circles that bounce off the inside of the window
// december 2014
// https://github.com/flippedpython/processing

Robot bigRob, mediumRob, smallRob;

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
  mediumRob = new Robot(1,width/6,height/2);
  smallRob = new Robot(0.5,width/2,height/2);
  bigRob = new Robot(1.5,width*0.75,height/2);
  
}

void draw()
{
  
  noStroke();
  bigRob.drawPallete();
  bigRob.display();
  mediumRob.display();
  smallRob.display();
  
  noLoop();
}
