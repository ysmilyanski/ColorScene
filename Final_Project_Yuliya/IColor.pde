interface IColor {
  // defines the given color
  String defineColor();
  
  // returns the color system
  String getColorSystem();
  
  // converts a color to RGB
  IColor convertToRGB();
  
  // converts a color to HSB
  IColor convertToHSB();
  
  // getters for the channels
  float getR();
  float getG();
  float getB();
  float getH();
  float getS();
}