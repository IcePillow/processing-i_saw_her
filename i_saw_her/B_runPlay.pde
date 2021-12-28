void runPlay(){
  //update and move entities
    updatePlayer();
    movePlayer();
    if(level!=0){
      updateLove();
      updateCage();
      drawCage();
    }
    for(int i=0; i<zombies.length; i++){
      zombies[i].zUpdate();
    }
  
  //end level 0
    if(level==0 && plY==16*24 && plX>16*23 && plX<16*25){
      mode = "next";
    }
  
  //draw stuff
    if(act==1){ background(255,255,255); }
    else if(act==2){ background(255,220,220); }
    else if(act==3){ background(220,220,255); }
    else if(act==4){ background(220,255,220); }
    else if(act==5){ background(255,255,220); }
    else if(act==6){ background(225,180,255); }
    
    //instructions
      if(level==0){ fill(0,0,0); textSize(12); text("RIGHT to move",width/4,440); }
      if(level==9){ fill(0,0,0); textSize(12); text("SPACE to shoot",0.12*width,362); }
    //text
    textAlign(CENTER,CENTER);
    textSize(24);
    fill(0,0,0);
    text(levelText[level][0],width/2,20);
    drawTiles();
    //gun
      if(levelPresets[level].length>=7 && noGuns==false){
        if(levelPresets[level][6]!=100){
          updateGun();
        }
      }
    //player
      drawEntity(plX, plY, "player", plHoriz, false, 0);
    //zombies
      for(int i=0; i<zombies.length; i++){
        Zombie z = zombies[i];
        if(z.dir=="none"){ drawEntity(z.xpos,z.ypos,"zombie","none",false,zombies[i].rot); }
        else if(z.dir=="left"){ drawEntity(z.xpos,z.ypos,"zombie","left",false,zombies[i].rot); }
        else if(z.dir=="right"){ drawEntity(z.xpos,z.ypos,"zombie","right",false,zombies[i].rot); }
      }
    //love
      if(level==0){ drawEntity(loX, loY, "love", "none", false, 0); }
      else{
        if(loDir=="none"){ drawEntity(loX, loY, "love", "none", true, 0); }
        else if(loDir=="left"){ drawEntity(loX, loY, "love", "left", true, 0); }
        else if(loDir=="right"){ drawEntity(loX, loY, "love", "right", true, 0); }
      }
    //cage
      if(level!=0){ drawCage(); }
}

int actTimer = 0;
void runAct(){
  if(act==1){ background(255,255,255); }
  else if(act==2){ background(255,220,220); }
  else if(act==3){ background(220,220,255); }
  else if(act==4){ background(220,255,220); }
  else if(act==5){ background(255,255,220); }
  else if(act==6){ background(225,180,255); }
  textAlign(CENTER,CENTER);
  textSize(20);
  if(actTimer<143){ fill(-200+actTimer*3,-200+actTimer*3,-200+actTimer*3); }
  else if(act==1){ fill(255,255,255); }
  else if(act==2){ fill(255,220,220); }
  else if(act==3){ fill(220,220,255); }
  else if(act==4){ fill(220,255,220); }
  else if(act==5){ fill(255,255,220); }
  else if(act==6){ fill(225,180,255); }
  
  if(level==1){ text("story 1\nact 1: selfless devotion and stuff",width/2,height/2); }
  else if(level==6){ text("story 1\nact 2: lovers in a dangerous time",width/2,height/2); }
  else if(level==11){ text("story 1\nact 3: 'philosopher' isn't a career",width/2,height/2); }
  else if(level==16){ text("story 2\nact 1: a slightly alternate timeline",width/2,height/2); }
  else if(level==21){ text("story 2\nact 2: new world, new me, old love",width/2,height/2); }
  else if(level==26){ text("story 2\nact 3: luminous beings are we",width/2,height/2); }
  
  actTimer++;
  
  if(actTimer>260){ mode="play"; }
}
