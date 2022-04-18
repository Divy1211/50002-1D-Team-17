offset = 0;
function setup() {
  createCanvas(16, 16);
  frameRate(9);
}

function draw() {
  background(200);
  noFill();
  noSmooth();
  
  translate(8, 8);
  stroke(255);
  circle(0, 0, 2);
  rotate(radians(offset*10));
  for(var i = 0; i < 360; i+=360/8) {
    stroke(255, 0, 0);
    if(i%2 == 1) {
      stroke(0, 255, 0);
    }
    arcRot(4, -4, 8, 8, 0, PI/1.5, OPEN, i);
  }
  ++offset;
  
  if(frameCount < 10)
      save("f"+frameCount+".png");
}

function arcRot(x, y, w, h, s, st, m, d) {
  push();
  rotate(radians(d));
  arc(x, y, w, h, s, st, m);
  pop();
}