include <./_kagedourou_top.scad>

module kagedourou_bottom_frame_a() {
  translate([0, KD_TOP_Y/2 - KD_FRAME_INNER_T/2, KD_FRAME_T*2 + LCD_DISP_Z - LCD_DISP_Z_OFFSET_FROM_BOTTOM]) 
  cube(size=[KD_TOP_X - KD_FRAME_T*2, KD_FRAME_INNER_T, KD_FRAME_T], center=true);
}
