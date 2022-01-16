include <./_kagedourou_top.scad>

KD_SIDE_FRAME_Z=155;

module kagedourou_side_frame() {
  translate([KD_TOP_X/2 - KD_FRAME_T/2, KD_TOP_Y/2 - KD_FRAME_T/2, KD_FRAME_T]) 
  linear_extrude(height=KD_SIDE_FRAME_Z, center=!true, convexity=10, twist=0)
  difference(){
    square(size=[KD_FRAME_T, KD_FRAME_T], center=true);

    // inner space
    rotate([0, 0, 180])
    square(size=[KD_FRAME_INNER_T, KD_FRAME_INNER_T], center=!true);
  }
}
