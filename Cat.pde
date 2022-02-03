public class Cat extends Entity {
  private int ticksUntilBleh = (int) random(CAT_MIN_DEFAULT_TICKS_UNTIL_BLEH, CAT_MAX_DEFAULT_TICKS_UNTIL_BLEH);
  private int intelegence = (int) random(0, 100);
  private int targetRow = -1;
  private int targetColumn = -1;
  private int targetSector = -1;
  
  Cat(int sectorRow, int sectorColumn, int i) {
    sector = i;
    id = (int) random(-32767, 32767);
    this.sectorRow = sectorRow;
    this.sectorColumn = sectorColumn;
     
    xPosition = (sectorRow * SECTOR_EVERY) + (int) random(SECTOR_EVERY); 
    yPosition = (sectorColumn * SECTOR_EVERY) + (int) random(SECTOR_EVERY);
  }
  
  void eatAndReproduce(Vector<Entity> sector) {
    for (int i = 0; i < sector.size(); i++) {
      Entity entity = sector.get(i);
      
      // It is a rat. Get the distance to try and eat.
      if (entity instanceof Rat && Math.hypot(xPosition - entity.getXPosition(), yPosition - entity.getYPosition()) < CAT_EAT_DISTANCE &&
          random(0, 1000) < CAT_EAT_CHANCE) {
        sector.remove(entity);
        ticksUntilBleh += 100;
       
        notifications.add(new Notification(xPosition, yPosition, 255, 255, 0));
        
        if (!CAT_SPORT_KILL) {
          break;
        }
      }
      
      // Attempt to reproduce
      if (entity instanceof Cat && Math.hypot(xPosition - entity.getXPosition(), yPosition - entity.getYPosition()) < CAT_COPULATE_DISTANCE &&
          random(0, 1000) < CAT_COPULATE_RATE && CAT_COPULATE_MIN_RATS < numRats) {
        sector.add(new Cat(sectorRow, sectorColumn, this.sector));
        notifications.add(new Notification(xPosition, yPosition, 0, 255, 255));
        
        ticksUntilBleh -= CAT_COPULATE_COST;
        
        if (!CAT_COPULATE_SPORT) {
          break;
        }
      }
    }
  }
  
  void clearChase() {
    targetSector = -1;
  }
  
  void chaseRats() {
    if (targetSector == -1) {
      targetSector = highestRatSector;
      targetRow = highestRatSectorRow + (int) random(-SECTOR_EVERY, SECTOR_EVERY);
      targetColumn = highestRatSectorColumn + (int) random(-SECTOR_EVERY, SECTOR_EVERY);
    }
    
    // Get the angle of highest rat concentration
    int angle = (int) Math.toDegrees(Math.atan2(targetColumn - yPosition, targetRow - xPosition));
      
    xPosition += CAT_SCURRY_SPEED * Math.sin(-angle);
    yPosition += CAT_SCURRY_SPEED * Math.cos(-angle);
    
    // You have arrived at your destination.
    if (this.sector == targetSector) {
      targetSector = -1;
      
      if ((int) random(0, 1000) < CAT_INTELEGENCE_SUDDEN_DUNCE) {
        moveOverride = false;
        intelegence = 0;
      }
    }
  }
  
  void behavioralSink(Vector<Entity> sector) {
    if (sector.size() > CAT_SINK_LETHAL_THRESHHOLD) {
      for (int i = 0; i < CAT_BULK_REMOVAL; i++) {
         sector.remove(sector.size()-1);
      }
    }
  }
  
  void tick(Vector<Entity> sector) {
    move();
    
    // Did we starve to death
    if (ticksUntilBleh == 0) {
      sector.remove(this); 
    }
    
    eatAndReproduce(sector);
    
    if (intelegence > CAT_INTELEGENCE_CHASE_REQUIRED) {
      moveOverride = true;
      chaseRats();
    }
    
    // https://en.wikipedia.org/wiki/Behavioral_sink
    // Spread the cats out, or kill them if the population gets high enough for
    // societal collapse.
    behavioralSink(sector);
    
    ticksUntilBleh--;
  }
}
