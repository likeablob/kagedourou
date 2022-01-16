include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_frame_a.scad>
include <./_kagedourou_bottom_frame_b.scad>
include <./_kagedourou_side_frame.scad>
include <./_kagedourou_bottom_panel.scad>
include <./_kagedourou_bottom_display_holder.scad>

$fn=50;

%
lcd_for_top();


kagedourou_top();

for (i=[0:3]) {
  rotate([0, 0, 90*i])
  kagedourou_side_frame();
}

kagedourou_bottom_frame_a();

kagedourou_bottom_frame_b();

%
kagedourou_bottom_panel();
%
color(colors[6])
kagedourou_bottom_display_holder();
