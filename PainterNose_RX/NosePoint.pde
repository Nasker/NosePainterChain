class NosePoint{
  int posX;
  int posY;
  int size;
  
  NosePoint(int posX, int posY, int size){
    this.posX = posX;
    this.posY = posY;
    this.size = size;
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipse(posX, posY, size, size);
  }
}
