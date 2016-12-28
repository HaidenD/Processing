/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://youtu.be/KkyIDI6rQJI */

class Drop{
  float x = random(width);
  float y = random(-1000,0);
  float z = random(0,20);
  float yspeed = map(z,0,20,1,10);
  float len = map(z,0,20,10,20);
  
  
  
  void fall(){
    y = y + yspeed;
    float grav = map(z,0,20,0.01,0.2);
    yspeed = yspeed + grav;
    
    if (y > height) {
      splash();
      y = random(-200,0);
      yspeed = map(z,0,20,4,10);
    }
  }
  
  void splash() {
    /*for(int i =height; i > height-20; i--){
      float q =pow(i,2.0)-2; //sqrt(4*pow(float(i),float(2))/16);*/
     stroke(255, 234, 50);
     noFill();
     float r = random(10,20);
     float t = map(z,0,20,1,2);
     strokeWeight(t);
     arc(x, height-10, r, r*2, 0, PI, 0);
    
 
   
  }
  
  
  void show(){
     float thick = map(z,0,20,1,4);
     strokeWeight(thick);
     stroke(255, 234, 50);
     line(x,y,x,y+len); 
  }
  
}