class Nodos{ 
  PVector pos;
  PVector vel;
  PVector a;
  float mass = 10, dt = 0.25;
  PVector gravity =new PVector(0, 9.8);
  float Ec, Ep;
  float amort = 0.5;


  Nodos(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(random(-15.0, 15.0),random(-15.0, 15.0));
    a = new PVector(0,0);

  } 


  void update(){  //euler semi
    applyForce(PVector.mult(gravity, mass));

        vel = PVector.add(PVector.mult(a, dt), vel);
        pos = PVector.add(PVector.mult(vel, dt), pos);
        a = new PVector(0.0, 0.0);
  }


  void applyForce(PVector force){
    PVector f = force;
    f.div(mass);
    a.add(f);
  }



  void display(){ 
    noStroke();
    fill(210, 80, 80);
    ellipse(pos.x, pos.y, 1, 1); //radio 5 para que no se noten mucho los extremos por los que esta compuesta la cuerda
  } 

}
