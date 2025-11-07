include <../settings.scad>

// quarter
width=25;
length=50;

w_arm=10;

module quarter(){
    offset(r=.5)

    difference(){
        union(){
            translate([width/2, length/2,0])square([width,length], center=true);
            translate([width-w_arm/2,length+5,0])square([w_arm,20], center=true);
        }
        translate([width-8,length*.5,0])rotate([0,0,0])square([10,10], center=true);
        translate([width-2,length*.5,0])rotate([0,0,0])square([4,4], center=true);
    }
}


linear_extrude(height=5)
union(){
    quarter();
    mirror([1,0,0])quarter();
    mirror([1,0,0])mirror([0,1,0])quarter();
    mirror([0,1,0])quarter();
}