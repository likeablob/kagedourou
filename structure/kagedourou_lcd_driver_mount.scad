include <scad-utils/morphology.scad>

$fn=50;

LCDD_HOLES_BETWEEN_X=49;

LCDD_MOUNT=[
  55,
  10,
  1
];

difference() {
  union(){
    cube(size=LCDD_MOUNT, center=true);

    
    mirror_x()
    translate([LCDD_HOLES_BETWEEN_X/2, 0, 0]) 
    hull(){
      cube(size=[6, LCDD_MOUNT.y, LCDD_MOUNT.z], center=true);

      cylinder(d=6, d2=6, h=6, center=!true);
    }
  }
  mirror_x()
  translate([LCDD_HOLES_BETWEEN_X/2, 0, 2]) 
  cylinder(d=2, h=6, center=!true);  
}
