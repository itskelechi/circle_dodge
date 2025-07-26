public class Player {
  
    final private int PINK = color(227, 28, 121); 
    private float playerX;  //x coordinate of the center of the player circle
    private float playerY;  //y coordinate of the center of the playe circle
    private int playerSize; //diameter of the player circle
    private color playerColor = PINK; //color of the player circle 
    private KA_CircleDodge game;
    
    public Player(KA_CircleDodge game){
      this.game = game;
      playerX = game.width/2;  //player x is in the middle of the window's width
      playerY = game.height/2; //player y is in the middle of the window's height
      playerSize = 50;         //player diameter is 50
      
      fill(playerColor);   //set the fill color
      circle(playerX, playerY, playerSize);  //display the circle 
    }
    
  public void drawPlayer(){
    playerX = mouseX;
    playerY = mouseY;
    fill(playerColor);
    circle(playerX, playerY, playerSize);
  }

  public float getPlayerX(){
    return playerX;
  }
  
  public float getPlayerY(){
    return playerY;
  }
  
  private void collide(Enemy e){
   float distance = dist(this.playerX, this.playerY, e.getEnemyX(), e.getEnemyY());
   float playerRadius = this.playerSize/2;
   float enemyRadius = e.getEnemySize()/2;
   
   if (distance < enemyRadius + playerRadius){
    System.out.println(e.type);
    System.out.println(distance);
    System.out.println(enemyRadius);
    System.out.println(playerRadius);
    game.setup();

   }
  }
}
