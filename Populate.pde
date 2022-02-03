// Dead code here is just a byproduct of the configuration
// constants being... well, constant.

void populateEntities() {
  populateWithEmptySectors();
  populateRatEntities();
  populateCatEntities();
}

void populateCatEntities() {
  // If the number of cats is more than the area of the world,
  // just spawn in the total number of cats in the first sector.
  if (CATS_PER_SECTOR == 0) {
    for (int i = 0; i < CATS; i++) {
      sectors.get(0).add(new Cat(0, 0, 0));
    }
    
    return;
  }
  
  for (int i = 0; i < TOTAL_SECTORS; i++) {
    for (int e = 0 ; e < CATS_PER_SECTOR; e++) {
      sectors.get(i).add(new Cat(i / SECTORS_PER, i % SECTORS_PER, i));
    }
  }
}

void populateRatEntities() {
  // If the number of rats is more than the area of the world,
  // just spawn in the total number of rats in the first sector.
  if (RATS_PER_SECTOR == 0) {
    for (int i = 0; i < RATS; i++) {
      sectors.get(0).add(new Rat(0, 0, 0));
    }
    
    return;
  }
  
  for (int i = 0; i < TOTAL_SECTORS; i++) {
    for (int e = 0 ; e < RATS_PER_SECTOR; e++) {
      sectors.get(i).add(new Rat(i / SECTORS_PER, i % SECTORS_PER, i));
    }
  }
}
