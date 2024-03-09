float[] posX, posY;
float[] speedX, speedY;
int[] r,g,b;

float speed = 10;
float rad = 100;
int nrBalls = 10;
float bounciness = 0.95;
float gravity = 1;

void setup(){
  fullScreen(1); 
  noStroke();
  //size(800,600);
  InitializeBalls();
}

void draw(){
  background(0);
  DrawBalls();
  CheckColliders();
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
    if (posX[i] < 0+(rad/2+0.1) || posX[i] > width-(rad/2+0.1)) speedX[i] = -speedX[i]*bounciness;
    if (posY[i] < 0+(rad/2+0.1) || posY[i] > height-(rad/2+0.1)){
      if (posX[i] > height-(rad/2+0.1)) speedY[i] = -speedY[i]*bounciness-gravity;
      else speedY[i] = -speedY[i]*bounciness;
    }
    speedY[i] += gravity;

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
    posX[i] = (int) random(0,width-rad/2);
    posY[i] = (int) random(0,height-rad/2);
    speedX[i] = random(-speed, speed);
    speedY[i] = random(-speed, speed);
  }
}

void CheckColliders(){
  for (int i = 0 ; i < nrBalls ; i++){    
    for (int j = 0 ; j < nrBalls ; j++){
      if (j == i) break;
      else if (sqrt(pow(posX[i]-posX[j],2)+pow(posY[i]-posY[j],2))<= rad){
        speedX[i] = -speedX[i] * bounciness;
        speedY[i] = -speedY[i] * bounciness;
        speedX[j] = -speedX[j] * bounciness;
        speedY[j] = -speedY[j] * bounciness;
      }
    }
  }
}
