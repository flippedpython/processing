public class Pendulum
{
  float pivotX = 0;
  float pivotY = 0;
  float pendulumLength = 0; // in metres
  float gravity = 9.8;
  float initialAngle;
  float pendulumTime = 0;
  float fRate = 30;
  color pivotCircleRGB;
  color pivotLineRGB;
  color pivotSpotRGB;
  
  Pendulum()
  {
    // create random pendulum length
    pendulumLength = (30+random(100))/100;
    
    // create random colour for pendulum
    int r = int(random(200));
    int g = int(random(200));
    int b = int(random(200));
    
    // set initial pendulum angle
    initialAngle = ((10 + random(35))/360)*2*PI;
    // set random position for pendulum
    pivotX = 10 + random(width-20);
    pivotY = random(height);
    
    pivotCircleRGB = color(r,g,b);
    pivotLineRGB = color(r+50,g+50,b+50);
    pivotSpotRGB = color(g,r,b);
  } 
  
  void  update()
  {
    
  }
  
  void display()
  {
    // draw pivot point
    fill(pivotCircleRGB);
    ellipse(pivotX,pivotY, 14, 14);
    
    // pivot line
    strokeWeight(2); 
    stroke(pivotLineRGB);
    
    pendulumTime =  pendulumTime+0.3/fRate;
    
    float angleAtPendulumTime = initialAngle*cos(sqrt(gravity/pendulumLength)*pendulumTime);
    float newX = pendulumLength * 100 * sin(angleAtPendulumTime);
    float newY = pendulumLength * 100 * cos(angleAtPendulumTime);
    
    // draw pivot line
    line(pivotX, pivotY, pivotX + newX, pivotY + newY);
    
    // pivot centre spot
    noStroke();
    fill(pivotSpotRGB);
    ellipse(pivotX,pivotY,5,5);
    
  }
}
