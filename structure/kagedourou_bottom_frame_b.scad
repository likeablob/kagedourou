include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_frame_b.scad>
include <./_kagedourou_side_frame.scad>

$fn=50;

%
lcd_for_top();
%
kagedourou_top();
%
kagedourou_side_frame();

kagedourou_bottom_frame_b();
