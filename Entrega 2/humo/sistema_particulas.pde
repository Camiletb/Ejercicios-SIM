class Sistema_particulas{
    ArrayList<Particula> particulas;
    Particula p;
    PVector fuente;
    //float r; //radio
    //float ttl; //tiempo de vida
    float vx;
    float vy;
    //viento, porque un día es un día
    float fuerza_viento;
    PVector fuerzas;

    Sistema_particulas(int numParticulas, PVector _fuente){
        this.fuente = _fuente.copy();
        particulas = new ArrayList<Particula>();
        
        for(int i = 0; i < numParticulas; i++){
            //r = random(10, 15);
            //ttl = random(5, 20);
            vx = random(-0.3, 0.3);
            vy = random(-1.4, -1.5);
            particulas.add(new Particula(fuente, fuerzas));
        }
    }

    void run(){
        for(int i = 0; i < particulas.size(); i++){
            p = particulas.get(i);
            p.run(); //ejecuta la funcion run de cada particula
            if(p.isDead() ==true){ //si la particula ha muerto
                particulas.remove(i);   //elimina la particula
            }
        }
    }

    void acelerar(){
      for(Particula p : particulas){
        if(p.pos.y <= 450){ //altura a la que le afecta el viento
           fuerza_viento = random(-0.1, 0.2);
           fuerzas = new PVector(fuerza_viento, 0);
           p.acelerar(fuerzas);
        }else{
          p.acelerar(new PVector(0, 0));
        }
        }
      
    }
    //void applyForce(PVector force){
        //for(int i = 0; i < particulas.size(); i++){
            //p.applyForce(force);
        //}
    //}

    void addParticula(){
        particulas.add(new Particula(fuente, fuerzas));
    }

}
