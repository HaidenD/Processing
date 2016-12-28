/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://youtu.be/AaGK-fj-BAM?list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH */
   
function Food() {

    this.pos = createVector(random(width),random(height))

    this.pickLoc =  function(){

        var cols = floor(width/scl);
        var rows = floor(height/scl);
        this.pos = createVector(floor(random(cols)),floor(random(rows)));
        this.pos.mult(scl);

    }

    this.show = function(){
        fill(255,100,100);
        rect(this.pos.x, this.pos.y, scl, scl);

    }


}