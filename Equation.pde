public class Equation {
  
  private ArrayList<String> elements;
  private ArrayList<String> eqCopy;
  private Block[][] board;
  private Grid grid;
  private int numGiven; //random total generated from blocks in the board
 
  /**
    Constructs an equation that consists of a copy of the game board and an arrayList of five string elements: 
    a number generated so that the equation is solvable using the blocks in the grid, two blank spaces that 
    user input will replace, one operator, and an equals sign
    @param b - 2D array of blocks used in the grid in GameScreen
  **/
  public Equation(Grid g){
    elements = new ArrayList<String>();
    eqCopy = new ArrayList<String>();
    grid = g;
    board = g.getBoard();
    int rand = (int) (Math.random() * 4);
    int rand1 = (int) (Math.random() * 7);
    int rand2 = (int) (Math.random() * 4);
    if(rand == 0){
        elements.add("___ ");
        elements.add("+ ");
    }else if(rand == 1){
        elements.add("___ ");
        elements.add("* ");
    }else if(rand == 2){
        elements.add((board[rand1][rand2].getNum() + board[rand1][rand2].getNum()) + " ");
        numGiven = board[rand1][rand2].getNum() + board[rand1][rand2].getNum();
        elements.add("- ");
    }else{
        elements.add((board[rand1][rand2].getNum() * board[rand1][rand2].getNum()) + " ");
        numGiven = board[rand1][rand2].getNum() * board[rand1][rand2].getNum();
        elements.add("/ ");
    }
    elements.add("___ ");
    elements.add("= ");
    if(rand == 0){
        elements.add((board[rand1][rand2].getNum() + board[rand1][rand2].getNum()) + " ");
        numGiven = board[rand1][rand2].getNum() + board[rand1][rand2].getNum();
    }else if(rand == 1){
        elements.add((board[rand1][rand2].getNum() * board[rand1][rand2].getNum()) + " ");
        numGiven = board[rand1][rand2].getNum() * board[rand1][rand2].getNum();
    }else{
        elements.add("___ ");
    }
    for(int i = 0; i < elements.size(); i++){
      eqCopy.add(elements.get(i));
    }
  }
 
  public void resetDisplay(){
    for(int i = 0; i < elements.size(); i++){
      eqCopy.set(i, elements.get(i));
    }
  }
 
  public void newNumbers(int i){
    for(int k = 0; k < eqCopy.size(); k++)
      if(eqCopy.get(k).equals("___ ")){
        eqCopy.set(k, " " + i);
        break;
      }
  }

  public String toString(){
    String str = "";
    for(int i = 0; i < eqCopy.size(); i++){
      str += eqCopy.get(i) + " ";
    }
    return str;
  }
  
  /**
    @return - boolean value indicating whether or not equation is true
  **/
  public boolean checkValidity(int a, int b){
    print(" Checking Validity ");
    if(elements.get(1).equals("+ ")){
      return a + b == numGiven;
    }else if(elements.get(1).equals("* ")){
      return a * b == numGiven;
    }else if(elements.get(1).equals("- ")){
      return numGiven - a == b;
    }else{
      return numGiven / a == b;
    }
  }
 
}