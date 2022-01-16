include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_frame_a.scad>
include <./_kagedourou_bottom_frame_b.scad>
include <./_kagedourou_side_frame.scad>
include <./_kagedourou_bottom_panel.scad>
include <./_kagedourou_bottom_display_holder.scad>

$fn=50;
colors=[
  "PowderBlue",
  "LightBlue",
  "SkyBlue",
  "LightSkyBlue",
  "DeepSkyBlue",
  "DodgerBlue",
  "CornflowerBlue",
  "RoyalBlue",
  "Blue",
  "MediumBlue",
  "DarkBlue",
];

%
lcd_for_top();

%
color(colors[1])
kagedourou_top();
%
color(colors[2])
for (i=[0:3]) {
  rotate([0, 0, 90*i])
  kagedourou_side_frame();
}

%
color(colors[3])
kagedourou_bottom_frame_a();
%
color(colors[4])
kagedourou_bottom_frame_b();
%
color(colors[5])
kagedourou_bottom_panel();
%
color(colors[6])
kagedourou_bottom_display_holder();

PAPER_SIDE=[
  KD_TOP_X-KD_FRAME_INNER_T*2,
  0.01,
  KD_BOTTOM_PANEL_ZPOS - KD_FRAME_INNER_T - KD_FRAME_T/2
];
echo("PAPER_SIDE", PAPER_SIDE);

%
color("red", 0.1)
translate([0, -KD_TOP_Y/2 + KD_FRAME_INNER_T/2, PAPER_SIDE.z/2 + KD_FRAME_INNER_T]) 
cube(size=PAPER_SIDE, center=true);
