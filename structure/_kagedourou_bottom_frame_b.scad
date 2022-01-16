include <./_kagedourou_top.scad>

$fn=50;

KD_BOTTOM_FRAME_ZPOS=KD_FRAME_T + LCD_DISP_Z - LCD_DISP_Z_OFFSET_FROM_BOTTOM + KD_FRAME_T;

module kagedourou_bottom_frame_b() {
  // align base XY-plane to the bottom edge of LCD's visible area
  translate([0, 0, KD_BOTTOM_FRAME_ZPOS]){
    // %color("red", 0.05) square(size=[100, 100], center=true);

    rotate([0, 0, 90]) 
    translate([0, KD_TOP_Y/2 - KD_FRAME_INNER_T/2, 0]) {
      cube(size=[KD_TOP_X - KD_FRAME_T*2, KD_FRAME_INNER_T, KD_FRAME_T], center=true);

      // tab for bottom panel
      TAB_H=10;
      TAB_W=10;
      TAB_Z=4;

      translate([0, 0, KD_FRAME_T/2 - TAB_Z]) 
      linear_extrude(height=TAB_Z, center=!true, convexity=10, twist=0)
      translate([0, -KD_FRAME_INNER_T/2 - TAB_H/2, 0])
      difference() {
        square(size=[10, TAB_H], center=true);

        // screw hole
        circle(d=2);      
      }
    }
  }
}
