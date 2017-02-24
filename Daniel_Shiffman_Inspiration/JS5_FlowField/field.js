

var inc = 0.1;
var scl = 20;
var cols, rows;
var zoff = 0;


function setup() {
    createCanvas(400, 400);
}

function draw() {

    createCanvas(400, 400);
    cols = floor(width / scl);
    rows = floor(height / scl);

    var yoff = 0;
    for (var y = 0; y < rows; y++) {
        var xoff = 0;
        for (var x = 0; x < cols; x++) {
            var index = (x + y * cols) * 4;
            var angle = noise(xoff, yoff, zoff) * TWO_PI;
            var v = p5.Vector.fromAngle(angle);
            xoff += inc;
            stroke(0);
            push();
            translate(x * scl, y * scl);
            rotate(v.heading());
            line(0, 0, scl, 0);
            pop();
        }
        yoff += inc;
        zoff+= .0002;
    }
    
}