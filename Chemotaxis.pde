OldMan[] man = new OldMan[100];
int checkX = 0;
int checkY = 0;
int checkThis = 0;
boolean speed = false;
int changed = 0;

void setup(){
  background(0,0,0);
  size(500,500);
  //instantiating Bacteria
  for(int i = 0; i < man.length; i++){
   man[i] = new OldMan(); 
  }
  frameRate(50);
}

void draw(){
  background(0,0,0);
  speedUp();
  //draw + move bacteria
  for(int i = 0; i < man.length; i++){
   man[i].show(); 
   man[i].walk();
  }
  
  for(int i = 0; i<man.length; i++){
    checkX=man[i].myX;
    checkY=man[i].myY;
    for(int e = 0; e<man.length; e++){
      if(dist(man[e].myX,man[e].myY,checkX,checkY)<5){
        man[i].changeColor();
        checkThis = e;
      }
    }
  }
}

class OldMan{
  int myX,myY, colorChooser;
  color myC;
  OldMan(){
    myX = (int)(Math.random()*400)+50;
    myY =(int)(Math.random()*400)+50;
    colorChooser = (int)(Math.random()*7);
    
    //Assigns bacteria a random color
    if(colorChooser == 0){
    myC = color(255,0,0);
    } else if(colorChooser == 1){
      myC = color(0,255,0);
    } else if(colorChooser == 2){
      myC = color(0,0,255);
    } else if(colorChooser == 3){
      myC = color(255,255,0);
    } else if(colorChooser == 4){
      myC = color(0,255,255);
    } else if(colorChooser == 5){
      myC = color(#9E05FF);
    } else if(colorChooser == 6){
      myC = color(#FF05D2);
    } else {
      myC = color(#FF8705);
    }
    
  }
  
  void show(){
    fill(myC);
    ellipse(myX,myY,20,20);
    //Border, keeps the bacteria in
    if(myX > 500){
     myX-=2;
    }
    if(myY > 500){
      myY-=2;
    }
    if(myX < 0){
     myX+=2;
    }
    if(myY < 0){
      myY+=2;
    }
  }
  void walk(){
   //Random bacteria walk
   myX+=(int)(Math.random()*5)-2;
   myY+=(int)(Math.random()*5)-2;
  }
  
  void changeColor(){
    int random = (int)(Math.random()*50);
    if(random == 0){
     myC = man[checkThis].myC; 
    }
  }
}

void speedUp(){
 if(speed == true){
 frameRate(1000); 
 } else {
 frameRate(50);
 }
}

void mouseClicked(){
 if(changed%2==0){
   speed=true;
 }else{
 speed=false;
 }
 changed++;
}
