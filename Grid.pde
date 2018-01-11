/**
* Class that creates grids for blocks and penguins
* that interact with each other accordingly
*/
class Grid{
  
      // Arrays that will hold the blocks
    private Block[][] board;
      // Arrays that will hold the penguin
    private Penguin[][] penguin;
    
    /**
    * Default constructor
    */
    public Grid(){
      // Initializing the board with blocks
      board = new Block[7][4];
      for(int i = 0; i < 7; i++)
        for(int j = 0; j < 4; j++)
          board[i][j] = new Block(i * 64, j * 64);
      // Initializing the second grid with a penguin
      penguin = new Penguin[7][5];
      for(int k = 0; k < penguin.length; k++)
        for(int l = 0; l < penguin[0].length; l++)
          if(k == 0 && l == 3)
            penguin[k][l] = new Penguin(l * 64, k * 64);
          else
            penguin[k][l] = null;
    }
    
    /**
    * Accessor method that returns the board containing blocks
    */
    public Block[][] getBoard(){
      return board;
    }
    
    /**
    * Method that runs through the arrays and displays the
    * blocks and penguin accordingly
    */
    public void drawGrid(){
      // Board with blocks
      for(int i = 0; i < 7; i++)
        for(int j = 0; j < 4; j ++)
          if(board[i][j] != null)
            board[i][j].drawBoard();
      // Board with penguin
      for(int i = 0; i < 7; i++)
        for(int j = 1; j < 5; j ++)
          if(penguin[i][j] != null)
            penguin[i][j].drawPenguin();
    }

    /**
    * Method that goes to the penguin's location and
    * changes the penguin
    */
    public void deadPenguin(){
      for(int i = 0; i < 7; i++)
        for(int j = 1; j < 5; j ++)
          if(penguin[i][j] != null){
              // Chaning penguin into dead penguin
            penguin[i][j].die();
              // Displaying dead penguin
            penguin[i][j].drawPenguin();
          }
    }
    
    /**
    * Helper method that erases the penguins
    */
    private void erasePenguin(){
      for(int i = 0; i < board.length; i++)
        for(int k = 0; k < board[0].length; k++)
          penguin[i][k] = null;
    }
    
    /**
    * Helper method that creates a new penguin at
    * the given row and column
    */
    private void setPenguin(int r, int c){
      penguin[r][c] = new Penguin(c * 64, r * 64);
      penguin[r][c].drawPenguin();
    }
    
    /**
    * Helper method that checks whether the given array
    * has any null objects or not
    */
    private boolean hasNull(Block[] arr){
      for(int i = 0; i < arr.length; i++)
        if(arr[i] == null)
          return true;
      return false;
    }
    
    /**
    * Helper method that counts up the number of null
    * objects within the given array
    */
    private int countNulls(Block[] arr){
      int nums = 0;
      for(int i = 0; i < arr.length; i++)
        if(arr[i] == null)
          nums++;
      return nums;
    }
    
}