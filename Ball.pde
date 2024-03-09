
public class Ball{
  private float m;
  private float r;
  private Vector2 speed;
  private Vector2 dir;
  private  Vector2 pos = new Vector2();
  public Color c;
  
  
  public void Move(){
    pos.Add(dir.Normalize().Multiply(speed.Magnitude()));
  }
  
  
  public void MakeBall(float inputM, float inputR,  float startSpeed, Vector2 startPos, Vector2 startDir){
    m = inputM;
    r = inputR;
    pos = startPos;
    dir = startDir;
    speed = startSpeed;
  }
  
  
  public void AddForce(Vector2 force){
    Vector2 a = force.Multiply(0.5);
    speed.Add(a);
  }
  
  
  public Vector2 GetPos(){
    return pos;
  }
  
  public void SetDir(Vector2 newDir){
    dir = newDir;
  }
}
