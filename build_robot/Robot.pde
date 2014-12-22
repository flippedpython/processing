public class Robot
{
  // properties of circle
  float posX;
  float posY;
  float factor;
  
  color ROBOT_COLOUR = color(#007777);
  color ROBOT_CONTRAST_COLOUR = color(#004444);
  color ROBOT_DARK_RED = color(#760000);
  color ROBOT_FEET = color(#a32020);
  color ROBOT_YELLOW = color(#ffe200);
  float ROBOT_SIZE = 100;
  float ROBOT_JOINT_SIZE = 0.05;
  float robotSize = 0;
  
  // create circle with random data
  Robot(float f, float x, float y)
  {
    posX = x;
    posY = y;
    factor = f;
    robotSize = factor*ROBOT_SIZE;
  } 
  
  void update()
  {

  }
  
  void display()
  {
    fill(ROBOT_COLOUR);
    rect(posX,posY,robotSize,robotSize);
    
    fill(ROBOT_FEET);
    rect((posX+robotSize/2+robotSize*ROBOT_JOINT_SIZE/2),(posY-robotSize/4),robotSize*ROBOT_JOINT_SIZE,robotSize*ROBOT_JOINT_SIZE*6);
    rect((posX-robotSize/2-robotSize*ROBOT_JOINT_SIZE/2),(posY-robotSize/4),robotSize*ROBOT_JOINT_SIZE,robotSize*ROBOT_JOINT_SIZE*6);
    
    fill(ROBOT_COLOUR);
    rect((posX+robotSize/2+robotSize*ROBOT_JOINT_SIZE*2),(posY+robotSize/6),robotSize*ROBOT_JOINT_SIZE*2,robotSize*ROBOT_JOINT_SIZE*24);
    rect((posX-robotSize/2-robotSize*ROBOT_JOINT_SIZE*2),(posY+robotSize/6),robotSize*ROBOT_JOINT_SIZE*2,robotSize*ROBOT_JOINT_SIZE*24);
    
    
    // create robot chest
    float sixPackWidth = robotSize/2.4;
    
    fill(ROBOT_CONTRAST_COLOUR);
    rect((posX-robotSize*0.25),(posY-robotSize*0.25),sixPackWidth,robotSize/2.4);
    rect((posX+robotSize*0.25),(posY-robotSize/4),sixPackWidth,robotSize/2.4);
   
    float sixPackHeight = 0.75*0.3333*robotSize/2;
    float sixPackGap = 0.25*0.25*robotSize/2;
    
    // left
    rect((posX-robotSize*0.25),(posY+sixPackGap+sixPackHeight*0.5),sixPackWidth,robotSize/8);
    rect((posX-robotSize*0.25),(posY+2*sixPackGap+sixPackHeight*1.5),sixPackWidth,robotSize/8);
    rect((posX-robotSize*0.25),(posY+3*sixPackGap+sixPackHeight*2.5),sixPackWidth,robotSize/8);
    
    //right 
    rect((posX+robotSize*0.25),(posY+sixPackGap+sixPackHeight*0.5),sixPackWidth,robotSize/8);
    rect((posX+robotSize*0.25),(posY+2*sixPackGap+sixPackHeight*1.5),sixPackWidth,robotSize/8);
    rect((posX+robotSize*0.25),(posY+3*sixPackGap+sixPackHeight*2.5),sixPackWidth,robotSize/8);
    
    // leg joint
    fill(ROBOT_FEET);
    float legJointY = posY+robotSize/2+robotSize*ROBOT_JOINT_SIZE/2;
    float legJointHeight = robotSize*ROBOT_JOINT_SIZE;
    rect((posX-robotSize*0.25), legJointY, robotSize*ROBOT_JOINT_SIZE*6, legJointHeight);
    rect((posX+robotSize*0.25), legJointY, robotSize*ROBOT_JOINT_SIZE*6, legJointHeight);
    
    // robot legs
    fill(ROBOT_COLOUR);
    float legHeight = robotSize*1.1;
    float legWidth = robotSize*0.2;
    float legY = legJointY + legJointHeight/2 + legHeight/2;
    rect((posX-robotSize*0.25), legY, legWidth, legHeight);
    rect((posX+robotSize*0.25), legY, legWidth, legHeight);
    // knees
    fill(ROBOT_CONTRAST_COLOUR);
    float kneeWidth = robotSize*0.24;
    float kneeHeight = robotSize*0.1;
    rect((posX-robotSize*0.25), legY, kneeWidth, kneeHeight);
    rect((posX+robotSize*0.25), legY, kneeWidth, kneeHeight);
    
    // FEET
    fill(ROBOT_DARK_RED);
    float footHeight = 0.2*robotSize;
    float footWidth = legWidth*1.2;
    float footY = legY + legHeight/2 + footHeight/2;
    rect((posX-robotSize*0.25), footY, kneeWidth, footHeight);
    rect((posX+robotSize*0.25), footY, kneeWidth, footHeight);
    
    // head
    
    // neck
    fill(ROBOT_FEET);
    float neckHeight = robotSize*.03;
    float neckWidth = robotSize*0.4;
    float neckX = posX;
    float neckY = posY - robotSize/2 - neckHeight/2;
    rect(neckX, neckY, neckWidth, neckHeight);
    
    // neck joints x 3
    float minorJointHeight = neckHeight*2;
    float minorJointWidth = minorJointHeight;
    float minorJointY = neckY - neckHeight/2 - minorJointHeight/2;
    fill(ROBOT_CONTRAST_COLOUR);
    float jointDelta = neckWidth/4;
    rect(neckX-jointDelta, minorJointY, minorJointWidth, minorJointHeight);
    rect(neckX, minorJointY, minorJointWidth, minorJointHeight);
    rect(neckX+jointDelta, minorJointY, minorJointWidth, minorJointHeight);
    
    // make head
    fill(ROBOT_COLOUR);
    float headWidth = 0.65*robotSize;
    float headY = minorJointY - minorJointHeight/2 - headWidth/2;
    rect(neckX, headY, headWidth, headWidth);
    fill(ROBOT_CONTRAST_COLOUR);
    rect(neckX, headY, headWidth*0.9, headWidth*0.9);
    fill(ROBOT_COLOUR);
    rect(neckX, headY, headWidth*0.8, headWidth*0.8);
    
    // eyes
    float eyeWidth = headWidth*0.36;
    float eyeY = headY - headWidth/5;
    float eyeDeltaX = headWidth/5.2;
    fill(ROBOT_DARK_RED);
    ellipse(neckX-eyeDeltaX, eyeY, eyeWidth, eyeWidth);
    ellipse(neckX+eyeDeltaX, eyeY, eyeWidth, eyeWidth);
    fill(#F1F1F1);
    ellipse(neckX-eyeDeltaX, eyeY, eyeWidth*0.85, eyeWidth*0.85);
    ellipse(neckX+eyeDeltaX, eyeY, eyeWidth*0.85, eyeWidth*0.85);
    fill(ROBOT_YELLOW);
    ellipse(neckX-eyeDeltaX, eyeY, eyeWidth*0.5, eyeWidth*0.5);
    ellipse(neckX+eyeDeltaX, eyeY, eyeWidth*0.5, eyeWidth*0.5);
    
    // lips
    float lipWidth = 0.6 * headWidth;
    float lipY = headY + headWidth*0.22;
    float lipHeight = lipWidth*0.28;
    fill(#dddddd);
    rect(neckX,lipY,lipWidth,lipHeight);
    fill(#f1f1f1);
    rect(neckX,lipY-lipHeight/2-lipHeight*0.1,lipWidth,lipHeight*0.2);
    rect(neckX,lipY+lipHeight/2+lipHeight*0.1,lipWidth,lipHeight*0.2);
    rect(neckX,lipY,lipWidth,lipHeight*0.2);
  }
  
  void drawPallete()
  {
    rectMode(CORNER);
    fill(ROBOT_COLOUR);
    rect(0,0,20,20);
    fill(ROBOT_CONTRAST_COLOUR);
    rect(20,0,20,20);
    fill(ROBOT_FEET);
    rect(40,0,20,20);
    rectMode(CENTER);
  }

}
