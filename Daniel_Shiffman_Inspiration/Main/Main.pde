int max_dist = 50;
int min_dist = 5; 

Tree tree;
void setup() {
  size(600,600);
  tree =  new Tree();
  
}


void draw(){
  background(51);
  tree.show();
  tree.grow();
  
}