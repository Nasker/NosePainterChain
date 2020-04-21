import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int posX = 0;
int posY = 0;
int sizeX = 0;
int sizeY = 0;
boolean isClear = false;
void setup() {
  size(640, 480);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 1234);

  myRemoteLocation = new NetAddress("127.0.0.1", 1234);
  println(posX + "    " +posY);
  background(0);
}

void draw() {
  stroke(255);
  fill(255);
  ellipse(posX, posY, sizeX, sizeY);
  if (posX == 0 && posY == 0)
    background(0);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/painterNose/pos")) {
    posX = theOscMessage.get(0).intValue()*2;
    posY = theOscMessage.get(1).intValue()*2;
    sizeX = theOscMessage.get(2).intValue()*2;
    sizeY = theOscMessage.get(3).intValue()*2;
  }
  if (theOscMessage.checkAddrPattern("/painterNose/clear")) {
    posX = 0;
    posY = 0;
  }
}

void keyPressed() {
  if (key == 'c') background(0);
}
