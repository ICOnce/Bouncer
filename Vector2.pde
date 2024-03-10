

public class Vector2{
  public float x,y;
  
  
  public float Magnitude(){
    return sqrt(pow(x,2)+pow(y,2));
  }
  
  public Vector2 Normalize(){
    Vector2 normalized = new Vector2();
    normalized.x = x/Magnitude();
    normalized.y = y/Magnitude();
    return normalized;
  }
  
  public Vector2 Add(Vector2 addThis){
    x += addThis.x;
    y += addThis.y;
    return this;
  }
  
  public Vector2 Multiply(float num){
    Vector2 multiplied = new Vector2();
    multiplied.x = x*num;
    multiplied.y = y*num;
    return multiplied;
  }
  
  public Vector2 MultVec(Vector2 vec){
    Vector2 mult = new Vector2();
    mult.x = x*vec.x;
    mult.y = x*vec.y;
    return mult;
  }
}
