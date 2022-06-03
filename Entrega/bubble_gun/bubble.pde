class Bubble{
 
  PVector pos;
  PVector vel;
  float r;
  boolean mov;
  float[] colores;

  Bubble(PVector p, float rd) {
    pos = p;
    vel = new PVector(0,0);
    r = rd;
    mov = false;
    
  }
    void rebotes(){
    if(pos.x + r > width)
      vel.x*=-1;
    
    if(pos.x - r < 0)
      vel.x*=-1;
    
    if(pos.y + r > height)
      vel.y*=-1;
    
    if(pos.y - r < 100){
      vel.y*=0;
      vel.x=0;
    }
  }
  
  void rotar(PVector p){
    if(!mov)
      pos = p;
  }
  
  void mover(){
     if(mov)
       pos.add(vel);
  }
 
  void lanzar(int modulo) {
    vel.x = pos.x - width/2;
    vel.y = pos.y - height-50;
    vel.normalize();
    vel.mult(modulo);
    pos.add(vel);
    mov = true;
    
  }
  
  void drawb(){
    stroke (250, 80, 100); 
    strokeWeight(4);
    fill(20, 40, 60);
    
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
