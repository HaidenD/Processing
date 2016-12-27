/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://www.youtube.com/watch?v=17WoOqgXsRM */


Star[] stars = new Star[3000];
float speed;

void setup(){
  size(460,800);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX,0,width, 0 ,20);
  background(0);
  //translate(): Moves the top left corner to the another starting (x,y) value.
  translate(width/2,height/2);
  for (int i =0; i < stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
  
}