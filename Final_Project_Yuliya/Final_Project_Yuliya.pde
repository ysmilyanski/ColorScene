import processing.video.*;

/**
 Yuliya Smilyanski
 Final Project
 Section 01
**/

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

void setup() {
  size(960, 540);
  myMovie = new Movie(this, "at.mp4");      // choose the movie
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
    myMovie.stop();
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
