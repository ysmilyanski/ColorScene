// takes an image and identifies all the colors of each pixel
class ColorSampler {
  PImage img;                  // image being sampled 
  int imgHeight;               // height of the image
  int imgWidth;                // width of the image
  int imgTopLeftX;             // X position of the image on the screen
  int imgTopLeftY;             // Y position of the image on the screen
  int imgPxlsStart;
  int imgPxlsEnd;
  
  int pxls;                    // total number of pixels on the screen
  IColor[] colorsByPixel;      // Array of IColors for each pixel on the screen
  String[] colorsByName;       // Array of Strings defining the color of each pixel on the screen
  String colorMode;            // the color mode of the program, etiehr "HSB" or "RGB"
  
  ColorChannel[] colorTypes;   // the possible color types

  // constructs a color sampler for the given image in the given color mode
  ColorSampler(String imgName, String colorMode) {
    this.img = loadImage(imgName);
    this.imgHeight = img.height;
    this.imgWidth =img.width;
    this.imgTopLeftX = 0;
    this.imgTopLeftY = 0;

    this.pxls = width*height;
    this.colorsByPixel = new IColor[pxls];
    this.colorsByName = new String[pxls];
    
    populateColorTypes();

    this.colorMode = colorMode;
    if (colorMode == "RGB") {
      colorMode(RGB);
    }
    if (colorMode == "HSB") {
      colorMode(HSB);
    }
  }
  
  // constructs an empty color sampler to be used for a frame of a movie
  ColorSampler() {
    this.imgTopLeftX = 0;
    this.imgTopLeftY = 0;
    
    this.pxls = width*height;
    this.colorsByPixel = new IColor[pxls];
    this.colorsByName = new String[pxls];
    
    populateColorTypes();
    this.colorMode = "RGB";
    colorMode(RGB);
    
    loadPixels();
  }

  // populates the colorsByPixel array
  void populateColorsByPixel() {
    if (colorMode == "RGB") {
      for (int i = 0; i < pxls; i++) {
        float r = red(pixels[i]);
        float g = green(pixels[i]);
        float b = blue(pixels[i]);
        colorsByPixel[i] = new ColorRGB(r, g, b);
      }
    }
    if (colorMode == "HSB") {
      for (int i = 0; i < pxls; i++) {
        float h = hue(pixels[i]);
        float s = saturation(pixels[i]);
        float b = brightness(pixels[i]);
        colorsByPixel[i] = new ColorHSB(h, s, b);
      }
    }
  }
  
  // populates the colorsByName array
  void populateColorsByName() {
    for (int i = 0; i < pxls; i++) {
        colorsByName[i] = colorsByPixel[i].defineColor();
    }
  }
  
  // calculates the percent of each color in the image
  void calcColorPercents() {
    for (int i = 0; i < pxls; i++) {
      String curColor = colorsByName[i];
      if (curColor == "white") {
        colorTypes[9].addOne();
      }
      else if (curColor == "black") {
        colorTypes[10].addOne();
      }
      else if (curColor == "gray") {
        colorTypes[11].addOne();
      }
      else if (curColor == "red") {
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
    
    // for console testing and checking
    //for (int i = 0; i < 9; i++) {
    //  colorTypes[i].printChannel();
    //}
  }
  
  // runs the appropriate methods in the right order to calculate the percent of each color in an image
  void run() {
    populateColorsByPixel();
    populateColorsByName();
    calcColorPercents();
  }
  
  // populates the color types for each color channel. arbitrarily identified
  void populateColorTypes() {
    colorTypes = new ColorChannel[12];
    colorTypes[9] = new ColorChannel("white");
    colorTypes[10] = new ColorChannel("black");
    colorTypes[11] = new ColorChannel("gray");
    colorTypes[0] = new ColorChannel("red");
    colorTypes[1] = new ColorChannel("orange");
    colorTypes[2] = new ColorChannel("yellow");
    colorTypes[3] = new ColorChannel("lime green");
    colorTypes[4] = new ColorChannel("blue green");
    colorTypes[5] = new ColorChannel("light blue");
    colorTypes[6] = new ColorChannel("blue");
    colorTypes[7] = new ColorChannel("purple");
    colorTypes[8] = new ColorChannel("pink");
  }

  // changes the color mode to the given color mode
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
}
