class ColorHistograph {
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
      if (cc.name == "red") {
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
    fill(255);
    rect(0, 0, width, height);
    fill(0);
    rect(10, 510, 940, 2);
    
    int xCoef = (width - 20)/totalFrames;
    int yCoef = (height - 40)/100;
    int yBuff = height - 40;
    
    for(int i = 0; i < red.size(); i++) {
      red.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < orange.size(); i++) {
      orange.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < yellow.size(); i++) {
      yellow.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < limeGreen.size(); i++) {
      limeGreen.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < blueGreen.size(); i++) {
      blueGreen.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < lightBlue.size(); i++) {
      lightBlue.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < blue.size(); i++) {
      blue.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < purple.size(); i++) {
      purple.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
    for(int i = 0; i < pink.size(); i++) {
      pink.get(i).showChannelDot(i*xCoef + 10, yCoef, yBuff);
    }
  }
}