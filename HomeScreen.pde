/**
* Class that executes displays and interactions
* for when the game is first opened
*/
class HomeScreen extends Screen{
  
  // Final variables
    // xCoordinate for the clickable graphic
  private final int X_COOR = width / 2;
    // yCoordinate for the clickable graphic
  private final int Y_COOR = height;
    // size of the clickable graphic
  private final int SIZE = width;
  
  // Ending coordinate and parameters for clicking the buttons
  // Format = { rightMostCoordinate, leftMostCoordinate, upperMostCoordinate, lowerMostCoordinate}
    // Parameters for clicking the penguin graphic
  private int[] clickParams = {0, width, Y_COOR - SIZE/2, height};
  
    // Image variables
  private PImage frontLayer, title;
  
  /**
  * Default constructor
  */
  public HomeScreen(){
      // Assigning respective background and border image
    super("HomeBG.png", "DarkBorder.png");
      // Initializing additional graphics
    frontLayer = loadImage("HomeStart.png");
    title = loadImage("Title.png");
    imageMode(CENTER);
  }
  
  /**
  * Method to display the images/screen
  */
  public void displayScreen(){
      // Checking to see if screen is supposed to display
    if(getStatus()){
      imageMode(CENTER);
      super.displayScreen();
        // Displaying additional graphics
      image(title, width/2, height/3, 400, 181);
      image(frontLayer, X_COOR, Y_COOR, SIZE, SIZE);
        // Displaying name of the authors
      textAlign(CENTER);
      textSize(15);
      fill(255);
      text("ANN ZHANG : ELIZABETH HOFFMANN : LULU LIU", width/2, 20);
    }
  }
  
  /**
  * Method that returns a String on what was clicked on
  */
  public String selection(){
    imageMode(CENTER);
      // Penguin graphic
    if(mouseX > clickParams[0] && mouseX < clickParams[1]
              && mouseY > clickParams[2] && mouseY < clickParams[3]){
        // Resizing image to indicate selection option
      image(frontLayer, X_COOR, Y_COOR, SIZE + SIZE/10, SIZE + SIZE/10);
        // Returning proper String if area is clicked
      if(mousePressed){
        return "play";
      }
    }
      // Returning blank String if no available option is clicked
    return "";
  }
  
}