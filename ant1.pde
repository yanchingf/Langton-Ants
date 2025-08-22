
int moves;
Ant ant; 

boolean tracker[][];

final int x_b = 1600;
final int y_b = 1600;

  
final int cell = 4;

class Ant {
  
  int x;
  int y;
  
  int facing;
  
  public Ant(){
    this.x = 125;
    this.y = 125;
    
    this.facing = 0;
  }

  public Ant(int x, int y){
    this.x = x;
    this.y = y; 
    
    this.facing = 0; // N E S W

  }
  
  public void move(boolean state, int x_bound, int y_bound){
    
    // rotate
    
    if (state){
      facing++;
      
      if (facing > 3){
        facing = 0;
      }

    }
    
    else {
      facing--; 
      
      if (facing < 0){
        facing = 3;
      }
    }
    
    // and move!
    
    if (facing == 0){ 
      y++;
    }
    else if (facing == 1){
      x++;
    }
    else if (facing == 2){
      y--;
    }
    else {
      x--;
    }
    
    // bound check
    
    if (y >= y_bound){
      y = y_bound - 1;
    }
    
    if (y < 0){
      y = 0;
    }
    
    if (x >= x_bound){
      x = x_bound - 1;
    }
    
    if (x < 0){
      x = 0;
    }

  }
  
};

void settings(){
  size(x_b / cell, y_b / cell);

}

void setup(){
  
  background(255);
  
  moves = 20000;
  
  ant = new Ant(125, 125);
  
  tracker = new boolean [x_b][y_b];
  
}

void draw(){
  
  for (int i = 0; i < moves; ++i){
    
    tracker[ant.x][ant.y] = !tracker[ant.x][ant.y]; 
    
    if (tracker[ant.x][ant.y]){
      fill(color(166, 175, 234));
      noStroke();
      rect(ant.x * cell, ant.y * cell, cell, cell);
    }
    else {
      fill(255);
      noStroke();
      rect(ant.x * cell, ant.y * cell, cell, cell);
    }
    
    ant.move(tracker[ant.x][ant.y], x_b, y_b);

    
    
  }
  
  
  
}
