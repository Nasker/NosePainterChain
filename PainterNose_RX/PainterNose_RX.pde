import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

NosePointsList nosePoints;

void setup() {
  size(640, 480);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 1234);

  myRemoteLocation = new NetAddress("127.0.0.1", 1234);
  nosePoints = new NosePointsList();
}

void draw() {
  background(0);
  nosePoints.display();
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/painterNose/pos")) {
    int posX = theOscMessage.get(0).intValue()*2;
    int posY = theOscMessage.get(1).intValue()*2;
    int sizeX = theOscMessage.get(2).intValue()*2;
    int sizeY = theOscMessage.get(3).intValue()*2;
    NosePoint nosePoint = new NosePoint(posX, posY, sizeX);
    nosePoints.addNosePoint(nosePoint);
  }
  if (theOscMessage.checkAddrPattern("/painterNose/clear")) {
   nosePoints.clear();
  }
}

void keyPressed() {
  if (key == 'c') background(0);
}
