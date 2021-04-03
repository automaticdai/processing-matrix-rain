// https://openprocessing.org/sketch/491851
// https://openprocessing.org/sketch/1017917

String[] textLines;
ArrayList<Line> myLines = new ArrayList<Line>();

int lineNumber = 200;
int FPS = 60;

void setup() {
  size(2000, 1100, P3D);
  frameRate(FPS);
    
  textLines = loadStrings("text.txt");
  println("there are " + textLines.length + " lines");
  for (int i = 0 ; i < textLines.length; i++) {
    println(textLines[i]);
  }
  
  background(0);
  for (int i = 0; i < lineNumber; i++){
    Line a = new Line(textLines[int(random(textLines.length))], random(width), random(height));
    myLines.add(a);
  }
  
  // load font
  PFont font = createFont("xinwei.ttf", 32);
  //PFont font = createFont("yahei.ttf", 32);
  textFont(font);
  
  //smooth();
  //noStroke();
  delay(3000);
}


int count = 0;

void draw() {
  background(0);
  
  int timer = 22 * FPS; // timer is the countdown before the rotation starts
  rotateY(PI/20 * sin(max(count-timer, 0) / 500.0));  
  rotateX(PI/12 * sin(max(count-timer, 0) / 1000.0));
  count++;
  
  for (Line a : myLines){
    a.draw();
    a.update();
  }
}
