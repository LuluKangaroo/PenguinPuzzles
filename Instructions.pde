/**
* Class that executes displays and interactions
* when displaying the instructions
*/
class InstructionScreen extends Screen{
  
  // Final variables
    // xCoordinate of penguin graphic
  private final int X_COOR = (4 * width / 5) - 12;
    // yCoordinate of penguin graphic
  private final int Y_COOR = 6 * height / 7;
    // size of the penguin graphic
  private final int SIZE = width / 6;
  
  // Ending coordinate and parameters for clicking the buttons
  // Format = { rightMostCoordinate, leftMostCoordinate, upperMostCoordinate, lowerMostCoordinate}
    // Parameters for the penguin graphic
  private int[] clickParams = {X_COOR - SIZE/2, X_COOR + SIZE/2, Y_COOR - SIZE/2, Y_COOR + SIZE/2};
  
  // Image variables
  private PImage nextButton;
  
  /**
  * Default constructor
  */
  public InstructionScreen(){
      // Assigning respective background and border image
    super("Instructions.png", "WorldBorder.png");
      // Loading the additional graphics
    nextButton = loadImage("PenguinSuper.png");
  }
  
  /**
  * Method to display the images/screen
  */
  public void displayScreen(){
      // Checking to see if screen is supposed to display
    if(getStatus()){
        // Displaying screen and displaying penguin
      imageMode(CENTER);
      super.displayScreen();
      image(nextButton, X_COOR, Y_COOR, SIZE, SIZE);
    }
  }
  
  /**
  * Method that returns a String on what was clicked on
  */
  public String selection(){
    imageMode(CENTER);
      // Penguin graphic AKA next button
    if(mouseX > clickParams[0] && mouseX < clickParams[1]
              && mouseY > clickParams[2] && mouseY < clickParams[3]){
        // Resizing image to indicate selection option
      image(nextButton, X_COOR, Y_COOR, SIZE + SIZE/10, SIZE + SIZE/10);
        // Returning proper String if area is clicked
      if(mousePressed){
        return "play";
      }
    }
      // Returning blank String if no available option is clicked
    return "";
  }
  
}