/*
  Theramin

  Read from a light sensor and produce notes through a piezo element.
  Uses a button to toggle sound on/off and a potentiometer to adjust pitch.
 */

// define DIGITAL pins
int button = 2;
int redLED = 12;
int greenLED = 11;
int speaker = 10;

// define ANALOGUE pins
int pot = 0;
int photo = 1;

// output toggle
boolean onAir = false;

// run once at startup/reset
void setup() {                
  // set up digital pins
  pinMode(redLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
  pinMode(speaker, OUTPUT);
  pinMode(button, INPUT);
  
  // turn off both LEDs
  digitalWrite(redLED, LOW);
  digitalWrite(greenLED, LOW);
  
  goOffAir();
  
  Serial.begin(9600);
  Serial.println("Arduino online...");
}

// run in an infinite loop
void loop() {
  // detect button push
  int btnVal = digitalRead(button);
  if (btnVal == LOW) {
    // toggle
    if (onAir) { goOffAir(); }
    else { goOnAir(); }
  }
  
  // get value from light sensor and adjust to reasonable tone values
  int lightLevel = analogRead(photo);
  lightLevel = map(lightLevel, 0, 900, 255, 512);
  lightLevel = constrain(lightLevel, 255, 512);
  
  // get pot reading for pitch adjustment
  int potValue = analogRead(pot);
  potValue = map(potValue, 0, 1024, 0, 200);
  float adjust = potValue * 0.01;
  
  Serial.print("Pot value: ");
  Serial.print(analogRead(pot));
  Serial.print(", normalised: ");
  Serial.print(potValue);
  Serial.print(", adjust: ");
  Serial.println(adjust);
  
  // make ze noise
  if (onAir) {
    playTone(floor(lightLevel * adjust), 10);
  }
  
  //Serial.print("Light reading: ");
  //Serial.println(lightLevel);
  //delay(1000);
}

void playTone(int tone, int duration) {
  for (long i = 0; i < duration * 1000L; i += tone * 2) {
    digitalWrite(speaker, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speaker, LOW);
    delayMicroseconds(tone);
  }
}

void goOffAir() {
  onAir = false;
  digitalWrite(redLED, HIGH);
  digitalWrite(greenLED, LOW);
  Serial.println("Going off air...");
  delay(500);
}

void goOnAir() {
  onAir = true;
  digitalWrite(redLED, LOW);
  digitalWrite(greenLED, HIGH);
  Serial.println("Going on air...");
  delay(500);
}
