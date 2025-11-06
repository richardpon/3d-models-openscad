include <../lib/settings.scad>

part_clearance = 1;

// Original 40 with -180 twist
inside_height = 10;


module ni_character(should_offset, height){
    clearance = (should_offset)? part_clearance : 0;
    
    translate([0,0,height])
    mirror([0,0,1])
    linear_extrude(height = height, center = false, twist=-45, convexity = 10)
    offset(r=clearance)
    translate([0,0,0])scale([.6,.6,.6])import(file="ni_character.svg", center=true);
    
}

module outside_holder() {

    difference(){
        translate([0,0,-5.01])linear_extrude(inside_height+5)circle(30);
        ni_character(true,inside_height);
    }
}



translate([60,0,0])ni_character(false, inside_height);
translate([0,0,5])outside_holder();