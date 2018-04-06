import processing.video.*;

class MovieColorSampler {
  Movie m;
  float mDuration;
  float mFrames;
  
  ArrayList<ColorSampler> frames;
  
  MovieColorSampler(Movie myMovie) {
    this.m = myMovie;
    this.mDuration = m.duration();
    this.mFrames = mDuration * m.frameRate;
  }
}