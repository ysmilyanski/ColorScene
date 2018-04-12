// used to store information about one color channel
class ColorChannel {
  String name;          // the name of the color
  int amt;              // the amount of the color in the image, in pixels
  int totalPixels;      // the total pixels on the screen
  float percent;        // the percent of pixels of this color on the screen
  
  color c;              // the color of the line, for use in the ColorHistograph
  
  // constructs a color channel
  ColorChannel(String name) {
    this.name = name;
    this.amt = 0;
    this.totalPixels = width * height;
    
    if (name == "white") {
      c = color(255);
    }
    else if (name == "black") {
      c = color(0);
    }
    else if (name == "gray") {
      c = color(97);
    }
    else if (name == "red") {
      c = color(255, 0, 0);
    }
    else if (name == "orange") {
       c = color(255, 144, 0);
    }
    else if (name == "yellow") {
       c = color(255, 255, 0);
    }
    else if (name == "lime green") {
      c = color(0, 255, 0);
    }
    else if (name == "blue green") {
      c = color(0, 255, 97);
    }
    else if (name == "light blue") {
      c = color(0, 255, 255);
    }
    else if (name == "blue") {
      c = color(0, 0, 255);
    }
    else if (name == "purple") {
      c = color(170, 0, 255);
    }
    else if (name == "pink") {
      c = color(255, 0, 170);
    }
    else {
      c = color(0);
    }
  }
  
  // adds one to the amount of pixels of this color channel
  void addOne() {
    amt++;
  }
  
  // gets the amount of pixels of this color channel
  int getAmt() {
    return this.amt;
  }
  
  // prints the percent of this color channel to the console
  void printChannel() {
    calcPercent();
    if (round(percent) != 0) {
      println(name + " channel: " + amt + " pixels, " + round(percent) + "%");
    }
  }
  
  // for showing ColorHistograph
  // x = the frame of the movie
  // y = % of color on screen
  void showChannelDot(int x, int y) {
    ellipseMode(CENTER);
    fill(c, 200);
    //ellipse(x, y, 5, 5);
  }
  
 // yBufferlculates the percent of pixels of this color channel on the screen
  void calcPercent() {
    this.percent = ((float) amt / (float) totalPixels) * 100;
  }
  
  int getPercent() {
    calcPercent();
    return (int) round(this.percent);
  }
}