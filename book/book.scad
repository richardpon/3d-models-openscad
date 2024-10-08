$fn = $preview ? 32: 128;

// book dimentions
book_depth = 7;
book_height = 40;
book_width = 30;

cover_thickness = .5;
binding_width = 1;

// Used to calculate the curvature of the binding
// Note: Only works for smallish values, as large values extend the width of the book shape
binding_curve_distance=5;

// Small overlap to ensure parts have some overlap when they would otherwise exactly touch
overlap=.01;

// internal values for the binding
_opposite = book_depth/2;
_binding_radius = _opposite / sin(atan(_opposite/binding_curve_distance));
_binding_thickness = _binding_radius - binding_curve_distance;


module base_book_shape() {
    cube([book_width, book_depth, book_height], center= true);
}

// creates half cylinder to interesect with base book shape
// Moves to correct place at end of book
module create_binding_half_cylinder() {
    translate([-book_width/2+_binding_radius-_binding_thickness,0,0])
    intersection(){
        cylinder(h = book_height, r = _binding_radius, center=true);
        translate([-_binding_radius/2,0,0])
        cube([_binding_radius, _binding_radius*2, book_height+overlap], center=true);
    }
    
}

//cut off extra portions of cylinder, or anything outside the plane of the book
module ensure_book_depth_plane() {
    intersection(){
        children();
        cube([1000, book_depth, 1000], center=true);
    }
}


module ensure_binding_overhangs_pages_on_end() {
    difference(){
        children();
        translate([book_width/2-cover_thickness/2,0,0]) {
            cube([cover_thickness+overlap, book_depth-2*cover_thickness, book_height+overlap], center=true);
        }
    }
}

module ensure_binding_overhangs_pages_on_top_or_bottom(direction) {
    difference(){
        children();
        translate([binding_width,0,direction*book_height/2-direction*cover_thickness/2]) {
            cube([book_width-cover_thickness/2, book_depth-2*cover_thickness, cover_thickness+overlap], center=true);
        }
    }
}

module base_book_shape_with_binding() {
    ensure_book_depth_plane()create_binding_half_cylinder();
    base_book_shape();
}

module book() {
    ensure_binding_overhangs_pages_on_top_or_bottom(1)
        ensure_binding_overhangs_pages_on_top_or_bottom(-1)
            ensure_binding_overhangs_pages_on_end()
                base_book_shape_with_binding();
}

book();


