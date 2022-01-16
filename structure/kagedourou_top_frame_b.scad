include <./_kagedourou_top.scad>

$fn=50;

intersection(){
  kagedourou_top();

  rotate([0, 0, 45 + 180])
  cube(size=[KD_TOP_X*2, KD_TOP_Y*2, KD_FRAME_T*2], center=false);
}

