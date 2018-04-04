interface IColor {
  // defines the given color
  String defineColor();
  
  // returns the color system
  String getColorSystem();
  
  // converts a color to RGB
  IColor convertToRGB();
  
  // converts a color to HSB
  IColor convertToHSB();
  
  // converts a color to CMYK
  IColor convertToCMYK();
  
  // getters
  float getR();
  float getG();
  float getB();
  float getH();
  float getS();
}
