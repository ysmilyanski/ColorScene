class ColorCMYK implements IColor {
  float c;
  float m;
  float y;
  float k;
  
  ColorCMYK(float c, float m, float y, float k) {
    this.c = c;
    this.m = m;
    this.y = y;
    this.k = k;
  }
  
  String defineColor() {
    String c = "";
    
    return c;
  }
  
  String getColorSystem() {
    return "CMYK";
  }
  
  // converts a color to RGB
  IColor convertToRGB() {
    return this;
  }
  
  // converts a color to HSB
  IColor convertToHSB() {
    return this;
  }
  
  // converts a color to CMYK
  IColor convertToCMYK() {
    return this;
  }
  
  float getR() { throw new IllegalArgumentException("cannot retrieve r"); }
  float getG() { throw new IllegalArgumentException("cannot retrieve g"); }
  float getB() { throw new IllegalArgumentException("cannot retrieve b"); }
  float getH() { throw new IllegalArgumentException("cannot retrieve h"); }
  float getS() { throw new IllegalArgumentException("cannot retrieve s"); }
}
