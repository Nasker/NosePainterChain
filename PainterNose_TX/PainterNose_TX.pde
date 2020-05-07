NosePointsList nosePoints;
OSCCommunication oscComm;
VideoManager vManager;

String destIP = "192.168.1.129";
int portIn = 1234;
int portOut = 4321;

void setup() {
  size(640, 480);
  vManager = new VideoManager(this);
  oscComm = new OSCCommunication(this, destIP, portIn, portOut);
  nosePoints = new NosePointsList();
}

void draw() {
  background(0);
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
