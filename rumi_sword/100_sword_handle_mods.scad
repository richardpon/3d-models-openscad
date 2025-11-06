include <../settings.scad>

difference(){
    translate([0,0,-150])import("Handle 1.stl");
    translate([0,0,53.25])cube([30,4.4,3], center=true);
}