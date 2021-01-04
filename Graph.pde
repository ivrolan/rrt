class Graph{

  ArrayList<Vertex> vertexes = new ArrayList<Vertex>();
  ArrayList<Edge> edges = new ArrayList<Edge>(); 
  
  
  
  
  void addVertex(Vertex v){
  
    vertexes.add(v);
    
  }
  
  
  void addEdge(Edge e){
  
    edges.add(e);
    
  }
  
  //static void isIn(ArrayList ) ...laziness
  
  void addVertexToExistingVertex(Vertex v_in_graph, Vertex v_to_add){
    // assuming that vertex exists in our graph
    // add a vertex and an edge connecting it to the v_in_graph given
    Edge temp_e = new Edge(v_in_graph, v_to_add);
    v_in_graph.children.add(v_to_add);
    v_to_add.parent = v_in_graph;
    this.addVertex(v_to_add);
    this.addEdge(temp_e);
  
  }
  
  Vertex findNearestTo(PVector point){
    float min_distance = 9999999;
    Vertex nearest_v = new Vertex(0,0);
    for (Vertex v : vertexes){
      
      if(point.dist(v.position) < min_distance){
      
        nearest_v = v;
        min_distance = point.dist(v.position);
        
      }
    }
    
    return nearest_v;
  
  }
  
  Edge findEdgeWith(Vertex init, Vertex end){
  
    Edge e_found = new Edge(new Vertex(0,0),new Vertex(0,0));
    
    for (Edge e : edges){
    
      if(init.isEqualTo(e.v1) && end.isEqualTo(e.v2)){
        e_found = e;
        break;
      } 
    }
    return e_found;
    
  }
  
  void changePathToOrigin(Vertex last){
    
    color v_color = color(85,255,0); //color(0, 255, 20);
    color e_color = color(30,255,20);
    int strk = 3;
    
    while (last != init){
      last.clr = v_color;
      Edge e_to_change = findEdgeWith(last.parent, last);
      e_to_change.w = strk;
      e_to_change.clr = e_color;
      last = last.parent;
    }
  
  }
  
  // DRAW FUNCTIONS
  void drawEdges(){
  
    for(Edge e : edges){
      e.drawEdge();
    }
    
  }
  
  void drawVertexes(){
  
    for(Vertex v : vertexes){
      v.drawVertex();
    }
    
  }
  
  void drawGraph(){
  
    drawEdges();
    drawVertexes();
  
  }


}
