#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

// Set these to run example.
#define FIREBASE_HOST "****************************************"
#define FIREBASE_AUTH "****************************************"
#define WIFI_SSID "PRIVATE"
#define WIFI_PASSWORD "PRIVATE"
#define ProxSensor D2
int LED = 16;

void setup() {
  Serial.begin(9600);
  pinMode(LED, OUTPUT);          // Pin 13 has an LED connected on most Arduino boards:
  pinMode(ProxSensor, INPUT);
  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

int n = 0;
int s =1;
float cal;
int value;
void loop() {

  if(1) {
    Firebase.setInt("user/1/Set",s);
    int state = digitalRead(ProxSensor);
    
    if (state == HIGH)     //Check the sensor output
    {
      
      digitalWrite(LED, HIGH);   // set the LED on
      Serial.println(n);
      Firebase.setFloat("user/1/Reps", n);
      cal = n*(5.4/30);
      Firebase.setFloat("user/1/Calories",cal);
      n++;
      delay(1000);
      
      
    }
    else
    {
      value=millis();
      while(state!=HIGH)
      {
      if(value==10000)
      {
        n=0;
        }
      }
      if(n=0){ 
      digitalWrite(LED, LOW);    // set the LED off
      Serial.println(state);
      delay(3000);
      }
      digitalWrite(LED, LOW);    // set the LED off
      Serial.println(state);
      delay(1000);
    }
  }
}
