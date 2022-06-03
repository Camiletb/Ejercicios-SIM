//VARIABLES GLOBALES
float dt=0.2;
//Entorno
PVector G = new PVector(0, 0.98);
//float g = 0.98;
PVector froz = new PVector (0.0, 0.0); //fuerza rozamiento aire
//Agua
float h_agua;
float fric_agua = 0.2; //fricción con el agua
float Fb; //módulo de fricción
PVector vFb = new PVector(0.0, 0.0); //fuerza flotación
float Vs; //volumen sumergido
float d; //densidad
float empuje;

Particula p;
Splash sp;
PVector posini;
float r;
boolean trigger;


void setup()
{
  size(800,800);
  posini = new PVector(width/2, 50);
  r = 40;
  p = new Particula(posini, r);
  h_agua = height*2/3;
  sp = new Splash(30, new PVector(width/2, h_agua));
  trigger = false;
  
}


void draw()
{
   //fondo
   background(20, 40, 60);
    
   //partícula
   /*if(p.pos.y + r>=h_agua){
     p.acelerar(vFb);
   }*/
   /*else{
     p.acelerar(g);
   }
   */
   p.run();
    
    
   //agua
   noStroke();
   fill(240, 240, 240, 100);
   rect(0, h_agua, width, height);
    
   //gotas
   sp.run();
   if(p.pos.y+r >= h_agua & p.vel.y > 1){
     trigger = true; //salpicar
   }
   
}
