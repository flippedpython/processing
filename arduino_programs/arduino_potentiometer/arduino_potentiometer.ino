int val;
int inputPin = 4;
// this is the pin to which we
// connect the potentiometer
void setup() {
  Serial.begin(9600);
}
void loop() {
  val = analogRead(inputPin)/4; // the potentiometer’s range is from
  Serial.write(val);
  delay (100);
}
