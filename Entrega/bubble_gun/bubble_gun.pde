Bubble b;
Bubble[] burbujas;
PVector origen, canyon, canyon0, dir_canon, pos_canon, base_canon;
int longitud, potencia, tam;
float radio, phi;
void setup() {
  size(800, 800);
  radio = 10;
  longitud = 60;
  //tam = 5;
  origen = new PVector(width/2, height-50);
  phi = radians(90);
  
  canyon = new PVector(origen.x + longitud * cos(phi), origen.y - longitud * sin(phi));
  b = new Bubble(canyon, radio);
  potencia = 10;
}
 
void draw() {
  //limpiamos
  background(20, 40, 60); 
  stroke (240); 
  strokeWeight(2);
  fill(255);
  textSize(15);
  text("Aprieta A para moverte a la izquierda", width*0.025, height*0.05); 
  text("Aprieta D para moverte a la derecha", width*0.025, height*0.075); 
  text("Dispara con el espacio", width*0.025, height*0.1); 
  
  
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        phi = phi - radians(2);
        canyon.x = origen.x - longitud * cos(phi);
        canyon.y = origen.y - longitud * sin(phi);
        
        b.rotar(canyon);
      }
      if (key == 'd' || key == 'D') {
        phi = phi + radians(2);
        canyon.x = origen.x - longitud * cos(phi);
        canyon.y = origen.y - longitud * sin(phi);
        b.rotar(canyon);
      }
      if ( key == ' ') {
        b.lanzar(potencia);
      }
    }
    canyon0=canyon.copy();
    
    stroke(215);
    strokeWeight(5);
    //line(origen.x, origen.y, canyon0.x, canyon0.y);
    line(0, 100, width, 100);
    b.rebotes();
    b.mover();

    b.drawb();
  
}

void keyPressed()
{
  if (key == 'r')
    setup();
}
