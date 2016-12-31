
/*  Created by Haiden Deaton 
     With Reference by Daniel Shiffman 
     https://youtu.be/biN3v3ef-Y0 */

var ship;
var r_ = 1;
function setup(){
    createCanvas(460,800, WEBGL);
    ship = new Ship();

}

function keyPressed() {
    if(keyCode === RIGHT_ARROW)
    {
        ship.shift(1);
    } else if (keyCode === LEFT_ARROW) {
        ship.shift(-1);
    }

}

function draw(){
    background(0,69);
    //rotateX( this.r_ += 0.02);
    //rotateY( this.r_ += 0.02);
    ship.show();


}