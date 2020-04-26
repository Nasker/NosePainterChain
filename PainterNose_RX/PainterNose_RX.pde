NosePointsList nosePoints;
OSCCommunication oscComm;

void setup() {
  size(640, 480);
  oscComm = new OSCCommunication(this, 1234, 4321);
  nosePoints = new NosePointsList();
}

void draw() {
  nosePoints.display();
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/painterNose/pos")) {
    int posX = theOscMessage.get(0).intValue()*2;
    int posY = theOscMessage.get(1).intValue()*2;
    int size = theOscMessage.get(2).intValue()*2;
    NosePoint nosePoint = new NosePoint(posX, posY, size);
    nosePoints.addNosePoint(nosePoint);
  }
  if (theOscMessage.checkAddrPattern("/painterNose/clear")) {
    nosePoints.clear();
  }
}

void keyPressed() {
  if (key == 'c') {
    nosePoints.clear();
  }
}
