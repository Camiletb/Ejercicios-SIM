

float ang = 3.14/3;
class movil
{
    float acum=0.0;
    PVector vel;
    PVector pos;
    
    movil(PVector _p,PVector _v)
    {
      pos = _p;
      vel = _v;
    }
  
  
  void update(float dt)
  {
    acum=acum+dt/1000;
    
    vel.x+=0*acum;
    vel.y+=9.8*acum;
    
    pos.x+=vel.x*acum;
    pos.y+=vel.y*acum;
    
  }
  
  void draw()
  {
    ellipse(pos.x,pos.y,20,20);
  }
}



PVector centro;
ArrayList<movil> bola;
int h;
void setup()
{
  size(1000,600);
  h = 500;
  centro = new PVector (width/4, h);
  PVector v = new PVector(80*cos(ang),-80*sin(ang));
  bola=new ArrayList <movil> ();
  movil m =new movil(centro,v);
  bola.add(m);
  
}


void mousePressed()
{
  PVector p = new PVector (width/4, h);
  PVector v = new PVector(80*cos(ang),-80*sin(ang));
  movil m = new movil (p,v);
  bola.add(m);
}
void draw()
{
  background(20, 40, 60);
  for(movil m : bola)
  {
  m.update(1);
  noStroke();
  fill(105,220,200);
  m.draw();
  
  stroke (240); 
  strokeWeight(2);
  fill(255);
  textSize(15);
  text("Aprieta S para aumentar la altura.", width*0.025, height*0.05); 
  text("Aprieta D para disminuir la altura.", width*0.025, height*0.075);
  text("Altura: " + (height - h), width*0.025, height*0.1); 
  text("Dispara bola con el mouse", width*0.025, height*0.125);
  
  }
}
void keyPressed()
{
  if (key == 'r')
    setup();
  if (key == 'w')
    h -= 20;
  if (key == 's')
    h += 20;
}
