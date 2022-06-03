class Particula{
    PVector pos; //posicion
    PVector vel; //velocidad
    PVector ace; //aceleracion
    PVector v;
    float r; //radio
    float ttl; //tiempo de vida
    boolean dead;
    int cont;

    Particula(PVector posicion, PVector _wind){
        
        
        //Entropía
        //Velocidad
        float vx = random(-0.1, 1);
        float vy = random(-4.0, -4.4); 
        v = new PVector(vx, vy);
        vel = v.copy();
        //Posición
        //float desvix = random(-15, 15);
        pos = posicion.copy();
          ace = new PVector(0, 0);
        r = random(20, 45);
        ttl = random(40, 70);
        ttl*=1.12;
    }

    void run(){
        update();
        render();
        
    }

    void update(){
      
        vel.add(ace);
        pos.add(vel);
        ttl -= 0.5; //Reducimos el tiempo de vida
        cont++;
        ace.mult(0); //Resetea la aceleracion

    }

    void render(){
        noStroke();
        
        fill(255, 255, 255, ttl*0.3);
        ellipse(pos.x, pos.y, r, 40);
    }
    
    void acelerar(PVector fuerzas){
      ace.add(fuerzas);
    }
    
    boolean isDead(){
      if(cont >=300){
        dead=true;
      }else{
        dead=false;
      }
      return dead;
    }

}
