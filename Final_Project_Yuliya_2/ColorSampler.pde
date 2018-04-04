// takes an image and identifies all the colors of each pixel
class ColorSampler {
  PImage img;
  int imgHeight;
  int imgWidth;
  IColor[] colorsByPixel;
  String[] colorsByName;
  String colorMode;
  
  ColorChannel[] colorTypes;
  ColorChannel[] sortedColorTypes;

  ColorSampler(String imgName, String colorMode) {
    this.img = loadImage(imgName);
    this.imgHeight = img.height;
    this.imgWidth =img.width;

    colorsByPixel = new IColor[width*height];
    colorsByName = new String[width*height];
    
    populateColorTypes();

    this.colorMode = colorMode;
    if (colorMode == "RGB") {
      colorMode(RGB, 255);
    }
    if (colorMode == "HSB") {
      colorMode(HSB, 360, 100, 100);
    }
  }

  void populateColorsByPixel() {
    if (colorMode == "RGB") {
      for (int i = 0; i < width*height; i++) {
        float r = red(pixels[i]);
        float g = green(pixels[i]);
        float b = blue(pixels[i]);
        colorsByPixel[i] = new ColorRGB(r, g, b);
        //println(r + " " + g + " " + b);
      }
    }
    if (colorMode == "HSB") {
      for (int i = 0; i < width*height; i++) {
        float h = hue(pixels[i]);
        float s = saturation(pixels[i]);
        float b = saturation(pixels[i]);
        colorsByPixel[i] = new ColorHSB(h, s, b);
        //println(h + " " + s + " " + b);
      }
    }
  }
  
  void populateColorsByName() {
    if (colorMode == "RGB") {
      // do nothing. not done yet
    }
    if (colorMode == "HSB") {
      for (int i = 0; i < width*height; i++) {
        colorsByName[i] = colorsByPixel[i].defineColor();
      }
    }
  }
  
  void findPopularColors() {
    for (int i = 0; i < width*height; i++) {
      String curColor = colorsByName[i];
      if (curColor == "red") {
        colorTypes[0].addOne();
      }
      else if (curColor == "orange") {
        colorTypes[1].addOne();
      }
      else if (curColor == "yellow") {
        colorTypes[2].addOne();
      }
      else if (curColor == "lime green") {
        colorTypes[3].addOne();
      }
      else if (curColor == "blue green") {
        colorTypes[4].addOne();
      }
      else if (curColor == "light blue") {
        colorTypes[5].addOne();
      }
      else if (curColor == "blue") {
        colorTypes[6].addOne();
      }
      else if (curColor == "purple") {
        colorTypes[7].addOne();
      }
      else if (curColor == "pink") {
        colorTypes[8].addOne();
      }
    }
    
    for (int i = 0; i < 9; i++) {
      colorTypes[i].printChannel();
    }
  }
  
  void sortColorTypes() {
    for (int i = 0; i < 9; i++) {
      // not yet
    }
  }
  
  void run() {
    populateColorsByPixel();
    populateColorsByName();
    findPopularColors();
  }
  
  void populateColorTypes() {
    colorTypes = new ColorChannel[9];
    colorTypes[0] = new ColorChannel("red");
    colorTypes[1] = new ColorChannel("orange");
    colorTypes[2] = new ColorChannel("yellow");
    colorTypes[3] = new ColorChannel("lime green");
    colorTypes[4] = new ColorChannel("blue green");
    colorTypes[5] = new ColorChannel("light blue");
    colorTypes[6] = new ColorChannel("blue");
    colorTypes[7] = new ColorChannel("purple");
    colorTypes[8] = new ColorChannel("pink");
    
    sortedColorTypes = new ColorChannel[9];
  }

  void changeColorMode(String cm) {
    if (cm == "RGB") {
      colorMode(RGB, 255);
      populateColorsByPixel();
    }
    if (cm == "HSB") {
      colorMode(HSB, 360, 100, 100);
      populateColorsByPixel();
    }
  }
  
  void showImage() {
    imageMode(CORNER);
    image(this.img, 0, 0, 600, 600);
    loadPixels();
  }
}
