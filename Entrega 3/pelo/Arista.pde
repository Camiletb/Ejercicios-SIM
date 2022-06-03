class Arista{ 
  PVector ancho;
  float len;
  float k = 20, Epe;
  float elong = 0;
  
  PVector Fa = new PVector(0.0, 0.0);
  PVector Fb = new PVector(0.0, 0.0);
  
  Nodos a;
  Nodos b;

  Arista(Nodos a_, Nodos b_, int l) {
    a = a_;
    b = b_;
    len = l;
  } 


  void update(){  
    ancho = PVector.sub(b.pos, a.pos);
    elong = ancho.mag() - len;
    ancho.normalize();
    Epe = -k * elong;
    Fa = PVector.mult(ancho, -Epe);
    Fb = PVector.mult(ancho, Epe);
    
    // Amortiguación
    Fa = PVector.sub(Fa, PVector.mult(a.vel, a.amort));
    Fb = PVector.sub(Fb, PVector.mult(b.vel, b.amort));
    
    a.applyForce(Fa);
    b.applyForce(Fb);
  }


  void display() {
    strokeWeight(1);
    stroke(210, 80, 80);
    line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
  }
}
