class Particle {
  double myX, myY, mySpeedX, mySpeedY, myColor, myAngle, gravity, myWidth, myHeight;


  Particle(int x, int y) {
    myX = x;
    myY = y;
    mySpeedX = (Math.random()*3) + 1;
    mySpeedY = (Math.random()*5) + 1;
    myColor = color((int)(Math.random()*156) + 100, (int)(Math.random()*156) + 100, (int)(Math.random()*156)) + 100;
    myAngle = (double)(Math.random()*360);
    gravity = 0.25;
    myWidth = 10;
    myHeight = 10;
  }

  void move() {
    myX = ((Math.cos(myAngle))* mySpeedX) + myX;
    myY = ((Math.sin(myAngle)) * mySpeedY) + myY;
    if (myWidth < 50 && myHeight < 50) {
      gravity += 0.15;
      myY += gravity;
    }
    if (myX > 550 && myWidth > 99) {
      myX = -50;
    } else if (myX < -50 && myWidth > 99){
     myX = 550; 
    }
    
    if(myY > 400 && myWidth > 99){
     myY = -50; 
    } else if (myY < - 25 && myWidth > 99){
     myY = 400; 
    }
    
    if (mouseY > myY && myWidth > 99) {
      myY += (int)(Math.random()*5) - 1;
    } else if (mouseY <= myY && myWidth > 99) {
      myY += (int)(Math.random()*5) - 3;
    }
  }

  void show() {
    fill((int)myColor);
    ellipse((float)myX, (float)myY, (float)myWidth, (float)myHeight);
  }
}


class Bard extends Particle {
  Bard(int x, int y) {
    super(x, y);
    myX = x;
    myY = y;
    mySpeedX = (Math.random()*2) + 1;
    mySpeedY = 1;
    //myColor = color((int)(Math.random()*100) + 50, (int)(Math.random()*100) + 50, (int)(Math.random()*50));
    myColor = color(255, 255, 255);
    myAngle = (int)(Math.random()*360);
    gravity = 0;
    myWidth = 75;
    myHeight = 75;
  }
}

class Cloud extends Particle {
  Cloud(int x, int y){
   super(x, y);
   myX = x;
   myY = y;
   mySpeedX = 1.5;
   mySpeedY = 0;
   myColor = (int)(Math.random()*20) + 80;
   myAngle = 0;
   gravity = 0;
   myWidth = 100;
   myHeight = 50;
  }
}


Particle [] garvin;
Bard bird;

void setup() {
  size(500, 500);
  garvin = new Particle [100];
  garvin[0] = new Cloud(100, 100);
  for (int i = 1; i < 6; i++) {
    garvin[i] = new Bard(250, 250);
  }

  for (int i = 6; i < garvin.length; i++) {
    garvin[i] = new Particle(200, 200);
  }
}

void draw() { 
  background(#212083);
  stroke(0);
  for (int i = 0; i < garvin.length; i++) {
    garvin[i].move();
    garvin[i].show();
  }

  fill(#765C3F);
  rect(-10, 400, 550, 200);
  stroke(255);
  line(mouseX, mouseY - 10, mouseX, mouseY + 10);
  line(mouseX - 10, mouseY, mouseX + 10, mouseY);
}

void mousePressed() {
  stroke(0);
  for (int i = 5; i < garvin.length; i++) {
    garvin[i] = new Particle(mouseX, mouseY);
  }
  for (int i = 0; i < 5; i++) {
    if (garvin[i].myX - 30 < mouseX && mouseX < garvin[i].myX + 30 && garvin[i].myWidth < 100) {
      garvin[i].myY = 1000;
    }
  }
  stroke(255);
  line(250, 375, mouseX, mouseY);
}

void keyPressed(){
 if(key == ' '){
  for(int i = 1; i < 6; i++){
    garvin[i] = new Bard (250, 200);
 }
}
}

