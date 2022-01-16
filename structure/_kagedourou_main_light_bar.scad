include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_panel.scad>

KD_MAIN_LIGHT_BAR_Z=80;

module kagedourou_main_light_bar() {
  translate([0, 0, KD_BOTTOM_PANEL_ZPOS]){
    translate([0, KD_MAIN_LIGHT_BAR_SCREW_XPOS, 0]) 
    difference(){
      translate([0, 0, -KD_MAIN_LIGHT_BAR_Z]) 
      linear_extrude(height=KD_MAIN_LIGHT_BAR_Z, center=!true, convexity=10, twist=0)
      rotate([0, 0, 45])
      square(size=[10, 10], center=true);    

      // screw hole
      cylinder(d=2, h=10, center=true);
    }
  }
}
