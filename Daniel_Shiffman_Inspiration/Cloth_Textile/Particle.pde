class Particle extends VerletParticle2D {
  
  Particle(float x, float y){
    super(x,y);
  }
  
  void display(){
    
   ellipse(x,y,10,10); 
  }
  
}