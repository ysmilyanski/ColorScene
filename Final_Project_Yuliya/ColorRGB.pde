class ColorRGB implements IColor {
  float r;    // red
  float g;    // green
  float b;    // blue
  
  // constructs a color of the RGB system
  ColorRGB(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  // defines the color by converting to HSB system
  String defineColor() {
    String c = convertToHSB().defineColor();
    return c;
  }
  
  // gets the color system
  String getColorSystem() {
    return "RGB";
  }
  
  // converts a color to RGB
  IColor convertToRGB() {
    return this;
  }
  
  // converts a color to HSB
  IColor convertToHSB() {
    color rgb = color(r, g, b);
    float h = hue(rgb);
    float s = saturation(rgb);
    float b = brightness(rgb);
    IColor converted = new ColorHSB(h, s, b);
    return converted;
  }
  
  // getters for the channels
  float getR() { return this.r; }
  float getG() { return this.g; }
  float getB() { return this.b; }
  float getH() { throw new IllegalArgumentException("cannot retrieve h"); }
  float getS() { throw new IllegalArgumentException("cannot retrieve s"); }
}