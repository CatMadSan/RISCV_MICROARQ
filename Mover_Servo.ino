#include <Servo.h>

Servo servoMotor;
String nom = "Arduino";
String msg;

void setup() {
  Serial.begin(9600);
  servoMotor.attach(A2);
  servoMotor.write(0);
}

void loop() {
  readSerialPort();

  if (msg == "d") {
     for (int i = 0; i <= 180; i++)
  {
    // Desplazamos al ángulo correspondiente
    servoMotor.write(i);
    // Hacemos una pausa de 25ms
    delay(25);
  }
 
  }else if(msg == "a"){
    for (int i = 179; i > 0; i--)
  {
    // Desplazamos al ángulo correspondiente
    servoMotor.write(i);
    // Hacemos una pausa de 25ms
    delay(25);
  }  
  }
  else if(msg == "m"){
    servoMotor.write(0)
    }
  sendData()
  delay(500);
}

void readSerialPort() {
  msg = "";
  if (Serial.available()) {
    delay(10);
    while (Serial.available() > 0) {
      msg += (char)Serial.read();
    }
    Serial.flush();
  }
}

void sendData() {
  //write data ledState x sensor1 x sensor2
  Serial.print(true);

}
