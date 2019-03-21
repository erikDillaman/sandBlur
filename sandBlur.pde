      /*---------------------------------------       
      |             Sand Blur Filter           |
      |             ~Erik Dillaman~            |
      ----------------------------------------*/

PImage img;
color tempPixel1, tempPixel2;
int offset;   // used with i%5==0 to only move every 'offset' pixel
int counter = 0;
int MAX_COUNT = 100;   // set this to determine how many times the pixel movement occurs

void setup()
{
  img = loadImage("image.jpg");
  surface.setSize(img.width, img.height);
  //noLoop();
}

void draw()
{


  int i = 0;
  int j = 0;
  img.loadPixels();
  tempPixel1 = img.pixels[img.pixels.length-1];
  while (i < img.pixels.length) {
    offset = (int)random(1, 50);
    if (i%offset == 0) {
      tempPixel2 = img.pixels[i];
      img.pixels[i] = tempPixel1;
      tempPixel1 = tempPixel2;
    }
    i++;
  }
  counter++;
  img.updatePixels();
  image(img, 0, 0);
  
  if(counter > MAX_COUNT) noLoop();
}
