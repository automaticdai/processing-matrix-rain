public class Line{
  String text_str;
  float speed;
  color text_color;
  float alpha;
  float x;
  float y;

  Line(String text_str_, float x_, float y_){
    text_str = text_str_;
    x = x_;
    y = y_;
    speed = random(2,10);
    alpha = random(50,255);
  }
  
  public void draw(){
    pushMatrix();
    
    String text_str_to_draw = text_str;
    float p = random(1);
    
    if (p < 0.01){
      int pos = int(random(0, text_str.length()));
      char[] text = text_str_to_draw.toCharArray();
      text[pos] = '&';
      text_str_to_draw = String.valueOf(text);
    }
    
    translate(x, y);
    fill(0, 255, 0, alpha);
    text(text_str_to_draw, 0, 0, 16, 500);
    
    popMatrix();
  }
  
  public void update(){
    y = y + speed;
    if (y > height+50) {
      y = -50;
    }
  }

}
