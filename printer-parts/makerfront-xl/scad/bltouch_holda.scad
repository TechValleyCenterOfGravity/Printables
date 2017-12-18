module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}


module bltouch_outside_profile()
{
    HEIGHT=.301;
    OR=4;
    C_XOFF=0;
    C_YOFF=9;
    S_H=11.53;
    S_W=6;
    XI=S_H/2 - C_XOFF;
    YI=S_W/2 - C_YOFF;
    SQRT = sqrt(pow(XI,2) +pow(YI,2)-pow(OR,2));
    X1= ((pow(OR,2)*XI - OR*YI*SQRT)/(pow(XI,2)+pow(YI,2)))+C_XOFF;
    Y1= ((pow(OR,2)*YI + OR*XI*SQRT)/(pow(XI,2)+pow(YI,2)))+C_YOFF;
    hull(){
        cube(size=[S_H, S_W, HEIGHT], center=true);
        copy_mirror([0,1,0]){
            translate([0, C_YOFF, 0]) {
                cylinder(h=HEIGHT, r=OR, center=true, $fn=20);
            }
        }
        /*copy_mirror([0,1,0]) linear_extrude(HEIGHT, center=true) {
            polygon(points=[[S_H/2,S_W/2],
                            [S_H/-2,S_W/2],
                            [-X1,Y1],
                            [X1,Y1]]);
        }*/
    }
}


module bltouch_bracket()
{
difference()
{
    hull(){
        linear_extrude (3, center=true){
            offset(r=2)projection() bltouch_outside_profile();
        }
        translate([-8.9/2,0,0]) cube([8.9,18+8+2*2,3], center=true);
    }
    translate([0,0,.15-1.5]) bltouch_outside_profile();
    copy_mirror([0,1,0]) translate([0,9,0]) cylinder(h=20,r=3.2/2, center=true, $fn=20);
    translate([1.5-8.9,0,0]) cube([3.001,13,20], center=true);

    copy_mirror()translate([0,9,0]) cylinder (r=2.4, h=1.501, $fn=6);
}
}
bltouch_bracket();
//bottom to nozzle 19mm
//bltouch total 41.8mm
//22.8mm upis where it should res
//middle should be 8.5mm 
//plugs=13x3mm