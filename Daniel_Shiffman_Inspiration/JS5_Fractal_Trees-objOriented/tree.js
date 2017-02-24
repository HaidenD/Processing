/*  <!-- Created by Haiden Deaton -->
    <!-- With Reference by Daniel Shiffman -->
    <!-- https://www.youtube.com/watch?v=HyK_Q5rrcr4&t=89s -->
    <!-- https://en.wikipedia.org/wiki/Maze_generation_algorithm */



var tree = [];

function setup() {
    createCanvas(460, 800);

    var a = createVector(width / 2, height);
    var b = createVector(width / 2, height - 100);
    var root = new Branch(a, b);
    tree[0] = root;

}

function mousePressed(){

    for (var i = tree.length-1; i >= 0; i--){
        tree.push(tree[i].spawnr());
        tree.push(tree[i].spawnl());

    }

}

function draw() {
    background(51);
    for (var i = 0; i < tree.length; i++) {

        tree[i].show();
    }
}

