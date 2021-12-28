void drawEntity(float x, float y, String kind, String dir, boolean molt, float angle){
  if(kind=="player"){ fill(0,0,0); }
  else if(kind=="zombie"){ fill(0,100,0); }
  else if(kind=="love" && loveIntBlue==false){ fill(250,40,240); }
  else if(kind=="love" && loveIntBlue==true){ fill(0,0,255); }
  else if(kind=="green"){ fill(100,40,255); }
  
  noStroke();
  
  pushMatrix();
    translate(x-5,y+32);
    rotate(angle);
    translate(-x+5,-y-32);
    if(dir=="none"){
      ellipse(x,y+5,11,11);
      beginShape();
        vertex(x-5,y+13);
        vertex(x+5,y+13);
        vertex(x+5,y+32);
        vertex(x-5,y+32);
      endShape(CLOSE);
    } else if(dir=="left"){
      ellipse(x-1,y+5,11,11);
      beginShape();
        vertex(x-7,y+13);
        vertex(x+3,y+13);
        vertex(x+5,y+32);
        vertex(x-5,y+32);
      endShape(CLOSE);
    } else if(dir=="right"){
      ellipse(x+1,y+5,11,11);
      beginShape();
        vertex(x-3,y+13);
        vertex(x+7,y+13);
        vertex(x+5,y+32);
        vertex(x-5,y+32);
      endShape(CLOSE);
    }
    if(molt==true){
      fill(0,160,0);
      if(dir=="none"){
        ellipse(x-2,y+3,4,4); //head
        ellipse(x-3,y+5,4,3);
        ellipse(x+2,y+6,5,6);
        ellipse(x+3,y+17,3,3); //body
        arc(x-5,y+18,10,6,-PI/2,PI/2);
        ellipse(x-2,y+21,4,4);
        arc(x+5,y+23,9,6,PI/2,3*PI/2);
        arc(x-5,y+32,9,9,-PI/2,0);
        ellipse(x+3,y+28,4,5);
      } else if(dir=="left"){
        ellipse(x-3,y+3,4,4); //head
        ellipse(x-4,y+5,4,3);
        ellipse(x+1,y+6,5,6);
        ellipse(x+1,y+16,3,3); //body
        arc(x-6,y+18,10,6,-9*PI/16,PI/2);
        ellipse(x-2,y+21,4,4);
        arc(x+4,y+23,9,6,PI/2,23*PI/16);
        arc(x-5,y+32,9,9,-PI/2,0);
        ellipse(x+3,y+28,4,5);
      } else if(dir=="right"){
        ellipse(x-1,y+3,4,4); //head
        ellipse(x-2,y+5,4,3);
        ellipse(x+3,y+6,5,6);
        ellipse(x+4,y+16,3,3); //body
        arc(x-3,y+18,10,6,-7*PI/16,PI/2);
        ellipse(x-1,y+21,4,4);
        arc(x+6,y+23,9,6,PI/2,3*PI/2);
        arc(x-5,y+32,9,9,-PI/2,0);
        ellipse(x+3,y+28,4,5);
      }
    }
  popMatrix();
}
