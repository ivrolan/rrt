

class Vertex{

  PVector position;
  static final int SIZE = 10;
  color clr = color(0,179,149);//color(89, 176, 194);
  ArrayList<Vertex> children = new ArrayList<Vertex>();
  Vertex parent;
  Vertex(float px, float py){
  
    position = new PVector(px, py); 
  
  }
  
  boolean isEqualTo(Vertex to_compare){
  
    return this.position.x == to_compare.position.x && this.position.y == to_compare.position.y;
  }
  
  
  void drawVertex(){
    fill(clr);
    stroke(0);
    circle(position.x, position.y, SIZE);
    
  }

}
