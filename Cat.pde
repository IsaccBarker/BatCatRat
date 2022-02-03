public class Cat extends Entity {
  private int ticksUntilBleh = (int) random(CAT_MIN_DEFAULT_TICKS_UNTIL_BLEH, CAT_MAX_DEFAULT_TICKS_UNTIL_BLEH);
  private int intelegence = (int) random(0, 100);
  
  Cat(int sectorRow, int sectorColumn, int i) {
    sector = i;
    id = (int) random(-32767, 32767);
    angle = (int) random(0, 360);
     
    xPosition = (sectorRow * SECTOR_EVERY) + (int) random(SECTOR_EVERY); 
    yPosition = (sectorColumn * SECTOR_EVERY) + (int) random(SECTOR_EVERY);
  }
  
  void tick(Vector<Entity> sector) {
    move();
    
    // Did we starve to death
    if (ticksUntilBleh == 0) {
      System.out.println("cat starved");
      sector.remove(this); 
    }
    
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
      
      // Attemp to reproduce
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
    
    // Chace the rats (if smart enough!)
    if (intelegence > CAT_INTELEGENCE_CHASE_REQUIRED) {      
      // Get the angle of highest rat concentration
      int angle = (int) Math.toDegrees(Math.atan2(highestRatSectorColumn - yPosition, highestRatSectorRow - xPosition));
      
      xPosition += CAT_SCURRY_SPEED * Math.sin(-angle);
      yPosition += CAT_SCURRY_SPEED * Math.cos(-angle);
      
      System.out.println("\t" + angle);
    }
    
    // https://en.wikipedia.org/wiki/Behavioral_sink
    // Spread the cats out, or kill them if the population gets high enough for
    // societal collapse.
    if (sector.size() > CAT_SINK_LETHAL_THRESHHOLD) {
      for (int i = 0; i < CAT_BULK_REMOVAL; i++) {
         sector.remove(sector.size()-1);
      }
    }
    
    if (sector.size() > CAT_SINK_SCURRY_THRESHHOLD) {
      xPosition += (int) random(-CAT_SCURRY_SPEED, CAT_SCURRY_SPEED);
      yPosition += (int) random(-CAT_SCURRY_SPEED, CAT_SCURRY_SPEED);
    }
    
    ticksUntilBleh--;
  }
}
