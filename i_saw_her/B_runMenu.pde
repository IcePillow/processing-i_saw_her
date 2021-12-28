void runMenu(){
  
  //draw stuff
    if(act==1){ background(255,255,255); }
    else if(act==2){ background(255,220,220); }
    else if(act==3){ background(220,220,255); }
    else if(act==4){ background(220,255,220); }
    else if(act==5){ background(255,255,220); }
    else if(act==6){ background(225,180,255); }
      
    textAlign(CENTER,CENTER);
    textSize(36);
    fill(0,0,0);
    if(adminMode==true){ fill(admCol); }
    if(loveIntBlue==false){ text("i saw her standing there",width/2,0.1*height); }
    else{ text("i saw him standing there",width/2,0.1*height); }
    
    //image
      fill(0,0,0);
      drawEntity(340,300,"main","none",false,0);
      drawEntity(400,220,"love","none",true,0);
      fill(100,100,100);
      rect(280,332,100,16);
      rect(380,252,150,16);
      rect(5*width/6-8,370,width/6+16,16);
      rect(0,5*width/6,200,16);
      //zombies
        drawEntity(32,5*width/6-32,"zombie","right",false,0);
        drawEntity(64,5*width/6-32,"zombie","right",false,0);
        drawEntity(96,5*width/6-32,"zombie","right",false,0);
        drawEntity(128,5*width/6-32,"zombie","right",false,0);
        drawEntity(160,5*width/6-32,"zombie","right",false,0);
        drawEntity(432,338,"zombie","left",false,0);
        drawEntity(464,338,"zombie","left",false,0);
        drawEntity(498,338,"zombie","left",false,0);
      fill(255,0,0);
      textSize(16);
      text("♥",340,290);
      text("♥",400,210);
    
    //mode change text
      textAlign(LEFT,TOP);
      fill(0,0,0);
      if(adminMode==true){ fill(admCol); }
      textSize(16);
      if(mouseX>width/5 && mouseY>0.4*height && mouseX<width/5+80 && mouseY<0.44*height){
        fill(255,0,0); textSize(18);
        if(mousePressed){ initLevel(); }
      }
      text("play game",width/5,0.4*height);
      fill(0,0,0);
      if(adminMode==true){ fill(admCol); }
      textSize(16);
      if(mouseX>width/5 && mouseY>0.45*height && mouseX<width/5+90 && mouseY<0.49*height){
        fill(255,0,0); textSize(18);
        if(mousePressed){ mode="select"; }
      }
      text("level select", width/5, 0.45*height);
      fill(0,0,0);
      if(adminMode==true){ fill(admCol); }
      textSize(16);
      if(mouseX>width/5 && mouseY>0.5*height && mouseX<width/5+70 && mouseY<0.54*height){
        fill(255,0,0); textSize(18);
        if(mousePressed){ mode="how"; }
      }
      text("how to", width/5, 0.5*height);
      fill(0,0,0);
      if(adminMode==true){ fill(admCol); }
      textSize(16);
      if(mouseX>width/5 && mouseY>0.55*height && mouseX<width/5+70 && mouseY<0.59*height){
        fill(255,0,0); textSize(18);
        if(mousePressed){ mode="credits"; }
      }
      text("credits", width/5, 0.55*height);
      
      if(adminMode==true || bonusMode==true){
        textAlign(CENTER,CENTER);
        textSize(14);
        //fly mode
          fill(255,0,0);
          stroke(255,0,0);
          if(flyMode==true){ fill(0,255,0); stroke(0,255,0); }
          text("fly mode",width/5,0.2*height);
          noFill();
          rect(width/5-35,0.2*height-10,70,20);
        //fast zombies
          fill(255,0,0);
          stroke(255,0,0);
          if(fastZombies==true){ fill(0,255,0); stroke(0,255,0); }
          text("fast zombies",2*width/5,0.2*height);
          noFill();
          rect(2*width/5-47,0.2*height-10,94,20);
        //no guns
          fill(255,0,0);
          stroke(255,0,0);
          if(noGuns==true){ fill(0,255,0); stroke(0,255,0); }
          text("no guns",3*width/5,0.2*height);
          noFill();
          rect(3*width/5-32,0.2*height-10,64,20);
      }
}

String curCode = "";
void runSelect(){
  if(act==1){ background(255,255,255); }
  else if(act==2){ background(255,220,220); }
  else if(act==3){ background(220,220,255); }
  else if(act==4){ background(220,255,220); }
  else if(act==5){ background(255,255,220); }
  else if(act==6){ background(225,180,255); }
  
  //return
    fill(0,0,0);
    textSize(12);
    textAlign(CENTER,CENTER);
    text("press TAB to return to menu",width/2,height-20);
  //boxes and stories
    //story 1
      textSize(20);
      textAlign(LEFT,CENTER);
      if(adminMode==true){ fill(admCol); }
      text("story 1", 40,145);
      noFill();
      strokeWeight(2);
      stroke(0,0,0);
      if(adminMode==true){ stroke(admCol); }
      rect(30,68,360,160);
    //story 2
      if(adminMode==true){ fill(admCol); }
      text("story 2",40,330);
      noFill();
      strokeWeight(2);
      stroke(0,0,0);
      if(adminMode==true){ stroke(admCol); }
      rect(30,253,360,160);
  
  for(int i=1; i<6; i++){
    for(int j=0; j<3; j++){
      //fill
        if(selAv[j][i-1]==true){ fill(0,255,0); }
        else if(selAv[j][i-1]==false){ fill(255,0,0); }
        if(mouseX>140+50*(i-1) && mouseX<170+50*(i-1) && mouseY>80+50*j && mouseY<110+50*j){
          if(selAv[j][i-1]==true){
            fill(150,255,150);
            if(mousePressed){
              mode="play";
              level=5*j+i-1;
              initLevel();
            }
        }
          else if(selAv[j][i-1]==false){ fill(255,150,150); }
        }
      //draw
        rect(140+50*(i-1), 80+50*j, 30, 30);
        fill(0,0,0);
        textAlign(CENTER,CENTER);
        textSize(14);
        text(5*j+i,155+50*(i-1),95+50*j);
    }
  }
  
  for(int i=1; i<6; i++){
    for(int j=3; j<6; j++){
      //fill
        if(selAv[j][i-1]==true){ fill(0,255,0); }
        else if(selAv[j][i-1]==false){ fill(255,0,0); }
        if(mouseX>140+50*(i-1) && mouseX<170+50*(i-1) && mouseY>115+50*j && mouseY<145+50*j){
          if(selAv[j][i-1]==true){
            fill(150,255,150);
            if(mousePressed){
              mode="play";
              level=5*j+i-1;
              initLevel();
            }
        }
          else if(selAv[j][i-1]==false){ fill(255,150,150); }
        }
      //draw
        rect(140+50*(i-1), 115+50*j, 30, 30);
        fill(0,0,0);
        textAlign(CENTER,CENTER);
        textSize(14);
        text(5*j+i,155+50*(i-1),130+50*j);
    }
  }
  
  textAlign(LEFT,CENTER);
  fill(0,0,0);
  textSize(16);
  text("Or enter code: "+curCode,width/4,width-60);
  noStroke();
  rect(width/5+142,width-50,72,3);
};

void initLevel(){
  //increase level
    level++;
  //tile map
    tileMap = new int[32][32];
    for(int i=0; i<tileMap.length; i++){ //set all zeroes
      for(int j=0; j<tileMap[i].length; j++){
        tileMap[i][j] = 0;
      }
    }
    genLevel(level);
  //set positions
    plX=16*levelPresets[level][0];
    plY=16*levelPresets[level][1];
    loX=16*levelPresets[level][2];
    loY=16*levelPresets[level][3];
    if(levelPresets[level].length>=8 && noGuns==false){
      gunOnSt=true;
      pGunDir="";
      bullets = new Bullet[0];
      if(levelPresets[level][6]!=100){
        standX=16*levelPresets[level][6];
        standY=16*levelPresets[level][7];
      }
    }
    if(level!=0){
      caX = 16*levelPresets[level][4];
      caY = 16*levelPresets[level][5];
    }
    if(levelPresets[level].length>=10){ zombies = new Zombie[ (levelPresets[level].length-8)/2 ]; }
    else{ zombies = new Zombie[0]; }
    for(int i=8; i<levelPresets[level].length; i+=2){
      zombies[(i-8)/2] = new Zombie( 16*levelPresets[level][i], 16*levelPresets[level][i+1], (i-8)/2 );
    }
  //dirs
    plHoriz = "none";
    lPress = false;
    rPress = false;
    uPress = false;
  //timers
    nextTimer=0;
    plRotate=0;
    actTimer=0;
    endTimer=0;
    resetTimer=0;
    killTimer=0;
    colorChange=0;
    endStoryT = 0;
  //animations
    endLoDir = "none";
    endPlRot = 0;
    endPlMolt = false;
    endLoMolt = true;
    endBx = 0;
    endLoRect = 0;
    shakeAmtH=0;
    shakeAmtV=0;
  //cage & gun
    caLower=0;
  //set act
    if(level>-1 && level<6){ act=1; }
    else if(level>5 && level<11){ act=2; }
    else if(level>10 && level<16){ act=3; }
    else if(level>15 && level<21){ act=4; }
    else if(level>19 && level<26){ act=5; }
    else if(level>24 && level<31){ act=6; }
  //change mode
    if(level==1){ mode = "act"; }
    else if(level==6){ mode = "act"; }
    else if(level==11){ mode = "act"; }
    else if(level==16){ mode = "act"; }
    else if(level==21){ mode = "act"; }
    else if(level==26){ mode = "act"; }
}

void runHow(){
  //draw stuff
    if(act==1){ background(255,255,255); }
    else if(act==2){ background(255,220,220); }
    else if(act==3){ background(220,220,255); }
    else if(act==4){ background(220,255,220); }
    else if(act==5){ background(255,255,220); }
    else if(act==6){ background(225,180,255); }
    
    fill(0,0,0);
    if(adminMode==true){ fill(admCol); }
    textSize(36);
      text("how to play game",width/2,30);
    textAlign(LEFT,TOP);
    textSize(16);
      text("-arrow keys to move around\n-space to shoot\n-don't get hit by a zombie\n-lure your love to the cage\n-press R to restart level\n-press TAB to return to menu\n-elevators are blue, press up to go faster",50,110);
      caX=0.65*width;
      caY=0.4*height;
      drawCage();
      
    //draw entities
      fill(100,100,100);
      for(int i=4; i<28; i++){
        rect(16*i,16*26,16,16);
      }
      for(int i=12; i<20; i++){
        rect(16*i,16*22,16,16);
      }
      drawEntity(16*14,16*20,"player","right",false,0); //main
      drawEntity(16*18,16*20,"love","left",true,0); //love
      textSize(12);
      textAlign(CENTER,CENTER);
      fill(255,0,0);
      text("♥",16*14,16*20-10); //heart above main
      text("♥",16*18-2,16*20-10); //heart above love
      //zombies
        drawEntity(16*6,16*24,"zombie","right",false,0);
        drawEntity(16*10,16*24,"zombie","right",false,0);
        drawEntity(16*16,16*24,"zombie","left",false,0);
        drawEntity(16*20,16*24,"zombie","left",false,0);
        drawEntity(16*24,16*24,"zombie","left",false,0);
        drawEntity(16*27,16*24,"zombie","left",false,0);
    
    //draw arrows
        fill(200,200,200);
        stroke(100,100,100);
        strokeWeight(2);
        rect(0.7*width, height/6,30,30);
        rect(0.7*width, height/6+30,30,30);
        rect(0.7*width-30, height/6+30,30,30);
        rect(0.7*width+30, height/6+30,30,30);
        noStroke();
        fill(0,0,0);
        triangle(0.7*width+15,height/6+8,0.7*width+22,height/6+22,0.7*width+8,height/6+22);
        triangle(0.7*width-22,height/6+45,0.7*width-8,height/6+38,0.7*width-8,height/6+52);
        triangle(0.7*width+15,height/6+52,0.7*width+22,height/6+38,0.7*width+8,height/6+38);
        triangle(0.7*width+52,height/6+45,0.7*width+38,height/6+38,0.7*width+38,height/6+52);
        
    textAlign(CENTER,CENTER);
}

void runCredits(){
  if(act==1){ background(255,255,255); }
  else if(act==2){ background(255,220,220); }
  else if(act==3){ background(220,220,255); }
  else if(act==4){ background(220,255,220); }
  else if(act==5){ background(255,255,220); }
  else if(act==6){ background(225,180,255); }
  
  textAlign(CENTER,CENTER);
  fill(0,0,0);
  if(adminMode==true){ fill(admCol); }
  textSize(36);
  text("credits",width/2,30);
  
  textSize(16);
  text("-code and story 2 made by elliott hendricks\n-original game (story 1) made by nicholas yonge\n-original sponsored by MyPlayYard Games",width/2,height/2);
  fill(0,0,255);
  text("-press TAB to go menu\n-thanks for playing",width/2,5*height/6);
}
