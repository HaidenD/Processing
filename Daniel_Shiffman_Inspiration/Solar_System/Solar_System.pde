/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
    https://youtu.be/FGAwi7wpU8c*/

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


Planet star;
float starSize = 432168.6;
float orbit;        // Size Radius       Orbit
float sPlanets[][] = {{1240,      35983605.742,   47.4  },  //Mercury
                      {3760,      67232363.001,   35.0 }, // Venus
                      {3963.199,  92957130.359,   29.8 }, // Earth
                      {2110.798,  141635349.559,  24.1 }, // Mars
                      {44423.069, 483631840.054,  13.1 }, // Jupiter
                      {37448.799, 888187982.184,  9.7 }, // Saturn
                      {15881.626, 1783950479.201, 6.8  }, //Uranus
                      {15388.878, 2798655849.837, 5.4 }, // Neptune
                      {736.946,   3674490972.719, 4.7 }}; //Pluto
                      
 String[] Tlinks =   {"sun2.jpg",
                      "mercury.jpg",
                      "venus.jpg",
                      "earth.jpg",
                      "mars.jpg",
                      "jupiter.jpg",
                      "saturn.jpg",
                      "uranus.jpg",
                      "neptune.jpg",
                      "pluto.png"};
 PImage[] Textures;
                      
float maxD = 3674490972.719;
float maxS = 432169;
float minD = 35983605.742;
float minS = 736.946;
float s;


PeasyCam cam;

void setup() {
  size(1000, 1000,P3D);
  lights();
  cam = new PeasyCam(this, 100);
  Textures = new PImage[Tlinks.length];
  for(int i = 0; i < Tlinks.length; i++){
    Textures[i] = loadImage(Tlinks[i]);
  }
  
  int level = 0;
  float s  =  map(starSize,minS,maxS,50,150);
  star = new Planet(s,0,level,0, Textures[0]);
  star.spawnMoons(level+1);

}


void draw() {
  //translate(width/2,height/2);
  //lights();
  shininess(.05);

  pointLight(255,255,255,200,0,0);
  pointLight(255,255,255,0,200,0);
  pointLight(255,255,255,0,0,200);
   pointLight(255,255,255,-200,0,0);
  //ambientLight(255, 255, 255,100,0,0);
    
  background(0);
  PVector i = new PVector(1,1,1);
  //directionalLight(255, 255, 255, 1, 1, 1);
  rotate(1.5708,i.x,i.y,i.z);
  star.show();
  star.orbit();
  
}