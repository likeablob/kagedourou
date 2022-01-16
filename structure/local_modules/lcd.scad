LCD_X=76;
LCD_Y=1.5;
LCD_Z=138;
LCD_DISP_X=LCD_X - 1.5 * 2;
LCD_DISP_Z_OFFSET_FROM_BOTTOM=6;
LCD_DISP_Z=LCD_Z-LCD_DISP_Z_OFFSET_FROM_BOTTOM - 1.5;

module lcd(margin=0, draw_display_region=false) {
  translate([0, 0, LCD_Z/2]){
    cube(size=[LCD_X+margin, LCD_Y+margin, LCD_Z+margin], center=true);

    if(draw_display_region){
      translate([0, 0, -(LCD_Z - LCD_DISP_Z)/2 + LCD_DISP_Z_OFFSET_FROM_BOTTOM]) 
      color("green", 0.5)
      cube(size=[LCD_DISP_X, LCD_Y, LCD_DISP_Z], center=true);
    }
  }
}
