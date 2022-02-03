public class Notification {
  // X coordinate position.
  private int x;
  
  // Y coordinate position.
  private int y;
  
  // Red colour channel.
  private int r;
  
  // Green colour channel.
  private int g;
  
  // Blue colour channel.
  private int b;
  
  // Notification time to live.
  private int ttl = NOTIFICATION_TTL;
  
  public Notification(int x, int y, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.r = r; 
    this.g = g; 
    this.b = b;  
  }
  
  public int getRed() {
    return r;
  }
  
  public int getGreen() {
    return g;
  }
  
  public int getBlue() {
    return b;
  }
  
  public int getX() {
    return x; 
  }
  
  public int getY() {
    return y;
  }
  
  /** Decrease the TTL value, and return true if time is up. */
  public Boolean tick() {
    ttl--;
    
    return ttl == 0;
  }
}
