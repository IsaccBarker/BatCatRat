public class Rat extends Entity {
  private int ticksUntilBleh = (int) random(RAT_MIN_DEFAULT_TICKS_UNTIL_BLEH, RAT_MAX_DEFAULT_TICKS_UNTIL_BLEH);
  
  Rat(int sectorRow, int sectorColumn, int i) {
    sector = i;
    id = (int) random(-32767, 32767);
    this.sectorRow = sectorRow;
    this.sectorColumn = sectorColumn;
         
    xPosition = (sectorRow * SECTOR_EVERY) + (int) random(SECTOR_EVERY); 
    yPosition = (sectorColumn * SECTOR_EVERY) + (int) random(SECTOR_EVERY);
  }
  
  void reproduce(Vector<Entity> sector) {
    for (int i = 0; i < sector.size(); i++) {
      Entity entity = sector.get(i);
      
      // It is a rat. Get the distance to try and reproduce.
      if (entity instanceof Rat && Math.hypot(xPosition - entity.getXPosition(), yPosition - entity.getYPosition()) < RAT_COPULATE_DISTANCE &&
          random(0, 1000) < RAT_COPULATE_RATE) {
        sector.add(new Rat(sectorRow, sectorColumn, this.sector));
        notifications.add(new Notification(xPosition, yPosition, 255, 0, 255));
        
        if (!RAT_COPULATE_SPORT) {
          break;
        }
      }
    }
  }
  
  void behavioral_sink(Vector<Entity> sector) {
    if (sector.size() > RAT_SINK_LETHAL_THRESHHOLD) {
      for (int i = 0; i < RAT_BULK_REMOVAL; i++) {
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
    
    // Reproduce, if possible
    reproduce(sector);
    
    // https://en.wikipedia.org/wiki/Behavioral_sink
    // Spread the rats out, or kill them if the population gets high enough for
    // societal collapse.
    behavioral_sink(sector);
    
    ticksUntilBleh--;
  }
}
