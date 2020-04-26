NosePointsList nosePoints;
OSCCommunication oscComm;
VideoManager vManager;

void setup() {
  size(640, 480);
  vManager = new VideoManager(this);
  oscComm = new OSCCommunication(this, 4321, 1234);
  nosePoints = new NosePointsList();
}

void draw() {
  vManager.captureNShowFrame();
  nosePoints.display();
  ArrayList<NosePoint> nosePointsN = vManager.getFrameNosePoints();
  if (keyPressed == true && key == 'd') {
    for (NosePoint nosePoint : nosePointsN) {
      nosePoints.addNosePoint(nosePoint);
      oscComm.sendNosePoint(nosePoint);
    }
  } 
}

void keyPressed() {
  if (key == 'c') {
    oscComm.sendClear();
    nosePoints.clear();
  }
}
