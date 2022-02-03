private Boolean stepMode = false;
private Boolean shouldStep = false;

void keyPressed() {
    if (key == 's') {
      stepMode = !stepMode;
    }      
    
    if (key == ' ') {
       shouldStep = true; 
    }
}
