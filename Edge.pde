class Edge{


  Vertex v1;
  Vertex v2;
  color clr = color(105, 5, 4);
  int w = 1;
  Edge(Vertex v1_source, Vertex v2_source){
  
    v1 = v1_source;
    v2 = v2_source;
    
  }
  
  void drawEdge(){
    strokeWeight(w);
    stroke(clr);
    line(v1.position.x, v1.position.y, v2.position.x, v2.position.y);
    strokeWeight(1);
  }






}
