import processing.video.*;

/**
 Yuliya Smilyanski
 Final Project
 Section 01
 **/

Movie myMovie;
MovieColorSampler MCS;

void setup() {
  size(600, 600);
  myMovie = new Movie(this, "skate_00.mp4");
  MCS = new MovieColorSampler(myMovie, 10);

  myMovie.noLoop();
  myMovie.play();
}

void draw() {
  MCS.readMovie();
}