use <extruder-main_with_bltouch.scad>
module m3nut()
{
difference()
{    
cube([2,6,8]);
translate([-0.5,3,3]) rotate([0,90,0]) cylinder(r=1.25, h=3, $fn=20);
}
}


module ext_body(){
    
    difference(){
       extruder_body();
       extruder_mount_holes();
     }
    
}
difference()
{
    ext_body();

    // screw end larger hole
    //%translate([-20,40,12])rotate([0,90,0])cylinder(r=1.5, h=24, $fn=20);    
    //%translate([2,40,11.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 
    //%translate([2,40,12])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 
    //%translate([2,40,12.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 

    // M3 nuts 
    translate([0,46,9]) m3nut();
    translate([0,37,9]) m3nut();
    
    translate([0,42,9]) m3nut();
    translate([2,45,11.5])rotate([0,90,0])cylinder(r=1.6, h=3, $fn=20); 
    translate([2,45,12])rotate([0,90,0])cylinder(r=1.6, h=3, $fn=20); 
    translate([2,45,12.5])rotate([0,90,0])cylinder(r=1.6, h=3, $fn=20); 
    translate([-20,45,12])rotate([0,90,0])cylinder(r=1.6, h=25, $fn=20);
    
}

ext_body();
