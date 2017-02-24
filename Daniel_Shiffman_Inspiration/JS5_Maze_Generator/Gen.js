/*  <!-- Created by Haiden Deaton -->
    <!-- With Reference by Daniel Shiffman -->
    <!-- https://www.youtube.com/watch?v=HyK_Q5rrcr4&t=89s -->
    <!-- https://en.wikipedia.org/wiki/Maze_generation_algorithm */


var cols, rows;
var w = 40;
var grid= [];
var stack = [];


var current;

function setup(){
    createCanvas(480,800);
    rows = floor(height/w);
    cols = floor(width/w);

    for(var y = 0; y < rows; y++){
        for (var x = 0; x < cols; x++){
            grid.push(new Cell(x,y));
        }
    }

    current = grid[0];

}

function draw(){
    background(138,255,138);

    for (var i = 0; i < grid.length; i++){
        grid[i].show();
    }

    current.visited = true;
    next = current.checkNeigbors();
    if(next){
        stack.push(current);
        removeWalls(current,next);
        current = next;
    }
    else if(stack.length > 0){
        current = stack.pop();
    }
    

}


function removeWalls(current, next){

        var g = current.x - next.x;
        var v = current.y - next.y;

        if (g === - 1){ //Right
            current.walls[1] = false;
            next.walls[3] = false;
        }
        else if (g === 1){ //Left
            current.walls[3] = false;
            next.walls[1] = false;
        } 
        else if (v === -1){ // Bottom
            current.walls[2] = false;
            next.walls[0]=false;
        } 
        else if (v === 1){ //Top
            current.walls[0] = false;
            next.walls[2]=false;
        } 
}


function getIndex(i , j){
    return i +j * cols;
}



function Cell(i,j){
    
    this.x = i;
    this.y = j;
    this.visited = false;
    this.walls = [true,true,true,true];
    

    this.checkNeigbors = function(){
        var neighbors = [];

        if(j-1 >= 0){
            var top = grid[getIndex(i,j-1)];
            if(!top.visited){
                neighbors.push(top);
            }
            
        }
        if(i+1 <= cols-1){
            var right = grid[getIndex(i+1,j)];
            if(!right.visited){
            neighbors.push(right);
            }
        }
        if(i-1 >= 0){
            var left = grid[getIndex(i-1,j)];
            if(!left.visited){
            neighbors.push(left);
            }
        }
        if(j+1 <= rows-1){
            var bottom = grid[getIndex(i,j+1)];
            if(!bottom.visited){
            neighbors.push(bottom);
            }
        }

        if (neighbors.length >0)
        {
            return neighbors[floor(random(0,neighbors.length))];
        }
        

    }

    this.show = function(){

        var x = this.x*w;
        var y = this.y*w;
    
       if (this.visited)
        {
            noStroke();
            fill(255,138,197);
            rect(x,y,w,w);
        }

        
        stroke(0);
        if (this.walls[0]) {
            line(x,y,x+w,y); //top
        }
        if (this.walls[1]) {
          line(x+w,y,x+w,y+w); // right
        }
        if (this.walls[2]) {
            line(x,y+w,x+w,y+w); //bottom
        }
        if (this.walls[3]) {
            line(x,y,x,y+w); //left
        }

    }
}