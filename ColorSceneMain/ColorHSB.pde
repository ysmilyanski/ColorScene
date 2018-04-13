class ColorHSB implements IColor {
  float h;    // hue
  float s;    // saturation
  float b;    // brightness
  
  // constructs a color of the HSB system
  ColorHSB(float h, float s, float b) {
    this.h = h;
    this.s = s;
    this.b = b;
  }
  
  // defines the color based on what the HSB values are
  String defineColor() {
    String c = "";
    
    h = floor(h);
    s = floor(s);
    b = floor(b);
    
    if (s == 0 && b >= 90 && b <= 100) {
      c = "white";
    }
    else if (s == 0 && b <= 10 && b >= 0) {
      c = "black";
    }
    else if (s == 0 && b > 10 && b < 90) {
      c = "gray";
    }
    else if ((h >= 0 && h <= 20) || (h >= 340 && h <= 360)) {
      c = "red";
    }
    else if (h >= 21 && h <= 40) {
      c = "orange";
    }
    else if (h >= 41 && h <= 70) {
      c = "yellow";
    }
    else if (h >= 71 && h <= 110) {
      c = "lime green";
    }
    else if (h >= 111 && h <= 150) {
      c = "blue green";
    }
    else if (h >= 151 && h <= 190) {
      c = "light blue";
    }
    else if (h >= 191 && h <= 247) {
      c = "blue";
    }
    else if (h >= 248 && h <= 282) {
      c = "purple";
    }
    else if (h >= 283 && h <= 339) {
      c = "pink";
    }
    
    return c;
  }
  
  // gets the color system
  String getColorSystem() {
    return "HSB";
  }
  
  // converts a color to RGB
  IColor convertToRGB() {
    color hsb = color(h, s, b);
    float r = red(hsb);
    float g = green(hsb);
    float b = blue(hsb);
    IColor converted = new ColorRGB(r, g, b);
    return converted;
  }
  
  // converts a color to HSB
  IColor convertToHSB() {
    return this;
  }
  
  // getters for the channels
  float getR() { throw new IllegalArgumentException("cannot retrieve r"); }
  float getG() { throw new IllegalArgumentException("cannot retrieve g"); }
  float getB() { return this.b; }
  float getH() { return this.h; }
  float getS() { return this.s; }
}
