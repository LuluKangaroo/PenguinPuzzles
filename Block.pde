/**
* Class that represents a numbered block
*/
public class Block{

    // xCoordinate, yCoordinate, size of block, size of numbers
  private int xPos, yPos, size, numSize;
    // array holding integers that hold colors
    // format : [r, g, b, r, g, b]
  private int[] tint = new int[6];
    // Image variables
  private PImage block;
  private PImage numImg;
    // Number of block
  private int num;
    // Name of image to load
  private String fileName;
    // Integers of parameters
    // Format: [upper most, lower most, left most, right most]
  private int[] params;

  /**
  * Constructor that takes in coordinates
  * and initializes them accordingly
  */
  public Block(int x, int y){
    xPos = x + 27;
    yPos = y + 328;
    params = new int[4];
    params[0] = yPos;
    params[1] = yPos + 64;
    params[2] = xPos;
    params[3] = xPos + 64;
    size = 64;
    numSize = 25;
      // Recieving correct tint according to
      // map's location and display
    tint = WorldMap.tints();
      // Loading corresponding images
    block = loadImage("IceBlock.png");
    num = (int) (Math.random() * 9) + 1;
    fileName = num + ".png";
    numImg = loadImage(fileName);
  }
 
  /**
  * Method that draws the blocks and their number
  */
  public void drawBoard(){
    imageMode(CORNER);
      // Color tinting for the block
    tint(tint[0], tint[1], tint[2]);
    image(block, xPos, yPos, size, size);
      // Color tinting for the number
    tint(tint[3], tint[4], tint[5]);
    image(numImg, xPos + 20, yPos + 20, numSize, numSize);
    noTint();
    imageMode(CENTER);
  }
 
  public boolean checkParameters(int x, int y){
    if(y > params[0] && y < params[1] && x > params[2] && x < params[3]){
      print("Fits parameters");
      return true;
    }
    print("Doesn't fit parameters");
    return false;
  }
 
  /**
  * Getter method that returns the number assigned
  * to the block
  */
  public int getNum(){
    return num;
  }
}