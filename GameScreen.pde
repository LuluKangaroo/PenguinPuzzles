/**
* Class that executes displays and interactions
* for the actual game screen
*/
class GameScreen extends Screen{
  
  // Image variable
  private PImage map;
  
  // Number variables
    // xCoordinate for where the player clicks
  private int xCoor = mouseX;
    // yCoordinate for where the player clicks
  private int yCoor = mouseY;
  private float timer, timerChange;
  
    // Variable for the grid that holds
    // blocks and penguins
  private Grid gameGrid;
    // Variable for the equations
  private Equation equation;
  private int[] numbers;
  
  /**
  * Default constructor
  */
  public GameScreen(){
      // Assigning respective background and border image
    super("Transparent.png", "DarkBorder.png");
      // Loading and initializing other variables
    map = loadImage("WorldMap.jpg");
    gameGrid = new Grid();
    timer = 11;
    timerChange = .25;
    equation = new Equation(gameGrid);
    numbers = new int[2];
  }
  
  /**
  * Method that returns a String on what was clicked on
  */
  public String selection(){
    if(loseGame())
      return "lose";
    println(" Numbers: " + numbers[0] + " + " + numbers[1]);
    if(mouseX > 27 && mouseY > 328 && mouseX < 475 && mouseY < 584 && clicking){
      int number = selection(mouseX, mouseY);
      print(" X: " + (mouseX - 27)/64 + " Y: " + (mouseY - 328)/64);
      print(" Number: " + number);
      println();
      if(number > 0){
        if(numbers[0] != 0)
          numbers[1] = number;
        else
          numbers[0] = number;
        equation.newNumbers(number);
      }
      clicking = false;
    }
    if(numbers[0] != 0 && numbers[1] != 0)
      if(equation.checkValidity(numbers[0], numbers[1]))
        return "right";
      else
        return "wrong";
    return "";
  }
  
  /**
  @return - integer value of the block pressed
  **/
  public int selection(int a, int b){
    int x = (a-27)/64;
    int y = (b-328)/64;
    if(x < 7 && y < 4 && x >= 0 && y >= 0)
      if(gameGrid.getBoard()[x][y].checkParameters(a, b))
        return gameGrid.getBoard()[x][y].getNum();
    return -1;
  }

  public void tryAgain(){
    drawEquation();
    equation.resetDisplay();
    for(int i = 0; i < numbers.length; i++)
      numbers[i] = 0;
  }

  public void proceed(){
    WorldMap.scroll();
    gameGrid = new Grid();
    newEquation();
    timer = 11;
    for(int i = 0; i < numbers.length; i++)
      numbers[i] = 0;
  }

  /**
  * Method to display the images/screen
  */
  public void displayScreen(){
      // Checking to see if screen is supposed to display
    if(getStatus()){  
        // Displaying the map and grid
      imageMode(CORNER);
      image(map, WorldMap.getXCoor(), WorldMap.getYCoor(), width, 5344);
      gameGrid.drawGrid();
      imageMode(CENTER);
      super.displayScreen();
        // Counting down for the timer
      if(timer >= 0)
        timer -= timerChange;
      // Displaying the other aspects and information
      drawEquation();
      drawTimer();
    }
  }
  
  /**
    Generates a new equation when the previous one is solved
  */
  public void newEquation(){
    equation = new Equation(gameGrid);
  }
  
  /**
  * Method that checks whether the player has
  * lost the game yet or not
  */
  public boolean loseGame(){
      // Game lost if timer ends
    if(timer <= 0)
      return true;
    return false;
  }
  
  /**
  * Method that checks whether the player has
  * won the game yet or not
  */
  public boolean winGame(){
      // Game won if heart of Earth is reached
    if(WorldMap.getYCoor() < -4600)
      return true;
    return false;
  }
  
  /**
  * Method that creates and displays a dead penguin
  * for when the game is lost
  */
  public void killPenguin(){
    gameGrid.deadPenguin();
  }
  
  /**
  * Method that resets and creates new variables
  * to play the game from the start again
  */
  public void reset(){
    timer = 11;
    WorldMap.reset();
    gameGrid = new Grid();
    newEquation();
  }
  
  /**
  * Method that displays the equation that is
  * to be solved
  */
  private void drawEquation(){
    noStroke();
    textSize(25);
    textAlign(BOTTOM);
    textAlign(LEFT);
      // Blocking out the area with solid color for
      // better display aesthetics
    rectMode(CORNER);
    fill(77, 85, 100);
    rect(0, 5 * height / 6, width, height / 6);
      // Displaying of actual equation
    fill(251, 181, 98);
    text(" " + equation, 25, 650);
  }

  /**
  * Method that displays the timer
  */
  private void drawTimer(){
    noStroke();
    textSize(25);
    textAlign(BOTTOM);
    textAlign(CENTER);
      // Coloring the timer according to how many
      // seconds are left
    if(timer >= 4)
      fill(255);
    else
      fill(255, 125, 125);
    text("Time: " + (int) timer, 425, 650);
    rectMode(CORNER);
  }
  
}