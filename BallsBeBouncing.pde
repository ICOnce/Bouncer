float speed = 10;
float rad = 100;
int nrBalls = 10;
float bounciness = 0.95;
float gravity = 1;

Ball balls[];

void setup(){
  fullScreen(1); 
  noStroke();
  //size(800,600);
  InitializeBalls();
}

void draw(){
  background(0);
  CheckColliders();
  DrawBalls();
  UpdateBallPositions();
}

void DrawBalls(){
    for (int i = 0; i < nrBalls ; i++){
      Ball curBall = balls[i];
      
      Color c = new Color();
      c = curBall.c;
      
      Vector2 pos = new Vector2();
      pos = curBall.GetPos();
      
      fill(c.r, c.g, c.b);
      ellipse(pos.x, pos.y, curBall.r, curBall.r);
    }
}

void UpdateBallPositions(){
  for (int i = 0 ; i < nrBalls ; i++){
    balls[i].Move();
  }
  
  for (int i = 0 ; i < nrBalls ; i++){
    Ball curBall = new Ball();
    curBall = balls[i];
    
    
    Vector2 pos = new Vector2();
    pos = curBall.pos;
    
    if (pos.x < 0+(curBall.r/2+0.1) || pos.x > width-(curBall.r/2+0.1))  curBall.SetDir(curBall.dir.Multiply(-1));
    if (pos.y < 0+(curBall.r/2+0.1) || pos.y > height-(curBall.r/2+0.1)){
      if (pos.y > height-(curBall.r/2+0.1)) speedY[i] = -speedY[i]*bounciness-gravity;
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
