// used to store information about one color channel
class ColorChannel {
  String name;          // the name of the color
  int amt;              // the amount of the color in the image, in pixels
  int totalPixels;      // the total pixels on the screen
  float percent;        // the percent of pixels of this color on the screen
  
  // constructs a color channel
  ColorChannel(String name) {
    this.name = name;
    this.amt = 0;
    this.totalPixels = width * height;
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
    if (percent != 0) {
      println(name + " channel: " + amt + " pixels, " + round(percent) + "%");
    }
  }
  
  // calculates the percent of pixels of this color channel on the screen
  void calcPercent() {
    this.percent = ((float) amt / (float) totalPixels) * 100;
  }
}