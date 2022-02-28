import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(800,800, P3D);  
  minim = new Minim(this);
  player = minim.loadFile ("/Users/xeniavonplanta/Documents/Processing/UHERE-KIDZv1.mp3");
}

void draw () {
  
  translate( width/2, height/2); // displace objects , moves coordinate system 
  background(0); // background refreched at every frame! 
  stroke (255);
  
  int a = 0;
  for(int i = 0; i < player.bufferSize()-1 ; i++) {
      pushMatrix();
      rotate(radians(a));
      //stroke(random(255),random(255),random(255)); 
      if( player.left.get(i) > 0.2 && player.left.get(i)< 0.5 ) {
        stroke( #E749EA);
      } else if (player.left.get(i) > 0.5 ) {
       stroke( #FA1225);
      } else {
        stroke(#12FAF4);
      }
      strokeWeight(2);
      line( player.left.get(i)*500, 0, player.left.get(i+1)*50 , 0); // increase y to make a circle at the center
      popMatrix();
      a ++; // increase to space out the lines 
  } 
         
     if ( player.isPlaying() )
  {
    textSize(15);
    stroke(255,105,180);
    text("Press any key to pause playback.", 160, -380 ); // x,y
  }
  else
  {
    fill(255,105,180);
    text("Press any key to start playback.", 160, -380 );
  }
}

void keyPressed()
{
  if ( player.isPlaying() )
  {
    player.pause();
  }
  // if the player is at the end of the file,
  // we have to rewind it before telling it to play again
  else if ( player.position() == player.length() )
  {
    player.rewind();
    player.play();
  }
  else
  {
    player.play();
  }
    
}
  
  
