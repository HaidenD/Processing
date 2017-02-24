
/* Haiden Deaton
 Inspired by Daniel Shiffman
 https://youtu.be/IKB1hWWedMk?list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH */

int cols, rows, scl;
int w = 3000;
int h = 3000;

float flying =0;

float[][] terrain;



void setup() {
  size (800, 800, P3D);
  frameRate(30);
  scl  =  20;
  cols =  w  / scl;
  rows =  h  / scl;
  terrain = new float[cols][rows];
  
}


void draw() {
  background(231, 229, 195);
  
 /* fill(255);
  textSize(40);
  String texts = "Perlin Noise Terrain \n By Haiden Deaton";
  text(texts, (width/2-((texts.length()*10)/2)), 75);*/
  //stroke(255);
  noStroke();
  
  
  flying -=0.1;
  float yoff =flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -200, 180);
      xoff +=0.1;
    }
    yoff +=0.1;
  }
  
  
  

  translate(width/4, height/2.5);
    rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {

    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      blendMode(SUBTRACT);
      fill(map((terrain[x][y+1]),-200,180,0,200),
           map((terrain[x][y+1])*1,-200,180,20,150),
           map((terrain[x][y+1])*3,-200,180,30,150));
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

    }
    endShape(TRIANGLE_STRIP);
  }
}