
PImage img, img0, img1, img2, img3;
PFont  font, font0, font1, font2;
String txt, txt0, txt1, txt2;
float[] xDrops, yDrops, speed, size;
color[] c;
int numD = 100;
float x, y, velocitat, textSizeValue=80;
boolean drop = false, showText;

void setup(){
  size(1000, 800);
  
  xDrops = new float[numD];
  yDrops = new float[numD];
  c      = new color[numD];
  speed  = new float[numD];
  size   = new float[numD];
  for(int i=0; i<yDrops.length; i++){
    yDrops[i] = random(-width, 0);
    xDrops[i] = random(0, width);
    c[i]      = color(0, 0, random(255));
    speed[i]  = random(10, 25);
    size[i]   = random(20, 80);
  }  
  imageMode(CENTER);
   // Imatges
  img0 = loadImage("raindrop1.png");
  img1 = loadImage("raindrop2.png");
  img2 = loadImage("raindrop3.png");
  img3 = loadImage("raindrop4.png");
  
  // Text
 txt0 = "Rain";
 txt1 = "Happy";
 txt2 = "Cold";
 
 font0 = createFont("raindropsFont/Raindrops.ttf", 100);
 font1 = createFont("RainyFont.otf", 100);
 font2 = createFont("happyTimeFont/HappyTime.otf", 100);
 
 font = font1;
 txt = txt1;
}

void draw(){
  background(255);
  setParameters();
  
  // Draw Drops
  if(drop){
    pushMatrix();
    for(int i=0; i<yDrops.length; i++){
      tint(c[i]);
      image(img, xDrops[i], yDrops[i], size[i], size[i]);
      yDrops[i]+=speed[i];
      if(yDrops[i]>height){
        yDrops[i] = random(-width, 0);
        xDrops[i] = random(0, width);
        size[i]   = random(20, 80);
      }  
    } 
   popMatrix();
 }
 
 // Draw Text
  if(showText){
    x = mouseX; y = mouseY;
    textFont(font); textSize(textSizeValue);
    fill(random(255), random(255), random(255));
    text(txt, x, y);
  }
}

void setParameters(){
  // Settings Imatge
  float currentI = random(3);
  switch((int)currentI){
    case 0: img = img0; break;
    case 1: img = img1; break;
    case 2: img = img2; break;
    case 3: img = img3; break;
  }
}    

void reset(){
  for(int i=0; i<yDrops.length; i++){
    yDrops[i] = random(-width, 0); 
    xDrops[i] = random(0, width);  
    speed[i] = random(2, 20);      
    size[i] = random(20, 80);      
    c[i] = color(0, 0, random(255)); 
  }
}

void keyPressed(){
  if(key=='s' || key=='S'){
    saveFrame("collage.png");
  }else if(key=='d' || key=='D'){
    reset();
    drop = true;
  }else if(key=='n' || key=='N'){
    drop = false;
  }
  
  // Canviar text amb '1', '2', '3'
 if (key == '1') {
   txt = txt0; // Cambiar a "Rain"
 } else if (key == '2') {
   txt = txt1; // Cambiar a "Happy"
 } else if (key == '3') {
   txt = txt2; // Cambiar a "Cold"
 }
 
 // Canviar font amb '4', '5', '6'
 if (key == '4') {
   font = font0; // Font "Raindrops"
 } else if (key == '5') {
   font = font1; // Font "RainyFont"
 } else if (key == '6') {
   font = font2; // Font "HappyTime"
 }
}

void mousePressed() {
  showText = !showText; // Alternar la visibilidad del texto al hacer clic
  textSizeValue = random(20,100);
}
