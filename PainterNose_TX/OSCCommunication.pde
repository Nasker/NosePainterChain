import oscP5.*;
import netP5.*;

class OSCCommunication {
  OscP5 oscP5;
  NetAddress myRemoteLocation;

  OSCCommunication(PApplet _parent, int portIn, int portOut) {
    oscP5 = new OscP5(_parent, portIn);
    myRemoteLocation = new NetAddress("localhost", portOut);
    //myRemoteLocation = new NetAddress("37.14.27.52", portOut);
  }
  
  void sendClear() {
    OscMessage myMessage = new OscMessage("/painterNose/clear");
    myMessage.add("clear");
    oscP5.send(myMessage, myRemoteLocation);
  }

  void sendNosePoint(NosePoint nosePoint) {
    OscMessage myMessage = new OscMessage("/painterNose/pos");
    myMessage.add(nosePoint.posX);
    myMessage.add(nosePoint.posY);
    myMessage.add(nosePoint.size);
    oscP5.send(myMessage, myRemoteLocation);
  }
}
