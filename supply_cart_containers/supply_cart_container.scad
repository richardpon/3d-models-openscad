include <../lib/settings.scad>

part_radius=40;
w=132 - 2*part_radius;
d=132 - 2*part_radius;

wall_thickness=4;
height=115;


stacking_cutout_clearance = .2;
stacking_cutout_height=5;



module outside_footprint(){
    offset(r=part_radius)square([w,d], center = true);
}


module wall_shape(){
    difference(){
        outside_footprint();
        offset(delta=-wall_thickness)outside_footprint();
    }
}
/*
module stacking_cutout(){
    linear_extrude(height=stacking_cutout_height)
    offset(r=stacking_cutout_clearance)
    wall_shape();
}

module inside_lip(){

    linear_extrude(height=stacking_cutout_height)
    difference(){
        offset(delta=-wall_thickness+.1)outside_footprint();
        offset(delta=-wall_thickness*2-+.1)outside_footprint();
    }   
}
*/

module cross_hatch(){
    width = w+2*part_radius+.1;
    translate([0,0,height/2])cube([width,wall_thickness, height-5], center=true);
    translate([0,0,height/2])cube([wall_thickness,width, height-5], center=true);
}

module finished_container(){
    difference(){
        union(){
            linear_extrude(h=wall_thickness)outside_footprint();
            linear_extrude(h=height)wall_shape();
            cross_hatch();
        }
//        stacking_cutout();
    }
}



finished_container();
//translate([0,0,0])inside_lip();

//cross_hatch();