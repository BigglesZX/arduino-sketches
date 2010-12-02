/*
  XmasTree

  Use digital pins 2-13 to display pretty patterns.
  Each pin is wired to 2 LEDs, making 24 LEDs which are arranged on the 
  breadboard in the shape of a little Christmas tree. Aww.
 */

// Define delay between pattern displays
int interDelay = 500;

// Setup
void setup() {
  // iterate the digital pins and set them to OUTPUT mode
  for (int pin = 2; pin <= 13; pin += 1) {  
    pinMode(pin, OUTPUT);
  }
}

// Run continuously
void loop() {
  // display a random pattern (defined below)
  // random is between min and max-1
  pattern(random(1, 9));
  
  // reset LEDs
  for (int pin = 2; pin <= 13; pin += 1) {  
    digitalWrite(pin, LOW);
  }
  
  // wait a bit
  delay(interDelay);
}

// Define the patterns
void pattern(int i) {
  int pin = 0;
  
  switch(i) {
    // Wave display, top to bottom
    case 1: {
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, HIGH);
        delay(20);
      }
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
        delay(20);
      }
      delay(100);
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, HIGH);
        delay(20);
      }
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
        delay(20);
      }
      
      break;
    }
    
    // Flash the whole tree a few times
    case 2: {
      int count = 0;
      while (count < 3) {
        for (pin = 2; pin <= 13; pin += 1) {  
          digitalWrite(pin, HIGH);
        }
        delay(200);
        for (pin = 2; pin <= 13; pin += 1) {  
          digitalWrite(pin, LOW);
        }
        delay(200);
        count += 1;
      }
      
      break;
    }
    
    // Wave display, bottom to top
    case 3: {
      for (pin = 13; pin >= 2; pin -= 1) {
        digitalWrite(pin, HIGH);
        delay(20);
      }
      for (pin = 13; pin >= 2; pin -= 1) {  
        digitalWrite(pin, LOW);
        delay(20);
      }
      delay(100);
      for (pin = 13; pin >= 2; pin -= 1) {  
        digitalWrite(pin, HIGH);
        delay(20);
      }
      for (pin = 13; pin >= 2; pin -= 1) {  
        digitalWrite(pin, LOW);
        delay(20);
      }
      
      break;
    }
    
    // Build-up, bottom to top
    case 4: {
      for (pin = 13; pin >= 2; pin -= 1) {  
        digitalWrite(pin, HIGH);
        delay(500);
      }
      delay(1000);
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
      }
      
      break;
    }
    
    // "Random" build-in
    case 5: {
      digitalWrite(2, HIGH);
      delay(200);
      digitalWrite(13, HIGH);
      delay(200);
      digitalWrite(5, HIGH);
      delay(200);
      digitalWrite(9, HIGH);
      delay(200);
      digitalWrite(12, HIGH);
      delay(200);
      digitalWrite(4, HIGH);
      delay(200);
      digitalWrite(6, HIGH);
      delay(200);
      digitalWrite(11, HIGH);
      delay(200);
      digitalWrite(3, HIGH);
      delay(200);
      digitalWrite(8, HIGH);
      delay(200);
      digitalWrite(10, HIGH);
      delay(200);
      digitalWrite(7, HIGH);
     
      delay(1000);
      
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
      }
      
      break;
    }
    
    // "Random" build-in v2
    case 6: {
      digitalWrite(4, HIGH);
      delay(200);
      digitalWrite(9, HIGH);
      delay(200);
      digitalWrite(13, HIGH);
      delay(200);
      digitalWrite(8, HIGH);
      delay(200);
      digitalWrite(2, HIGH);
      delay(200);
      digitalWrite(6, HIGH);
      delay(200);
      digitalWrite(11, HIGH);
      delay(200);
      digitalWrite(7, HIGH);
      delay(200);
      digitalWrite(5, HIGH);
      delay(200);
      digitalWrite(10, HIGH);
      delay(200);
      digitalWrite(3, HIGH);
      delay(200);
      digitalWrite(12, HIGH);
     
      delay(1000);
      
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
      }
      
      break;
    }
    
    // "Random" build-out (start lit)
    case 7: {      
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, HIGH);
      }
      
      delay(1000);
      
      digitalWrite(7, LOW);
      delay(200);
      digitalWrite(9, LOW);
      delay(200);
      digitalWrite(6, LOW);
      delay(200);
      digitalWrite(11, LOW);
      delay(200);
      digitalWrite(2, LOW);
      delay(200);
      digitalWrite(13, LOW);
      delay(200);
      digitalWrite(5, LOW);
      delay(200);
      digitalWrite(10, LOW);
      delay(200);
      digitalWrite(3, LOW);
      delay(200);
      digitalWrite(4, LOW);
      delay(200);
      digitalWrite(8, LOW);
      delay(200);
      digitalWrite(12, LOW);
      
      break;
    }
    
    // Build-up from the bottom, dropping each line in like Tetris :)
    case 8: {
      for (int endpin = 13; endpin >= 2; endpin -= 1) {
        for (pin = 2; pin <= endpin; pin += 1) {  
          digitalWrite(pin, HIGH);
          delay(50);
          digitalWrite(pin, LOW);
        }
        digitalWrite(endpin, HIGH);
        delay(200);
      }
      
      delay(500);
      
      for (pin = 2; pin <= 13; pin += 1) {  
        digitalWrite(pin, LOW);
        delay(10);
      }
      
      break;
    }
  }
}
