int numImg = 13;

PImage[] img;  // Images PNG (.png)
int currentFrame = 0;
int x;
int direcció = 1;

void setup(){
  size(1000, 800);
  img = new PImage[numImg];
  for(int i=0; i<img.length; i++){
     img[i] = loadImage("camelAnimation/camel"+i+".png");
     img[i].resize(img[i].width*2, img[i].height*2);       // Augmentar dimensions imatges
  }   
}

void draw(){
  background(0, 220, 250);
  // Grass
  pushMatrix();
    translate(0, (height/2)+95);
     fill(0, 250, 0); noStroke();
     rect(0, 0, 1000, height/2);
  popMatrix();  
  
  // Bug
  pushMatrix();
    bug();
  popMatrix();  
  
  // Camel running
  imageMode(CENTER);
  pushMatrix();
   translate(x, height/2);
   scale(direcció, 1);
   image(img[currentFrame], 0, 0);
  popMatrix();
    x+= 5*direcció;
  if(x>width || x<0){
    direcció*= -1;
  }  
 
  if(frameCount%2==0){
    currentFrame++;
    currentFrame = currentFrame % img.length;
  }  
}  

void bug(){
  pushMatrix();
    translate(x+direcció*140, height/2*1.21);
     fill(255, 0, 0);
     ellipse(0, 0, 20, 20);
     fill(0);
     ellipse(-4, 2*direcció, 3, 3);
     ellipse(4, -1*direcció, 3, 3);
  popMatrix();  
}  
