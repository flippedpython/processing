// pendulum version 1
// december 2014
// https://github.com/flippedpython/processing

int screenWidth = 440;
int screenHeight = 280;
// pivot point
float pivotX = 0;
float pivotY = 0;
float pendulumLength = 1; // in metres
float gravity = 9.8;
// pendulumPeriod
float pendulumPeriod = 0;
float initialAngle = 0;
float angleAtPendulumTime;
float pendulumTime = 0;
float fRate = 30;
float newX = 0;
float newY = 0;

void setup()
{

  // light grey background
  background(#ffffff);
  
  // set pivot point
  pivotX = screenWidth/2;
  pivotY = screenHeight*1/3;

  // screen size
  size(screenWidth,screenHeight);
  smooth();
  noStroke();
  
  // starting angle
  initialAngle = (45.0/360.0)*2*PI;
  
  // pendlulum period
  pendulumPeriod = 2*PI*sqrt(pendulumLength/gravity);
  
  // update window title
  String str = "Initial Angle: " + str(initialAngle*360/(2*PI));
  str = str + " Pendulum Period: " + nfc(pendulumPeriod,2) + " seconds";
  frame.setTitle(str);
  
  // frame rate
  fRate = 30;
  
  // pendulum time, used as a clock
  pendulumTime = 0;

}

void draw(){
  background(#cccccc);
  
  // increment pivot time as a function of the frame rate
  pendulumTime = pendulumTime+0.3/fRate;
  
  // calculate new pendulum angle
  angleAtPendulumTime = initialAngle*cos(sqrt(gravity/pendulumLength)*pendulumTime);

  // calculate x, y position of end of pivot line
  newX = pendulumLength * 100 * sin(angleAtPendulumTime);
  newY = pendulumLength * 100 * cos(angleAtPendulumTime);
  
  // draw pivot point with colour
  fill(#FFD700);
  noStroke();
  ellipse(pivotX,pivotY, 18,18);
  
  // draw pivot line, set stroke and colour of pivot length
  strokeWeight(2); 
  stroke(#7F0078);
  line(pivotX, pivotY, pivotX + newX, pivotY + newY);

}
