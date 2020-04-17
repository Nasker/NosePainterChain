import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
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
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    fill(255);
    ellipse(faces[i].x+(faces[i].width)/2, faces[i].y + faces[i].height/2, 
      faces[i].width/10, faces[i].height/10);
  }
}

void captureEvent(Capture c) {
  c.read();
}


void keyPressed() {
  if (key == 'c') background(0);
}
