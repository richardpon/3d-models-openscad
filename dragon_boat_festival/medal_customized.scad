include <../settings.scad>


translate([0,0,-8.4])rotate([90,0,90])import("Medal1V3.stl");


translate([0,0,-1.42])linear_extrude(3, center=true)circle(r=30);