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

boolean movieMode;
boolean readMode;
boolean graphMode;

void setup() {
  size(960, 540);
  myMovie = new Movie(this, "at_10.mp4");
  myMovie.frameRate(30);
  myMovie.play();
  
  numPickedFrames = 10;
  pickedFrames = new ArrayList<ColorSampler>();
  deltaColors = new ColorHistograph(numPickedFrames);

  movieMode = false;
  readMode = true;
  graphMode = false;

  myMovie.jump(0);
  myMovie.pause();
}

void draw() {
  if (movieMode) {
    if (myMovie.available()) {
      myMovie.read();
    }
    background(0);
    image(myMovie, 0, 0, width, height);
    text(getFrame() + " / " + (getLength() - 1), 10, 30);
  }
  else if (readMode) {
    if (myMovie.available()) {
      myMovie.read();
    }
    
    int numFrames = getLength() - 1;
    int skipEveryBlankFrames = numFrames / numPickedFrames;
    
    if (framesPassed <= numFrames && framesPassed % skipEveryBlankFrames == 0) {
      background(0);
      setFrame(framesPassed);
      image(myMovie, 0, 0, width, height);
      readMovie();
      println("grabbed frame " + framesPassed);
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
    if (keyCode == LEFT && !readMode) {
      if (0 < newFrame) newFrame-= 5;
    } else if (keyCode == RIGHT && !readMode) {
      if (newFrame < getLength() - 1) newFrame+= 5;
    } else if (keyCode == UP && !readMode) {
      //readMovie();
    } else if (keyCode == DOWN) {
      if (movieMode && readMode) {
        graphMode = true;
        movieMode = false;
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
  println("red: " + deltaColors.red.size());
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

void grabMovieFrames() {
  int numFrames = getLength() - 1;
  int skipEveryBlankFrames = numFrames / numPickedFrames;
  for (int i = 0; i < numPickedFrames; i++) {
    setFrame(i*skipEveryBlankFrames);
    readMovie();
  }
}
