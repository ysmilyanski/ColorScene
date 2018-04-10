import processing.video.*;
// histogram that keeps track of the changes in 9 color channels over a period of time in a movie

/**
Yuliya Smilyanski
Final Project
Section 01
**/

ColorSampler c;
Movie myMovie;
MovieColorSampler MCS;

void setup() {
  size(600, 600);
  //c = new ColorSampler("images/me.jpg", "RGB");
  //c.showImage();
  //c.run();
  myMovie = new Movie(this, "skate_00.mp4");
  MCS = new MovieColorSampler(myMovie, 10);
}

void draw() {
  MCS.readMovie();
}