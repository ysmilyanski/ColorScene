/**
Yuliya Smilyanski
Final Project
Section 01
**/

ColorSampler c;

void setup() {
  size(600, 600);
  c = new ColorSampler("images/lotsOColors.png", "HSB");
  c.showImage();
  c.populateColorsByPixel();
  c.run();
}

void draw() {
}
