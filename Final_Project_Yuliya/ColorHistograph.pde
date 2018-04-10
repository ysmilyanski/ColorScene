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

  void showHistograph() {
    // x axis = frames
    // y axis = percent of color
  }
}