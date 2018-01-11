/**
* Static class that provides set variables and
* details that will affect the display of interactions
* related to the world map
*/
static class WorldMap{

  // x and y coordinates for the map's display
  static int xCoor, yCoor;
  
  /**
  * Default constructor
  */
  public WorldMap(){
    // Map starting off at the top
    xCoor = yCoor = 0;
  }
  
  /**
  * Getter method for the xCoordinate of
  * the map
  */
  public static int getXCoor(){
    return xCoor;
  }
  
  /**
  * Getter method for the yCoordinate
  * of the map
  */
  public static int getYCoor(){
    return yCoor;
  }

  /**
  * Method that resets the map
  */
  public static void reset(){
      // Moving back to top of map
    xCoor = 0;
    yCoor = 0;
  }
  
  /**
  * Method that increments and moves the map
  */
  public static void scroll(){
     // Moving up the height of a block
     // when called
    yCoor -= 64;
  }
  
  /**
  * Method that creates and returns the tint colors
  * according to what part of the map is on display
  */
  public static int[] tints(){
    int[] colors = new int[6];
      // Mountainous purple region
    if(yCoor >= -425){
      colors[0] = 244; colors[1] = 229; colors[2] = 255;
      colors[3] = 140; colors[4] = 121; colors[5] = 151;
      
      // Icy pale blue region
    }else if(yCoor >= -550){
      colors[0] = 205; colors[1] = 233; colors[2] = 237;
      colors[3] = 115; colors[4] = 146; colors[5] = 166;
      
      // Upper waters light blue region
    }else if(yCoor >= -1020){
      colors[0] = 86; colors[1] = 118; colors[2] = 143;
      colors[3] = 61; colors[4] = 83; colors[5] = 104;
       
      // Middle waters blue region
    }else if(yCoor >= -1620){
      colors[0] = 61; colors[1] = 83; colors[2] = 104;
      colors[3] = 40; colors[4] = 47; colors[5] = 66;
      
      // Deep sea dark blue region
    }else if(yCoor >= -2430){
      colors[0] = 40; colors[1] = 47; colors[2] = 66;
      colors[3] = 69; colors[4] = 85; colors[5] = 114;
      
      // Earth's crust brown region
    }else if(yCoor >= -2550){
      colors[0] = 85; colors[1] = 68; colors[2] = 48;
      colors[3] = 121; colors[4] = 103; colors[5] = 81;
      
      // Earth's mantle red region
    }else if(yCoor >= -3330){
      colors[0] = 233; colors[1] = 31; colors[2] = 31;
      colors[3] = 255; colors[4] = 143; colors[5] = 82;
      
      // Earth's outer core orange region
    }else if(yCoor >= -4110){
      colors[0] = 254; colors[1] = 208; colors[2] = 97;
      colors[3] = 238; colors[4] = 128; colors[5] = 31;
      
      // Earth's innter core yellow region
    }else if(yCoor >= -4425){
      colors[0] = 252; colors[1] = 243; colors[2] = 122;
      colors[3] = 210; colors[4] = 204; colors[5] = 72;
      
      // Earth's heart white region
    }else/* if(yCoor >= -4431)*/{
      colors[0] = 255; colors[1] = 255; colors[2] = 255;
      colors[3] = 255; colors[4] = 171; colors[5] = 246; 
    }
    return colors;
  }
  
}