PImage img[] = new PImage[10];
String imgFile[] = {"0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg","5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"};

void setup(){
  size(460, 95);
  for(int i = 0; i<10; i++){
    img[i] = loadImage(imgFile[i]);
  }  
}

void draw(){
  // Hores
  int h = hour();
  int hA = int(h/10); // Primer dígit hora
  int hB = h-(hA*10); // Segon dígit hora
  
  image(img[hA], 0, 0);
  image(img[hB], 70, 0);
  
  // Minuts
  int m = minute();
  int mA = int(m/10); // Primer dígit minuts
  int mB = m-(mA*10); // Segon dígit minuts

  image(img[mA], 160, 0);
  image(img[mB], 230, 0);
  
  // Segons
  int s = second();
  int sA = int(s/10); // Priner dígit segons
  int sB = s-(sA*10); // Segon dígit segons
  
  image(img[sA], 320, 0);
  image(img[sB], 390, 0);
}  
