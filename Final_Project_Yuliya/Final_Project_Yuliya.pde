import processing.video.*;
import processing.pdf.*;

/**
 Yuliya Smilyanski
 Final Project
 Section 01
**/

String movieTitle;
Movie myMovie;                            // the movie to be read  
int numPickedFrames;                      // number of frames to be read
ArrayList<ColorSampler> pickedFrames;     // array list that has a color sampler for each frame to be read
ColorHistograph deltaColors;              // object which stores all the color channels and 
                                          // their amounts for every frame being read
int newFrame = 0;                         // start at frame 0
int framesPassed = 0;                     // frame counter
int numFrames;                            // total number of frames in movie
int skipEveryBlankFrames;                 // how many frames to skip between each frame to be read

boolean readMode;                         // mode for reading the movie colors
boolean graphMode;                        // mode for graphing the movie colors
boolean record;
boolean showFrameMode;

void setup() {
  size(960, 540);
  movieTitle = "at.mp4";
  myMovie = new Movie(this, movieTitle);      // choose the movie
  myMovie.frameRate(30);
  myMovie.play();
  
  numPickedFrames = 20;
  pickedFrames = new ArrayList<ColorSampler>();
  deltaColors = new ColorHistograph(movieTitle);

  numFrames = getLength() - 1;
  skipEveryBlankFrames = numFrames / (numPickedFrames - 1);

  readMode = true;
  graphMode = false;
  record = false;
  showFrameMode = false;

  myMovie.jump(0);
  myMovie.pause();
}

void draw() {
  if (record) {
    beginRecord(PDF, movieTitle + "_colorHistograph.pdf");
  }
  
  if (readMode) {
    if (myMovie.available()) {
      myMovie.read();
    }
    if (framesPassed <= numFrames && framesPassed % skipEveryBlankFrames == 0) {
      background(0);
      setFrame(framesPassed);
      image(myMovie, 0, 0, width, height);
      readMovie();
    }
    else if (framesPassed > numFrames) {
      readMode = false;
      graphMode = true;
    }
    
    framesPassed++;
  }
  
  else if (graphMode) {
    myMovie.stop();
    fill(30);
    rect(0, 0, width, height);
    deltaColors.showHistograph(numPickedFrames, newFrame, skipEveryBlankFrames);
  }
  
  else if (showFrameMode) {
    myMovie.play();
    myMovie.pause();
    setFrame(newFrame);
    if (myMovie.available()) {
      myMovie.read();
    }
    noStroke();
    fill(255);
    rect(width/4 - 10, height/4 - 10, 500, 290);
    image(myMovie, width/4, height/4, width/2, height/2);
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      if (graphMode) {
        if (newFrame > 0) newFrame-=skipEveryBlankFrames;
      }
    }
    else if (keyCode == UP) {
      if (graphMode) {
        if (newFrame == 0) newFrame+=skipEveryBlankFrames;
        else if (newFrame < getLength() - 1) newFrame+=skipEveryBlankFrames;
      }
    }
  }
  if (key == 'p') {
    record = true;
  }
  if (key == 'v') {
    showFrameMode = true;
    graphMode = false;
  }
  if (key == 'g') {
    showFrameMode = false;
    graphMode = true;
  }
  
  println(newFrame);
  setFrame(newFrame);
}

// reads the movie by creating a new color sampler for the frame
void readMovie() {
  ColorSampler cs = new ColorSampler();
  cs.run();
  pickedFrames.add(cs);
  deltaColors.populateColorData(cs);
}

// returns the frame that the movie is at 
int getFrame() {
  return ceil(myMovie.time() * 30) - 1;
}

// sets the frame to be a given frame
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

// returns the length of the movie in frames
int getLength() {
  return int(myMovie.duration() * myMovie.frameRate);
}


// some code is from https://github.com/processing/processing-video/blob/master/examples/Movie/Frames/Frames.pde
