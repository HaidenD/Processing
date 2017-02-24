import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;

import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;







Particle[][] particles;
ArrayList<Spring> springs;

float w  = 10;
int cols = 40, 
  rows = 40;

VerletPhysics physics;

void setup() {
  size(600, 600,P3D);
  particles = new Particle[cols][rows];
  springs = new ArrayList<Spring>();

  physics = new VerletPhysics();
  Vec3D gravity =  new Vec3D(0, 1, 0);
  GravityBehavior gb = new GravityBehavior(gravity);
  physics.addBehavior(gb);

  float x = -200, 
    z = -200;
  for (int i = 0; i < cols; i++) {   
    z = -200;
    for (int j = 0; j < rows; j++) {
      Particle p = new Particle(x, -100, z);
      particles[i][j]= p;
      physics.addParticle(p);
      z += w;
    }
    x += w;
  }

  for (int i = 0; i < cols-1; i++) {   
    for (int j = 0; j < rows-1; j++) {
      //Connect to the right
      Spring s1 = new Spring(particles[i][j], particles[i+1][j]);
      Spring s2 = new Spring(particles[i][j], particles[i][j+1]);
      springs.add(s1);
      physics.addSpring(s1);
      springs.add(s2);
      physics.addSpring(s2);
    }
  }



  //Lock the first and last particle
  particles[0][0].lock();
  particles[cols-1][0].lock();
   particles[0][rows-1].lock();
   particles[cols-2][rows-1].lock();
}


void draw() {
  background(51);
  translate(width/2, height/2);
  //Phyics move forward with time
  physics.update();
  //for (int i = 0; i < cols; i++) {   
  //  for (int j = 0; j < rows; j++) {
  //    particles[i][j].display();
  //  }
  //}
  for (Spring p : springs) {
    p.display();
  }
  //saveFrame("output/CT_####.png");
}