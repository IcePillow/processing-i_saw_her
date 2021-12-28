//tile maps
  int[][] tileMap = {};
  void drawTiles(){
    noStroke();
    for(int i=0; i<tileMap.length; i++){
      for(int j=0; j<tileMap[i].length; j++){
        int tiTy = tileMap[i][j];
        if(tiTy==0 || tiTy==1){
          if(tiTy==0){ noFill(); }
          else if(tiTy==1){ fill(100,100,100); }
          rect(j*16,i*16,16,16);
        } else if(tiTy==2){
          float rtim = (rollingTimer%32)/2;
          fill(0,0,255);
          noStroke();
          rect(j*16,i*16+16-rtim,16,1);
        }
      }
    }
  }
  //generators
    void genLevel(int level){
      if(level==0){
        for(int i=0; i<32; i++){ tileMap[26][i]=1; } //floor
      }
      else if(level==1){
        for(int i=0; i<32; i++){ tileMap[26][i]=1; } //floor
      }
      else if(level==2){
        for(int i=10; i<32; i++){ tileMap[10][i]=1; } //top level
        for(int i=0; i<22; i++){ tileMap[17][i]=1; } //middle
        for(int i=0; i<32; i++){ tileMap[28][i]=1; } //floor
      }
      else if(level==3){
        for(int i=3; i<7; i++){ tileMap[12][i]=1; } //left segment
        for(int i=22; i<32; i++){ tileMap[12][i]=1; } //right segment
        for(int i=16; i<32; i++){ tileMap[20][i]=1; } //bottom
      }
      else if(level==4){
        for(int i=7; i<28; i++){ tileMap[15][i]=1; } //top
        for(int i=4; i<18; i++){ tileMap[22][i]=1; } //middle
        for(int i=12; i<25; i++){ tileMap[27][i]=1; if(i==18){i+=3;} } //bottom
      }
      else if(level==5){
        for(int i=14; i<25; i++){ tileMap[12][i]=1; } //top
        for(int i=0; i<32; i++){ tileMap[18][i]=1; if(i==18){i+=8;} } //middle
        for(int i=12; i<18; i++){ tileMap[i][14]=1; } //vertical
        for(int i=3; i<27; i++){ tileMap[28][i]=1; } //bottom
        for(int i=11; i<14; i++){
          for(int j=12; j<18; j++){ tileMap[j][i]=2; }
        }
        for(int i=22; i<25; i++){
          for(int j=23; j<28; j++){ tileMap[j][i]=2; }
        }
      }
      else if(level==6){
        for(int i=22; i<32; i++){ tileMap[16][i]=1; } //top
        for(int i=0; i<7; i++){ tileMap[20][i]=1; } //middle
        for(int i=0; i<29; i++){ tileMap[28][i]=1; } //bottom
      }
      else if(level==7){
        for(int i=0; i<11; i++){ tileMap[13][i]=1; } //left top
        for(int i=17; i<32; i++){ tileMap[16][i]=1; } //right top
        for(int i=11; i<21; i++){ tileMap[26][i]=1; } //middle
        for(int i=0; i<32; i++){ tileMap[30][i]=1; if(i==5){i=21;} } //bottom
      }
      else if(level==8){
        for(int i=0; i<28; i++){ tileMap[16][i]=1; if(i==11){i=18;} } //top
        for(int i=0; i<32; i++){ tileMap[22][i]=1; } //bottom
        for(int i=12; i<19; i++){
          for(int j=16; j<22; j++){
            tileMap[j][i]=2;
          }
        }
      }
      else if(level==9){
        for(int i=0; i<13; i++){ tileMap[17][i]=1; if(i==8){i=11;} } //top floor
        for(int i=0; i<10; i++){ tileMap[21][i]=1; } //gun floor
        for(int i=13; i<29; i++){ tileMap[19][i]=1; } //love floor
        for(int i=18; i<32; i++){ tileMap[25][i]=1; } //cage floor
        for(int i=17; i<19; i++){ tileMap[i][13]=1; } //short vertical
        for(int i=10; i<15; i++){ tileMap[i][22]=1; } //tall vertical
        for(int i=23; i<32; i++){ tileMap[14][i]=1; } //ceiling
      }
      else if(level==10){
        for(int i=22; i<32; i++){ tileMap[11][i]=1; } //top floor
        for(int i=0; i<11; i++){ tileMap[14][i]=1; } //2nd floor
        for(int i=5; i<25; i++){ tileMap[19][i]=1; } //3rd floor
        for(int i=0; i<32; i++){ tileMap[24][i]=1; if(i==8){ i=13; } } //4th floor
        for(int i=0; i<32; i++){ tileMap[30][i]=1; } //base floor
      }
      else if(level==11){
        for(int i=0; i<8; i++){ tileMap[8][i]=1; } //top ledge
        for(int i=26; i<32; i++){ tileMap[10][i]=1; } //second ledge
        for(int i=0; i<5; i++){ tileMap[23][i]=1; } //player ledge
        for(int i=0; i<32; i++){ tileMap[28][i]=1; } //floor
      }
      else if(level==12){
        for(int i=0; i<7; i++){ tileMap[7][i]=1; } //love ledge
        for(int i=22; i<32; i++){ tileMap[12][i]=1; } //2nd ledge
        for(int i=0; i<14; i++){ tileMap[17][i]=1; } //3rd ledge
        for(int i=0; i<21; i++){ tileMap[23][i]=1; } //4th ledge
        for(int i=3; i<32; i++){ tileMap[29][i]=1; } //bottom floor
      }
      else if(level==13){
        for(int i=0; i<10; i++){ tileMap[30][i]=1; } //bottom ledge
        for(int i=5; i<32; i++){ tileMap[24][i]=1; } //main floor
        for(int i=26; i<32; i++){ tileMap[20][i]=1; } //gun ledge
        for(int i=0; i<32; i++){ tileMap[12][i]=1; if(i==4){i=7;}else if(i==11){i=14;}else if(i==18){i=22;} else if(i==26){i=28;} } //zombie ledges
      }
      else if(level==14){
        for(int i=0; i<32; i++){ tileMap[12][i]=1; if(i==7){i=20;} } //top floor
        for(int i=5; i<28; i++){ tileMap[18][i]=1; } //2nd floor
        for(int i=0; i<32; i++){ tileMap[23][i]=1; if(i==4){i=12;} } //3rd floor
        for(int i=0; i<32; i++){ tileMap[28][i]=1; } //bottom floor
      }
      else if(level==15){
        for(int i=0; i<32; i++){ tileMap[22][i]=1; } //floor
      }
      else if(level==16){
        for(int i=0; i<32; i++){ tileMap[26][i]=1; } //floor
      }
      else if(level==17){
        for(int i=10; i<32; i++){ tileMap[10][i]=1; } //top level
        for(int i=8; i<22; i++){ tileMap[17][i]=1; } //middle
        for(int i=10; i<23; i++){ tileMap[28][i]=1; } //floor
      }
      else if(level==18){
        for(int i=1; i<4; i++){ tileMap[12][i]=1; } //left segment
        for(int i=24; i<32; i++){ tileMap[12][i]=1; } //right segment
        for(int i=23; i<30; i++){ tileMap[20][i]=1; } //cage segment
        for(int i=15; i<17; i++){ tileMap[28][i]=1; }
        for(int i=21; i<23; i++){ tileMap[23][i]=1; }
        for(int i=6; i<16; i++){ tileMap[i][16]=1; } //vertical
      }
      else if(level==19){
        for(int i=7; i<24; i++){ tileMap[15][i]=1; } //top
        for(int i=4; i<18; i++){ tileMap[22][i]=1; if(i==9){i=12;}else if(i==13){i=14;} } //middle
        for(int i=13; i<25; i++){ tileMap[27][i]=1; if(i==18){i+=3;} } //bottom
      }
      else if(level==20){
        for(int i=14; i<25; i++){ tileMap[12][i]=1; } //top
        for(int i=2; i<29; i++){ tileMap[18][i]=1; if(i==11){i=13;} if(i==18){i=26;} } //middle
        for(int i=12; i<18; i++){ tileMap[i][16]=1; if(i==15){i=16;} } //vertical
        for(int i=3; i<22; i++){ tileMap[28][i]=1; } //bottom
        for(int i=11; i<14; i++){
          for(int j=12; j<18; j++){ tileMap[j][i]=2; }
        }
        for(int i=22; i<25; i++){
          for(int j=23; j<28; j++){ tileMap[j][i]=2; }
        }
      }
      else if(level==21){
        for(int i=22; i<32; i++){ tileMap[16][i]=1; } //top
        for(int i=2; i<7; i++){ tileMap[20][i]=1; } //middle
        for(int i=5; i<23; i++){ tileMap[28][i]=1; } //bottom
      }
      else if(level==22){
        for(int i=4; i<11; i++){ tileMap[13][i]=1; } //left top
        for(int i=17; i<32; i++){ tileMap[16][i]=1; } //right top
        for(int i=11; i<21; i++){ tileMap[26][i]=1; } //middle
        for(int i=0; i<32; i++){ tileMap[30][i]=1; if(i==3){i=21;} } //bottom
      }
      else if(level==23){
        for(int i=0; i<3; i++){ tileMap[12][i]=1; } //top ledge
        for(int i=4; i<29; i++){ tileMap[16][i]=1; if(i==11){i=18;} } //top floor
        for(int i=4; i<12; i++){ tileMap[20][i]=1; } //middle
        tileMap[19][4]=1;
        for(int i=19; i<28; i++){ tileMap[22][i]=1; } //bottom
        for(int i=12; i<19; i++){
          for(int j=16; j<22; j++){
            tileMap[j][i]=2;
          }
        }
      }
      else if(level==24){
        for(int i=1; i<13; i++){ tileMap[17][i]=1; if(i==8){i=11;} } //top floor
        for(int i=3; i<10; i++){ tileMap[21][i]=1; if(i==5){i=6;}else if(i==7){i=8;} } //gun floor
        for(int i=13; i<29; i++){ tileMap[19][i]=1; } //love floor
        for(int i=19; i<30; i++){ tileMap[25][i]=1; } //cage floor
        for(int i=17; i<19; i++){ tileMap[i][13]=1; if(i==17){i=18;} } //short vertical
        for(int i=10; i<15; i++){ tileMap[i][22]=1; if(i==11){i=12;} } //tall vertical
        for(int i=23; i<31; i++){ tileMap[14][i]=1; } //ceiling
      }
      else if(level==25){
        for(int i=22; i<32; i++){ tileMap[11][i]=1; } //top floor
        for(int i=2; i<8; i++){ tileMap[15][i]=1; } //2nd floor
        tileMap[14][7]=1;
        for(int i=5; i<25; i++){ tileMap[19][i]=1; if(i==10){i=10;}else if(i==16){i=17;}else if(i==20){i=21;} } //3rd floor
        tileMap[18][12]=1;
        for(int i=0; i<32; i++){ tileMap[24][i]=1; if(i==5){i=6;}else if(i==8){ i=13; }else if(i==26){i=28;} } //4th floor
        for(int i=4; i<26; i++){ tileMap[30][i]=1; } //base floor
        tileMap[29][4]=1;
        tileMap[29][25]=1;
      }
      else if(level==26){
        for(int i=2; i<8; i++){ tileMap[8][i]=1; } //top ledge
        for(int i=26; i<32; i++){ tileMap[10][i]=1; } //second ledge
        for(int i=0; i<5; i++){ tileMap[23][i]=1; } //player ledge
        for(int i=2; i<30; i++){ tileMap[28][i]=1; if(i==18){i=19;} } //floor
      }
      else if(level==27){
        for(int i=0; i<7; i++){ tileMap[7][i]=1; } //love ledge
        for(int i=22; i<32; i++){ tileMap[12][i]=1; if(i==23){i=24;} } //2nd ledge
        for(int i=2; i<14; i++){ tileMap[17][i]=1; } //3rd ledge
        for(int i=0; i<21; i++){ tileMap[23][i]=1; if(i==3){i=4;} else if(i==5){i=6;}else if(i==17){i=18;} } //4th ledge
        for(int i=3; i<30; i++){ tileMap[29][i]=1; if(i==15){i=16;}else if(i==19){i=20;}else if(i==23){i=24;} } //bottom floor
      }
      else if(level==28){
        for(int i=2; i<9; i++){ tileMap[30][i]=1; } //bottom ledge
        for(int i=5; i<31; i++){ tileMap[24][i]=1; if(i==16){i=17;}else if(i==8){i=9;} } //main floor
        for(int i=26; i<32; i++){ tileMap[20][i]=1; } //gun ledge
        for(int i=0; i<32; i++){ tileMap[12][i]=1; if(i==4){i=7;}else if(i==11){i=14;}else if(i==18){i=22;} else if(i==26){i=28;} } //zombie ledges
      }
      else if(level==29){
        for(int i=3; i<31; i++){ tileMap[12][i]=1; if(i==5){i=6;}else if(i==7){i=20;} } //top floor
        for(int i=5; i<28; i++){ tileMap[18][i]=1; if(i==7){i=8;}else if(i==10){i=11;} } //2nd floor
        for(int i=0; i<32; i++){ tileMap[23][i]=1; if(i==4){i=12;}else if(i==14){i=15;}else if(i==16){i=17;} } //3rd floor
        for(int i=2; i<30; i++){ tileMap[28][i]=1; if(i==11){i=12;} } //bottom floor
      }
      else if(level==30){
        for(int i=0; i<32; i++){ tileMap[22][i]=1; } //floor
      }
    }
