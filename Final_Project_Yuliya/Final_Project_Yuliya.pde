import processing.video.*;

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
  size(960, 540);
  myMovie = new Movie(this, "at_short.mp4");
  myMovie.frameRate(30);
  myMovie.play();

  durationInSec = myMovie.duration();
  numberOfFrames = myMovie.frameRate * durationInSec;
  numPickedFrames = 20;
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
  image(myMovie, 0, 0, width, height);
  
  if (frameCount % skipEveryBlankFrames == 0 && frameCount <= numberOfFrames) {
    ColorSampler cs = new ColorSampler();
    cs.run();
    pickedFrames.add(cs);
    println("frame " + frameCount + " grabbed");
  }
  
  else if (frameCount > numberOfFrames) {
    // now create the histograph?
    populateColorHistograph();
    deltaColors.showHistograph();
  }
}

void populateColorHistograph() {
  for (int i = 0; i < pickedFrames.size(); i++) {
    deltaColors.populateColorData(pickedFrames.get(i));
  }
}