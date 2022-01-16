include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_frame_a.scad>
include <./_kagedourou_bottom_frame_b.scad>
include <./_kagedourou_side_frame.scad>
include <./_kagedourou_bottom_panel.scad>
include <./_kagedourou_bottom_display_holder.scad>

$fn=50;

%
lcd_for_top();
%
kagedourou_top();
%
for (i=[0:3]) {
  rotate([0, 0, 90*i])
  kagedourou_side_frame();
}
%
kagedourou_bottom_frame_a();
%
kagedourou_bottom_frame_b();
%
kagedourou_bottom_panel();
%
kagedourou_bottom_display_holder();

KD_TOTAL_Z=KD_FRAME_T + KD_SIDE_FRAME_Z;
KD_BOTTOM_SPACE_Z=KD_TOTAL_Z - KD_BOTTOM_FRAME_ZPOS - KD_FRAME_T/2;

module kagedourou_support_bottom_space() {
  translate([0, KD_TOP_Y/2 - KD_FRAME_INNER_T/2, KD_TOTAL_Z])
  translate([0, 0, -KD_BOTTOM_SPACE_Z/2]) 
  cube(size=[(KD_TOP_X - KD_FRAME_T*2)/2, KD_FRAME_INNER_T, KD_BOTTOM_SPACE_Z], center=true);
}


kagedourou_support_bottom_space();
