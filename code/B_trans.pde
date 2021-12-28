void runBegin(){
  background(255,255,255);
  
  fill(0,0,0);
  textAlign(CENTER,CENTER);
  textSize(24);
  text("who should your love interest be?",width/2,40);
  
  //draw selections
    noStroke();
    //blue
      fill(0,0,255);
      ellipse(width/3,150,30,30);
      rect(width/3-15,170,30,70);
    //pink
      fill(250,40,240);
      ellipse(2*width/3,150,30,30);
      rect(2*width/3-15,170,30,70);
    //rects
      if(mouseX>width/3-25 && mouseX<width/3+25 && mouseY>130 && mouseY<245){
        noFill();
        stroke(0,0,0);
        strokeWeight(2);
        rect(width/3-25,130,50,115);
        if(mousePressed){
          mode="play";
          initLevel();
          loveIntBlue=true;
          levelText = levelTextHim;
        }
      }
      if(mouseX>2*width/3-25 && mouseX<2*width/3+25 && mouseY>130 && mouseY<245){
        noFill();
        stroke(0,0,0);
        strokeWeight(2);
        rect(2*width/3-25,130,50,115);
        if(mousePressed){
          mode="play";
          initLevel();
          loveIntBlue=false;
          levelText = levelTextHer;
        }
      }
}

int nextTimer = 0;
float plRotate = 0;
void endLevel0(){
  
  //rotation amount
    if(nextTimer>60 && plRotate>-PI/2){
      plRotate-=PI/64;
    }
    
  //draw stuff
    background(255,255,255);
    
    textAlign(CENTER,CENTER);
    textSize(24);
    fill(0,0,0);
    text(levelText[level][0],width/2,20);
    fill(800-nextTimer*5, 800-nextTimer*5, 800-nextTimer*5);
    text(levelText[level][1],width/2,60);
    
    drawTiles();
    //main
      drawEntity(plX, plY, "player", "none", false, plRotate);
    //love
      drawEntity(loX, loY, "love", "none", true, 0);
      if(nextTimer<40){
        noStroke();
        fill(255,255,255);
        rect(loX-6, loY, 12, 32-nextTimer/2);
        if(loveIntBlue==false){ fill(250,40,240); }
        else{ fill(0,0,255); }
        ellipse(loX,loY+5,11,11);
        rect(loX-5,loY+13,10,20-nextTimer/2);
      }
    //heart
      if(nextTimer>240){
        fill(255,0,0);
        textSize(16);
        beginShape();
           text("♥",loX,loY-10);
        endShape();
      }
  if(nextTimer>300){
    mode = "menu";
  }
  
  nextTimer++;
}

int endTimer=0;
int colorChange=0;
float shakeAmtH=0;
float shakeAmtV=0;
void endLevel(){
  
  if(endTimer>300){
    mode = "play";
    initLevel();
  }
  
  if(level==16){
    if(endTimer%15<7){ shakeAmtH--; }
    else if(endTimer%15>=7){ shakeAmtH++; }
    if(endTimer%10>5){ shakeAmtV--; }
    if(endTimer%10<5){ shakeAmtV++; }
  }
  
  //draw stuff
    if(act==1){ background(255,255,255); }
    else if(act==2){ background(255,220,220); }
    else if(act==3){ background(220,220,255); }
    else if(act==4){ background(220,255,220); }
    else if(act==5){ background(255,255,220); }
    else if(act==6){ background(225,180,255); }
    textAlign(CENTER,CENTER);
    textSize(24);
    fill(0,0,0);
    text(levelText[level][0],width/2,20);
    if(endTimer>=110){ colorChange++; }
    if(act==1){ fill(255-colorChange*5, 255-colorChange*5, 255-colorChange*5); }
    else if(act==2){ fill(255-colorChange*5, 220-colorChange*5, 220-colorChange*5); }
    else if(act==3){ fill(220-colorChange*5, 220-colorChange*5, 255-colorChange*5); }
    else if(act==4){ fill(220-colorChange*5, 255-colorChange*5, 220-colorChange*5); }
    else if(act==5){ fill(255-colorChange*5, 255-colorChange*5, 220-colorChange*5); }
    else if(act==6){ fill(220-colorChange*5, 175-colorChange*5, 250-colorChange*5); }
    text(levelText[level][1],width/2,60);
    
    //entities
    pushMatrix();
      translate(shakeAmtH,shakeAmtV);
      drawEntity(plX, plY, "player", "none", false, 0);
      drawEntity(loX, loY, "love", "none", true, 0);
      if(levelPresets[level].length>7 && noGuns==false){ if(levelPresets[level][6]!=100){ drawGunStuff(); } }
      
      for(int i=0; i<zombies.length; i++){
        drawEntity(zombies[i].xpos, zombies[i].ypos, "zombie", "none", false, zombies[i].rot);
      }
      
      drawTiles();
      drawCage();
      if(caLower<32){ caLower+=1.5; }
    
    if(endTimer>60){
        fill(255,0,0);
        textSize(16);
        text("♥",loX,loY-10);
        text("♥",plX,plY-10);
      }
    popMatrix();
    
    endTimer++;
}

String endLoDir = "none";
float endPlRot = 0;
float endBx = 0;
boolean endPlMolt = false;
float endLoRect = 0;
boolean endLoMolt = true;
void endAll(){
    if(level==15){
      background(220,220,255);
      
      //text
        textAlign(CENTER,CENTER);
        textSize(24);
        fill(0,0,0);
        text(levelText[level][0],width/2,20);
      //entities
        drawTiles();
        drawEntity(plX, plY, "player", "none", endPlMolt, endPlRot);
        drawEntity(loX, loY, "love", endLoDir, true, 0);
        if(endTimer<22){ caLower+=1.5; }
        else if(endTimer>90 && caLower>0){ caLower-=1.5; }
        drawCage();
      //move player veritcally
        if(plY>loY){ plY+=0.5; }
      //other animation
        if(endTimer>150 && loX>plX+10){ loX--; endLoDir="left"; }
        else{ endLoDir="none"; }
        if(loX<=plX+10 && endPlRot>-PI/2 && endTimer<250){ endPlRot-=PI/64; }
        if(endTimer>250){ endPlMolt = true; }
        if(endTimer>290 && endPlRot<0){ endPlRot+=PI/64; }
        if(endTimer>360){
          textAlign(CENTER,CENTER);
          textSize(24);
          fill(0,0,0);
          text(levelText[level][1],width/2,60);
          fill(255,0,0);
          textSize(16);
          text("♥",loX,loY-10);
          text("♥",plX,plY-10);
        }
        
      if(endTimer>540){ mode="end story 1"; }
        
      endTimer++;
  } else if(level==30){
    background(225,180,255);
    
    //text
      textAlign(CENTER,CENTER);
      textSize(24);
      fill(0,0,0);
      text(levelText[level][0],width/2,20);
    //entities
      drawTiles();
      drawEntity(plX, plY, "player", "none", false, 0);
      drawEntity(loX, loY, "love", endLoDir, endLoMolt, 0);
      
    
    //draw and move the ball
      if(endTimer==120){ endBx=plX; }
      else if(endTimer>120 && endBx<loX){
        fill(0,0,0);
        ellipse(endBx,plY+5,8,8);
        endBx+=1.5;
      }
    //changing the zombie
      if(endBx>=loX && endLoRect<19){
        if(loveIntBlue==false){ fill(250,40,240); }
        else{ fill(0,0,255); }
        rect(loX-5,loY+32,10,-endLoRect);
        endLoRect+=0.2;
      } else if(endLoRect>=19){
        endLoMolt=false;
        
        textAlign(CENTER,CENTER);
        textSize(12);
        text("♥",loX,loY-10);
        text("♥",plX,plY-10);
        textSize(24);
        text(levelText[level][1],width/2,60);
        
        endLoRect++;
      }
      if(endLoRect>200){
        mode = "end story 2";
      }
      
      if(plY>loY){ plY+=0.5; }
      if(endTimer<22){ caLower+=1.5; }
      else if(endTimer>90 && caLower>0){ caLower-=1.5; }
      drawCage();
      
      endTimer++;
  }
}

int endStoryT = 0;
void endStory1(){
  
  if(endStoryT==0){ selAv[3][1]=true; }
  
  background(220,220,255);
  fill(0,0,0);
  textAlign(LEFT,TOP);
  textSize(16);
  
  fill(220-endStoryT*5,220-endStoryT*5,255-endStoryT*5);
  text("and all the humans everywhere died",60,50);
  if(endStoryT>120){
    fill(820-endStoryT*5,820-endStoryT*5,855-endStoryT*5);
    text("but the guy and gal zombies were in love, so it's good",60,80);
  }
  if(endStoryT>240){
    fill(1420-endStoryT*5,1420-endStoryT*5,1455-endStoryT*5);
    text("to celebrate, they made delicious pancakes",60,110);
  }
  if(endStoryT>360){
    fill(2020-endStoryT*5,2020-endStoryT*5,2055-endStoryT*5);
    text("(zombies can make pancakes).",60,140);
  }
  if(endStoryT>480){
    fill(2620-endStoryT*5,2620-endStoryT*5,2655-endStoryT*5);
    text("the end of story 1",60,200);
  }
  if(endStoryT>600){
    fill(3220-endStoryT*5,3220-endStoryT*5,3255-endStoryT*5);
    text("to be continued ♥ ♥ ♥",60, 230);
  }
  if(endStoryT>720){
    textSize(12);
    fill(3820-endStoryT*5,3820-endStoryT*5,3855-endStoryT*5);
    text("press ENTER to go on\nor press TAB to return to main menu",60,460);
  }
  
  fill(100,100,100);
  noStroke();
  for(int i=10; i<21; i++){ rect(16*i, 22*16,16,16); }
  drawEntity(16*14,20*16,"player","right",true,0);
  drawEntity(16*17,20*16,"love","left",true,0);
  fill(255,0,0);
  textAlign(CENTER,CENTER);
  text("♥",16*14+1,20*16-12);
  text("♥",16*17-2,20*16-12);
  
  endStoryT++;
};

void endStory2(){
  
  background(225,180,255);
  fill(0,0,0);
  textAlign(LEFT,TOP);
  textSize(16);
  
  if(endStoryT==0){ bonusMode=true; }
  
  //text
    fill(220-endStoryT*5,220-endStoryT*5,255-endStoryT*5);
    text("over time we healed all the zombies",60,50);
    if(endStoryT>120){
      fill(820-endStoryT*5,820-endStoryT*5,855-endStoryT*5);
      text("and everyone was happy just to be not dead",60,80);
    }
    if(endStoryT>240){
      fill(1420-endStoryT*5,1420-endStoryT*5,1455-endStoryT*5);
      text("so they all made waffles to feed their newly alive bodies",60,110);
    }
    if(endStoryT>360){
      fill(2020-endStoryT*5,2020-endStoryT*5,2055-endStoryT*5);
      text("(waffles are easier to make than pancakes).",60,140);
    }
    if(endStoryT>480){
      fill(2620-endStoryT*5,2620-endStoryT*5,2655-endStoryT*5);
      text("the end of story 2",60,200);
    }
    if(endStoryT>600){
      fill(3220-endStoryT*5,3220-endStoryT*5,3255-endStoryT*5);
      text("♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥",60, 230);
    }
    if(endStoryT>720){
      textSize(12);
      fill(3820-endStoryT*5,3820-endStoryT*5,3855-endStoryT*5);
      text("press TAB to return to main menu (you unlocked some bonus settings)",60,460);
    }
    
    fill(100,100,100);
    noStroke();
    for(int i=12; i<20; i++){ rect(16*i,22*16,16,16); }
    for(int i=6; i<26; i++){ rect(16*i+8,26*16,16,16); }
    //other entities
      drawEntity(15*16,20*16,"player","right",false,0);
      drawEntity(17*16,20*16,"love","left",false,0);
    //normal people
      drawEntity(9*16,24*16,"green","none",false,0);
      drawEntity(13*16,24*16,"green","none",false,0);
      drawEntity(16*16,24*16,"green","none",false,0);
      drawEntity(20*16,24*16,"green","none",false,0);
      drawEntity(24*16,24*16,"green","none",false,0);
    
    textAlign(CENTER,CENTER);
    textSize(12);
    fill(255,0,0);
    text("♥",16*15+2,20*16-12);
    text("♥",16*17-2,20*16-12);
  
  endStoryT++;
}

int resetTimer = 0;
void resetLevel(){
  resetTimer++;
  if(resetTimer>180){
    level--;
    initLevel();
    mode = "play";
  }
  
  //draw stuff
    background(255-4*resetTimer,255-4*resetTimer,255-4*resetTimer);
    textAlign(CENTER,CENTER);
    textSize(24);
    fill(0,0,0);
    text(levelText[level][0],width/2,20);
    drawTiles();
    drawEntity(plX, plY, "player", "none", false, plRotate);
    drawEntity(loX, loY, "love", "none", true, 0);
    for(int i=0; i<zombies.length; i++){
      drawEntity(zombies[i].xpos, zombies[i].ypos, "zombie", "none", false, zombies[i].rot);
    }
    textSize(12); fill(255,0,0); text("♥",loX,loY-10);
    drawCage();
    if(resetTimer>140){ background(0,0,0); }
}

int killTimer=0;
void runKill(){
  //draw
    if(act==1){ background(255,255,255); }
    else if(act==2){ background(255,220,220); }
    else if(act==3){ background(220,220,255); }
    else if(act==4){ background(220,255,220); }
    else if(act==5){ background(255,255,220); }
    else if(act==6){ background(225,180,255); }
    textAlign(CENTER,CENTER);
    textSize(24);
    fill(0,0,0);
    text(levelText[level][0],width/2,20);
    drawTiles();
    drawEntity(plX, plY, "player", "none", false, plRotate);
    drawEntity(loX, loY, "love", "none", true, 0);
    for(int i=0; i<zombies.length; i++){
      drawEntity(zombies[i].xpos, zombies[i].ypos, "zombie", "none", false, zombies[i].rot);
    }
    drawCage();
    
  killTimer++;
  if(plRotate>-PI/2){ plRotate-=PI/64; }
  if(killTimer>90){ textSize(12); fill(255,0,0); text("♥",loX,loY-10); }
  if(killTimer>120){ mode = "reset"; }
}
