/**
* Class that executes displays and interactions
* according to how and when the game ends
*/
class EndScreen extends Screen{
  
  // Final variables
    // xCoordinate for the replay button
  private final int REPLAY_X = width / 4;
    //  xCoordinate for the home button
  private final int HOME_X = 3 * width / 4; 
    // yCoordinate for both buttons
  private final int Y_COOR = 2 * height / 8;
    // width and height of the buttons
  private final int SIZE = width / 5;
    // yCoordinate of the win or lose banners
  private final int BANNER_Y = 2 * height / 3;
  
  // Ending coordinate and parameters for clicking the buttons
  // Format = { rightMostCoordinate, leftMostCoordinate, upperMostCoordinate, lowerMostCoordinate}
    // Parameters for clicking the home button
  private int[] homeParams = {HOME_X - SIZE/2, HOME_X + SIZE/2, Y_COOR - SIZE/2, Y_COOR + SIZE/2};
    // Parameters for clicking the replay button
  private int[] replayParams = {REPLAY_X - SIZE/2, REPLAY_X + SIZE/2, Y_COOR - SIZE/2, Y_COOR + SIZE/2};
  
    // Image variables
  private PImage homeButton, replayButton, winBanner, loseBanner;
    // Status on whether the penguin is dead or alive,
    // whether the player won or lost
  private boolean isDead;
  
  /**
  * Default Constructor
  */
  public EndScreen(){
      // Assigning respecting background and border image
    super("Transparent.png", "DarkBorder.png");  
      // Initializing additional graphics
    homeButton = loadImage("HomeButton.png");
    replayButton = loadImage("ReplayButton.png");
    winBanner = loadImage("YouWin.png");
    loseBanner = loadImage("YouLose.png"); 
      // Player wins as default status
    isDead = false;
  }
  
  /**
  * Method to display the images/screen
  */
  public void displayScreen(){
      // Checking to see if screen is supposed to display
    if(getStatus()){
        //Displaying buttons
      imageMode(CENTER);
      image(replayButton, REPLAY_X, Y_COOR, SIZE, SIZE);
      image(homeButton, HOME_X, Y_COOR, SIZE, SIZE);
        // Displaying win or lose banners accordingly
      if(isDead)
        image(loseBanner, width/2, BANNER_Y, 425, 91);
      else
        image(winBanner, width/2, BANNER_Y, 425, 91);
    }
  }
  
  /**
  * Method that returns a String on what was clicked on
  */
  public String selection(){
    imageMode(CENTER);
      // Replay button
    if(mouseX > replayParams[0] && mouseX < replayParams[1]
              && mouseY > replayParams[2] && mouseY < replayParams[3]){
         // Resizing image to indicate selection option
      image(replayButton, REPLAY_X, Y_COOR, SIZE + SIZE/10, SIZE + SIZE/10);
        // Returning proper String if area is clicked
      if(mousePressed){
        return "replay";
      }
    }
      // Home button
    if(mouseX > homeParams[0] && mouseX < homeParams[1]
              && mouseY > homeParams[2] && mouseY < homeParams[3]){
        // Resizing image to indicate selection option
      image(homeButton, HOME_X, Y_COOR, SIZE + SIZE/10, SIZE + SIZE/10);
        // Returning proper String if area is clicked
      if(mousePressed){
        return "home";
      }
    }
      // Returning blank String if no option is clicked
    return "";
  }
  
  /**
  * Method that take in a boolean and changes the
  * isDead status boolean accordingly
  */
  public void changeDeadStatus(boolean death){
    isDead = death;
  }
}