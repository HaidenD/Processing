

function Branch(parent, pos, dir ){


    this.pos = pos;
    this.parent = parent;
    this.dir = dir;
    this.origdir = dir.copy();
    this.count = 0;

    this.reset = function() {
        this.dir = this.origdir.copy();
        this.count = 0;
    }

    this.next = function(){
        var nextPos = p5.Vector.add(this.pos, this.dir);
        var nextBranch = new Branch(this, nextPos, this.dir.copy());
        return nextBranch;
    }



    this.show = function()
    {
        if (parent != null){
            stroke(255);
            line(this.pos.x, this.pos.y, this.parent.pos.x, this.parent.pos.y);

        } 
       }

}