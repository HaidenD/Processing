class Leaf {

  PVector position;
  boolean reached;

  Leaf() {
    position = new PVector(random(width), random(height));
    reached = false;
  }

  void show() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, 4, 4);
  }
}