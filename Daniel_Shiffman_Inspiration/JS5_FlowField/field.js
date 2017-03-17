

var inc = 0.1;
var scl = 10;
var cols, rows;
var zoff = 0;

var flowfield = [];
var particles = [];
var numofParticles = 200;
function setup() {

    createCanvas(1200, 400);
    background(255);
    cols = floor(width / scl);
    rows = floor(height / scl);

    flowfield = new Array(cols * rows);

    for(var i = 0; i < numofParticles; i++){
        particles[i] = new Particle();
    }

}

function draw() {
      background(255);
    var yoff = 0;
    for (var y = 0; y < rows; y++) {
        var xoff = 0;
        for (var x = 0; x < cols; x++) {
            var index = (x + y * cols);
            var angle = noise(xoff, yoff, zoff) * TWO_PI;
            var v = p5.Vector.fromAngle(angle);
            v.setMag(5);
            flowfield[index] = v;
            xoff += inc;
            stroke(0,50);
            strokeWeight(1);
            push();
            translate(x * scl, y * scl);
            rotate(v.heading());
            line(0, 0, scl, 0);
            pop();
        }
        yoff += inc;
        zoff+= .0002;
    }

   /* for(var i = 0; i < numofParticles; i++){
    particles[i].follow(flowfield);
    push();
    particles[i].show();
    pop();
    }*/
    
}