import processing.serial.*;
int bgcolor;   // Background color
int fgcolor;   // Fill color
Serial myPort;      // The serial port
int[] serialInArray = new int[3]; // Where we'll put what we receive
int serialCount = 0;     // A count of how many bytes we receive
int xpos, ypos;     // Starting position of the ball
boolean firstContact = false;  // Whether we've heard from the
          // microcontroller
void setup() 
{
   size(1000, 600); // Stage size
   noStroke();  // No border on the next thing drawn
   xpos = width/2;
   ypos = height/2;
   println(Serial.list());
   String portName = Serial.list()[0];
   myPort = new Serial(this, portName, 9600);
   background(#eeeeee);
   frameRate(10);
}

void draw() 
{
   
   fill(serialInArray[0],serialInArray[1],serialInArray[2],random(255));
   // Draw the shape
   float r = random(60);
   ellipse(random(1000), random(600), 20+r, 20+r);
}

void serialEvent(Serial myPort) 
{
   int inByte = myPort.read();
   
   if (firstContact == false) 
   {
     if (inByte == 'A') 
     {
      myPort.clear();   // clear the serial port buffer
      firstContact = true;  // you've had first contact from the microcontroller
      myPort.write('A');  // ask for more
     }
   }
   else 
   {
     serialInArray[serialCount] = inByte;
     serialCount++;
     // If we have 3 bytes:
       if (serialCount > 2 ) 
       {
        xpos = serialInArray[0];
        ypos = serialInArray[1];
        fgcolor = serialInArray[2];
        // print the values (for debugging purposes only):
        println(xpos + "\t" + ypos + "\t" + fgcolor);
        // Send a capital A to request new sensor readings:
        myPort.write('A');
        // Reset serialCount:
        serialCount = 0;
       }
   }
}
