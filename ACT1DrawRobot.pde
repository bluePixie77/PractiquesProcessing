void setup(){
 size(400, 600); 
 strokeWeight(4);
}  

void draw(){
  // Variables generals
  int x = mouseX;
  int y = mouseY;
  
 // circle(x, y, 10);
  background(255);
  drawRobot(x, y);
}  
void drawRobot(int x, int y){
  drawLegs(x, y);
  drawNeck(x, y);
  drawBody(x, y);
  //draw3Lines(x, y);
  drawArms(x, y);
  drawHead(x, y);
  drawStar(x, y);
  drawLinesArms(x, y);
}  
void drawBody(int x, int y){
  strokeWeight(5);
  fill(255, 210, 0);
  arc(x, y+10, width/3.5, height/7, 0, PI, PIE);
  
  fill(0, 200, 255);
  rectMode(CENTER);
  strokeJoin(MITER);
  rect(x, y-20, width/3, height/6);
  
}  
void drawLinesArms(int x, int y){
  for(int i=0; i<100; i+=20){
    // Arms
    line(x+70, y+50-i, x+90, y+50-i);
    line(x-70, y+50-i, x-90, y+50-i);
    // Legs
    line(x-30, y+150-i, x-10, y+150-i);
    line(x+30, y+150-i, x+10, y+150-i);
    // antena

 
  }  
}  

void drawArms(int x, int y){
  fill(255, 210, 0);
  rect(x-80, y+10, 20, 150);
  rect(x+80, y+10, 20, 150);
}  
void drawLegs(int x, int y){
  fill(0, 200, 255);
  rectMode(CENTER);
  rect(x+20, y+100, 20, 150);
  rect(x-20, y+100, 20, 150);
}  

void drawHead(int x, int y){
  strokeWeight(4);
  fill(0, 200, 255);
  ellipse(x, y-125, 110, 70); 
  drawEye(x, y);
}  
void drawEye(int x, int y){
  fill(255);
  circle(x, y-140, 40);
  fill(255, 0, 0); 
   circle(x, y-140, 20);
}  

void drawNeck(int x, int y){
  fill(255, 210, 0);
  triangle(x-60, y-60, x+60, y-60, x, y-100);
  fill(255);
}  
void drawStar(int x, int y){

  fill(255, 0, 0);
  beginShape();
    vertex(x, y-50);
    vertex(x+13, y-30);
    vertex(x+35, y-30);
    vertex(x+20, y-15);
    vertex(x+25, y+5);
    
    vertex(x, y-8);
    vertex(x-25, y+5);
    vertex(x-20, y-15);
    vertex(x-35, y-30);
    vertex(x-13, y-30);
  endShape(CLOSE);  
  
}  
