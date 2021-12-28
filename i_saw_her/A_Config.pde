float plSpe = 2.2; //default 2.2
float plJump = -4; //default -4
float gravity = 0.08; //default 0.08
int bulletCooldown = 20;
boolean loveBlue = false;
boolean loveIntBlue = false;

//admin
  boolean adminMode = false;
  color admCol = color(140,55,210);
  boolean bonusMode = false;
//cheats
  boolean flyMode = false;
  boolean fastZombies = false;
  boolean noGuns = false;

boolean[][] selAv = {
  {true,false,false,false,false},
  {false,false,false,false,false},
  {false,false,false,false,false},
  
  {false,false,false,false,false},
  {false,false,false,false,false},
  {false,false,false,false,false},
};

void runDev(){
  background(255,255,255);
  drawEntity(200,200,"love","right",true,0);
}
