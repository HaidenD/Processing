/*  <!-- Created by Haiden Deaton -->
    <!-- With Reference by Daniel Shiffman -->
    <!-- https://www.youtube.com/watch?v=kKT0v3qhIQY&index=20&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH -->
    <!-- https://en.wikipedia.org/wiki/Maze_generation_algorithm */



var tree;
var max_dist = 400;
var min_dist = 10;



function setup(){
    createCanvas(800,200);
    tree = new Tree();
   
}

function draw(){
    background(51);
    tree.show();
    tree.grow();
    if (tree.leaves.length === 0){
        noloop();
    }


}
