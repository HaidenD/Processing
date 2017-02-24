/*  <!-- Created by Haiden Deaton -->
    <!-- With Reference by Daniel Shiffman -->
    <!-- https://www.youtube.com/watch?v=HyK_Q5rrcr4&t=89s -->
    <!-- https://en.wikipedia.org/wiki/Maze_generation_algorithm */





function setup(){
    createCanvas(460,800);
   
}

function draw(){
    background(51);
    translate( width/2 , height);


    stroke(255);
    branch(100);

}

    
function branch(len) {
    line(0,0,0,-len);
    translate(0,-len);
    if(len > 4){
        push();
        rotate(PI/4);
        branch(len*0.67);
        pop();
        push();
        rotate(-PI/4);
        branch(len* .67);
        pop();
    }
        
}