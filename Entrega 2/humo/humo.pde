Sistema_particulas sp;
float h_suelo;

void setup(){
    size(600, 800);
    h_suelo = height*2/3;
    sp = new Sistema_particulas(4, new PVector(width/2, h_suelo - 5));
}

void draw(){
    // fondo
    background(20, 40, 60);
    

    
    //humo
    fill(255);
    
    //viento, porque un día es un día
    //float fuerza = random(-0.5, 3);
    //PVector wind = new PVector(fuerza, 0);
    
    sp.acelerar();
    sp.run();
    for(int i = 0; i<3; i++){
      sp.addParticula();
    }
    filter(BLUR, 2);
    
    //luna
    fill(220);
    ellipse(100, 100, 70, 70);
    // suelo
    noStroke();
    fill(240, 80, 80, 100);
    rect(0, h_suelo, width, height);
    

    
}
