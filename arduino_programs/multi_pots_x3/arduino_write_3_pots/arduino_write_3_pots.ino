int firstSensor = 0; // first analog sensor
int secondSensor = 0; // second analog sensor
int thirdSensor = 0; // digital sensor
int inByte = 0;   // incoming serial byte
void setup()
{
   // start serial port at 9600 bps:
   Serial.begin(9600);
 
   establishContact(); // send a byte to establish contact until receiver
}

void loop()
{
 // if we get a valid byte, read analog ins:
   if (Serial.available() > 0) 
   {
       // get incoming byte:
       inByte = Serial.read();
       // read first analog input, divide by 4 to make the range 0-255:
       firstSensor = analogRead(0)/4;
       // delay 10ms to let the ADC recover:
       delay(10);
       // read second analog input, divide by 4 to make the range 0-255:
       secondSensor = analogRead(1)/4;
       // read switch, map it to 0 or 255L
       thirdSensor = analogRead(2)/4;
       // send sensor values:
       Serial.write(firstSensor);
       Serial.write(secondSensor);
       Serial.write(thirdSensor);
   }
}

void establishContact() 
{
   while (Serial.available() <= 0) 
   {
     Serial.print('A'); // send a capital A
     delay(300);
   }
}
