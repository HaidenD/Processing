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
import toxi.physics.constraints.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;




Particle[][] particles;
ArrayList<Spring> springs;

float w  = 10;
int cols = 40,
    rows = 40;

  VerletPhysics2D physics;

void setup() {
  size(600, 600);
  particles = new Particle[cols][rows];
  springs = new ArrayList<Spring>();

  physics = new VerletPhysics2D();
  Vec2D gravity =  new Vec2D(0, .5);
  GravityBehavior gb = new GravityBehavior(gravity);
  physics.addBehavior(gb);

  float x = 100, 
    y = 10;
  for (int i = 0; i < cols; i++) {   
    y=10;
    for (int j = 0; j < rows; j++) {
      Particle p = new Particle(x, y);
      particles[i][j]= p;
      physics.addParticle(p);
      y += w;
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
}


void draw() {
  background(51);
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