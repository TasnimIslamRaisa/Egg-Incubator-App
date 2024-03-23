#include <WiFi.h>
#include <WebServer.h>
#include <DHT.h>

WebServer server(80);
#define WIFI_SSID "Raisa Tasnim"
#define WIFI_PASSWORD "raisa123"
#define DHT_PIN 4       // Pin connected to DHT sensor
#define DHT_TYPE DHT11  // Type of DHT sensor (DHT11 or DHT22)
#define ULTRASONIC_PIN_TRIGGER 2  // Trigger pin of ultrasonic sensor
#define ULTRASONIC_PIN_ECHO 22    // Echo pin of ultrasonic sensor
#define LED_PIN 25                  // Pin connected to LED
#define BUZZER_PIN 5  // Set the pin for the buzzer


DHT dht(DHT_PIN, DHT_TYPE);

float temperature = 0;    // Global variable for temperature
float distance = 0;       // Global variable for distance


void setup() {
  Serial.begin(9600);
  delay(1000);

  // Connect to WiFi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi...");
  }

  // Initialize sensor pins
  pinMode(ULTRASONIC_PIN_TRIGGER, OUTPUT);
  pinMode(ULTRASONIC_PIN_ECHO, INPUT);
  //pinMode(LED_PIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);


  // Start web server
  server.on("/sensor-data", HTTP_GET, []() {
    String data = "{\"temperature\":";
    data += String(dht.readTemperature());
    data += ",\"humidity\":";
    data += String(dht.readHumidity());
    data += ",\"distance\":";
    data += String(getUltrasonicDistance());
    data += "}";
    server.send(200, "application/json", data);
  });
  server.begin();
}


void loop() {
  server.handleClient();
  updateSensors();
  playBuzzer();
   
}

void playBuzzer() {
  // Read temperature and distance from global variables
  if (temperature >= 20 || distance >= 20) {
    // If temperature or distance is greater than or equal to 20,
    // turn on the buzzer for 1 second
    digitalWrite(BUZZER_PIN, HIGH);
    delay(1000);
    digitalWrite(BUZZER_PIN, LOW);
  }
}

void updateSensors() {
  static unsigned long previousMillisDHT = 0;
  static unsigned long previousMillisUltrasonic = 0;
  const long intervalDHT = 2000;       // Interval for DHT sensor (2 seconds)
  const long intervalUltrasonic = 1000; // Interval for ultrasonic sensor (1 second)

  unsigned long currentMillis = millis();

  // Update DHT sensor data
  if (currentMillis - previousMillisDHT >= intervalDHT) {
    previousMillisDHT = currentMillis;

     temperature = dht.readTemperature();
    float humidity = dht.readHumidity();

    // Turn off LED if temperature exceeds 29°C
    digitalWrite(LED_PIN, temperature > 28 ? LOW : HIGH);

    Serial.print("IP Address is : ");
  Serial.println(WiFi.localIP());

    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.print(" °C, Humidity: ");
    Serial.print(humidity);
    Serial.println(" %");
  }

  // Update ultrasonic sensor data
  if (currentMillis - previousMillisUltrasonic >= intervalUltrasonic) {
    previousMillisUltrasonic = currentMillis;

    float distance = getUltrasonicDistance();

    Serial.print("Distance: ");
    Serial.print(distance);
    Serial.println(" cm");
  }
}

float getUltrasonicDistance() {
  digitalWrite(ULTRASONIC_PIN_TRIGGER, LOW);
  delayMicroseconds(2);
  digitalWrite(ULTRASONIC_PIN_TRIGGER, HIGH);
  delayMicroseconds(10);
  digitalWrite(ULTRASONIC_PIN_TRIGGER, LOW);

  float duration = pulseIn(ULTRASONIC_PIN_ECHO, HIGH);
   distance = (duration * 0.0343) / 2;

  return distance;
}
int getTemperaturePercentage() {
  float temperature = dht.readTemperature();
  // Normalize temperature to the range 0-100
  int temperaturePercentage = map(temperature, 0, 50, 0, 100);
  return temperaturePercentage;
}
