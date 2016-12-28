/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://youtu.be/AaGK-fj-BAM?list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH */
   
function Snake() {
    this.x = 0;
    this.y = 0;
    this.xspeed = 1;
    this.yspeed = 0;
    this.size = 0;
    this.tail = [];

    this.direction = function(x,y){
        this.xspeed = x;
        this.yspeed = y;
    }

    this.death = function() {
        for(var i = 0; i < this.tail.length; i++){

            if ( this.x == this.tail[i].x  && this.y == this.tail[i].y) {
                return true;
             }
         }
         return false;
    }

    this.update = function() {
        if (this.size === this.tail.length){
            for (var i = 0; i < this.size-1; i++){
            this.tail[i] = this.tail[i+1];
         }
        }
        this.tail[this.size-1] = createVector(this.x,this.y);

        this.x = this.x + this.xspeed*scl;
        this.y = this.y + this.yspeed*scl;

        if(this.death()){
            return true;
        }
        if (this.x >= width  || this.x < 0 || this.y < 0 || this.y >= height ){
            return true;
        }
        //this.x =  constrain(this.x, 0, width-scl);
        //this.y = constrain(this.y,0,height-scl);

        return false;
    }
    
    this.eat = function(pos){
        var d = dist(this.x,this.y, pos.x, pos.y);
        if (d < 1){
            this.size++;
            return true;
        } else {
            return false;
        }

    }

    this.show =  function() {
        fill(255);
        for (var i = 0; i < this.size; i++){
            rect(this.tail[i].x, this.tail[i].y, scl, scl);
        }
        rect(this.x,this.y,scl,scl);
    }
}