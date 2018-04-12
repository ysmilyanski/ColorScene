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
  int totalFrames;

  ColorHistograph(int frames) {
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
    this.totalFrames = frames;
  }

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

  // x axis = frames
  // y axis = percent of color
  void showHistograph() {
    noStroke();
    stroke(0);
    line(120, 420, 840, 420);
    line(120, 120, 120, 420);
    noStroke();

    for (int i = 0; i < white.size(); i++) {
      white.get(i).showChannelDot(i, white.get(i).getPercent());
    }
    for (int i = 0; i < black.size(); i++) {
      black.get(i).showChannelDot(i, black.get(i).getPercent());
    }
    for (int i = 0; i < gray.size(); i++) {
      gray.get(i).showChannelDot(i, gray.get(i).getPercent());
    }
    for (int i = 0; i < red.size(); i++) {
      red.get(i).showChannelDot(i, red.get(i).getPercent());
    }
    for (int i = 0; i < orange.size(); i++) {
      orange.get(i).showChannelDot(i, orange.get(i).getPercent());
    }
    for (int i = 0; i < yellow.size(); i++) {
      yellow.get(i).showChannelDot(i, yellow.get(i).getPercent());
    }
    for (int i = 0; i < limeGreen.size(); i++) {
      limeGreen.get(i).showChannelDot(i, limeGreen.get(i).getPercent());
    }
    for (int i = 0; i < blueGreen.size(); i++) {
      blueGreen.get(i).showChannelDot(i, blueGreen.get(i).getPercent());
    }
    for (int i = 0; i < lightBlue.size(); i++) {
      lightBlue.get(i).showChannelDot(i, lightBlue.get(i).getPercent());
    }
    for (int i = 0; i < blue.size(); i++) {
      blue.get(i).showChannelDot(i, blue.get(i).getPercent());
    }
    for (int i = 0; i < purple.size(); i++) {
      purple.get(i).showChannelDot(i, purple.get(i).getPercent());
    }
    for (int i = 0; i < pink.size(); i++) {
      pink.get(i).showChannelDot(i, pink.get(i).getPercent());
    }
  }
}