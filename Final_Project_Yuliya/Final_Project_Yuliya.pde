import processing.video.*;

/**
 Yuliya Smilyanski
 Final Project
 Section 01
**/

Movie myMovie;
int numPickedFrames;
ArrayList<ColorSampler> pickedFrames;
ColorHistograph deltaColors;

int newFrame = 0;
int framesPassed = 0;
int numFrames;
int skipEveryBlankFrames;

boolean readMode;
boolean graphMode;

void setup() {
  size(960, 540);
  myMovie = new Movie(this, "at_10.mp4");
  myMovie.frameRate(30);
  myMovie.play();
  
  numPickedFrames = 25;
  pickedFrames = new ArrayList<ColorSampler>();
  deltaColors = new ColorHistograph(numPickedFrames);

  numFrames = getLength() - 1;
  skipEveryBlankFrames = numFrames / numPickedFrames;

  readMode = true;
  graphMode = false;

  myMovie.jump(0);
  myMovie.pause();
}

void draw() {
  if (readMode) {
    if (myMovie.available()) {
      myMovie.read();
    }
    
    if (framesPassed <= numFrames && framesPassed % skipEveryBlankFrames == 0) {
      background(0);
      setFrame(framesPassed);
      image(myMovie, 0, 0, width, height);
      readMovie();
      println("grabbed frame " + framesPassed);
    }
    else if (framesPassed > numFrames) {
      readMode = false;
      graphMode = true;
    }
    
    framesPassed++;
  }
  
  else if (graphMode) {
    fill(255);
    rect(0, 0, width, height);
    deltaColors.showHistograph();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      if (readMode) {
        graphMode = true;
        readMode = false;
      }
    }
  } 
  setFrame(newFrame);
}

void readMovie() {
  ColorSampler cs = new ColorSampler();
  cs.run();
  pickedFrames.add(cs);
  deltaColors.populateColorData(cs);
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
