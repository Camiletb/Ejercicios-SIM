int radio;
int tam;
PVector pos;
PVector[] vel;
PVector v, a;
float ax, ay, dt;
PVector[] topo;
int speed;

void setup(){
  size(800, 800);
  radio = 16;
  pos = new PVector(150, 300);
  tam = 4;
  topo = new PVector[tam];
  vel = new PVector[tam];
  ax=1;
  ay=1;
  v = new PVector(0, 0);
  a = new PVector(ax, ay);
  speed = 35;
  dt = 0.05; 
}

void draw(){
  //limpiamos
  background(20, 40, 60); 
  stroke (240); 
  strokeWeight(2);
  
  //puntos montaña
  topo[0]= new PVector(150, 300);
  topo[1]= new PVector(200, 150);
  topo[2]= new PVector(400, 550);
  topo[3]= new PVector(600, 400);
  
  //dibujar montaña
  int i=0;
  while(i < topo.length-1){
    line(topo[i].x, topo[i].y, topo[i+1].x, topo[i+1].y);
    i++;
  }
  
  //bola
  //Identificación de tramos
  if(pos.x >= 150 && pos.x < 200){
    vel[0]=topo[1].sub(topo[0]);
    v=vel[0];
    v=v.copy().normalize().mult(speed*2);
    ax = ay= 1;
  //v=v.mult(speed * 30);
  }
  if(pos.x >= 200 && pos.x < 400){
    vel[1]=topo[2].sub(topo[1]);
    v = vel[1];
    v=v.mult(100);
    v=v.copy().normalize().mult(speed * 3);
    ax = ay= 1;
  }
  if(pos.x >= 400 && pos.x < 600){
    vel[2]=topo[3].sub(topo[2]);
    v = vel[2];
    v=v.copy().normalize().mult(speed * 1);
    ax = ay= 1;
  }
  if(pos.x >= 600){
      setup();
  }
  //v=v.copy().normalize().mult(speed * 10);
  //v=v.mult(speed);
  a=new PVector(ax, ay);
  v.add(PVector.mult(a, dt));
  
  
  //Poner límites
  if(pos.x + radio/2> width) //hacemos esto en las 4 direcciones
    v.x*=-1;
  if(pos.x - radio/2 < 0)
    v.x*=-1;
  if(pos.x + radio/2> width)
    v.y*=-1;
  if(pos.x - radio/2 < 0)
    v.y*=-1;
    
  stroke (255, 100, 200); 
  strokeWeight(4);
  fill(20, 40, 60);
  //pos = pos + vel * dt
  pos.add(PVector.mult(v, dt));
  ellipse(pos.x, pos.y, radio, radio);
}

void keyPressed()
{
  if (key == 'r')
    setup();
}
