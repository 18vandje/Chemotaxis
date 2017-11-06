//Baby Got Back(teria) by Jess van de Ven

Bacteria sirmixalot;
Bacteria[] backupsingers;
int x, y, magnitude, count;
evilBeing jess;

void setup() {
  size(800, 500);
  backupsingers = new Bacteria[8];
  for (int i=0; i<backupsingers.length; i++) {           //Gives starting place to new bacteria
    x=(int)(Math.random()*600);
    y=(int)(Math.random()*100)+50;
    magnitude=15;
    backupsingers[i] = new Bacteria(x, y, magnitude);
  }
  jess = new evilBeing();
  frameRate(10);                                          //Slows those babies down!
}

void draw() {
  background(100, 180, 0);
  fill(0);
  text("Help our friends jump away from the angry evil beings!", 480, 180);
  text("They will be scared to death...", 490, 200);
  text("(click to encourage them)", 550, 220);
  for (int i=0; i<backupsingers.length; i++) {            //Kills bacteria too close to small EvilBeing
    if (backupsingers[i].x<275 && backupsingers[i].x>130 && backupsingers[i].y>370 && backupsingers[i].y<430) {

      backupsingers[i].perish();
    } else if (backupsingers[i].x<575 && backupsingers[i].x>430 && backupsingers[i].y>220 && backupsingers[i].y<280) {
      backupsingers[i].perish();                          //Kills bacteria too close to large EvilBeing
    } else {
      backupsingers[i].walk();                            //Living bacteria keeps on movin'
      backupsingers[i].show();
      jess.revealTwo();                                   //EvilBeings keep on keepin' on, evilly
      jess.reveal();
    }
  }
}
void mousePressed() {                                      //Resets location of living bacteria
  for (int i=0; i<backupsingers.length; i++) {
    backupsingers[i].jump();
  }
}

class Bacteria {
  int x;
  int y;
  int magnitude;
  Bacteria(int _x, int _y, int _magnitude) {
    x = _x;
    y = _y;
    magnitude=_magnitude;
  }

  void show() {                                            //Shows living bacteria as circles
    fill(200, 0, 200);
    ellipse(x, y, magnitude, magnitude);
  }

  void jump() {                                             //Resets location of bacteria
    x=(int)(Math.random()*650);
    y=(int)(Math.random()*400);
  }

  void walk() {                                              //Minimally changes location of bacteria
    x=x+(int)(Math.random()*5)-2;
    y=y+(int)(Math.random()*4)-1;
  }

  void perish() {                                            //Bacteria EXPLODE! #RIP
    for (int decay=0; decay<magnitude; decay++) {
      magnitude=magnitude-1;
      show();
      fill(100, 0, 255);
      ellipse(x, y, magnitude, magnitude*2);
    }
  }
}

class evilBeing {
  evilBeing() {
  }
  void reveal() {                        //Shows first EvilBeing! (AHhHhHh)
    fill(0, 155, 155);
    rect(200, 400, 25, 25, 6);
    fill(0);
    textSize(11);
    text(">:(", 205, 415);
  }
  void revealTwo() {                    //Shows second EvilBeing (eek)
    fill(0, 155, 155);
    rect(500, 250, 40, 40, 6);
    fill(0);
    textSize(15);
    text(">:(", 515, 275);
  }
}
