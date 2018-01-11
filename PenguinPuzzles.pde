/**
* Penguin Puzzles
*
* A game where a player selects numbers to complete math
* equations to exercise and reestablish their ability
* in calculating basic operations :)
*
* AP Computer Science
* Period 1
* April 27, 2016
*
* @Authors : Ann Zhang, Elizabeth Hoffmann, Lulu Liu
*/

  // Packing your bags and booking a plane ticket
Game finalProject;
boolean clicking;

void setup(){
    // Setting size of screen to be displayed
  size(500, 700);
    // Flying down to Antarctica with your things
  finalProject = new Game();
}

void draw(){
    // Where the adventure begins :)
  finalProject.playGame();
}

void mouseClicked(){
  clicking = true;
}