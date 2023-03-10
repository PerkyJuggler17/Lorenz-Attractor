import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> points1 = new ArrayList<PVector>();
ArrayList<PVector> points2 = new ArrayList<PVector>();

PeasyCam cam;

void setup()
{
  size(1000, 600, P3D);
  //fullScreen(P3D);
  colorMode(HSB);
  
  cam = new PeasyCam(this, 500);
}

void draw()
{
  background(0);

  float dt = 0.01;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points1.add(new PVector(x, y, z));
  points2.add(new PVector(x, y, -z));
  
  translate(0, 0, 0);
  //translate(width/2, height/2);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  beginShape();
  for (PVector v : points1)
  {
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    //PVector offset = Pvector.random3D();
    //offset.mult(0.01);
    //v.add(offset);
    
    hu += 0.1;
    if (hu > 255)
    {
      hu = 0;
    }
  }
  endShape();
  
    beginShape();
  for (PVector v : points2)
  {
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);
    
    hu += 0.1;
    if (hu > 255)
    {
      hu = 0;
    }
  }
  endShape();
}
