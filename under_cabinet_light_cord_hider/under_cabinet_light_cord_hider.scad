//use <../settings.scad>

$fn = $preview ? 32: 32;

r_inner=10;
oval_width=20;
r_thickness=2;
height=10;
r_fillet=2;

module outline(){
    hull(){
        translate([oval_width/2,0,0])circle(r=r_inner);
        translate([-oval_width/2,0,0])circle(r=r_inner);
    }
}

module outer() {
    minkowski(){
        outline();
        circle(r=r_thickness);
    }
}

module hollow(){
    difference(){
        outer();
        outline();
    }
}


module hollow_and_extruded(height){
    linear_extrude(height){
        hollow();
    }
}
module add_fillet(height, should_add){
    if (should_add) {
        minkowski(){
            hollow_and_extruded(height);
            sphere(r=r_fillet);
        }  
    } else {
            hollow_and_extruded(height);
    }
        
}


union(){
//    translate([0,0,140])add_fillet(10, true);
//    translate([0,0,5])add_fillet(140, false);
  //  add_fillet(10, true);
}

module rim(){
    minkowski(){

        linear_extrude(1)hollow();
        sphere(r=r_fillet);
    }
}

//translate([0,0,142.9])rim();
//translate([0,0,2.99])add_fillet(140, false);
//rim();

add_fillet(150, false);