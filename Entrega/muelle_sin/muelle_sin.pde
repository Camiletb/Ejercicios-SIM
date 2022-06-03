float dt=0.2;
class extremo
{
    float masa = 2.0;
    float g = 9.8; // Gravedad
    float longReposo=100;
    float ac=0.0;
    float ka= 0.0; // amortiguacion
    PVector ft = new PVector(0,0);
    PVector fa = new PVector(0,0);
    PVector fd = new PVector(0,0);
    PVector vel_euler = new PVector(0,0);
    PVector pos_euler = new PVector(0,0);
    
  extremo (PVector p)
  {
    pos_euler.x = p.x;
    pos_euler.y = p.y;
  }
  
  float getposx ()
  {
    return pos_euler.x;
  }
  
  float getposy ()
  {
    return pos_euler.y;
  }
  
  
  void update(PVector f)
  { 
    
    fa.y = ka * vel_euler.y;
    fd.y = f.y - fa.y;
    
    ft.y= fd.y+(masa*g);
    ac = ft.y /masa;
    

    vel_euler.y+=ac*dt;
    pos_euler.y+=vel_euler.y*dt;
  }
  
}


class muelle
{
    extremo e1;
    extremo e2;
    float ke = -0.5; // elasticidad
    float longre=100;
    
    PVector fk = new PVector(0,0);
    PVector fa = new PVector(0,0);

    
    muelle(extremo _e1, extremo _e2)
    {
      e1=_e1;
      e2=_e2;
    }
     
  float update()
  {
    fk.y= ke * (e2.getposy()-e1.getposy()-longre);
    
    return fk.y;
  }
  
  
  void draw()
  {
    strokeWeight(2);
    stroke(255);
    line(width/2,e1.getposy(),width/2,-e2.getposy()+500);
    ellipse(width/2,-e2.getposy()+500,30,30);
    fill(135,206,250);
  }
}


muelle m;
extremo e1;
extremo e2;
PVector f;

void setup()
{
  size(600,800);
  e1=new extremo(new PVector (400,0));
  e2=new extremo(new PVector (400,450));
  m =new muelle(e1,e2);
}


void draw()
{
  background(20, 40, 60);
    
    f=new PVector (0,m.update());
    e2.update(f);
    m.draw();
   
}
void keyPressed()
{
  if (key == 'r')
    setup();
}
