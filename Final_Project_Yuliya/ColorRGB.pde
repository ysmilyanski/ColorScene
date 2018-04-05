class ColorRGB implements IColor {
  float r;
  float g;
  float b;
  
  ColorRGB(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  String defineColor() {
    String c = convertToHSB().defineColor();
    return c;
  }
  
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
  
  float getR() { return this.r; }
  float getG() { return this.g; }
  float getB() { return this.b; }
  float getH() { throw new IllegalArgumentException("cannot retrieve h"); }
  float getS() { throw new IllegalArgumentException("cannot retrieve s"); }
}