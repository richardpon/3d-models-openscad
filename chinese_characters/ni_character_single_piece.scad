include <../lib/settings.scad>

part_clearance = .8;

connector_width = 3;


// Original 40 with -180 twist
inside_height = 40;
holder_thickness = 5;
character_base_extrude_height=15;

extrude_twist = 130;

module ni_character_2d(){
    translate([0,0,0])scale([.6,.6,1])import(file="ni_character.svg", center=true);
}

module connectors(){
    translate([-7,5,0])rotate([0,0,-45])square([8,connector_width]);
    translate([16,0,0])rotate([0,0,75])square([6,connector_width]);
    translate([8.75,5,0])rotate([0,0,90])square([9,connector_width]);
    translate([-10,12.5,0])rotate([0,0,0])square([9,connector_width]);
}

module common_extrude(){
    rotate([0,0,extrude_twist])
    linear_extrude(height = inside_height, center = false, twist=extrude_twist, convexity = 10)
    children();
}


// extrude char all the way
    // extrude char+connector partway
module character_inside(){
    common_extrude()
    ni_character_2d();
}

module character_base_extruded(){
    base_twist = extrude_twist * character_base_extrude_height / inside_height;
    
    rotate([0,0,extrude_twist]) // rotate bu extrude_twist to line up with common_extruded parts
    linear_extrude(height=character_base_extrude_height, center=false, twist=base_twist, convexity=10)
    
    union(){
        connectors();
        ni_character_2d();
    }

}


module character_cutout(){
    common_extrude()
    offset(r=part_clearance)
    union(){
        ni_character_2d();
        connectors();
    }
}



module ni_character(){
    union(){
        character_inside();
        character_base_extruded();
    }
    
}



module outside_holder() {

    difference(){
        translate([0,0,-holder_thickness-.1])linear_extrude(inside_height+holder_thickness)circle(30);
        character_cutout();
    }
}



translate([120,0,0])ni_character();
translate([0,0,5])outside_holder();





