/**
* Abstract class that holds the basics of the
* various screens
*/
abstract class Screen{

  // Image variables
  private PImage background;
  private PImage border;
  
  // Status variable on whether screen is
  // to be displayed or not
  private boolean status;
  
  /**
  * Constructor that takes two file names as
  * Strings and loads the images
  */
  public Screen(String bgImg, String borderImg){
    background = loadImage(bgImg);
    border = loadImage(borderImg);
      // All screens default turned off
    status = false;
  }
  
  /**
  * Method that displays the given background and
  * border images
  */
  public void displayScreen(){
    imageMode(CENTER);
    image(background, width/2, height/2, 450, 650);
    image(border, width/2, height/2, width, height);
  }
  
  /**
  * Getter method that returns the status of the screen
  */
  public boolean getStatus(){
    return status;
  }
  
  /**
  * Abstract method selection that will return Strings
  * of what selections and options are made that are
  * unique to each screen
  */
  public abstract String selection();
  
  /**
  * Method that changes the status of the screen
  * Turning the screen on or off
  */
  public void changeStatus(){
    status = !status;
  }
  
  /**
  * Method that clears the screen to display a
  * blank grey screen
  */
  public void clearScreen(){
    background(150);
  }
  
}