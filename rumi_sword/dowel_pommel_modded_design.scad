include <../settings.scad>


module pommel(){
    translate([0,0,-200])import("Dowel Pommel.stl");
}


difference(){
    pommel();
    translate([0,0,1.72])cube([60,10,1], center=true);
}
