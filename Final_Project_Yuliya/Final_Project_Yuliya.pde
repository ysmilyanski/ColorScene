import processing.video.*;
// histogram that keeps track of the changes in 9 color channels over a period of time in a movie

/**
 Yuliya Smilyanski
 Final Project
 Section 01
 **/

Movie myMovie;
float durationInSec;
float numberOfFrames;
float numPickedFrames;
float skipEveryBlankFrames;
ArrayList<ColorSampler> pickedFrames;
ColorHistograph deltaColors;

void setup() {
  size(600, 600);
  myMovie = new Movie(this, "skate_00.mp4");
  myMovie.frameRate(10);
  myMovie.play();

  durationInSec = myMovie.duration();
  numberOfFrames = myMovie.frameRate * durationInSec;
  numPickedFrames = 10;
  skipEveryBlankFrames = round(numberOfFrames / numPickedFrames);
  pickedFrames = new ArrayList<ColorSampler>();
  deltaColors = new ColorHistograph((int)numPickedFrames);

  println("created MCS with " + durationInSec + " secs of movie");
  println("frames: " + numberOfFrames);
  println("# picked frames: " + numPickedFrames);
  println("skip every __ frames: " + skipEveryBlankFrames);
}

void draw() {
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0, 600, 600);
  
  if (frameCount % skipEveryBlankFrames == 0 && frameCount <= numberOfFrames) {
    ColorSampler cs = new ColorSampler();
    cs.run();
    pickedFrames.add(cs);
    println("frame " + frameCount + " grabbed");
  }
}