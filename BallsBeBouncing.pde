float[] posX, posY;
float[] speedX, speedY;
int[] r,g,b;

float speed = 10;
float rad = 25;
int nrBalls = 10;
float bounciness = 0.95;


void setup(){
  
  noStroke();
  size(800,600);
  InitializeBalls();
}

void draw(){
  background(0);
  DrawBalls();
  UpdateBallPositions();
}

void DrawBalls(){
    for (int i = 0; i < nrBalls ; i++){
      fill(r[i],g[i],b[i]);
      ellipse(posX[i], posY[i], rad, rad);
    }
}

void UpdateBallPositions(){
  for (int i = 0 ; i < nrBalls ; i++){
    posX[i] += speedX[i];
    posY[i] += speedY[i];
  }
  
  for (int i = 0 ; i < nrBalls ; i++){
    if (posX[i] < 0+rad || posX[i] > width-rad) speedX[i] = -speedX[i]*bounciness;
    if (posY[i] < 0+rad || posY[i] > height-rad) speedY[i] = -speedY[i]*bounciness;
  }
}

void InitializeBalls(){
  posX = new float [nrBalls];
  posY = new float [nrBalls];
  speedX = new float [nrBalls];
  speedY = new float [nrBalls];
  r = new int [nrBalls];
  g = new int [nrBalls];
  b = new int [nrBalls];
  for (int i = 0; i < nrBalls ; i++){
    r[i] = (int) random(256);
    g[i] = (int) random(256);
    b[i] = (int) random(256);
    posX[i] = (int) random(0,width);
    posY[i] = (int) random(0,height);
    speedX[i] = random(-speed, speed);
    speedY[i] = random(-speed, speed);
  }
}

void CheckColliders(){
  for (int i = 0 ; i < nrBalls ; i++){    
    for (int j = 0 ; j < nrBalls ; j++){
      if (j == i) return;
      
      if (abs(posX[i]-posX[j]) <= rad && abs(posY[i]-posY[j]) <= rad){
        speedX[i]
      }
    }
  }
}
