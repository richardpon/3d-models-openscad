include <../settings.scad>

module rounder(){
    union(){
        translate([0,0,90])scale([1,.5,.5])sphere(20);
        translate([0,0,-10])cube([100,100,200], center=true);
    }
}

intersection(){
    rotate([180,0,0])translate([0,0,550])import("Dowel Blade 5.stl");
    translate([0,0,-27])rounder();
}

