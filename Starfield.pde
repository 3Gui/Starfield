particle[] head = new particle[1000];
//count time
int count =0;

void setup(){
  //head init
  for(int i = 0; i< head.length; i++){
    head[i] = new particle();
  }
  head[0]= new odd();
  size(500,500);
  
 
  
}


void draw(){
  background(0);
  //head move and show
  for(int i = 0; i< head.length; i++){
    head[i].show();
    head[i].move();
  }

//reset timer
  if (count == 1200){
    for(int i = 0; i< head.length; i++){
    head[i] = new particle();
  }
    head[0]= new odd();
    count = 0;
    
  }
   count++;
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
     // size of middle gap
     mHoleSize = 75;
    mColor = color((int)(Math.random()*155)+100,(int)(Math.random()*155)+100,(int)(Math.random()*155)+100);
  }
  
  void show(){
    fill(mColor);
    ellipse((float)mX,(float)mY, (float)mSize,(float)mSize);
    mHoleSize -= (double)count/600.0;
    
  }
  
  void move(){
    
       mX += mSpeed*Math.cos(mAngle);
       mY += mSpeed*Math.sin(mAngle);
    mSize +=0.001;
    // bring particle to a range around middle
    if(mX > 500 || mY > 500 ||mX < 0 || mY < 0){
        mX = 250 + mHoleSize*Math.cos(mAngle);
        mY = 250 + mHoleSize*Math.sin(mAngle);
        mSpeed++;
        
      }
      /*
     if ((mX < width/2+1 && mX < width/2-1)&& (mY < height/2 +1 && mY > height/2-1)){
       mX = width/2;
       mY = height/2;
       
     } else{
       
       
     }
  */
  }
   void setHole(float c){
     
     
     
     
   }
 
  double getHole(){
    return mHoleSize;
    
  }
    
    
  }
  
   class odd extends particle{
     double oAng;
     float rot= 0.1;
    odd(){
      mSize = 20;
      oAng = 0;
      mX = 225;
      mY=150;
    }
    void show(){
      //show and rotate on its center
      fill(mColor);
      pushMatrix();
      translate((float)mX,(float)mY);
      rotate(rot);
      rect((float)0, (float)0, (float)mSize,(float)mSize);
      popMatrix();
      rot+=0.1;
      
    }
    
    void move(){
      // move in a circular orbit
      mX+= 7.5*Math.cos(oAng);
      mY+= 7.5*Math.sin(oAng);
      oAng+= PI/60;
      
    }
  
  
}
