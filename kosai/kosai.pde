PVector colorbox, blackbox;  // contains width and height of box centered on display area
PVector delta, bdelta;  // amount to change dimensions by each iteration
float r, g, b;

void setup()
{
  size(800, 550, P2D);
  background(0);
  frameRate(12);

  reset();
}

void draw()
{
  update();

  loadPixels();  // Processing will copy display raster into pixels[]
  // 1D array holding 2D information requires a little math to work with
  // height/2 - colorbox.y * width -> row
  // width/2+i -> column
  // this way of updating colors creates the interwoven texture effect
  for (int i = -1 * (int) colorbox.x; i < (int) colorbox.x; i++) {
    color p = pixels[(height/2-(int) colorbox.y)*width+(width/2+i)];
    pixels[(height/2-(int) colorbox.y)*width+(width/2+i)] = color(abs(red(p)-r), abs(green(p)-g), abs(blue(p)-b));
    pixels[(height/2+(int) colorbox.y)*width+(width/2+i)] = color(abs(red(p)-r), abs(green(p)-g), abs(blue(p)-b));
  }

  for (int i = -1 * (int) colorbox.y; i < (int) colorbox.y; i++) {
    color p = pixels[(height/2+i)*width+(width/2-(int) colorbox.x)];
    pixels[(height/2+i)*width+(width/2-(int) colorbox.x)] = color(abs(red(p)-r), abs(green(p)-g), abs(blue(p)-b));
    pixels[(height/2+i)*width+(width/2+(int) colorbox.x)] = color(abs(red(p)-r), abs(green(p)-g), abs(blue(p)-b));
  }
  
  // update the black box
  for (int i = -1 * (int) blackbox.x; i < (int) blackbox.x; i++) {
    pixels[(height/2-(int) blackbox.y)*width+(width/2+i)] = color(0, 0, 0);
    pixels[(height/2+(int) blackbox.y)*width+(width/2+i)] = color(0, 0, 0);
  }

  for (int i = -1 * (int) blackbox.y; i < (int) blackbox.y; i++) {
    pixels[(height/2+i)*width+(width/2-(int) blackbox.x)] = color(0, 0, 0);
    pixels[(height/2+i)*width+(width/2+(int) blackbox.x)] = color(0, 0, 0);
  }
  updatePixels();
}

void update() {
  // adds deltas to boxes and checks if it bounces off edge of display
  // change colors if the box bounces
  colorbox.add(delta);
  if ((int) colorbox.x < 1) {
    delta.x *= -1;
    colorbox.x = 1;
  }
  if ((int) colorbox.x > (int) (width/2)-1) {
    delta.x = random(1, 10) * -1;
    colorbox.x = (int) (width/2) -1;

    r = random(1, 255);
    g = random(1, 255);
    b = random(1, 255);
  }
  if ((int) colorbox.y < 1) {
    delta.y *= -1;
    colorbox.y = 1;
  }
  if ((int) colorbox.y > (int) (height/2) -1) {
    delta.y = random(1, 10) * -1;
    colorbox.y = (int) (height/2) -1;

    r = random(1, 255);
    g = random(1, 255);
    b = random(1, 255);
  } 

  blackbox.add(bdelta);
  if ((int) blackbox.x < 1) {
    bdelta.x *= -1;
    blackbox.x = 1;
  }
  if ((int) blackbox.x > (int) (width) -1) {
    bdelta.x = random(1, 10) * -1;
    blackbox.x = (int) (width) -1;
  }
  if ((int) blackbox.y < 1) {
    bdelta.y *= -1;
    blackbox.y = 1;
  }
  if ((int) blackbox.y > (int) (height) -1) {
    bdelta.y = random(1, 10) * -1;
    blackbox.y = (int) (height) -1;
  }
}

void mouseClicked() {
  reset();
}

void keyPressed() {
  switch (key) {
  case ' ':
    reset();
    break;
  default:  
    break;
  }
}

void reset() {
  background(0);
  colorbox = new PVector(1, 1);
  blackbox = new PVector(width, height);
  bdelta = new PVector((int) random(-10, 1) * -1, (int) random(-10, -1));
  delta = new PVector((int) random(1, 10), (int) random(1, 10));
  rectMode(CENTER);
}