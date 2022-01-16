include <./_kagedourou_top.scad>
include <./_kagedourou_bottom_frame_b.scad>
include <./local_modules/opiz_mount.scad>

KD_BOTTOM_PANEL_X=KD_TOP_X - KD_FRAME_T - LCD_Y*2 - 0.5;
KD_BOTTOM_PANEL_Y=KD_BOTTOM_PANEL_X;
KD_BOTTOM_PANEL_Z=1;
KD_BOTTOM_PANEL_ZPOS=KD_BOTTOM_FRAME_ZPOS + KD_FRAME_T/2;

KD_MAIN_LIGHT_BAR_SCREW_XPOS=10;

KD_BOTTOM_DISP_HOLDER_SCREW_XPOS=10;
KD_BOTTOM_DISP_HOLDER_SCREW_YPOS=10;


module kagedourou_bottom_panel_base() {
  linear_extrude(height=KD_BOTTOM_PANEL_Z, center=!true, convexity=10, twist=0)
  difference(){
    rounding(r=2)
    square(size=[KD_BOTTOM_PANEL_X, KD_BOTTOM_PANEL_Y], center=true);

    // holes for screws to bottom_frame_b
    for (i=[1:3]) {
      rotate([0, 0, 90*i]) 
      translate([0, KD_TOP_Y/2 - KD_FRAME_T/2 - 10/2, 0]) 
      circle(d=2.5);
    }

    // holes for bottom_display_holder 
    mirror_x()
    translate([KD_BOTTOM_DISP_HOLDER_SCREW_XPOS, KD_TOP_X/2 - KD_FRAME_T/2 - KD_BOTTOM_DISP_HOLDER_SCREW_YPOS/2, 0]) 
    circle(d=2.5);

    // holes for main_light_bar
    translate([0, KD_MAIN_LIGHT_BAR_SCREW_XPOS, 0]) 
    circle(d=2.5);

    // holes for cabling
    translate([0, KD_BOTTOM_PANEL_Y/2-10/2-8, 0]) 
    rounding(r=1)
    square(size=[20, 10], center=true);
    
    // center space
    translate([0, -10, 0]) 
    circle(d=8);
  }
}


module _kd_opiz_mount_offset() {
  KD_OPIZ_MOUNT_OFFSET_X=OPIZ_HOLES_BETWEEN_X/2-10;
  KD_OPIZ_MOUNT_OFFSET_Y=-5;

  translate([KD_OPIZ_MOUNT_OFFSET_X, KD_OPIZ_MOUNT_OFFSET_Y, KD_BOTTOM_PANEL_Z])
  children(0);
}

module kagedourou_bottom_panel() {
  translate([0, 0, KD_BOTTOM_PANEL_ZPOS]){
    difference(){
      union(){
        kagedourou_bottom_panel_base();

        _kd_opiz_mount_offset()
        opiz_mount();
      }

      _kd_opiz_mount_offset()
      opiz_mount(holes=true);
    }
  }
}
