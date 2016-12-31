

function Ship(){
    this.x=-0;
    this.x = map(this.x, -width, width, -width/2, width/2);
    console.log(this.x)
    this. r_ = 0;
    this.show =function(){
       //fill(100,100,100);
        noFill();
        translate(this.x,(height/2)-20)
        rotateX(this.r_ += .01);
        rotateY(this.r_ += .01);
        box(50);
    }

    this.shift = function(dir){
        
        this.x += dir*20;
        this.x = map(this.x, -width, width, -width, width);
        console.log(this.x)
    }
}