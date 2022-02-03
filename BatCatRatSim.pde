// Simulates the evolution of cats and rats. Cats will always be
// a preditor, and rats will always be prey.

import java.util.Vector;

Vector<Vector<Entity>> sectors = new Vector<Vector<Entity>>();
Vector<Notification> notifications = new Vector<Notification>();
Vector<Integer> ratsInSectors = new Vector<Integer>();
Vector<Integer> catsInSectors = new Vector<Integer>();
int numCats = 0;
int numRats = 0;
int highestCatSector = 0;
int highestRatSector = 0;
int highestRatSectorRow = 0;
int highestRatSectorColumn = 0;

void setup() {
  size(1000, 1000);
  background(0, 0, 0);
  stroke(255, 0, 0, 100);
  frameRate(30);
  
  // We set these here beacuse of the updated
  // width value.
  SECTOR_EVERY = width / SECTORS_PER;
  FONT_SIZE = SECTOR_EVERY/10;
  
  ratsInSectors.setSize(TOTAL_SECTORS);
  catsInSectors.setSize(TOTAL_SECTORS);
  
  populateEntities();
}

void tickAll() {
  for (int i = 0; i < sectors.size()-1; i++) {
    for (int l = 0; l < sectors.get(i).size()-1; l++) {
      Entity entity = sectors.get(i).get(l);
      entity.tick(sectors.get(i));
    }
  }
}

void populateWithEmptySectors() {
  for (int i = 0; i < TOTAL_SECTORS; i++) {
    sectors.add(new Vector<Entity>()); 
  }
}
