/*
  Created by Haiden Deaton
   With Reference by Daniel Shiffman
   https://youtu.be/AaGK-fj-BAM?list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH */
   
var snake;
var scl = 30;
var food;

function setup(){
    createCanvas(460,800);
    snake = new Snake();
    food = new Food();
    food.pickLoc();
    frameRate(10);
}

function draw() {
    background(51);
    if (snake.update())
    {
        setup();
    }
    snake.show();
    food.show();
    if (snake.eat(food.pos)){
        food.pickLoc();
    }

    
    
}

function keyPressed() {
    if (keyCode == UP_ARROW){
        var d = dist(snake.xspeed,snake.yspeed, 0, 1);
        if (d != 0){
            snake.direction(0,-1);
        }
    } else if (keyCode == DOWN_ARROW){
        var d = dist(snake.xspeed,snake.yspeed, 0, -1);
        if (d != 0){
        snake.direction(0,1);
        }
    } else if (keyCode == RIGHT_ARROW){
        var d = dist(snake.xspeed,snake.yspeed, -1, 0);
        if (d != 0){
        snake.direction(1,0);
        }
    } else if (keyCode == LEFT_ARROW){
        var d = dist(snake.xspeed,snake.yspeed, 1, 0);
        if (d != 0){
        snake.direction(-1,0);
        }
    }
}
