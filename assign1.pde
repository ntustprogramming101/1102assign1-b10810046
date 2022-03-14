PImage bg;
PImage soil;
PImage groundhog;
PImage life;
PImage robot;
PImage soldier;
//每格高度
int gridHeight = 80;
//機器人xy定位
float robotX;
int robotY;
//士兵xy定位
float soldierX;
int soldierY;
//雷射光設定
float laserLightX;
int laserLightY;
float laserLimit;
float laserLightXx;
float laserStart;
void setup() {
  size(640, 480, P2D);
  //圖片資料加載
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  //機器人xy
  robotX = random(gridHeight*2, width-80);
  robotY = gridHeight*floor(random(3, 6));
  //雷射光
  laserLightX = robotX + 25;
  laserLightXx =  robotX+25;
  laserLightY = robotY + 37;
  //重置線段的位置
  laserLimit = laserLightX - gridHeight*2-25 ;
  //讓線段第二座標開始移動的位置
  laserStart = robotX+25-40 ;
  //士兵xy
  soldierX = 0;
  soldierY = gridHeight*floor(random(3, 6));
}


void draw() {

  //天空與土地
  image(bg, 0, 0);
  image(soil, 0, gridHeight*2);
  //太陽
  fill(253, 184, 19);
  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(width-50, 50, 120, 120);
  //草地
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, width, 15);

  //土撥鼠
  image(groundhog, 280, 80);
  //生命值
  image(life, 10, 10);
  image(life, 80, 10);
  image(life, 150, 10);

  //機器人
  image(robot, robotX, robotY);

 //雷射光
  stroke(255, 0, 0);
  strokeCap(ROUND);
  strokeWeight(10);
   /*
  ellipse(laserLightX,laserLightY,10,10);
  laserLightX -= 2;
  */
   line( laserLightX, laserLightY, laserLightXx, laserLightY);
   laserLightX -= 2;
   
   if (laserLightX <= laserStart) {
    laserLightXx -= 2;
  }
 
   if (laserLightX <= laserLimit) {
    laserLightX = laserLightX + gridHeight*2+25;
    laserLightXx =  robotX+25;
  }

  //士兵
  image(soldier, soldierX, soldierY);
  soldierX++;
  if (soldierX>width) {
    soldierX=-80;
  }
}
