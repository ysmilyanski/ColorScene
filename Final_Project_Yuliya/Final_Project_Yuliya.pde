// histogram that keeps track of the changes in 9 color channels over a period of time in a movie

/**
Yuliya Smilyanski
Final Project
Section 01
**/

ColorSampler c;

void setup() {
  size(600, 600);
  c = new ColorSampler("images/lotsOColors.png", "RGB");
  c.showImage();
  c.populateColorsByPixel();
  c.run();
}

void draw() {
}