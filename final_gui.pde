class face {
  PFont small;
  PFont big;
  int size_1 = 30;
  int size_2 = 110; 
  boolean start = true;
  boolean mainScreen = false;
  boolean next = false;
  boolean instructions = false; 
  
  int move = 0;
  int shift = 0;




  face() {
    small = createFont("Courier", size_1);
    big = createFont("Courier", size_2);
    rectMode(CENTER);
  }


  void display() {

    strokeWeight(1);
    rectMode(CENTER);
    if (start) {
      background(51);
      fill(255, 255, 255);
      textFont(big);
      String title = "Symmetry Art"; 
      text (title, (width-textWidth(title))/2, size_2*1.2);

      fill(255);
      textFont(small);
      String line_1 = "Press start to begin";
      text(line_1, (width-textWidth(line_1))/2, 300);

      rect(width/2, 5*height/8, width/4, height/10);
      fill(0);
      String line_2 = "Start";
      text(line_2, (width-textWidth(line_2))/2, .6375*height);

      rectMode(CORNER);
      fill(255);
      rect(width/2-100, 5*height/7 + 20 - 30, 200, 60);
      fill(0);
      textSize(25);
      String line_3 = "Instructions";
      text(line_3, (width-textWidth(line_3))/2, .7575*height);

      if (instructions) {

        background(255);
        fill(0);
        String sentence1 = "Key functions";
        text(sentence1, 20, 30);
        strokeWeight(4);
        line(20, 35, 213, 35);
        String sentence2 = "z = undo";
        String sentence3 = "y = redo";
        String sentence4 = "c = clear screen";
        String sentence5 = "w = increase mirroring";
        String sentence6 = "s = decrease mirroring";
        String sentence7 = "k = save work";
        String sentence8 = "l = load work";
        String sentence30 = "p = pause music";
        String sentence31 = "u = unpause music";
        text(sentence30,20,195);
        text(sentence31,20,215);
        text(sentence2, 20, 55);
        text(sentence3, 20, 75);
        text(sentence4, 20, 95);
        text(sentence5, 20, 115);
        text(sentence6, 20, 135);
        text(sentence7, 20, 155);
        text(sentence8, 20, 175);
        String sentence9 = "Mouse functions";
        String sentence10 = "-click and hold to draw";
        text(sentence9, 20, 240);
        line(20, 245, 245, 245);
        text(sentence10, 20, 270);
        String sentence11 = "-click on colors and line widths after clicking coin";
        text(sentence11, 20, 290);
        String sentence12 = "to change options";
        text(sentence12, 20, 310);

        rectMode(CORNER);
        fill(255);
        rect(width/2-100, 5*height/7 + 20 - 30 + 60, 200, 60);
        fill(0);
        textSize(40);
        String sentence13 = "Back";
        text(sentence13, width/2-100+52, 5*height/7+30 + 60);
      }
    } else if (mainScreen) {

      rectMode(CENTER);
      ellipse(width/2, height/2, 4, 4);
      textFont(small);
      text(str(divides) + "x", width-75, 50);
      noStroke();
      if (coords.size()>0) {
        for (int i = 0; i < coords.size()/2; i+=1) {
          fill(colors.get(i*3), colors.get(i*3+1), colors.get(i*3+2));
          float x1 = coords.get(i*2);
          float y1 = coords.get(i*2+1);
          float deltax = x1-width/2;
          float deltay = y1-height/2;
          float r = dist(x1, y1, width/2, height/2);
          float rad = atan(deltay/deltax);
          for (int j = 1; j <= divides; j+=1) {
            float newx = width/2 + r * cos(rad+i*2*PI/divides);
            float newy = height/2 + r * sin(rad+i*2*PI/divides);
            ellipse(newx, newy, sizes.get(i), sizes.get(i));
          }
        }
      }

      fill(255);
      stroke(0);
      rectMode(CORNER);
      rect(1, 1, 100, 40);
      fill(0);
      textSize(20);
      String sentence14 = "Back";
      text(sentence14, 25, 27);

      fill(255);
      rect(1, 43, 100, 40);
      fill(0);
      String sentence15 = "Hide menu";
      textSize(18);
      text(sentence15, 2, 67);
      noFill();


      x = (counter % 4) * w;
      y = (counter / 4) * w;

      copy(sprite, x, y, w, w, move, height-64, w, w);
      delay(40);
      counter = counter + 1;
      if (counter == 16) {
        counter = 0;
      }

      move = move + 1;

      if (move > width + 25) {
        move = -30;
      }


      if (next) {

        a = (count % 4) * wi;
        b = (count / 4) * wi;
        copy(img, a, b, wi, wi, move, height-90, wi, wi);
        delay(20);
        count = count + 1;
        if (count > 25) {
          fill(0);
          line(0, height-70, width, height-70);
          line(100, height-70, 100, height);
          line(200, height-70, 200, height);
          line(300, height-70, 300, height);
          line(400, height-70, 400, height);
          line(500, height-70, 500, height);
          line(600, height-70, 600, height);
          line(700, height-70, 700, height);
          line(800, height-70, 800, height);
          rectMode(CORNER);
          fill(255, 0, 0);
          rect(0, height-70, 100, 70);
          fill(0, 255, 0);
          rect(100, height-70, 100, 70);
          fill(0, 0, 255);
          rect(200, height-70, 100, 70);
          fill(0);
          rect(300, height-70, 100, 70);
          fill(255);
          stroke(0);
          rect(400, height-70, 100, 70);
          rect(500, height-70, 100, 70);
          rect(600, height-70, 100, 70);
          rect(700, height-70, 100, 70);


          fill(0);

          textSize(20);
          text("Size 1", width-387, height-30);
          text("Size 2", width-287, height-30);
          text("Size 3", width-187, height-30);
          text("Size 4", width-87, height-30);
        }
      }

     
    }
  }



  void nextScreen() {
    if (mouseX >= 3*width/8 && mouseX <= 5*width/8 && mouseY >= .575*height && mouseY <= .675*height && start) {
      start = false;
      mainScreen = true;
    }
  }


  void howTo() {
    if (mouseX >= width/2-100 && mouseX <= width/2-100+200 && mouseY >= 5*height/7 + 20 - 30) {
      mainScreen = false;
      instructions = true;
    }
  }

  void goBack() {
    if (mouseX >= width/2-100 && mouseX <= width/2-100+200 && mouseY >= 5*height/7 + 20 - 30 + 60) {
      mainScreen = true;
      instructions = false;
    }
  }

  void fromMain() {
    if (mouseX >= 1 && mouseX <= 100 && mouseY >= 1 && mouseY <= 40) {
      start = true;
      mainScreen = false;
    }
  }

  void hideMenu() {
    if (mouseX >= 1 && mouseX <= 100 && mouseY >= 43 && mouseY <= 83) {
      next = false;
      counter = 0;
      count = 0;
      
    }
  }

  void transition() {
    if (mouseX >= move && mouseX <= move+60 && mouseY > 500 && mainScreen) {
      counter = 17;
      next = true;
    }
  }

  void colorPicker() {

    if (mouseX <= 100 && mouseY >= height-70) {
      red = true;
      green = false;
      blue = false;
      black = false;
    } else if (mouseX >= 101 && mouseX <= 200 && mouseY >= height-70) {
      green = true;
      red = false;
      blue = false;
      black = false;
    } else if (mouseX >= 201 && mouseX <= 300 && mouseY >= height-70) {
      blue = true;
      red = false;
      green = false;
      black = false;
    } else if (mouseX >= 301 && mouseX <= 400 && mouseY >= height-70) {
      black = true;
      red = false;
      green = false;
      blue = false;
    } else if (mouseX >= 401 && mouseX <= 500 && mouseY >= height-70) {
      size = 10;
    } else if (mouseX >= 501 && mouseX <= 600 && mouseY >= height-70) {
      size = 12;
    } else if (mouseX >= 601 && mouseX <= 700 && mouseY >= height-70) {
      size = 14;
    } else if (mouseX >= 701 && mouseX <= 800 && mouseY >= height-70) {
      size = 16;
    }
  }
}