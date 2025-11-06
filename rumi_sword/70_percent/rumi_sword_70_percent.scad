include <../../settings.scad>


//import("Handle 2.stl");


module pommel(){
    
    difference(){
        translate([0,0,53.8])import("70% Pommel.stl");
        translate([0,0,-24.6])cube([50,50,50], center=true);
    }
            
}


//cube([50,10,10], center=true);
module wedge(){
    rotate([45,0,0])cube([10,2,2], center=true);
}






module handle(){
    difference(){
    translate([0,0,53])import("Handle 1.stl");
    translate([0,0,-.3])cube([20,3.1,1], center=true);
    }
}

handle();
//pommel();