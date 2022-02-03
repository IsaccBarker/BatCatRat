public abstract class Entity {
  protected int xPosition = 0;
  protected int yPosition = 0;
  protected int sector = 0;
  protected int sectorRow = 0;
  protected int sectorColumn = 0;
  protected int id = 0;
  protected int angle = 0;
  
  int getXPosition() {
    return xPosition;
  }
  
  int getYPosition() {
    return yPosition;
  }
  
  void move() {
    // Move a random amount
    xPosition += (int) random(-5, 5);
    yPosition += (int) random(-5, 5);
    
    // TODO: Fix angle based movement.
    // xPosition += 10.0 * Math.sin(angle);
    // yPosition += 10.0 * Math.cos(angle);
    // angle += random(-0.1, 0.1);
    
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
    
    if (angle > 360) {
      angle = 360; 
    } else if (angle < 0) {
      angle = 0; 
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
