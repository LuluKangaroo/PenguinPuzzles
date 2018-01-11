/**
* Class that represents a penguin
*/
class Penguin{
  
  // Image variable
  private PImage penguin;
    // xCoordinate of penguin
  private int penguinX;
    // yCoordinate of penguin
  private int penguinY;
    // size of penguin image
  private int size;
  
  /**
  * Constructor that takes in coordinates and sets those
  * coordinates accordingly
  */
  public Penguin(int xCoor, int yCoor){
    // If statement to determine which penguin graphic
    // is to be displayed
    if(WorldMap.getYCoor() <= -1230)
      penguin = loadImage("PenguinSuper.png");
    else
      penguin = loadImage("PenguinSurface.png");
    // Initializing variables
    penguinX = xCoor + 27;
    penguinY = yCoor + 264;
    size = 64;
  }
  
  /**
  * Method that displays the penguin's graphic
  * at the given coordinates
  */
  public void drawPenguin(){
    imageMode(CORNER);
    image(penguin, penguinX, penguinY, size, size);
  }
 
  /**
  * Method that changes the penguin's graphics
  */
  public void die(){
      // Changing image to dead penguin
    penguin = loadImage("PenguinLose.png");
  }
  
}