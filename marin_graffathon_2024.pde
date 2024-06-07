
/*
Music Credits
=============
"Go Cart - Loop Mix" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 4.0 License
http://creativecommons.org/licenses/by/4.0/
*/

import ddf.minim.*;

Minim minim;
AudioPlayer player;

int startTime;

// Init for bouncing ellipses scene
float ellipsesX = width / 2;
float ellipsesY = height / 2;
float ellipsesXSpeed = 30;
float ellipsesYSpeed = 30;

// Init for recty mess scene
float rectyX;
float rectyY;
float rectyXSpeed = 20;
float rectyYSpeed = 20;
int rectSize1 = 600;
int rectSize2 = 1800;
int rectSize3 = 4000;

// Init for star lines scene
int numLines = 24;
float angle = 0;

// Init scrolling text
String[] lines = {
  "Demo by Marin \"Bala-Koala\" Balabanov",
  " ",
  "Music \"Go Cart - Loop Mix\" by Kevin MacLeod",
  "(incompetech.com)",
  " ",
  "Made for Graffathon 2024"
};
float textY;

void setup() {
  // noCursor();
  // fullScreen();
  frameRate(60);
  size(1920, 1080);
  startTime = millis();
  
  minim = new Minim(this);
  player = minim.loadFile("music/go-cart-loop-mix.mp3");
  player.play();
  
  textY = height; // Initialize text position at the bottom of the screen
}

void draw() {
  int elapsedTime = millis() - startTime;

  if (elapsedTime < 8000) {
    starLines();    
  } else if (elapsedTime < 14000) {
    rectyMess();
  } else if (elapsedTime < 22000) {
    bouncingEllipses();
  } else if (elapsedTime < 30000) {
    pulsatingRectangles();
  } else if (elapsedTime < 40000) {
    creditScroll();
  } else {
    stopDemo();
  }
} 

void stopDemo() {
  player.close();
  minim.stop();
  super.stop();
}

void bouncingEllipses() {
  blendMode(ADD);
  background(160, 80, 0);

  // circle 13
  fill(170, 90, 10, 60);
  int rndOffset = 400;

  noStroke();
  ellipse(ellipsesX + 500 + random(1, rndOffset), ellipsesY - 500 + random(1, rndOffset), 2200, 2200);

  // circle 12
  fill(180, 100, 20, 60);
  noStroke();
  ellipse(ellipsesX + 450 + random(1, rndOffset), ellipsesY - 450 + random(1, rndOffset), 2000, 2000);

  // circle 11
  fill(190, 110, 30, 60);
  noStroke();
  ellipse(ellipsesX + 400 + random(1, rndOffset), ellipsesY - 400 + random(1, rndOffset), 1800, 1800);

  // circle 10
  fill(200, 120, 40, 60);
  noStroke();
  ellipse(ellipsesX + 350 + random(1, rndOffset), ellipsesY - 350 + random(1, rndOffset), 1600, 1600);

  // circle 9
  fill(210, 130, 50, 60);
  noStroke();
  ellipse(ellipsesX + 300 + random(1, rndOffset), ellipsesY - 300 + random(1, rndOffset), 1400, 1400);
  
  // circle 8
  fill(220, 140, 60, 60);
  noStroke();
  ellipse(ellipsesX + 250 + random(1, rndOffset), ellipsesY - 250 + random(1, rndOffset), 1200, 1200);
  
  // circle 7
  fill(230, 150, 70, 60);
  noStroke();
  ellipse(ellipsesX + 200 + random(1, rndOffset), ellipsesY - 200 + random(1, rndOffset), 1000, 1000);
  
 // circle 6
  fill(240, 160, 100, 60);
  noStroke();
  ellipse(ellipsesX + 150 + random(1, rndOffset), ellipsesY - 150 + random(1, rndOffset), 800, 800);

  // circle 5
  fill(250, 180, 140, 60);
  noStroke();
  ellipse(ellipsesX + 100 + random(1, rndOffset), ellipsesY - 100 + random(1, rndOffset), 600, 600);
  
  // circle 4
  fill(255, 200, 160, 60);
  noStroke();
  ellipse(ellipsesX + 75 + random(1, rndOffset), ellipsesY - 75 + random(1, rndOffset), 400, 400);

  // circle 3
  fill(255, 240, 200, 60);
  noStroke();
  ellipse(ellipsesX + 50 + random(1, rndOffset), ellipsesY - 50 + random(1, rndOffset), 200, 200);
  
  // circle 2
  fill(255, 255, 240, 60);
  noStroke();
  ellipse(ellipsesX + 25 + random(1, rndOffset), ellipsesY - 25 + random(1, rndOffset), 100, 100);
  
  // circle 1
  fill(255, 255, 255, 90);
  noStroke();
  ellipse(ellipsesX + random(1, rndOffset), ellipsesY + random(1, rndOffset), 50, 50);
  
  ellipsesX += ellipsesXSpeed;
  ellipsesY += ellipsesYSpeed;

  if (ellipsesX > width - 25 || ellipsesX < 25) { // 25 is half the diameter of the circle
    ellipsesXSpeed *= -1; // Reverse the horizontal direction
  }
  
  if (ellipsesY > height - 25 || ellipsesY < 25) {
    ellipsesYSpeed *= -1; // Reverse the vertical direction
  }
}

void rectyMess() {
  background(0);

  drawRectyMess(rectyX + 60, rectyY + 60, rectSize3, 90, 200, 40, 20, 16);

  rectyX += rectyXSpeed;
  rectyY += rectyYSpeed;
  
  if (rectyX > width - rectSize1 / 2 || rectyX < rectSize1 / 2) {
    rectyXSpeed *= -1;
  }
  
  if (rectyY > height - rectSize1 / 2 || rectyY < rectSize1 / 2) {
    rectyYSpeed *= -1;
  }
}

void drawRectyMess(float cx, float cy, float diameter, int ballRed, int ballGreen, int ballBlue, int rowNum, int colNum) {
  int rows = rowNum;
  int cols = colNum;
  float checkerSize = diameter / cols;
 
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if ((i + j) % 2 == 0) {
        fill(ballRed, ballGreen, ballBlue);
      } else {
        fill(ballBlue, ballRed, ballGreen);
      }
      float xPos = cx + diameter / 2 - j * checkerSize;
      float yPos = cy + diameter / 2 - i * checkerSize;
      rect(xPos, yPos, checkerSize, checkerSize);
    }
  }
}

void pulsatingRectangles() {
    background(10, 20, 15);
    blendMode(ADD);

    int i = 0;

    while (i < 22) {
        i = i + 1;
        println(i);

        int j = 0;
        while (j < 12) {
            j = j + 1;

            int posX = i * 80;
            int posY = j * 80;

            float dist1 = random(10) + 2;
            float dist2 = random(10) + 3;

            float squareSize = random(80);

            float squareCol1 = random(240);
            float squareCol2 = random(240);
            float squareCol3 = random(240);

            float squareAlpha = random(240);

            noStroke();
            fill(squareCol1, 0, 0, squareAlpha);
            rect(posX, posY, squareSize, squareSize);

            noStroke();
            fill(0, squareCol2, 0, squareAlpha);
            rect(posX + dist1, posY + dist2, squareSize, squareSize);

            noStroke();
            fill(0, 0, squareCol3, squareAlpha);
            rect(posX + dist2 * 2, posY + dist1 * 2, squareSize, squareSize);
        }
    }
}

void starLines() {
  noStroke();
   
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    int c = lerpColor(color(255, 100, 150), color(100, 150, 255), inter);
    stroke(c);
    line(0, y, width, y);
  }

  translate(width / 2, height / 2);
  
  float spacing = TWO_PI / numLines;
  for (int i = 0; i < numLines; i++) {
    float x = cos(angle + spacing * i) * 1200;
    float y = sin(angle + spacing * i) * 1200;
    
    stroke(200, 60, 80, 80);
    strokeWeight(100);
    line(0, 0, x, y);
  }
  
  angle += 0.02;
}

void creditScroll() {
  textSize(100); // Set text size
  textAlign(CENTER, CENTER);
  fill(255, 255, 100);
 
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    int c = lerpColor(color(139, 0, 0), color(75, 0, 130), inter);
    stroke(c);
    line(0, y, width, y);
  }
  
  // Scroll text
  background(0, 0, 0, 0); // Transparent background to avoid flickering
  for (int i = 0; i < lines.length; i++) {
    text(lines[i], width / 2, textY + i * 120); // Adjust the spacing between lines as needed
  }
  textY -= 1; // Move text upwards
  
  if (textY + lines.length * 60 < 0) {
    textY = height;
  }
}
