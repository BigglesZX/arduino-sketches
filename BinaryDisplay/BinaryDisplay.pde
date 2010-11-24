/* 
  Binary Display

  Increment a counter integer, convert to 8-bit binary and display on 8 LEDs 
  via the shift register.
   
  This sketch is a precursor to the temp readout which will come a bit later.
*/
 
// define pins for the 74HC595
int data = 2;
int clock = 3;
int latch = 4;

// define our counter
int count = 0;

// run once at startup/reset
void setup() {
  // set up IC pins
  pinMode(data, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
}

// run in an infinite loop
void loop() {
  // iterate every 250ms
  delay(250);
  
  // reset when we hit the max value for 8-bit display
  if (count == 256) {
    count = 0;
  }
  
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, count);
  digitalWrite(latch, HIGH);
  count++;
}
