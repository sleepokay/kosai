PVector dim, delta, blackbox, bdelta;
float r,g,b;

void setup()
{
  //size(displayWidth,displayHeight, P2D);
  size(800,550, P2D);
  background(0);
  frameRate(30);
  
  dim = new PVector(1, 1);
  blackbox = new PVector(width, height);
  bdelta = new PVector((int) random(-10,1) * -1, (int) random(-10, -1));
  delta = new PVector((int) random(1,10), (int) random(1,10));
  rectMode(CENTER);
}

/*
boolean sketchFullScreen()
{
  return true;
}
*/

void draw()
{
  update();
  
  if (true)//random(1) < 1)
  {
    loadPixels();
    for (int i = -1 * (int) dim.x; i < (int) dim.x; i++)
    {
      color p = pixels[(height/2-(int) dim.y)*width+(width/2+i)];
      pixels[(height/2-(int) dim.y)*width+(width/2+i)] = color(abs(red(p) - r), abs(green(p) - g), abs(blue(p) - b));
      pixels[(height/2+(int) dim.y)*width+(width/2+i)] = color(abs(red(p) - r), abs(green(p) - g), abs(blue(p) - b));
    }
    
    for (int i = -1 * (int) dim.y; i < (int) dim.y; i++)
    {
      color p = pixels[(height/2+i)*width+(width/2-(int) dim.x)];
      pixels[(height/2+i)*width+(width/2-(int) dim.x)] = color(abs(red(p) - r), abs(green(p) - g), abs(blue(p) - b));
      pixels[(height/2+i)*width+(width/2+(int) dim.x)] = color(abs(red(p) - r), abs(green(p) - g), abs(blue(p) -b));
    }
    updatePixels();
  }
  
  for (int i = -1 * (int) blackbox.x; i < (int) blackbox.x; i++)
  {
    pixels[(height/2-(int) blackbox.y)*width+(width/2+i)] = color(0,0,0);
    pixels[(height/2+(int) blackbox.y)*width+(width/2+i)] = color(0,0,0);
  }
    
  for (int i = -1 * (int) blackbox.y; i < (int) blackbox.y; i++)
  {
    pixels[(height/2+i)*width+(width/2-(int) blackbox.x)] = color(0,0,0);
    pixels[(height/2+i)*width+(width/2+(int) blackbox.x)] = color(0,0,0);
  }
  updatePixels();
  //rect(width/2.0), (height/2.0), blackbox.x, blackbox.y);
}

void update()
{
  dim.add(delta);
  if ((int) dim.x < 1)
  {
    delta.x *= -1;
    dim.x = 1;
  }
  if ((int) dim.x > (int) (width/2) -1)
  {
    delta.x = random(1,10) * -1;
    dim.x = (int) (width/2) -1;
    
    r = random(1,255);
    g = random(1, 255);
    b = random(1, 255);
  }
  if ((int) dim.y < 1)
  {
    delta.y *= -1;
    dim.y = 1;
  }
  if ((int) dim.y > (int) (height/2) -1)
  {
    delta.y = random(1,10) * -1;
    dim.y = (int) (height/2) -1;
    
    r = random(1,255);
    g = random(1, 255);
    b = random(1, 255);
  } 
  
  blackbox.add(bdelta);
  if ((int) blackbox.x < 1)
  {
    bdelta.x *= -1;
    blackbox.x = 1;
  }
  if ((int) blackbox.x > (int) (width) -1)
  {
    bdelta.x = random(1,10) * -1;
    blackbox.x = (int) (width) -1;
  }
  if ((int) blackbox.y < 1)
  {
    bdelta.y *= -1;
    blackbox.y = 1;
  }
  if ((int) blackbox.y > (int) (height) -1)
  {
    bdelta.y = random(1,10) * -1;
    blackbox.y = (int) (height) -1;
  }
}

void mouseClicked()
{
  renew();
}

void keyPressed()
{
    switch (key)
    {
      case ESC:
        exit();
        break;
      case ' ':
        renew();
        break;
      default:  
        break;
    }
    
}

void renew()
{
  background(0);
  dim = new PVector(1, 1);
  blackbox = new PVector(width, height);
  bdelta = new PVector((int) random(-10,1) * -1, (int) random(-10, -1));
  delta = new PVector((int) random(1,10), (int) random(1,10));
  rectMode(CENTER);
}

