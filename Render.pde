Boolean drawNotifications = true;
Boolean drawSectors = true;

void draw() {
  precomputeTickData();

  if (stepMode) {
    if (shouldStep) {
      drawFrame();
      shouldStep = false;
      
      return;
    }
    
    return;
  }
  
  drawFrame();
}

void drawFrame() {
  clear();
  
  tickAll();
  
  if (drawNotifications) drawNotifications();
  if (drawSectors) { drawSectorBoundaries(); drawSectorWeights(); }
  
  if (!drawNotifications) notifications.clear();
  
  drawEntities();
}

void drawEntities() {
  Vector<Entity> entities = new Vector<Entity>();
  
  for (int i = 0; i < sectors.size()-1; i++) {
     entities.addAll(sectors.get(i));
  }
  
  /* for (int i = 0; i < sectors.size()-1; i++) {
    for (int l = 0; l < sectors.get(i).size()-1; l++) { */
  for (int i = 0; i < entities.size()-1; i++) {
      Entity entity = entities.get(i);
      
      // Color the circle according to the species.
      if (entity instanceof Cat) {
        fill(0, 0, 255, 255);
      } else {
        fill(255, 0, 0, 255);
      }
  
      // Rects render faster than ellipses.
      rect(entity.getXPosition(), entity.getYPosition(), 10, 10);
      
      fill(255, 0, 255, 255);
      // text("id: " + entity.id, entity.getXPosition(), entity.getYPosition());
    // }
  }
}

void drawNotifications() {
  for (int i = 0; i < notifications.size(); i++) {
    Notification notification = notifications.get(i);
    
    fill(notification.getRed(), notification.getGreen(), notification.getBlue(), NOTIFICATION_MAX_OPACITY);
    ellipse(notification.getX(), notification.getY(), 50, 50);
    
    // Notification is over.
    if (notification.tick()) {
      notifications.remove(notification);
    }
  }
}
