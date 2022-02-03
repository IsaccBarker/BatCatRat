public abstract class Entity {
  protected int xPosition = 0;
  protected int yPosition = 0;
  protected int sector = 0;
  protected int sectorRow = 0;
  protected int sectorColumn = 0;
  protected int xTarget = -1;
  protected int yTarget = -1;
  protected int id = 0;
  protected Boolean moveOverride = false;
  
  int getXPosition() {
    return xPosition;
  }
  
  int getYPosition() {
    return yPosition;
  }
  
  void setXTarget(int x) {
    xTarget = x;
  }
  
  void setYTarget(int y) {
    yTarget = y;
  }
  
  void move() {    
    if (!moveOverride) {
      if (xTarget == -1 && yTarget == -1) {
        xTarget = (xPosition + (int) random(-SECTOR_EVERY, SECTOR_EVERY));
        yTarget = (yPosition + (int) random(-SECTOR_EVERY, SECTOR_EVERY));
        
        int angle = (int) Math.toDegrees(Math.atan2(yTarget - yPosition, xTarget - xPosition));
        xPosition += 5.0 * Math.sin(-angle);
        yPosition += 5.0 * Math.cos(-angle);
      }
      
      int angle = (int) Math.toDegrees(Math.atan2(yTarget - yPosition, xTarget - xPosition));
      xPosition += 5.0 * Math.sin(-angle);
      yPosition += 5.0 * Math.cos(-angle);
      
      if (xPosition == xTarget && yPosition == yTarget) {
        xTarget = -1;
        yTarget = -1;
      }
    }
    
    // Bounds checking
    if (xPosition > width-1) {
      xPosition = width-1;
    } else if (xPosition < 1) {
      xPosition = 2;
    }
    
    if (yPosition > height-1) {
      yPosition = height-1;
    } else if (yPosition < 1) {
      yPosition = 2;
    }
    
    // Add to new sector
    int xSector = xPosition / SECTOR_EVERY;
    int ySector = yPosition / SECTOR_EVERY;
    int iSector = (ySector * SECTORS_PER) + xSector;
    
    if (iSector != sector) {
      sectors.get(sector).remove(this);
      sectors.get(iSector).add(this);
      
      sector = iSector;
    }
  }
  
  abstract void tick(Vector<Entity> sector);
}
