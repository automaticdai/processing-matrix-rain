// https://openprocessing.org/sketch/491851
// https://openprocessing.org/sketch/1017917

String[] textLines;
ArrayList<Line> myLines = new ArrayList<Line>();

void setup() {
  size(1920, 1080);
    
  textLines = loadStrings("text.txt");
  println("there are " + textLines.length + " lines");
  for (int i = 0 ; i < textLines.length; i++) {
    println(textLines[i]);
  }
  
  background(0);
  for (int i = 0; i < 500; i++){
    Line a = new Line(textLines[int(random(textLines.length))], random(width), random(height));
    a.draw();
    myLines.add(a);
  }
  
  
}


void draw() {
  background(0);
  
  for (Line a : myLines){
    a.draw();
    a.update();
  }
}
