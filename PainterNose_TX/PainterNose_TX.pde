import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

Capture video;
OpenCV opencv;


void setup() {
  size(640, 480);
  oscP5 = new OscP5(this, 4321);
  myRemoteLocation = new NetAddress("127.0.0.1", 1234);
  //myRemoteLocation = new NetAddress("192.168.1.128", 1234);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
  background(0);
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  opencv.flip(OpenCV.HORIZONTAL);

  //image(video, 0, 0);

  noFill();
  stroke(255);
  //strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);
  if (keyPressed == true && key == 'd') {
    for (int i = 0; i < faces.length; i++) {
      //println(faces[i].x + "," + faces[i].y);
      //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      fill(255);
      int posX = faces[i].x + (faces[i].width)/2;
      int posY = faces[i].y + (faces[i].height)/2;
      int sizeX = faces[i].width/10;
      int sizeY = faces[i].height/10;
      ellipse(posX, posY, sizeX, sizeY);
      OscMessage myMessage = new OscMessage("/painterNose/pos");
      myMessage.add(posX);
      myMessage.add(posY);
      myMessage.add(sizeX);
      myMessage.add(sizeY);
      oscP5.send(myMessage, myRemoteLocation);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

void keyPrecssed() {
  if (key == 'c') {
    OscMessage myMessage = new OscMessage("/painterNose/clear");
    oscP5.send(myMessage, myRemoteLocation);
    myMessage.add("clear");
    oscP5.send(myMessage, myRemoteLocation);
    background(0);
  }
}
