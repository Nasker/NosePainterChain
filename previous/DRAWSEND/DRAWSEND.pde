import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(640, 480);
  frameRate(25);
  /* start oscP5, listening  for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 4321);

  myRemoteLocation = new NetAddress("127.0.0.1", 1234);
}


void draw() {
  background(0);
}

void mouseDragged() {
  OscMessage myMessage = new OscMessage("/fuck");

  myMessage.add(mouseX);
  myMessage.add(mouseY);
  //println(myMessage);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
  //println("Sending Message!");
}
