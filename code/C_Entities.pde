//player
boolean lPress=false;
boolean rPress=false;
boolean uPress=false;
boolean dPress=false;
boolean hasGun=false;
String plHoriz="none";
float plX, plY;
int plXt, plYt;
float plVeVel = 0;

void updatePlayer(){
  //input
    if( (lPress==true && rPress==true) || (lPress==false &&rPress==false) ){
      plHoriz = "none";
    } else if(lPress==true && rPress==false){
      plHoriz = "left";
      if(pGunDir!=""){ pGunDir = "left"; }
    } else if(lPress==false && rPress==true){
      plHoriz = "right";
      if(pGunDir!=""){ pGunDir = "right"; }
    }
  //tiles
    plXt=floor(plX/16);
    plYt=floor(plY/16);
  //position correction
    if(plYt<=29){
      if(tileMap[plYt+2][plXt]==1){
        plY=floor(plY/16)*16;
      }
    }
  //death
    if(plY>550){ mode="reset"; }
}
void movePlayer(){
  //horizantal motion
    if(plY<height-16){
      if(plXt>=1){
        if(plHoriz=="left" && plX>=8){
          if( tileMap[plYt][plXt-1]!=1 && tileMap[plYt+1][plXt-1]!=1 ){ plX-=plSpe; }
        }
      }
      if(plXt<=30){
        if(plHoriz=="right" && plX<=width-8){
          if(tileMap[plYt][plXt+1]!=1 && tileMap[plYt+1][plXt+1]!=1){ plX+=plSpe; }
        }
      }
    }
  //vertical motion
    if(plYt>=-2 && plYt<=29){
    //gravity
      if(tileMap[plYt+2][plXt]==0 || tileMap[plYt+1][plXt]==2 && flyMode==false){
        plVeVel+=gravity;
        if(tileMap[plYt+1][plXt]==2){ plVeVel-=1.5*gravity; }
      } else if(uPress==false && tileMap[plYt+2][plXt]==1) {
        plVeVel=0; //stop on ground
      }
    //head hitting
      if(plVeVel<0 && (tileMap[plYt][plXt]==1 || plY<8) ){
        plVeVel=0;
      }
      if(plY<5 && plVeVel<0){ plVeVel=0; }
    //jump
      if(flyMode==false){
        if(tileMap[plYt+2][plXt]==2 && uPress==true){
          plVeVel += plJump*0.02; //jumping in elevator
        }
        else if(tileMap[floor(plY/16+7/16)][plXt]==1 && uPress==true){
          plY--; //inside a wall
        }
        else if(tileMap[plYt+2][plXt]==1 && uPress==true && tileMap[floor((plY-4)/16)+2][plXt]!=1){
          plVeVel += plJump; //normal jump
        }
      } else if(flyMode==true){
      if(uPress==true && plY>8 && tileMap[plYt][plXt]!=1){ plY-=plSpe; }
      if(dPress==true){ plY+=plSpe; }
    }
    }
    if(flyMode==false){ plY+=plVeVel; } //move player
    
    if(plY>550){ mode="reset"; } //die
}

//love zombie
float loX, loY;
float loYv=0;
int loXti, loYti;
float loDist;
String loDir = "none";

void updateLove(){
  //tiles
    loXti = floor(loX/16);
    loYti = floor(loY/16);
  //correct position
    if(loYti>=-2 && loYti<=29){
      if(tileMap[loYti+2][loXti]==1){
        loY=floor(loY/16)*16;
      }
    }
  //move
    moveLove();
  //death
    if(loY>550){ mode="reset"; }
  //kill
    if((loXti==plXt|| (loX<plX+11&&loX>plX)) && (loYti==plYt||loYti==plYt+1)){ mode="killed"; }
}
void moveLove(){
  loDist = sqrt( sq(plXt-loXti)+sq(plYt-loYti) );
  loDir = "none";
  if(loDist<10 && loYti<=29){ 
    if(loX>plX+2 && tileMap[loYti][loXti-1]!=1 && tileMap[loYti+1][loXti-1]!=1){
      if(fastZombies==false){ loX-=plSpe*0.7; }
      else if(fastZombies==true){ loX-=plSpe*0.8; }
      loDir="left";
    }
    else if(loX<plX-2 && tileMap[loYti][loXti+1]!=1 && tileMap[loYti+1][loXti+1]!=1){
      if(fastZombies==false){ loX+=plSpe*0.7; }
      else if(fastZombies==false){ loX+=plSpe*0.8; }
      loDir="right";
    }
  }
  
  if(loYti>=-2 && loYti<=29){
    if(tileMap[int(loYti+2)][int(loXti)]==0 || tileMap[loYti+1][loXti]==2){
        loYv+=gravity;
        if(tileMap[loYti+1][loXti]==2){ loYv-=1.5*gravity; } //elevators
    } else if(tileMap[int(loYti+2)][int(loXti)]==1){
      loYv=0;
    }
  }
  loY+=loYv;
}

//normal zombies
Zombie[] zombies = {};

class Zombie{
  
  float xpos, ypos;
  int xtile, ytile;
  int id;
  float yvel=0;
  float rot=0;
  String dir="none";
  boolean dead=false;
  
  Zombie(float x, float y, int iden){
    xpos = x;
    ypos = y;
    id = iden;
  }
  
  void zUpdate(){
    xtile = floor(xpos/16);
    ytile = floor(ypos/16);
    
    //kill
    if(ypos>550){
      if(id==0){
        zombies = (Zombie[])subset(zombies,1,zombies.length-1);
        for(int i=0; i<zombies.length; i++){
          zombies[i].id--;
        }
      }
      else if(id==zombies.length-1){
        zombies = (Zombie[])subset(zombies,0,zombies.length-1);
      }
      else{
        Zombie[] frontset = (Zombie[])subset(zombies,0,id);
        Zombie[] backset = (Zombie[])subset(zombies,id+1,zombies.length-id-1);
        
        for(int i=0; i<backset.length; i++){
          backset[i].id--;
        }
        zombies = (Zombie[])concat(frontset, backset);
      }
    }
    
    //correct position
    if(ytile>=-2 && ytile<=29){
      if(tileMap[ytile+2][xtile]==1){
        ypos=floor(ypos/16)*16;
      }
    }
    
    //when shot
    if(dead==true && rot>-PI/2){ rot-=PI/64; }
    //move, check kill
    if(dead==false){
      if((xtile==plXt|| (xpos<plX+11&&xpos>plX)) && (ytile==plYt||ytile==plYt+1)){ mode="killed"; }
      zMove();
    }
  }
  void zMove(){
    float zdist = sqrt( sq(plXt-xtile)+sq(plYt-ytile) );
    
    dir="none";
    if(ytile<=30){
      if(zdist<10 || (loDist<10 && (act==3 || act==6))){ 
        
        if(xpos>plX+2 && tileMap[ytile][xtile-1]!=1 && tileMap[ytile+1][xtile-1]!=1){
          if(fastZombies==false){ xpos-=plSpe*0.5; }
          else if(fastZombies==true){ xpos-=plSpe*0.65; }
          dir="left";
        }
        else if(xpos<plX-2 && tileMap[ytile][xtile+1]!=1 && tileMap[ytile+1][xtile+1]!=1){
          if(fastZombies==false){ xpos+=plSpe*0.5; }
          else if(fastZombies==true){ xpos+=plSpe*0.65; }
          dir="right";
        }
        
      }
    }
    
    if(ytile>=-2 && ytile<=29){
    if(tileMap[int(ytile+2)][int(xtile)]==0 || tileMap[ytile+1][xtile]==2){
        yvel+=gravity;
        if(tileMap[ytile+1][xtile]==2){ yvel-=1.5*gravity; } //elevators
    } else if(tileMap[int(ytile+2)][int(xtile)]==1){
      yvel=0;
    }
  }
  ypos+=yvel;
  }
  
}
