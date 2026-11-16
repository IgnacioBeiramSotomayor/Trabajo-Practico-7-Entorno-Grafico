import processing.serial.*;

Serial myPort;
boolean boton1Estado = false;
boolean boton2Estado = false;

void setup() {
  size(400, 400);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(220);

  if (boton1Estado) {
    fill(0, 255, 0);
  } else {
    fill(100);
  }
  rect(80, 150, 100, 100);
  fill(0);
  textSize(14);
  text("BOTON 1", 100, 205);

  if (boton2Estado) {
    fill(0, 255, 0);
  } else {
    fill(100);
  }
  rect(220, 150, 100, 100);
  fill(0);
  text("BOTON 2", 240, 205);
}

void serialEvent(Serial p) {
  String message = p.readStringTrim();
  if (message != null) {
    if (message.equals("B1_ON")) {
      boton1Estado = true;
    } else if (message.equals("B1_OFF")) {
      boton1Estado = false;
    } else if (message.equals("B2_ON")) {
      boton2Estado = true;
    } else if (message.equals("B2_OFF")) {
      boton2Estado = false;
    }
  }
}
