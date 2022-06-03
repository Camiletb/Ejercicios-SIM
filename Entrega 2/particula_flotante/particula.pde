class Particula{
    PVector pos; //posicion
    PVector vel; //velocidad
    PVector ace; //aceleracion
    float r; //radio
    float m; //masa
    float d; //densidad
    

    Particula(PVector posicion, float _r){
        
        pos = posicion.copy();
        vel = new PVector(0, 0);
        ace = new PVector(0, 0.98);
        this.r = _r;
        m = 5;
        d = 0.00001;
    }

    void run(){
        update();
        render();
        
    }

    void update(){

      acelerar(PVector.mult(G, m));
      //tratamiento de fuerzas
      if (pos.y - r>= h_agua){ //dentro
        empuje = 5.0 * PI * pow(r,3) / 3.0;
        froz.y = -fric_agua * vel.y;
      }else if (pos.y+r/2 > h_agua && pos.y-r/2 <h_agua){ //en la línea
        float h = pos.y + r - height/1.5;
        float a = sqrt(2 * h * r - pow(h, 2));
        empuje = (3 * pow(a,2) + pow(h, 2)) * PI * h/6.0;
        froz.y = -fric_agua * vel.y; 
      }else{ //fuera
        empuje = 0;
        froz.y = 0;
      }
      
      vFb.y = -d * G.y * empuje;
      acelerar(vFb);   
      acelerar(froz);
      vel.add(ace);
      pos.add(vel);
      ace.mult(0); //Resetea la aceleracion
    }

    void render(){
      noStroke();
      fill(210,80,80);
      ellipse(pos.x, pos.y, r, r);
    }
    
    void acelerar(PVector fuerzas){
      PVector aux = fuerzas.div(m);
      ace.add(aux);
    }

}
