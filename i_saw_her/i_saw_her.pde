// ~1800 lines of code
String mode = "begin";
int act = 1;
int level = -1;
long rollingTimer=0;

void setup(){
  size(512,512);
  
  PImage iconImg = loadImage("iSawHerIcon.png");
  surface.setIcon(iconImg);
}

void draw(){
  rollingTimer++;
  if(mode=="menu"){
    runMenu();
  } else if(mode=="begin"){
    runBegin();
  } else if(mode=="select"){
    runSelect();
  } else if (mode=="play"){
    runPlay();
  } else if(mode=="next"){
    endLevel0();
  } else if(mode=="end"){
    endLevel();
  } else if(mode=="end all"){
    endAll();
  } else if(mode=="end story 1"){
    endStory1();
  } else if(mode=="end story 2"){
    endStory2();
  } else if(mode=="reset"){
    resetLevel();
  } else if(mode=="killed"){
    runKill();
  } else if(mode=="how"){
    runHow();
  } else if(mode=="act"){
    runAct();
  } else if(mode=="credits"){
    runCredits();
  } else if(mode=="dev"){
    runDev();
  }
}

void keyPressed(){
  if(mode=="play"){
    if(keyCode==LEFT){ lPress=true; }
    else if(keyCode==RIGHT){ rPress=true; }
    else if(keyCode==UP){ uPress=true; }
    else if(keyCode==DOWN){ dPress=true; }
    if(key==32){ shootGun(); }
  }
  
  if(mode=="select"){
    if(key==ENTER){
      if(curCode.equals("ETERNAL")){ runAdmin(); }
      curCode = "";
    }
    if(key>='a' && key<='z'){
      curCode=curCode+key;
      curCode=curCode.toUpperCase();
    }
    if(key==8||key==BACKSPACE||key==DELETE){ curCode=trim(curCode); }
  }
  
  if(mode=="end story 1"){
    if(key==ENTER){
      level=15;
      mode="play";
      initLevel();
    }
  }
}

void keyReleased(){
  if(key==TAB){ mode="menu"; level=0; }
  if(mode=="play"){
    if(keyCode==LEFT){ lPress=false; }
    else if(keyCode==RIGHT){ rPress=false; }
    else if(keyCode==UP){ uPress=false; }
    else if(keyCode==DOWN){ dPress=false; }
    if(key=='R' || key=='r'){ mode="reset"; }
  }
}

void runAdmin(){
  adminMode=true;
  for(int i=0; i<selAv.length; i++){
    for(int j=0; j<selAv[i].length; j++){
      selAv[i][j]=true;
    }
  }
}

void mousePressed(){
  if(mode=="menu"){
    if( mouseX>width/5-35 && mouseX<width/5+35 && mouseY>0.2*height-10 && mouseY<0.2*height+10){
      if(flyMode==true){ flyMode=false; }
      else if(flyMode==false){ flyMode=true; }
    }
    if( mouseX>2*width/5-47 && mouseX<2*width/5+47 && mouseY>0.2*height-10 && mouseY<0.2*height+10){
      if(fastZombies==true){ fastZombies=false; }
      else if(fastZombies==false){ fastZombies=true; }
    }
    if( mouseX>3*width/5-32 && mouseX<3*width/5+32 && mouseY>0.2*height-10 && mouseY<0.2*height+10){
      if(noGuns==true){ noGuns=false; }
      else if(noGuns==false){ noGuns=true; }
    }
  }
};
