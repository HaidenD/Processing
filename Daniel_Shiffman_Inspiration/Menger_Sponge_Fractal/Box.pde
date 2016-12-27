/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://www.youtube.com/watch?v=17WoOqgXsRM */
   
class Box {
  //Location
  PVector pos;
  float r;
  
  Box(float x, float y, float z, float r_){
    pos = new PVector(x,y,z);
    r = r_;
  }
  
   ArrayList<Box> generate() {
     ArrayList<Box> Boxes = new ArrayList<Box>();
     //int numBox = int(pow(3,c)) -1;
     for(int x = -1; x < 2; x++) {
       for(int y = -1; y < 2; y++) {
          for(int z = -1; z < 2; z++) {
            float newR = r/3;
            float sum  = abs(x) + abs(y) + abs(z);
            if(sum > 1){
              Box b =  new Box( pos.x+x*newR, pos.y+y*newR, pos.z+z*newR, newR);
              Boxes.add(b);
            }
          }
       }
    }
    return Boxes;
    
  }
  
  void show(){ 
   pushMatrix();
   translate(pos.x, pos.y,pos.z);
   fill(random(1,100));
  
   box(r);
   popMatrix();
    
  }
  
  
};