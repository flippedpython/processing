int rows = 4;
int columns = 10;

void setup()
{
  size(800,600);
  background(#eeeeee);
  noStroke();
}

void draw()
{
  //background(#eeeeee);
  fill(random(255),random(255),random(255),random(255));
  ellipse(random(800),random(600),10+random(60),10+random(60));
  
}
