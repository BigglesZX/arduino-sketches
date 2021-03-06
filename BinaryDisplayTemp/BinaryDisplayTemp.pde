/* 
  Binary Display Temperature

  Display temperature reading from sensor on 8 LEDs via the shift register.
*/

// define ANALOGUE pin for the TMP36 temp sensor
int temp = 0;
 
// define DIGITAL pins for the 74HC595
int data = 2;
int clock = 3;
int latch = 4;

// run once at startup/reset
void setup() {
  // set up IC pins
  pinMode(data, OUTPUT);  
  pinMode(clock, OUTPUT);
  pinMode(latch, OUTPUT);
  
  // arty farty KITT display gimmick to show we've started up
  doKITT();
  
  // open serial connection with the computer
  Serial.begin(9600);
  Serial.println("Arduino started.");
}

// run in an infinite loop
void loop() {
  // get reading
  float tempReading = getVoltage(temp);
  // convert to degrees C
  tempReading = (tempReading - .5) * 100;
  
  // write to console
  Serial.print("Temp: ");
  Serial.print(tempReading);
  Serial.println("C");
  
  // and display
  displayInt(round(tempReading));
  
  // iterate every 1s/1000ms
  delay(1000);
}

// display an int value in binary via the shift register
void displayInt(int value) {
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, value);
  digitalWrite(latch, HIGH);
}

// get the voltage on the specified analogue input
float getVoltage(int pin) {
  // this converts from 0 to 1024 digital range to 0 to 5 volts
  // since each degree reading is 5 millivolts
  return (analogRead(pin) * .004882814);
}

void doKITT() {
  // fire the LEDs in sequence, just like KITT
  int interDelay = 50;
  int betweenDelay = 100;
  
  // left-to-right
  displayInt(128);
  delay(interDelay);
  displayInt(64);
  delay(interDelay);
  displayInt(32);
  delay(interDelay);
  displayInt(16);
  delay(interDelay);
  displayInt(8);
  delay(interDelay);
  displayInt(4);
  delay(interDelay);
  displayInt(2);
  delay(interDelay);
  displayInt(1);
  delay(interDelay);
  displayInt(0);
  
  delay(betweenDelay);

  // right-to-left
  displayInt(0);
  delay(interDelay);
  displayInt(1);
  delay(interDelay);
  displayInt(2);
  delay(interDelay);
  displayInt(4);
  delay(interDelay);
  displayInt(8);
  delay(interDelay);
  displayInt(16);
  delay(interDelay);
  displayInt(32);
  delay(interDelay);
  displayInt(64);
  delay(interDelay);
  displayInt(128);
  delay(interDelay);
  displayInt(0);
  
  delay(betweenDelay);  
}
