/**
 * Circle Dodge Game's main file CircleDodge.pde
 * 
 * @author Kelechi Ariwodo
 * @version 1.0 Course : ITEC 2140, Spring, 2023 Written: Spring 2023 (Janurary - May)
 * 
 * This file is similar to a Java class that contains the main method. 
 * The Processing game engine ("the main method") starts executing the game by 
 * invoking the method setup() and then will invoke draw() 60 times/sec (the default frame rate).
 * The frame rate can be changed.
 *          
 * The two most important methods in this file:
 *  setup():  Initilize variables when app is started, only one time.
 *  draw():   Update variables. Executed over and over again.
 */
 
final public int ROSE = color(247, 202, 201);  
final public int RED = color(128, 0, 32);

public Player player;
public Enemy[] enemies;


public boolean start; // a boolean variable that represents whetner the game is started.
public int score = 0; // score earned
public int numberEnemies;

 
/**
 * Method: setup()
 *
 * This method is only invoked once when the game is started.
 * It does a couple of standard things, such as initializes window size, applies background color.
 * Then it initializes variables, such as player location, score, and etc.
 */
 void setup() {
  // Initilize the window size.
  // size() must be called before all other Processing method calls, such as noStroke(). 
  // Both parameters have to be constant: the first is width and the second is height.
  size(900, 900); 
  
  // Disable the layer.
  noStroke();
  
  // Background color to be PINK
  background(ROSE);

  start = false;  //Before player click to start the game, it is set to false
  score = 0;      //set score to 0

 player = new Player(this);
 numberEnemies = 7;
 enemies = new Enemy[numberEnemies];
 
 for (int i = 0; i<enemies.length; i++){
  enemies[i] = new Enemy(this); 
 }

}


/*  
 * Method: draw
 
 * This method will be invoked in a loop, each iteration drawing a frame as in a movie.
 * The default frame rate (which can be changed) is 60 frames/sec.
 *
 * Any change to the game (variable changes) should happen here. 
 * Note that drawing in Processing uses the rule of stack:
 * - First shape/img will be at the bottom. 
 * - Shape/image drawn later will be on top.
 *
 * When the game hasn't started yet, display instruction.
 * When the game has started, display score and draw player.
 * Increase the score by 1.
 */
void draw() {
  if (!start) {
    displayInst(); //display instruction if not started yet
  }
  if (start) {
    background(ROSE); //repaint the background each frame to hide previous frame
    displayScore(); //display score
    player.drawPlayer();   //draw the player where the mouse is
  
    for(int i=0; i<enemies.length; i++){
      player.collide(enemies[i]);
      enemies[i].drawEnemy();
    }
  }
  score++;  //increase the score with the passing of time
}

/*  
 * Method: displayInst
 * 
 * Display a text at the upper left corner of the window, starting at coordinates (5, 25).
 */
public void displayInst() {
  textSize(20);
  fill(RED);
  text("Click to start game", 5, 25);
}

/*  
 * Method: displayScore
 * 
 * Display the score at the upper left corner of the window, starting at coordinates (5, 25).
 */
public void displayScore() {
  textSize(20);
  fill(RED);
  text("Score: " + score, 5, 25);
}

/**
 * Method: drawPlayer
 * 
 * Set the player's coordinates where the mouse cursor is.
 * Then draw a circle at the location.
 */ 


/**
 * Method: keyPressed
 *
 * Called when a key is pressed. 
 * 
 * If the key pressed is the ENTER key, start the game.
 */
public void keyPressed() {
  if (key == ENTER) {
    start = true;
  }
}

/**
 * Method: mouseClicked
 *
 * Called when mouses is clicked to start the game.
 */
public void mouseClicked(){
  start = true;
}
