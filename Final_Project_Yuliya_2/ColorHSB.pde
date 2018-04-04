class ColorHSB implements IColor {
  float h;
  float s;
  float b;
  
  ColorHSB(float h, float s, float b) {
    this.h = h;
    this.s = s;
    this.b = b;
  }
  
  // color: hue range
  // red: 0 - 20, 340 - 360
  // orange: 21 - 40
  // yellow: 41 - 70
  // lime green: 71 - 110
  // blue green: 111 - 150
  // light blue: 151 - 190
  // blue: 191 - 247
  // purple: 248 - 282
  // pink: 283 - 339
  String defineColor() {
    String c = "";
    
    h = floor(h);
    
    if ((h >= 0 && h <= 20) || (h >= 340 && h <= 360)) {
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
  
  // converts a color to CMYK
  IColor convertToCMYK() {
    ColorRGB rgb = (ColorRGB) this.convertToRGB();
    IColor converted = rgb.convertToCMYK();
    return converted;
  }
  
  float getR() { throw new IllegalArgumentException("cannot retrieve r"); }
  float getG() { throw new IllegalArgumentException("cannot retrieve g"); }
  float getB() { return this.b; }
  float getH() { return this.h; }
  float getS() { return this.s; }
}
