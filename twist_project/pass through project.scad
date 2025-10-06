$fn = $preview ? 32: 128;

r_spiral = 15;

r_arm_smoothing=.2;
r_arm = 3 + 2*r_arm_smoothing;
w_arm = 1 + 2*r_arm_smoothing;


part_clearance=.8;

height=40;


r_sphere=30;

module arm(){
    offset(r=-r_arm_smoothing) {
        hull(){
            translate([r_spiral,0,0])circle(r = r_arm);
            translate([r_spiral*4/5,0,1])circle(r=w_arm/2);
        }
        translate([r_spiral/2-r_arm_smoothing,0,0])square([r_spiral,w_arm], center = true);
    }
}

module arms(should_offset){
    clearance = (should_offset)? part_clearance : 0;
    
    for (angle = [0:45:360]){
        rotate([0,0,angle])offset(r=clearance)arm();
    }
}

module spiral(should_offset = false) {
    linear_extrude(height=height*1, twist=-180*1){
        arms(should_offset);
    }    
}

module inside_part(){
    intersection(){
        translate([0,0,10])sphere(r=30);
        translate([0,0,30])sphere(r=30);
        spiral();
    }

}


module outside_part(){
    difference(){
        intersection(){
            translate([0,0,r_sphere-10])sphere(r=r_sphere);
            translate([0,0,height/2])cube([100,100,height-.1], center=true);
        }
        spiral(true);
        translate([0,0,65])sphere(r=30);    
        translate([0,0,-25])sphere(r=30);    
    }    
}


//inside_part();
//outside_part();

intersection(){
//    translate([0,0,25])cube([50,50,20], center = true);
    inside_part();
    //outside_part();
}

