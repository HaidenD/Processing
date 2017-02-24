float minX = -1, 
  minY =  1; 
int maxiterations = 100;



void setup() {

  // Create Canvas
  size(1000, 1000);
  colorMode(HSB, 1);
  pixelDensity(1);
  loadPixels();

}

void draw(){
  background(51);
for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      float a = map(x, 0, width, minY, minX), 
            b = map(x, 0, width, minY, minX);
  
      int   n = 0;

      float ca = a, 
            cb = b;
      while (n < maxiterations) {

        float aa = a * a - b * b, 
              bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (abs(a + b) > 16) {
          break;
        }
        
      float bright = map(n, 0, maxiterations, 0, 1);
      bright = map(sqrt(bright), 0, 1, 0, 255);
      int b2 = floor(bright);
      if (n == maxiterations) {
        bright = 0;
      }
      pixels[((y+1)*height)+(x)]=b2;


        n++;
      }


  }
  updatePixels();
}
}