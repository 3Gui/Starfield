particle[] head = new particle[1000];


void setup(){
  frameRate(60);
  for(int i = 0; i< head.length; i++){
    head[i] = new particle();
  }
  head[0]= new odd();
  size(500,500);
  
  
}


void draw(){
  background(0);
  for(int i = 0; i< head.length; i++){
    head[i].show();
    head[i].move();
  }
  
  
}

 class particle {
  protected double mX, mY, mAngle, mSpeed, mSize,mHoleSize;
  protected int mColor;
  
  particle(){
     mX = 250;
     mY = 250;
     mSize = 5;
     mAngle = Math.random()*2*PI+.01;
     mSpeed = Math.random()*2+1;
     mHoleSize = 50;
    mColor = color((int)(Math.random()*155)+100,(int)(Math.random()*155)+100,(int)(Math.random()*155)+100);
  }
  
  void show(){
    fill(mColor);
    ellipse((float)mX,(float)mY, (float)mSize,(float)mSize);
    
    
  }
  
  void move(){
    mX += mSpeed*Math.cos(mAngle);
    mY += mSpeed*Math.sin(mAngle);
    //mSize +=0.01;
    if(mX > width || mY > height ||mX < 0 || mY < 0){
        mX = 250 + mHoleSize*Math.cos(mAngle);
        mY = 250 + mHoleSize*Math.sin(mAngle);
        
        
      }
  }
  
 
    
    
    
  }
  
   class odd extends particle{
     double oAng;
    odd(){
      mSize = 20;
      oAng = 0;
      mX = 225;
      mY=150;
    }
    void show(){
      fill(mColor);
      rect((float)mX, (float)mY, (float)mSize,(float)mSize);
      
      
      
    }
    
    void move(){
      
      mX+= 5*Math.cos(oAng);
      mY+= 5*Math.sin(oAng);
      oAng+= PI/60;
      
    }
  /*
   (Math.random()*5 +5)*Math.cos(oAng);
      mY+= (Math.random()*5 +5)*Math.sin(oAng);
      */
  
}
