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

int newFrame = 0;

void setup() {
  size(960, 540);
  myMovie = new Movie(this, "at_10.mp4");
  myMovie.frameRate(30);
  myMovie.play();

  durationInSec = myMovie.duration();
  numberOfFrames = myMovie.frameRate * durationInSec;
  numPickedFrames = 20;
  skipEveryBlankFrames = round(numberOfFrames / numPickedFrames);
  pickedFrames = new ArrayList<ColorSampler>();
  deltaColors = new ColorHistograph((int)numPickedFrames);

  myMovie.jump(0);
  myMovie.pause();

  println("created MCS with " + durationInSec + " secs of movie");
  println("fps: " + frameRate);
  println("frames in movie: " + numberOfFrames);
  println("# picked frames: " + numPickedFrames);
  println("skip every __ frames: " + skipEveryBlankFrames);
}

void draw() {
  if (myMovie.available()) {
    myMovie.read();
  }
  background(0);
  image(myMovie, 0, 0, width, height);
  text(getFrame() + " / " + (getLength() - 1), 10, 30);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (0 < newFrame) newFrame--;
    } else if (keyCode == RIGHT) {
      if (newFrame < getLength() - 1) newFrame++;
    } else if (keyCode == UP) {
      readMovie();
    } else if (keyCode == DOWN) {
      fill(255);
      rect(0, 0, width, height);
      deltaColors.showHistograph();
    }
  } 
  setFrame(newFrame);
}

void readMovie() {
  ColorSampler cs = new ColorSampler();
  cs.run();
  pickedFrames.add(cs);
  deltaColors.populateColorData(cs);
  println("frame grabbed");
}

int getFrame() {
  return ceil(myMovie.time() * 30) - 1;
}

void setFrame(int n) {
  myMovie.play();

  float frameDuration = 1.0 / myMovie.frameRate;
  float where = (n + 0.5) * frameDuration;
  float diff = myMovie.duration() - where;
  if (diff < 0) {
    where += diff - 0.25 * frameDuration;
  }

  myMovie.jump(where);
  myMovie.pause();
}

int getLength() {
  return int(myMovie.duration() * myMovie.frameRate);
}
