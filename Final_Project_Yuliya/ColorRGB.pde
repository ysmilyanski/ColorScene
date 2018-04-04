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
    String c = "";
    
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
  
  // converts a color to CMYK
  // code by https://processing.org/discourse/beta/num_1228243376.html
  IColor convertToCMYK() {
    float c = 1 - (r/255);
    float m = 1 - (g/255);
    float y = 1 - (b/255);
    float b = 1;
    
    if (c < b) {
      b = c;
    }
    if (m < b) {
      b = m;
    }
    if (y < b) {
      b = c;
    }
    
    c = (c - b)/(1 - b) * 100;
    m = (m - b)/(1 - b) * 100;
    y = (y - b)/(1 - b) * 100;
    b = b * 100;
    
    IColor converted = new ColorCMYK(c, m, y, b);
    
    return converted;
  }
  
  float getR() { return this.r; }
  float getG() { return this.g; }
  float getB() { return this.b; }
  float getH() { throw new IllegalArgumentException("cannot retrieve h"); }
  float getS() { throw new IllegalArgumentException("cannot retrieve s"); }
}
