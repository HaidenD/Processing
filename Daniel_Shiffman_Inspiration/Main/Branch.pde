
class Branch {

  Branch parent;
  PVector position;
  PVector direction;
  PVector original_direction;
  int count;


  Branch(Branch par, PVector pos, PVector dir) {
    parent = par;
    position = pos;
    direction = dir;
    original_direction = dir.copy();
    count = 0;
  }

  void reset() {
    direction = original_direction.copy();
    count = 0;
  }

  Branch next() {
    PVector nextPosition =  position.add(direction);
    Branch nextBranch = new Branch(this, nextPosition, direction.copy());
    return nextBranch;
  }
  
  void show() {
   
    if(parent != null){
     stroke(255);
     line(position.x,position.y, parent.position.x,parent.position.y);
    }
  }
}