include <../settings.scad>

//import("Handle 1.stl");
//import("Handle 2.stl");
//import("Dowel Pommel.stl");

translate([0,0,35])sphere(r=3.625);

scale([.7,.7,.7])translate([0,0,-36])import("Handle 2.stl");

//translate([0,5,2])cube([10,10,10], center=true);