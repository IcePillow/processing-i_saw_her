//gun
float standX, standY;
boolean gunOnSt = false;
String pGunDir="";

void drawGunStuff(){
  fill(255,0,255);
  rect(standX,standY,16,16);
  
  fill(0,0,0);
  pushMatrix();
    if(gunOnSt==true){
      translate(standX,standY);
      rotate(-PI/6);
      rect(4,-2,3,6);
      rect(4,-2,9,3);
    }
  popMatrix();
  //player holding
  if(pGunDir=="right"){
    pushMatrix();
      translate(plX+4,plY+14);
      rect(4,-2,3,6);
      rect(4,-2,9,3);
    popMatrix();
  } else if(pGunDir=="left"){
    pushMatrix();
      translate(plX-4,plY+14);
      rect(-6,-2,3,6);
      rect(-12,-2,9,3);
    popMatrix();
  }
  
  for(int i=0; i<bullets.length; i++){
    noStroke();
    fill(0,0,0);
    rect(bullets[i].xpos, bullets[i].ypos, 3, 3);
  }
  
};
void updateGun(){
  if(plX>standX && plX<standX+16 && plY>standY-24 && plY<standY+16 && pGunDir!="left" && pGunDir!="right"){
    gunOnSt=false;
    if(lPress==true){ pGunDir="left"; }
    else{ pGunDir="right"; }
  }
  if(shotTimer>0){ shotTimer--; }
  drawGunStuff();
  
  if(pGunDir=="right" || pGunDir=="left"){
    for(int i=0; i<bullets.length; i++){
      bullets[i].updateBullet();
    }
  }
};
void shootGun(){
  if(shotTimer==0 && (pGunDir=="left" || pGunDir=="right")){
    shotTimer=bulletCooldown;
    Bullet tempB;
    Bullet[] tempBl = new Bullet[1];
    if(pGunDir=="left"){ tempB = new Bullet(plX-8, plY+14, "left", bullets.length); }
    else{ tempB = new Bullet(plX+8, plY+14, "right", bullets.length); }
    tempBl[0] = tempB;
    
    bullets = (Bullet[])concat(bullets, tempBl);
  }
};

//bullets
int shotTimer = 0;
Bullet[] bullets = {};
class Bullet{
  float xpos, ypos;
  String dir;
  int id;
  boolean exist = true;
  Bullet(float x, float y, String d, int i){
    xpos = x;
    ypos = y;
    dir = d;
    id = i;
  }
  
  void updateBullet(){
    //remove bullet
      if(xpos<-10 || xpos>width+10 || exist==false){
        if(id==0){
          bullets = (Bullet[])subset(bullets,1,bullets.length-1);
          for(int i=0; i<bullets.length; i++){
            bullets[i].id--;
          }
        }
        else if(id==bullets.length-1){
          bullets = (Bullet[])subset(bullets,0,bullets.length-1);
        }
        else{
          Bullet[] frontset = (Bullet[])subset(bullets,0,id);
          Bullet[] backset = (Bullet[])subset(bullets,id,bullets.length-1);
          for(int i=0; i<backset.length; i++){
            backset[i].id--;
          }
          bullets = (Bullet[])concat(frontset, backset);
        }
      }
    //move bullet
      if(dir=="left"){ xpos-=3.5; }
      else if(dir=="right"){ xpos+=3.5; }
    //zombie collision check
      for(int i=0; i<zombies.length; i++){
        Zombie z = zombies[i];
        if( ypos>z.ypos && ypos<z.ypos+32 && xpos>z.xpos-5 && xpos<z.xpos+5 && z.dead==false ){
          exist=false; //remove bullet
          zombies[i].dead=true; //kill zombie
          zombies[i].dir="none";
          break;
        }
      }
    //wall collision check
      if(xpos>0 && xpos<width && ypos>0 && ypos<height){
        if(tileMap[ int(floor(ypos/16)) ][ int(floor(xpos/16)) ]==1){
          exist=false;
        }
      }
  }
}

//cage
float caX=0;
float caY=0;
float caXti=0;
float caYti=0;
float caLower=0;

void updateCage(){
  caXti = floor(caX/16);
  caYti = floor(caY/16);
  
  if(abs(caX-loX)<3 && abs(caY-loY)<3){ //end level
    mode = "end";
    if(level!=30){ selAv[floor(level/5)][level%5] = true; } //change next level to green
    if(level==15 || level==30){ mode="end all"; }
  }
}
void drawCage(){
  pushMatrix();
    noFill();
    strokeWeight(2);
    stroke(0,0,0);
    translate(caX, caY);
      rect(-12,-8,24,40); //main box
      fill(0,0,0);
      noStroke();
      rect(-14,-8,28,2); //extra length
      rect(-14,32,28,2);
      rect(-11,-42+caLower,2,42); //bars
      rect(-4,-42+caLower,2,42);
      rect(3,-42+caLower,2,42);
      rect(10,-42+caLower,2,42);
  popMatrix();
}
