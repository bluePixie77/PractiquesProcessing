String[] imgFiles = {"fondo.png", "manzana.png", "newton1.png", "newton2.png"};
PImage[] img = new PImage[4];

int nX = 0; // X Newton
int nY = 0; // Y Newton
int aX; // X Apple
float aY = 0;                   // Y Apple
float aV = 3;     // Velocity Apple
float aA; // Acceleration Apple

int p = 0; // Points
boolean pCount = true; // Count points or not
long t = 0; // Time


void setup(){
  rectMode(CORNER);
  size(600, 600);
  nY = height-135;
  aX = int(random(width-20)); // Initialize random coordinate for Apple
  aA = random(0.068, 0.1);
  t = millis();   // Initialize time counter
  
  // Load Images
  for(int i=0; i<img.length; i++){
    img[i] = loadImage(imgFiles[i]);
  }  
}

void draw(){
  background(255);
  image(img[0], 0, 0, width, height); 
  tint(255);
  
  // Apple Movement
  aV += aA;
  aY += aV;
  if(aY>height){
    aY = 15;
    aX = int(random(width-20));
    aV = 0;
    aA = random(0.048, 0.098);
    pCount = true;
  }  
  
 // Collision detection
  if(aY+50>nY && aY-10<nY+135){
    if(aX+40>nX && aX-10<nX+128){
      tint(255, 0, 0);
      if(pCount) p++;
      pCount = false;
     }  
  }  
   
 image(img[1], aX, aY);  // Apple
 if(pCount){
   image(img[2], nX, nY); // Newton
 }else{
   image(img[3], nX, nY); // Newton has apple
 }  
  
  // Time Count (sec)
  float timer = (millis()-t)/1000;
  
  // GAME OVER
  if(timer>=30){
    noLoop(); 
    background(0, 70);
    rectMode(CENTER); fill(255);
    rect(width/2, height/2, width/2, height/3);
    textAlign(CENTER); fill(255, 0, 0); textSize(25);
    text("Total Hits: "+p, width/2, height/2);
    text("Good job Newton!", width/2, (height/2)+30);
  }  
  
   // Show Points
  fill(0);
  text("Hits: "+p, width-50, 20);
  
  // Show Time
  text("Timer: "+(30-timer), 10, 20);
  
  // Apple guide lines
  /* line(0,aY-10,width,aY-10);
   line(aX-10,0,aX-10,height);
   line(0,aY+10,width,aY+10);
   line(aX+10,0,aX+10,height); */
}  

void keyPressed(){
  // Newton Movement
  if(keyCode == RIGHT){
    nX += 20;
  }  
  if(keyCode == LEFT){
    nX -= 20; 
  }  
  // Limits in Newton's Movement
  if(nX<0){
    nX = 0; 
  }  
  if(nX>width-20){
    nX = width-20;
  }  
}  
