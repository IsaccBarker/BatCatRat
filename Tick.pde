void genCatsRatsInSector() {
  for (int i = 0; i < sectors.size(); i++) {
    Vector<Entity> sector = sectors.get(i);
    int rats = 0;
    int cats = 0;
    
    for (int e = 0; e < sector.size(); e++) {
      Entity entity = sector.get(e);
      if (entity instanceof Rat) {
        rats++;
      } else if (entity instanceof Cat) {
        cats++;
      }
    }
    
    ratsInSectors.set(i, rats);
    catsInSectors.set(i, cats);
    
    numCats += cats;
    numRats += rats;
  }
}

void ratConcentration() {
  int highestSector = 0;
  for (int i = 0; i < ratsInSectors.size(); i++) {
    if (highestSector < ratsInSectors.get(i)) {
      highestSector = ratsInSectors.get(i);
    }
  }
  
  highestRatSectorRow = (highestSector % SECTORS_PER) * SECTOR_EVERY;
  highestRatSectorColumn = (highestSector / SECTORS_PER) * SECTOR_EVERY;
}

void precomputeTickData() {
  // Precompute some values for the tick.
  genCatsRatsInSector();
  ratConcentration();
}
