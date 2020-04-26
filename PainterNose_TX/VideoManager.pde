import gab.opencv.*;
import processing.video.*;
import java.awt.*;

class VideoManager {
  Capture video;
  OpenCV opencv;

  VideoManager(PApplet _parent) {
    video = new Capture(_parent, 640/2, 480/2);
    opencv = new OpenCV(_parent, 640/2, 480/2);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
    video.start();
  }

  void captureNShowFrame() {
    scale(2);
    opencv.loadImage(video);
    opencv.flip(OpenCV.HORIZONTAL);
    pushMatrix();
    scale(-1.0, 1.0);
    translate(-width/2, 0);
    image(video, 0, 0);
    popMatrix();
  }

  ArrayList<NosePoint> getFrameNosePoints() {
    noFill();
    stroke(0, 255, 0);
    Rectangle[] faces = opencv.detect();
    ArrayList<NosePoint> nosePoints = new ArrayList<NosePoint>();
    for (int i = 0; i < faces.length; i++) {
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      int posX = faces[i].x + (faces[i].width)/2;
      int posY = faces[i].y + (faces[i].height)/2;
      int size = faces[i].width/10;
      ellipse(posX, posY, 2, 2);
      NosePoint nosePoint = new NosePoint(posX, posY, size);
      nosePoints.add(nosePoint);
    }
    return nosePoints;
  }
}

void captureEvent(Capture c) {
  c.read();
}
