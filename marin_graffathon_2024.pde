
/*
Proecessing demo by Marin "Bala-Koala" Balabanov
Website: http://marincomics.com
Demozoo: https://demozoo.org/sceners/133212/

The music is "Kick Shock" by Kevin MacLeod (incompetech.com)
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
float ellipsesXSpeed = 20;
float ellipsesYSpeed = 20;

// Init for recty mess scene
float rectyX;
float rectyY;
float rectyXSpeed = 10;
float rectyYSpeed = 10;
int rectSize1 = 400;
int rectSize2 = 1800;
int rectSize3 = 4000;

// Init for star lines scene
int numLines = 18;
float angle = 0;

// Set up for Glitch Flashes
PFont font;
float angleOffset = 0;

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

// Setup blinking colors
int currentColorIndex = 0;
int changeInterval = 400;
int lastChangeTime = 0;

color[] blinkyColors = {
  color(255, 0, 0),
  color(0),
  color(0, 255, 0),
  color(0),
  color(0, 0, 255),
  color(0),
  color(255, 255, 0),
  color(0),
  color(255, 0, 255),
  color(0),
  color(0, 255, 255),
  color(0),
  color(255, 128, 0),
  color(0),
  color(128, 0, 255),
  color(0),
  color(255, 0, 128),
  color(0),
  color(0, 128, 255),
  color(0),
  color(128, 255, 0),
  color(0),
  color(255, 255, 255)
};

// Settings for expanding circles
int numCircles = 8;
float maxRadius = 800;
float minRadius = 100;
float speed = 5;

void setup() {
  // noCursor();
  // fullScreen();
  // frameRate(60);
  size(1920, 1080);
  // size(1920, 1080, P3D);
  startTime = millis();
  
  minim = new Minim(this);
  player = minim.loadFile("data/kick-shock.mp3");
  player.play();
  
  textY = height;
}

void draw() {
  int elapsedTime = millis() - startTime;

  if (elapsedTime < 3000) {
    glitchTextFlash("GLITCH", 64, 0, 0);
  } else if (elapsedTime < 6000) {
    starLines(255, 100, 150);
  } else if (elapsedTime < 9000) {
    rectyMess();
  } else if (elapsedTime < 11000) {
    glitchTextFlash("PITCH", 255, 96, 64);
  } else if (elapsedTime < 13000) {
    starLines(128, 255, 64);
  } else if (elapsedTime < 19000) {
    rectyMess();
  } else if (elapsedTime < 21000) {
    starLines(192, 128, 32);
  } else if (elapsedTime < 24000) {
    glitchTextFlash("ITCH", 64, 128, 200);
  } else if (elapsedTime < 29000) {
    bouncingEllipses();
  } else if (elapsedTime < 43000) {
    pulsatingRectangles();
  } else if (elapsedTime < 57000) {
    blinkColors();
  } else if (elapsedTime < 65000) {
    creditScroll();
  } else if (elapsedTime < 67000) {
    expandingCircles();
  } else {
    stopDemo();
  }

}


void stopDemo() {
  player.close();
  minim.stop();
  super.stop();
}


void generateGradient(int colR, int colG, int colB) {
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    int c = lerpColor(color(colR, colG, colB), color(colB, colG, colR), inter);
    stroke(c);
    line(0, y, width, y);
  }  
}


void bouncingEllipses() {
  blendMode(ADD);
  background(160, 80, 0);

  int rndOffset = 400;

  fill(170, 90, 10, 60);
  noStroke();
  ellipse(ellipsesX + 500 + random(1, rndOffset), ellipsesY - 500 + random(1, rndOffset), 2200, 2200);

  fill(180, 100, 20, 60);
  noStroke();
  ellipse(ellipsesX + 450 + random(1, rndOffset), ellipsesY - 450 + random(1, rndOffset), 2000, 2000);

  fill(190, 110, 30, 60);
  noStroke();
  ellipse(ellipsesX + 400 + random(1, rndOffset), ellipsesY - 400 + random(1, rndOffset), 1800, 1800);

  fill(200, 120, 40, 60);
  noStroke();
  ellipse(ellipsesX + 350 + random(1, rndOffset), ellipsesY - 350 + random(1, rndOffset), 1600, 1600);

  fill(210, 130, 50, 60);
  noStroke();
  ellipse(ellipsesX + 300 + random(1, rndOffset), ellipsesY - 300 + random(1, rndOffset), 1400, 1400);
  
  fill(220, 140, 60, 60);
  noStroke();
  ellipse(ellipsesX + 250 + random(1, rndOffset), ellipsesY - 250 + random(1, rndOffset), 1200, 1200);

  fill(230, 150, 70, 60);
  noStroke();
  ellipse(ellipsesX + 200 + random(1, rndOffset), ellipsesY - 200 + random(1, rndOffset), 1000, 1000);
  
  fill(240, 160, 100, 60);
  noStroke();
  ellipse(ellipsesX + 150 + random(1, rndOffset), ellipsesY - 150 + random(1, rndOffset), 800, 800);

  fill(250, 180, 140, 60);
  noStroke();
  ellipse(ellipsesX + 100 + random(1, rndOffset), ellipsesY - 100 + random(1, rndOffset), 600, 600);
  
  fill(255, 200, 160, 60);
  noStroke();
  ellipse(ellipsesX + 75 + random(1, rndOffset), ellipsesY - 75 + random(1, rndOffset), 400, 400);

  fill(255, 240, 200, 60);
  noStroke();
  ellipse(ellipsesX + 50 + random(1, rndOffset), ellipsesY - 50 + random(1, rndOffset), 200, 200);

  fill(255, 255, 240, 60);
  noStroke();
  ellipse(ellipsesX + 25 + random(1, rndOffset), ellipsesY - 25 + random(1, rndOffset), 100, 100);

  fill(255, 255, 255, 90);
  noStroke();
  ellipse(ellipsesX + random(1, rndOffset), ellipsesY + random(1, rndOffset), 50, 50);
  
  ellipsesX += ellipsesXSpeed;
  ellipsesY += ellipsesYSpeed;

  if (ellipsesX > width - 25 || ellipsesX < 25) {
    ellipsesXSpeed *= -1;
  }
  
  if (ellipsesY > height - 25 || ellipsesY < 25) {
    ellipsesYSpeed *= -1;
  }

}


void rectyMess() {
  drawRectyMess(rectyX + 60, rectyY + 60, rectSize3, 90, 200, 40);

  rectyX += rectyXSpeed;
  rectyY += rectyYSpeed;
  
  if (rectyX > width - rectSize1 / 2 || rectyX < rectSize1 / 2) {
    rectyXSpeed *= -1;
  }
  
  if (rectyY > height - rectSize1 / 2 || rectyY < rectSize1 / 2) {
    rectyYSpeed *= -1;
  }
}


void drawRectyMess(float cx, float cy, float diameter, int ballRed, int ballGreen, int ballBlue) {
  int rows = 20;
  int cols = 16;
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


void starLines(int rA, int gA, int bA) {
  noStroke();

  generateGradient(rA, gA, bA);

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


void glitchTextFlash(String glitchedText, int colR, int colG, int colB) {
  font = createFont("Arial", 540, true);
  textFont(font);
  textAlign(CENTER, CENTER);

  generateGradient(colR, colG, colB);

  float distortionAmount = sin(angleOffset) * 40;
  
  fill(255, 255, 255, 60);
  text(glitchedText, width / 2, height / 2);
  
  fill(255, 0, 0, 60);
  text(glitchedText, width / 2 + distortionAmount, height / 2);
  
  fill(0, 255, 0, 60);
  text(glitchedText, width / 2 - distortionAmount, height / 2);
  
  fill(0, 0, 255, 60);
  text(glitchedText, width / 2, height / 2 + distortionAmount);

  angleOffset += 2;
}


void blinkColors() {
  int currentTime = millis();

  if (currentTime - lastChangeTime > changeInterval) {
    currentColorIndex = (currentColorIndex + 1) % blinkyColors.length;
    lastChangeTime = currentTime;
  }
  
  background(blinkyColors[currentColorIndex]);
}


void expandingCircles() {
  noStroke();
  background(random(1, 255), random(1, 255), random(1, 255), 40);

  blendMode(ADD);
  for (int i = 0; i < numCircles; i++) {
    float radius = minRadius + ((maxRadius - minRadius) * (i / (float)numCircles));
    float offset = (frameCount * speed) % height;
    float y = height - (i * height / numCircles + offset) % height;
    float alpha = map(y, height, 0, 0, 128);

    fill(random(1, 255), random(1, 255), random(1, 255), alpha);
    ellipse(width / 2, y, radius * 2, radius * 2);
  }
  filter(BLUR, 2);
}


void creditScroll() {
  blendMode(NORMAL);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(220, 200, 20);
  
  background(0, 0, 0, 0);
  for (int i = 0; i < lines.length; i++) {
    text(lines[i], width / 2, textY + i * 60);
  }
  textY -= 3;
}
