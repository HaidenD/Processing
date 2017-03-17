

function Particle() { 
    this.pos = createVector(random(width),random(height));
    this.lastpos = this.pos.copy();
    this.vel = createVector(0,0);
    this.acc = createVector(0,0);
    this.maxspeed = 10;
    this.color = [255, 255, 255, 50];

    this.update = function() {
        this.vel.add(this.acc);
        this.vel.limit(this.maxspeed);
        this.pos.add(this.vel);
        this.acc.mult(0);
        this.edges();
    }

    this.applyForce = function(force) {
        this.acc.add(force);
    }

    this.show = function() {
        this.lastpos = this.pos.copy();
        this.update();
        stroke(this.color[0],this.color[1],this.color[2], this.color[3]);
        strokeWeight(2);
        line(this.pos.x+1, this.pos.y, this.lastpos.x, this.lastpos.y); 
    }

    this.edges = function() {
        if (this.pos.x > width){ this.pos.x = 0; 
            this.lastpos = this.pos.copy();
            this.colorme(); 
         }

        if (this.pos.x < 0) 
        {this.pos.x = width; 
             this.colorme();
            this.lastpos = this.pos.copy(); }
        if (this.pos.y > height){
             this.pos.y = 0;
              this.colorme();
            this.lastpos = this.pos.copy(); }
        if (this.pos.y < 0) {
             this.pos.y = height; 
             this.colorme();
            this.lastpos = this.pos.copy();}
        
    }

    this.colorme = function(){
        var val = noise(this.pos.x, this.pos.x);
        this.color = [ val*255, val*255, val*255, val*100]
    }

    this.follow = function(flowfield){
        var x = floor(this.pos.x / scl);
        var y = floor(this.pos.y / scl);
        var index = x + y * cols;
        this.applyForce(flowfield[index]);

    }


}