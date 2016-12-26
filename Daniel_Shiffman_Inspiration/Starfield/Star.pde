/*
   Created by Haiden Deaton
   With reference by Daniel Shiffman
   https://www.youtube.com/watch?v=17WoOqgXsRM 
*/

class Star {
  /*X position
    Y Position
    Z Position (how close are they to the edge)
    pz Past Z postition */
  float x;
  float y;
  float z;
  float pz;
  
  
  Star()
  {
    x= random(-width,width);
    y = random(-height,height);
    z = random(width); 
    pz = z;
  }
  
  void update(){
    z = z - speed;
    if(z<1){
      z = width;
      x= random(-width,width);
      y = random(-height,height);
      pz = z;
    }

    
  
  }
  
  void show(){
    fill(255);
    noStroke();

    
    // Map(): Re-maps a number from one range to another.
    float sx = map(x / z, 0,1,0, width);
    float sy = map(y / z, 0,1,0, width);
    
    float r = map(z,0,width,8,0);
    ellipse(sx,sy,r,r);
    
    float px = map(x / pz, 0,1,0, width);
    float py = map(y / pz, 0,1,0, height);
    
    pz = z;
    stroke(255);
    strokeWeight(map(z,0,width,4,0));
    line(px, py, sx,sy);
    
    
  }
};