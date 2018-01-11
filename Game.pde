/**
* Class that organizes the various screens and carries
* out the order and process at which the game is to be executed
*/
class Game{
  
  // Declaring all the screens
  private HomeScreen home;
  private InstructionScreen instructions;
  private GameScreen gameScreen;
  private EndScreen end;
  
  /**
  * Default constructor
  */
  public Game(){
    // Initialiting the screens
    home = new HomeScreen();
      // Changing status of Home screen so that
      // screen will display when game is ran
    home.changeStatus();
    instructions = new InstructionScreen();
    gameScreen = new GameScreen();
    end = new EndScreen();
  }
  
  /**
  * Method that runs the game by going through
  * the different screens accordingly and in order
  */
  public void playGame(){
    
      // Executing the home screen
    if(home.getStatus()){
      home.displayScreen();
        // Changing screens over to instructions screen
        // if the correct selection is made
      if(home.selection().equals("play")){
        home.changeStatus();
        home.clearScreen();
        instructions.changeStatus();
      }
    }
    
      // Executing the instructions screen
    if(instructions.getStatus()){
      instructions.displayScreen();
        // Chaning into the game screen when the correct
        // selection is made
      if(instructions.selection().equals("play")){
        instructions.changeStatus();
        instructions.clearScreen();
        gameScreen.changeStatus();
      }
    }
    
      // Executing the game screen
    if(gameScreen.getStatus()){
      gameScreen.displayScreen();
        // Changing into the ending Lose screen if
        // the timer runs out
      if(gameScreen.selection().equals("lose")){
        gameScreen.killPenguin();
        gameScreen.changeStatus();
        end.changeDeadStatus(true);
        end.changeStatus();
      }else if(gameScreen.selection().equals("right")){
        gameScreen.proceed();
      }else if(gameScreen.selection().equals("wrong")){
        gameScreen.tryAgain();
      }
    }
    
      // Executing the ending screen
    if(end.getStatus()){
      end.displayScreen();
      
        // Changing back to the game screen when
        // replay is selected
      if(end.selection().equals("replay")){
        end.changeStatus();
        end.clearScreen();
        gameScreen.changeStatus();
          // Reseting the game screen back to the start
        gameScreen.reset();
        
        // Chaning to the home screen when home
        // is selected
      }else if(end.selection().equals("home")){
        end.changeStatus();
        end.clearScreen();
        home.changeStatus();
        gameScreen.reset();
      }
    }
    
  }
  
}