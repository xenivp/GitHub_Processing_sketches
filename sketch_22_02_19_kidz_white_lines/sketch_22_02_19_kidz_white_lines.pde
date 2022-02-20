import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;


void setup() {
 size( 800, 800 , P3D);
 
  minim = new Minim(this);
  player = minim.loadFile("UHERE-KIDZv1.mp3");

}

void draw() {
    
 background(0);
  stroke(255);
  
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    // i is converted from a value in the range of 0 to player.bufferSize() into a value between 0 and width
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+70, 0, player.bufferSize(), 0, width );
    
    line( x1, 400 + player.left.get(i)*500, x2, 400 + player.left.get(i+1)*50 );
    
  }
   
  if ( player.isPlaying() )
  {
    text("Press any key to pause playback.", 10, 20 );
  }
  else
  {
    text("Press any key to start playback.", 10, 20 );
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
