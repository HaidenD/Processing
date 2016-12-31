/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
    https://youtu.be/FGAwi7wpU8c */

class Planet {
  
  float radius;
  float angle;
  float distance;
  float orbit;
  int level;
  PVector v;
  PShape globe;
  float ro = 0;
  Planet[] planets;

  
  Planet( float radius_, float distance_ , int level_, float orbit_, PImage texture_){
     v = new PVector(0,1,0);
     radius = radius_;
     level = level_;
     distance = distance_;
     v.mult(distance);
     orbit = orbit_;
     angle = random(TWO_PI);
     
     noStroke();
     //noFill();
     globe = createShape(SPHERE,radius);
     globe.setTexture(texture_);
     
  }
  
  void orbit(){
    
    angle+=orbit;
    if(planets != null){
      for(int i = 0; i <planets.length; i++){
        planets[i].orbit();
      }
    }
    
  }
  
  void spawnMoons(int level) {
   
    planets = new Planet[sPlanets.length];
    for(int i = 0; i < sPlanets.length; i++){
      
      
        float s = map(sPlanets[i][0], minS, 44423.069, 30, 100);
        float d = map(sPlanets[i][1], minD, maxD, 200, 10000);
        float os = map(sPlanets[i][2], 0.00,50.00, 0.000,0.0050);
        if (i > 3){
           float div = map(i,4,9,2,5);
           d= d/div;
        }
        planets[i] =  new Planet(s,  // Size
                                 d + s , //Distance
                                 level, os, // Level, and Orbit Value
                                 Textures[i+1]); // Textures
      }
    
  }
  
 void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    rotate(angle,p.x,p.y,p.z);
    translate(v.x,v.y,v.z);
    rotate(angle+0.5);
    fill(255,100);
    //sphere(radius);
    shape(globe);
    noFill();
    stroke(255);
    //ellipse(0,0 , radius*2, radius*2);
    if (planets != null){
      for (int i = 0; i < planets.length; i++){
        planets[i].show();
      }
    }
    popMatrix();
    pushMatrix();
    rotate(5.49779,v.x,v.y,v.z);
    ellipse(0,0,distance*2,distance*2);
    popMatrix();
  }
  
  
}