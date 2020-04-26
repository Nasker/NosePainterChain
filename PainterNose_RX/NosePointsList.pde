import java.util.concurrent.CopyOnWriteArrayList;

class NosePointsList{
  CopyOnWriteArrayList<NosePoint> nosePointsList;
  
  NosePointsList(){
    nosePointsList = new CopyOnWriteArrayList<NosePoint>();
  }
  
  void addNosePoint(NosePoint nosePoint){
    nosePointsList.add(nosePoint);
  }
  
  void display(){
    for(NosePoint point:nosePointsList){
      point.display();
    }
  }
  
  void clear(){
    nosePointsList.clear();
  }
}
