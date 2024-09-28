$fn = $preview ? 32: 128;

// book dimentions
depth = 7;
height = 50;
width = 30;


// Used to calculate the curvature of the binding
// Note: Only works for smallish values, as large values extend the width of the book shape
binding_curve_distance=3;

// Small overlap to ensure parts have some overlap when they would otherwise exactly touch
overlap=.01;

// internal values for the binding
_opposite = depth/2;
_binding_radius = _opposite / sin(atan(_opposite/binding_curve_distance));
_binding_thickness = _binding_radius - binding_curve_distance;


module base_book_shape() {
    cube([width, depth, height], center= true);
}

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
    ensure_book_depth_plane()create_binding_half_cylinder();
    base_book_shape();
}

book();
