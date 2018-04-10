import processing.video.*;

class MovieColorSampler {
  Movie m;                            // the movie
  float mDuration;                    // the duration of the movie in seconds
  float mFrames;                      // total number of frames in the movie
  float numPickedFrames;              // number of frames picked to color sample
  float skipEveryBlankFrames;         // skip every ____ frames of the movie

  ArrayList<ColorSampler> pickedFrames;
  ColorHistograph deltaColors;

  MovieColorSampler(Movie myMovie, int pf) {
    this.m = myMovie;
    myMovie.frameRate(30);
    this.mDuration = m.duration();
    this.mFrames = mDuration * m.frameRate;
    this.numPickedFrames = (float) pf;
    this.skipEveryBlankFrames = round(mFrames / numPickedFrames);
    
    pickedFrames = new ArrayList<ColorSampler>();
    deltaColors = new ColorHistograph((int)mFrames);

    println("created MCS with " + mDuration + " secs of movie");
    println("frames: " + mFrames);
    println("# picked frames: " + numPickedFrames);
    println("skip every __ frames: " + skipEveryBlankFrames);
  }

  // read movie and populate the pickedFrames arrayList 
  void readMovie() {
    myMovie.play();
    myMovie.noLoop();
    
    for (int i = 0; i < mFrames; i+=skipEveryBlankFrames) {
      if (myMovie.available()) {
        myMovie.read();
      }
      image(myMovie, 0, 0);
      ColorSampler cs = new ColorSampler();
      cs.run();
      pickedFrames.add(cs);
      println("frame " + i + " grabbed");
    }
  }
  
  void populateColorHistograph() {
    for (int i = 0; i < pickedFrames.size(); i++) {
      deltaColors.populateColorData(pickedFrames.get(i));
    }
  }
}


// grab every __ frame
// create a colorSampler for that frame
//    colorSampler knows how much of each color is in the frame (colorChannel)
// keep track of change in colorChannels