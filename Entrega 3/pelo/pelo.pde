int tam;    
int lon;
int can;
int t = 0;

Nodos[][] vectorNodos;
Arista[][] vectorAristas;

void setup(){
  
  size(600, 700);
  
  tam = 10;
  lon = 60;
  can = 150;
  vectorNodos = new Nodos[tam][can]; //hay muelles + 1 extremo
  vectorAristas = new Arista[tam-1][can];
  
  for (int k = 0; k < can; k ++){
    
    for (int i = 0; i < tam; i++){
        vectorNodos[i][k] = new Nodos( -5 + random(-5, 5) + i*lon + k*4, 0);
    }
    for (int i = 0; i < tam-1; i++){
      vectorAristas[i][k] = new Arista(vectorNodos[i][k], vectorNodos[i+1][k], lon);
    }
  }
  
}

void draw(){
  
  background(20, 40, 60); 
  
  for (int k = 0; k < can; k++){
    for (int i = 0; i < tam-1; i++){
      vectorAristas[i][k].update();
      vectorAristas[i][k].display();
    }
    
    for (int i = 1; i < tam; i++){
      vectorNodos[i][k].update();
      vectorNodos[i][k].display();
    }
  }
  filter(BLUR, 1);
}

void keyPressed()
{
  if (key == 'r')
    setup();
}
