private Boolean stepMode = false;
private Boolean shouldStep = false;

void keyPressed() {
  if (key == 's') {
    stepMode = !stepMode;
  } else if (key == ' ') {
     shouldStep = true; 
  } else if (key == 't') {
    drawSectors = !drawSectors;
  } else if (key == 'n') {
    drawNotifications = !drawNotifications;
  } else if (key == '+') {
    weightSub /= 2;
    System.out.println(weightSub);
  } else if (key == '-') {
    weightSub *= 2;
    System.out.println(weightSub);
  }
  
  if (weightSub == 0) {
    weightSub = 1;
  }
  
  // Get rid of all current cat trajectories.
  if (key == '=') {
    for (int i = 0; i < sectors.size(); i++) {
      for (int e = 0; e < sectors.get(i).size(); e++) {
        Entity entity = sectors.get(i).get(e);
        
        if (entity instanceof Cat) {
          ((Cat) entity).clearChase();
        }
      }
    }
  }
}

void mouseClicked() {
  for (int i = 0; i < sectors.size(); i++) {
    for (int e = 0; e < sectors.get(i).size(); e++) {
      Entity entity = sectors.get(i).get(e);
      
      if (mouseButton == LEFT) {
        if (entity instanceof Rat) {
          entity.setXTarget(mouseX);
          entity.setYTarget(mouseY);
        }
      } else if (mouseButton == RIGHT) {
        if (entity instanceof Cat) {
          entity.setXTarget(mouseX);
          entity.setYTarget(mouseY);
        }
      }
    }
  }
}
