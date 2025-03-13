// Variables
color c;
float sz; // size
boolean stroke; 
enum shape{RECT, CIRCLE, TRIANGLE, STAR};
shape s;
String info = "1: square | 2: circle | 3: triangle | 4: star |" +
     " Up Arrow: size up | Down Arrow: size down |" +
     " r: red | g: green \nb: blue | p: purple | y: yellow | o: orange | w: white | " +
     "W: black | s: stroke/noStroke | S: save drawing";

void setup(){
  size(1000, 800);
  background(255);
  rectMode(CENTER);
  textAlign(LEFT);
 
  // Valors inicials
 s = shape.RECT;
 sz = 100;
 c = color(255);
 stroke = true;
}  
void draw(){
  drawToolbar();
  fill(255, 215, 35); textSize(25);
  text("Drawing APP :)", 20, height-756);
}  
void drawToolbar(){
  fill(20, 120, 255);
  rect(width/2, height/32, width, 90);
  textSize(19); fill(255);
  text(info, width-800, height/24);
}  
void mousePressed(){
  drawShape();
}  
void mouseDragged(){
  drawShape();
}  
void keyPressed(){
  setSize();
  setColor();
  resetCanvas();
  saveCanvas();
  
}  
void drawShape(){
  fill(c);
  if(stroke){
    stroke(5);
  }else{
    noStroke();
  }  
  setShape();
  if(s == shape.RECT){
    rect(mouseX, mouseY, sz, sz);
  }else if(s == shape.CIRCLE){
    circle(mouseX, mouseY, sz);
  }else if(s == shape.TRIANGLE){
    triangle(mouseX, mouseY-sz, mouseX-sz, mouseY+sz, mouseX+sz, mouseY+sz);
  }else if(s == shape.STAR){
    float scale = sz /50f;
    beginShape();
    vertex(mouseX, mouseY-50*scale);
    vertex(mouseX+13*scale, mouseY-30*scale);
    vertex(mouseX+35*scale, mouseY-30*scale);
    vertex(mouseX+20*scale, mouseY-15*scale);
    vertex(mouseX+25*scale, mouseY+5*scale);
    
    vertex(mouseX, mouseY-8*scale);
    vertex(mouseX-25*scale, mouseY+5*scale);
    vertex(mouseX-20*scale, mouseY-15*scale);
    vertex(mouseX-35*scale, mouseY-30*scale);
    vertex(mouseX-13*scale, mouseY-30*scale);
  endShape(CLOSE);  
  }  
}  

//Funció per establir color de la figura
void setColor(){
  if (key == 'r'){         // Red
    c = color(255, 0, 0);
  } else if (key == 'g'){  // Green
    c = color(0, 255, 0);
  } else if (key == 'b'){  // Blue
    c = color(0, 0, 255);
  } else if (key == 'y'){  // Yellow
    c = color(255, 255, 0);
  } else if (key == 'p'){  // Purple
    c = color(153, 51, 255); 
  } else if (key == 'o'){  // Orrange
    c = color(255, 165, 0);
  }else if (key == 'w') {  // White
    c = color(255);
  }else if (key == 'W') {  // Black
    c = color(0);
  }
  
// stroke o noStroke
 if(key=='s'){
    stroke = !stroke;
 }  
}
//Funció mida figures
void setSize(){
  if(keyCode == UP){
    sz+=10;
  }else if(keyCode == DOWN){
    sz-=10
   ;
  } 
  if(sz <= 5){
     sz = 5;
  }else if(sz>=900){
    sz = 900;
  }  
}
//Funció per establir forma dibuixada (ENUM)
void setShape(){
  if(key == '1'){
    s = shape.RECT;
  }else if(key == '2'){
    s = shape.CIRCLE;
  }else if(key == '3'){
    s = shape.TRIANGLE;
  }else if(key == '4'){
    s = shape.STAR;
  }  
}
void saveCanvas(){
  if(key == 'S') {  // Guarda la imatge en pitjar 'S' 
    saveFrame("drawings/myDrawing.png");
  }  
}  

void resetCanvas(){
  if(keyCode == BACKSPACE){
    background(255);
  }  
}  
