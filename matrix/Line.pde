public class Line{
  String text_str;       // the text loaded
  
  String text_str_t;     // temp for muted text
  int    mute_countdown; // countdown for mutation

  int   text_size = 32;
  float alpha;
  float x;
  float y;
  float z;
  float speed;
  
  Line(String text_str_, float x_, float y_){
    text_str = text_str_;
    x = x_;
    y = y_;
    z = random(-1000, 1000);
    speed = random(1,5);
    alpha = random(10, 255);
  }
  
  public void draw(){
    pushMatrix();
    
    String text_str_to_draw = text_str;
    //println(text_str);
    //println(text_str.length());
    
    // mute at most three characters
    for (int i = 0; i < 3; i++) {
      // set one random symbol
      float p = random(1);
      
      if (p < 0.005){
        // choose which character to mute
        int pos = int(random(0, text_str.length()-1));
        
        // choose which character to mute to
        String text_random = "チャンスは準備できた人のところにしか来ない";
        int c = int(random(0, text_random.length()-1));
        
        char[] text = text_str_to_draw.toCharArray();
        text[floor(pos/2)*2] = text_random.charAt(floor(c/2)*2);
        text_str_to_draw = String.valueOf(text);
        
        text_str_t = text_str_to_draw;
        mute_countdown = 20;
      }
    }
    
    if (mute_countdown > 0) {
      text_str_to_draw = text_str_t;
      mute_countdown -= 1;
    } else {
      ;
    }
    
    // display the text
    translate(x, y, z);
    //circle(0, 0, 5); // locating point
    fill(0, 255, 0, alpha);
    text(text_str_to_draw, 0, 0, text_size, 500);
    
    // (optional) motion blur & glow effect
    fill(0, 255, 0, max(alpha-100, 10));
    text(text_str_to_draw, 0, -speed, text_size, 500);
    
    popMatrix();
  }
  
  public void update(){
    y = y + speed;
    if (y > height + 100) {
      y = -100;
      x = random(width);
    }
  }

}
