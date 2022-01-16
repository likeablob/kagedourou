include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_panel.scad>

KD_BOTTOM_DISP_HOLDER_X=30;
KD_BOTTOM_DISP_HOLDER_Y=7;
KD_BOTTOM_DISP_HOLDER_Z=10;

module kagedourou_bottom_display_holder() {
  translate([0, 0, KD_BOTTOM_PANEL_ZPOS]){
    difference() {
      translate([0, KD_BOTTOM_PANEL_Y/2 - KD_BOTTOM_DISP_HOLDER_Y/2 + LCD_Y, 0])
      translate([0, 0, -KD_BOTTOM_DISP_HOLDER_Z/2])
      difference() {
        cube(size=[KD_BOTTOM_DISP_HOLDER_X, KD_BOTTOM_DISP_HOLDER_Y, KD_BOTTOM_DISP_HOLDER_Z], center=true);

        // hold LCD with this edge
        translate([0, KD_BOTTOM_DISP_HOLDER_Y-2.5, -3]) 
        cube(size=[KD_BOTTOM_DISP_HOLDER_X+1, KD_BOTTOM_DISP_HOLDER_Y, KD_BOTTOM_DISP_HOLDER_Z], center=true);
      }

      // screw holes
      mirror_x()
      translate([KD_BOTTOM_DISP_HOLDER_SCREW_XPOS, KD_TOP_X/2 - KD_FRAME_T/2 - KD_BOTTOM_DISP_HOLDER_SCREW_YPOS/2, 0])
      cylinder(d=2, h=KD_BOTTOM_DISP_HOLDER_Z*3, center=true);
    }
  }
}
