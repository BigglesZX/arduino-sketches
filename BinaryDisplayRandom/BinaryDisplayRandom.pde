/* 
  Binary Display Random

  Display random numbers on 8 LEDs to create a randomly shifting pattern.
*/
 
// define pins for the 74HC595
int data = 2;
int clock = 3;
int latch = 4;

// run once at startup/reset
void setup() {
  // set up IC pins
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

// run in an infinite loop
void loop() {
  // iterate every 1s
  delay(1000);
  
  // pick a number, any number...
  int count = floor(random(0, 256));
  
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, count);
  digitalWrite(latch, HIGH);
}
