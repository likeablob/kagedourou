include <scad-utils/mirror.scad>
include <scad-utils/morphology.scad>

include <./local_modules/lcd.scad>


module lcd_for_top(){
  translate([0, KD_TOP_Y/2 - LCD_Y/2 - (KD_FRAME_INNER_T + 0.5), LCD_Z + KD_FRAME_T - 2]) 
  rotate([180, 0, 0]) 
  lcd(draw_display_region=true);
}

KD_FRAME_T=10;
KD_FRAME_INNER_T=5;

KD_TOP_X=LCD_X-2*2+KD_FRAME_T*2;
KD_TOP_Y=KD_TOP_X;
echo(str("KD_TOP_X=", KD_TOP_X));
echo(str("KD_TOP_Y=", KD_TOP_Y));

KD_TOP_DISP_HOLDER_X=10;
KD_TOP_DISP_HOLDER_Y=4*2;

module kagedourou_top_display_holder(args) {
  translate([0, KD_TOP_Y/2 - KD_FRAME_INNER_T, 0]){
    difference() {

      linear_extrude(height=KD_FRAME_T, center=!true, convexity=10, twist=0)
      square(size=[KD_TOP_DISP_HOLDER_X, KD_TOP_DISP_HOLDER_Y], center=true);

      translate([0, 0, KD_FRAME_T - 2]) 
      linear_extrude(height=KD_FRAME_T, center=!true, convexity=10, twist=0)
      square(size=[KD_TOP_DISP_HOLDER_X, (LCD_Y + 1) * 2], center=true);
    }

  }
}

module kagedourou_top() {
  difference() {
    linear_extrude(height=KD_FRAME_T, center=!true, convexity=10, twist=0)
    difference(){
      square(size=[KD_TOP_X, KD_TOP_Y], center=true);

      // top window
      offset(delta=-KD_FRAME_T)
      square(size=[KD_TOP_X, KD_TOP_Y], center=true);
    }

    translate([0, 0, 5]) 
    linear_extrude(height=KD_FRAME_T, center=!true, convexity=10, twist=0)
    offset(delta=(KD_FRAME_T - KD_FRAME_INNER_T))
    offset(delta=-KD_FRAME_T)
    square(size=[KD_TOP_X, KD_TOP_Y], center=true);
  }

  kagedourou_top_display_holder();
}

// kagedourou_top();
