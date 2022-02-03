void drawSectorBoundaries() {
  stroke(255, 255, 255, 100);
  for (int x = 0; x < width; x += width / SECTORS_PER) {
    for (int y = 0; y < height; y += height / SECTORS_PER) {
       line(0, y, width, y); 
    }
    
    // Columns
    line(x, 0, x, height); 
  }
}

void drawSectorWeights() {
  int i = 0;
  
  for (int y = 0; y < height; y += height / SECTORS_PER) {
    for (int x = 0; x < width; x += width / SECTORS_PER) {
      int weight = sectors.get(i).size() * 100 / SECTORS_PER;
      String entitiesText = "entities: " + sectors.get(i).size() + "(" + weight + ")";
      String sectorText = "sector  : " + i;
     

      fill(255, 255, 255, weight);
      rect(x, y, width / SECTORS_PER, height / SECTORS_PER);
      
      fill(255, 0, 255, 255);
      textSize(FONT_SIZE);
      text(entitiesText, x, y+SECTOR_EVERY);
      text(sectorText, x, (y - FONT_SIZE)+SECTOR_EVERY); 
      
      i++;
    }
  }
}
