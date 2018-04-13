import processing.pdf.*;

// holds information for every color channel for every frame of a movie
class ColorHistograph {
  ArrayList<ColorChannel> white;
  ArrayList<ColorChannel> black;
  ArrayList<ColorChannel> gray;
  ArrayList<ColorChannel> red;
  ArrayList<ColorChannel> orange;
  ArrayList<ColorChannel> yellow;
  ArrayList<ColorChannel> limeGreen;
  ArrayList<ColorChannel> blueGreen;
  ArrayList<ColorChannel> lightBlue;
  ArrayList<ColorChannel> blue;
  ArrayList<ColorChannel> purple;
  ArrayList<ColorChannel> pink;
  
  PFont font;
  PFont font2;
  String movieTitle;

  // construct an empty color histograph
  ColorHistograph(String movieTitle) {
    white = new ArrayList<ColorChannel>();
    black = new ArrayList<ColorChannel>();
    gray = new ArrayList<ColorChannel>();
    red = new ArrayList<ColorChannel>();
    orange = new ArrayList<ColorChannel>();
    yellow = new ArrayList<ColorChannel>();
    limeGreen = new ArrayList<ColorChannel>();
    blueGreen = new ArrayList<ColorChannel>();
    lightBlue = new ArrayList<ColorChannel>();
    blue = new ArrayList<ColorChannel>();
    purple = new ArrayList<ColorChannel>();
    pink = new ArrayList<ColorChannel>();
    
    font = createFont("AmericanTypewriter-Semibold-48.vlw", 48);
    font2 = createFont("Avenir-Book-48.vlw", 48);
    
    this.movieTitle = movieTitle;
  }

  // populate color data for the color histograph from the given color sampler
  void populateColorData(ColorSampler cs) {
    for (int i = 0; i < cs.colorTypes.length; i++) {
      ColorChannel cc = cs.colorTypes[i];
      if (cc.name == "white") {
        white.add(cc);
      } else if (cc.name == "black") {
        black.add(cc);
      } else if (cc.name == "gray") {
        gray.add(cc);
      } else if (cc.name == "red") {
        red.add(cc);
      } else if (cc.name == "orange") {
        orange.add(cc);
      } else if (cc.name == "yellow") {
        yellow.add(cc);
      } else if (cc.name == "lime green") {
        limeGreen.add(cc);
      } else if (cc.name == "blue green") {
        blueGreen.add(cc);
      } else if (cc.name == "light blue") {
        lightBlue.add(cc);
      } else if (cc.name == "blue") {
        blue.add(cc);
      } else if (cc.name == "purple") {
        purple.add(cc);
      } else if (cc.name == "pink") {
        pink.add(cc);
      }
    }
  }

  // show the histograph
  // has a lot of code to simply create the screen we see, with the graph and the words
  // x axis = frames
  // y axis = percent of color
  void showHistograph(int pickedFrames, int curFrame, int skipEveryBlankFrames) {
    int xCoef = int(720 / pickedFrames);
    int xBuff = 120;
    int yBuff = 420;
    
    noStroke();
    stroke(255);
    strokeWeight(3);
    line(115, 425, 880, 425);
    line(115, 120, 115, 425);
    
    noStroke();
    fill(255, 100);
    rect(110, 25, 900, 35);
    textFont(font, 25);
    fill(255);
    text(movieTitle + " -  dynamic color data over " + pickedFrames + " frames", 115, 50);
    fill(255,100);
    rect(595, 63, 900, 18);
    textFont(font2, 12);
    fill(255);
    text("program created by Yuliya Smilyanski", 600, 76);
    fill(255, 100);
    rect(940, 0, 12, 600);
    
    fill(255);
    stroke(255);
    strokeWeight(3);
    
    textFont(font, 20);
    text("frame #", 115, 470);
    textFont(font2, 12);
    text("0", 115, 440);
    fill(255);
    textFont(font2, 12);
    text(pickedFrames , (pickedFrames-1)*xCoef + xBuff, 440);
    
    textFont(font, 20);
    int x = 80;
    int y = 425;
    pushMatrix();
    translate(x,y);
    rotate(-HALF_PI);
    translate(-x,-y);
    text("% color", x,y);
    popMatrix();
    textFont(font2, 12);
    text("0%", 95, 423);
    text("100%", 82, 130);
    
    textFont(font2, 15);
    int f = int(curFrame / skipEveryBlankFrames);
    text("press v to show grabbed frame #" + f + ". press g to go back to the graph. " 
    + "scroll through frames using the up & down arrow keys", 10, 530);
    
    noStroke();
    
    // create the points and lines on the graph for each color
    for (int i = 0; i < white.size(); i++) {
      int p = white.get(i).getPercent();
      color c = white.get(i).getColor();
      
      white.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = white.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < black.size(); i++) {
      int p = black.get(i).getPercent();
      color c = black.get(i).getColor();
      
      black.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = black.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < gray.size(); i++) {
      int p = gray.get(i).getPercent();
      color c = gray.get(i).getColor();
      
      gray.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = gray.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < red.size(); i++) {
      int p = red.get(i).getPercent();
      color c = red.get(i).getColor();
      
      red.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = red.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < orange.size(); i++) {
      int p = orange.get(i).getPercent();
      color c = orange.get(i).getColor();
      
      orange.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = orange.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < yellow.size(); i++) {
      int p = yellow.get(i).getPercent();
      color c = yellow.get(i).getColor();
      
      yellow.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = yellow.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < limeGreen.size(); i++) {
      int p = limeGreen.get(i).getPercent();
      color c = limeGreen.get(i).getColor();
      
      limeGreen.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = limeGreen.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < blueGreen.size(); i++) {
      int p = blueGreen.get(i).getPercent();
      color c = blueGreen.get(i).getColor();
      
      blueGreen.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = blueGreen.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < lightBlue.size(); i++) {
      int p = lightBlue.get(i).getPercent();
      color c = lightBlue.get(i).getColor();
      
      lightBlue.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = lightBlue.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < blue.size(); i++) {
      int p = blue.get(i).getPercent();
      color c = blue.get(i).getColor();
      
      blue.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = blue.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < purple.size(); i++) {
      int p = purple.get(i).getPercent();
      color c = purple.get(i).getColor();
      
      purple.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = purple.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
    for (int i = 0; i < pink.size(); i++) {
      int p = pink.get(i).getPercent();
      color c = pink.get(i).getColor();
      
      pink.get(i).showChannelDot(i*xCoef + xBuff, yBuff - p*3);
      
      if (i != 0) {
        int pOld = pink.get(i-1).getPercent();
        stroke(c, 150);
        strokeWeight(5);
        line((i-1)*xCoef + xBuff, yBuff - pOld*3, i*xCoef + xBuff, yBuff - p*3);
        noStroke();
      }
    }
  }
}
