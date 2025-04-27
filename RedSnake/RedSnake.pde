int time = 0;
int red = 255;
int diam = 50;
int alpha = 5;

void setup(){
  size(800, 800);
  background(255);
}

void draw(){
  time++;
  red = int(128*(1+sin(time*2*PI/frameRate/10)));
  diam = int(60*(1+sin(time*2*PI/frameRate/5)))+8;
  alpha = int(128*(1+sin(time*2*PI/frameRate/10)))+15;

  noStroke(); fill(0, red, red, alpha); 
  circle(mouseX, mouseY, diam);
}  
