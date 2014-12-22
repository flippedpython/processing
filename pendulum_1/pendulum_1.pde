// pendulum 1

int screenWidth = 1024;
int screenHeight = 600;
float pivotX = 0;
float pivotY = 0;
float pendulumL = 1; // in metres
float gravity = 9.8;
float T = 0;
float initialAngle = 45/360*(2*PI);
float thetaAtT;
float atT = 0;
float fRate = 30;
float newX = 0;
float newY = 0;
int frameN = 0;
float[][] fallingList;
int fallingCount = 0;
int falling = 0;
int fallingMax = 0 ;

void setup(){
  initialAngle = (45.0/360.0)*2*PI;
  println("angle " + initialAngle);
  frameN = 0;
  fallingMax = 8;
  falling = 0;
  fallingCount = 0;
  
  background(#ffffff);
  pivotX = screenWidth/2;
  pivotY = screenHeight*1/3;

  
  size(screenWidth,screenHeight);
  smooth();
  noStroke();
  
  T = 2*PI*sqrt(pendulumL/gravity);
  println(T);
  
  fRate = 30;
  
  atT = 0;
  
  fallingList = new float[2][1000];
}

void draw(){
  background(#BF72A9);
  noStroke();
  fill(#400037);
  frameN = frameN + 1;
  
  ellipse(pivotX,pivotY, 18,18);
  strokeWeight(2); 
  stroke(#7F0078);
  
  atT = atT+0.3/fRate;
  
  thetaAtT = initialAngle*cos(sqrt(gravity/pendulumL)*atT);

  //println(frameN,thetaAtT);
  newX = pendulumL * 100 * sin(thetaAtT);
  newY = pendulumL * 100 * cos(thetaAtT);
  
  line(pivotX, pivotY, pivotX + newX, pivotY + newY);
  
  falling += 1;
  //println(falling);
  if (falling > fallingMax)
  {
    fallingList[0][fallingCount] = newX + pivotX;
    fallingList[1][fallingCount] = newY + pivotY;
    fallingCount += 1;
    falling = 0;
    println(fallingList[0][fallingCount], fallingList[1][fallingCount]);
  }
  else
  {
    //falling = 0;
  }
  for (int x=0; x < fallingCount; x++)
  {
    ellipse(fallingList[0][x],fallingList[1][x], 6, 6);
    fallingList[1][x] += 3;
    if (x > 0)
    {
      strokeWeight(1);
      stroke(#AAACEC);
      
      line(fallingList[0][x],fallingList[1][x],fallingList[0][x-1],fallingList[1][x-1]);
    }
  }
  
  //noLoop();
}
