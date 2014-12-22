// pendulum_OO
// december 2014
// https://github.com/flippedpython/processing


int screenWidth = 1024;
int screenHeight = 600;
float fRate = 30;
Pendulum p;
Pendulum[] pendulums; // list of pendulums
int population = 200; // the total population of pendulums

void setup()
{
  background(#dddddd);
  size(screenWidth,screenHeight);
  smooth();
  noStroke();
  frame.setTitle("Pendulum Population: " + str(population));
  
  // create empty array of pendulums
  pendulums = new Pendulum[population];
  for (int p = 0 ; p < pendulums.length; p++)
  {
    // add pendulum with random properties created in constructor
    pendulums[p] = new Pendulum();
  }
}

void draw(){
  background(#dddddd);
  noStroke();

  // move thru the list and update the position of each pendulum
  for (int p = 0 ; p < pendulums.length; p++)
  {
    pendulums[p].display();
  }

}
