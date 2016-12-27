/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://www.youtube.com/watch?v=17WoOqgXsRM */
   
float a = 0;
Box b;
int count = 1;
ArrayList<Box> sponge;
void setup(){
  size(460, 800, P3D);
  sponge = new ArrayList<Box>();
  Box b =new Box(0,0,0,200);
  sponge.add(b);
  
}

void mousePressed() {
  ArrayList<Box> next = sponge.get(0).generate();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}


void draw(){
  background(50);
  stroke(255);
  noFill();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.1);
  rotateZ(a*0.2);
  for (Box b : sponge) {
    b.show();
  }
  
  a+=0.01;
  
  
 
  
}