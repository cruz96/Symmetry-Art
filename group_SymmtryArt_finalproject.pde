face one; 

import processing.sound.*;
SoundFile music;
ArrayList<Float> coords = new ArrayList<Float>();
ArrayList<Float> oldcoords = new ArrayList<Float>();
ArrayList<Integer> sizes = new ArrayList<Integer>();
ArrayList<Integer> oldsizes = new ArrayList<Integer>();
ArrayList<Integer> colors = new ArrayList<Integer>();
ArrayList<Integer> oldcolors = new ArrayList<Integer>();
String[] drawing;
boolean firstclick = true;
int size = 10;
int divides = 2;
boolean firstrun = true;
PFont small;
PImage sprite;
int w = 64;
int counter = 0;
int x;
int y;
PImage img;
int wi = 100;
int count = 0;
int a;
int b;
boolean red = false;
boolean green = false;
boolean blue = false;
boolean black = true;
int weight;





void setup() {
  music = new SoundFile(this, "Symphony No. 9Beethoven.mp3"); 
  music.play();
  size(800, 600);
  sprite = loadImage("coins.png");
  img = loadImage("Edited sparks.png");
  ellipseMode(CENTER);
  small = createFont("Courier", 32);
  textFont(small);
  fill(0);
  one = new face();
}

void draw() {
  background(255);
  stroke(0);
  one.display();
}


void mouseDragged() {
  coords.add(float(mouseX));
  coords.add(float(mouseY));
  if (red == true) {
    colors.add(255);
    colors.add(0);
    colors.add(0);
  } else if (green == true) {
    colors.add(0);
    colors.add(255);
    colors.add(0);
  } else if (blue == true) {
    colors.add(0);
    colors.add(0);
    colors.add(255);
  } else if (black == true) {
    colors.add(0);
    colors.add(0);
    colors.add(0);
  }
  sizes.add(size);
}

void mouseClicked() {
  one.nextScreen();
  one.transition();
  one.colorPicker();
  one.howTo();
  one.goBack();
  one.fromMain();
  one.hideMenu();
}

void keyPressed() {
  if (key == 'z') {
    if (coords.size()>=2) {
      oldcoords.add(coords.get(coords.size()-2));
      oldcoords.add(coords.get(coords.size()-1));
      coords.remove(coords.size()-2);
      coords.remove(coords.size()-1);
      
      oldsizes.add(sizes.get(sizes.size()-1));
      sizes.remove(sizes.size()-1);
      
      oldcolors.add(colors.get(colors.size()-3));
      oldcolors.add(colors.get(colors.size()-2));
      oldcolors.add(colors.get(colors.size()-1));
      colors.remove(colors.size()-3);
      colors.remove(colors.size()-2);
      colors.remove(colors.size()-1);
    }
  } else if (key == 'y') {
    if (oldcoords.size()>=2) {
      coords.add(oldcoords.get(oldcoords.size()-2));
      coords.add(oldcoords.get(oldcoords.size()-1));
      oldcoords.remove(oldcoords.size()-2);
      oldcoords.remove(oldcoords.size()-1);
      
      sizes.add(oldsizes.get(oldsizes.size()-1));
      oldsizes.remove(oldsizes.size()-1);
      
      colors.add(oldcolors.get(oldcolors.size()-3));
      colors.add(oldcolors.get(oldcolors.size()-2));
      colors.add(oldcolors.get(oldcolors.size()-1));
      oldcolors.remove(oldcolors.size()-3);
      oldcolors.remove(oldcolors.size()-2);
      oldcolors.remove(oldcolors.size()-1);
    }
  } else if (key == 'w') {
    if (divides <= 11) {
      divides += 1;
    }
    
  } else if (key == 's') {
    if (divides >= 3) {
      divides -= 1;
    }
    
  } else if (key == 'c') {
    coords.clear();
    oldcoords.clear();
    sizes.clear();
    oldsizes.clear();
    colors.clear();
    oldcolors.clear();
    
  } else if (key == 'k') {
    PrintWriter output;
    output = createWriter("drawing.txt");
    for (int i = 0; i < coords.size(); i+= 1) {
      output.println(coords.get(i));
    }
    output.close();
    output = createWriter("sizes.txt");
    for (int i = 0; i < sizes.size(); i += 1){
      output.println(sizes.get(i));
    }
    output.close();
    output = createWriter("colors.txt");
    for (int i = 0; i < colors.size(); i += 1){
      output.println(colors.get(i));
    }
    output.close();
    
  } else if (key == 'l') {
    coords.clear();
    colors.clear();
    sizes.clear();
    drawing = loadStrings("drawing.txt");
    for (int i = 0; i < drawing.length; i+= 1) {
      coords.add(float(drawing[i]));
    }
    drawing = loadStrings("sizes.txt");
    for (int i = 0; i < drawing.length; i += 1){
      sizes.add(int(drawing[i]));
    }
    drawing = loadStrings("colors.txt");
    for (int i = 0; i < drawing.length; i += 1){
      colors.add(int(drawing[i]));
    }
  }
  else if (key == 'p'){
    music.stop();
  }
  else if (key == 'u'){
    music.play();
  }
}