class ColorChannel {
  String name;
  int amt;
  
  ColorChannel(String name) {
    this.name = name;
    this.amt = 0;
  }
  
  void addOne() {
    amt++;
  }
  
  int getAmt() {
    return this.amt;
  }
  
  void printChannel() {
    println(name + " channel: " + amt + " pixels");
  }
}
