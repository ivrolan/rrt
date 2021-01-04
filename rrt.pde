/*
  Iván López Broceño
  RRT (Rapidly exploring Random Tree) algorithm -> Pathfinding

*/

//Vertex v1 = new Vertex(250, 250);
//Vertex v2 = new Vertex(300, 300);
//Edge e1 = new Edge(v1, v2);
//Graph g = new Graph();
//Vertex current = v2;
//Vertex v3 = new Vertex(0,0);

final int WIDTH = 1000;
final int HEIGHT = 700;
final int STEP = 20;
Vertex init = new Vertex(WIDTH/2, HEIGHT/2);
Graph g = new Graph();
Vertex current;
RectObst wall = new RectObst(0, 0, 0, 0);
int counter = 0;
int v_counter = 1;
boolean started = false;
Goal goal = new Goal(0, 0, 0);
void mousePressed(){
wall.upper_left_corner = new PVector(mouseX, mouseY);
}
void mouseReleased(){
  wall.down_right_corner = new PVector(mouseX, mouseY);
  
}

void keyPressed(){
  if(key == 'a'){
    goal = new Goal(mouseX, mouseY, 40);
  }
  else{
  started = !started;
  }
}

void setup(){
 size(1000,700);
 background(255);
 
 g.addVertex(init);
 current = init;
}

void draw(){
  background(255);
  
  wall.drawObs();
  goal.drawObs();
  g.drawGraph();
  
  fill(0);
  text("N of vertex: " + str(v_counter), 10, 10, 80, 30);
  if (started && !goal.reached){
  rrt_algorithm();
  }
  
}

void rrt_algorithm(){

  // pick a random point
  PVector random_point = new PVector(random(WIDTH), random(HEIGHT));
  Vertex random_vertex = new Vertex(random_point.x, random_point.y);
  random_vertex.clr = color(240, 10, 55);
  random_vertex.drawVertex();
  // link this point to the nearest
  // this will define the direction to the next step
  Vertex nearest_vertex = g.findNearestTo(random_point);
  dottedLine(nearest_vertex.position.x, nearest_vertex.position.y, random_point.x, random_point.y);
  PVector relative_direction = (random_point.sub(nearest_vertex.position)).normalize();
  PVector dir_scaled = relative_direction.mult(STEP);
  PVector to_add_position = dir_scaled.add(nearest_vertex.position);
  
  
  Vertex to_add_vertex = new Vertex(to_add_position.x, to_add_position.y);
  Vertex to_visualize = new Vertex(to_add_position.x, to_add_position.y);
  to_visualize.clr = color(0, 255, 0);
  to_visualize.drawVertex();
  if(!wall.contains(to_add_vertex)){
    
  g.addVertexToExistingVertex(nearest_vertex, to_add_vertex);
  v_counter++;
  
  if(goal.contains(to_add_vertex)){
    goal.reached = true;
    to_add_vertex.clr = color(23, 200, 70);
    g.changePathToOrigin(to_add_vertex);
  }
  }
  if(counter < 10){
    delay(700);
  }
  else{
    delay(40);
  }
  counter++;
}

void randomWalk(){

  
  PVector random_dir = PVector.random2D();
  random_dir = random_dir.mult(STEP);
  
  PVector relative_random_dir = random_dir.add(current.position);
  Vertex random_vert = new Vertex(relative_random_dir.x, relative_random_dir.y);
  
  g.addVertexToExistingVertex(current, random_vert);
  current = random_vert;
  delay(700);


}

void dottedLine(float x1, float y1, float x2, float y2){
int STEPS = 7;
PVector dir = (new PVector(x2, y2)).sub(new PVector(x1, y1));
float mag = dir.mag();
PVector inc = dir.div(STEPS);
PVector actual = new PVector(x1, y1);
  for(int i = 0; i < STEPS; i++){
    PVector incremented = actual.copy().add(inc);
    if (i%2 == 0){
      
      line(actual.x, actual.y, incremented.x, incremented.y);
    
    }
    actual = incremented.copy();
  }


}
