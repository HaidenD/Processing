class Tree {

  ArrayList<Branch>  branches =  new ArrayList<Branch>();
  ArrayList<Leaf>    leaves = new ArrayList<Leaf>();

  Tree() {

    //Create some Leaves.
    for (int i = 0; i < 1000; i++) {
      leaves.add(new Leaf());
    }

    PVector p = new PVector(width/2, height/2);
    PVector startDirection = new PVector(0, -1);
    Branch root = new Branch(null, p, startDirection);

    branches.add(root);
    Branch current = root;
    boolean found = false;
    
    while (!found) {
      for(Leaf F : leaves){
        float distance = PVector.dist(current.position, F.position);
        if (distance < max_dist){
          found = true;
        }
      }
      
      if(!found){
       Branch B = current.next();
       current = B;
       branches.add(current);
        
      }
     
    }
  }

 

  void grow() {

    for (Leaf F : leaves) {

      float record = 10000;
      Branch closestBranch =  null;

      for (Branch B : branches) {
        float distance = PVector.dist(F.position, B.position);
        if (distance < min_dist) {
          F.reached = true;
          closestBranch = null;
          break;
        } else if (closestBranch == null || distance < record) {
          closestBranch = B;
          record = distance;
        } else if (distance > max_dist) {
          
        }
      }
      

      if (closestBranch != null) {
        PVector newDirection = PVector.sub(F.position, closestBranch.position);
        newDirection.normalize();
        closestBranch.direction.add(newDirection);
        closestBranch.count++;
      }
    }

    for (int i = leaves.size()-1; i >= 0; i--) {
      Leaf F = leaves.get(i);
      if (F.reached) {
        leaves.remove(i);
      }
    }


    for (int i = branches.size()-1; i >= 0; i--) {
      Branch B =  branches.get(i);
      if (B.count > 0) {
        B.direction.div(B.count);
        PVector rand = PVector.random2D();
        rand.mult(0.3);
        PVector newPos = PVector.add(B.position, B.direction);
        B.direction.add(rand);
        Branch nB = new Branch(B, newPos, B.direction.copy());
        branches.add(nB);
        B.reset();
      }
    }
    
  }
  
  void jitter(){
   
    for (Branch B : branches){
      B.position.x += random(-1,1);
      B.position.y += random(-1,1);
    }
  }
  
  void show(){
   
    for(Leaf F : leaves){
      F.show();
    }
    for(Branch B : branches){
      B.show();
    }
  }
  
  
  
}