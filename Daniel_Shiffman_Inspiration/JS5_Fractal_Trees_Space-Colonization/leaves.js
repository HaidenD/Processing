
function Leaf() {

    this.pos = createVector(random(width), random(height));
    this.reached = false;


    this.show = function () {
        noStroke();
        
        fill(239, 180, 103);
        ellipse(this.pos.x, this.pos.y, 4, 4);

    }

}