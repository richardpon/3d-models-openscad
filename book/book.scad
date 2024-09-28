$fn = $preview ? 32: 128;

depth = 7;
height = 50;
width = 30;
binding_thickness=3;
// Larger means less curvature to binding
binding_curve_distance=binding_thickness*1;
//paper_to_cover=2;
overlap=.01;

// internal values for the binding
_opposite = depth/2;
_binding_radius = _opposite / sin(atan(_opposite/binding_curve_distance));
_binding_thickness = _binding_radius - binding_curve_distance;

//difference(){

module base_book_shape() {
//    translate([width/2,0,0])
        cube([width, depth, height], center= true);
}

/*
OLD - shape is too rounded
module binding_old(){
    difference(){
        cylinder(h = height, r = depth/2, center= true);
        translate([width/2,0,0])
            cube([width, depth, height+overlap], center= true);
        translate([width/2-width-binding_depth,0,0])
            cube([width, depth, height+overlap], center= true);
    }
}
*/


// creates half cylinder to interesect with base book shape
// Moves to correct place at end of book
module create_binding_half_cylinder() {
    

    translate([-width/2+_binding_radius-_binding_thickness,0,0])
    intersection(){
        cylinder(h = height, r = _binding_radius, center=true);
        translate([-_binding_radius/2,0,0])
        cube([_binding_radius, _binding_radius*2, height+overlap], center=true);
    }
    
}

//cut off extra portions of cylinder, or anything outside the plane of the book
module ensure_book_depth_plane() {
    intersection(){
        children();
        cube([1000, depth, 1000], center=true);
    }
}


module book() {
    
    ensure_book_depth_plane(){
        create_binding_half_cylinder();
        base_book_shape();
    }

}

// add_binding() only adds a cylinder to the base_book_shape() children
module add_binding() {
    union() {
        translate([0,0,-1])cylinder(h = height, r = radius, center=true);
        children();
    }
}




//translate([0,0,-1])create_binding_half_cylinder();
//base_book_shape();


book();

module debug(){
    translate([0,0,1])children();
}