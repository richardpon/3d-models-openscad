include <../settings.scad>

max=1000;

// overall box dimentions
w_box=195;
d_box=115;
h_box=100;

// wall thickness
wall=5;

d_salt_pepper=50;

w_lotion=55;
d_lotion=100;

w_brush=70;
d_brush=45;

d_sunscreen=55;

module organizer(){
    difference() {
        
        cube([w_box,d_box,h_box]);
        
        
        // Salt and Pepper cutouts
        translate([wall,wall,wall])cube([d_salt_pepper,d_salt_pepper,max]);
        translate([wall,d_box-wall-d_salt_pepper,wall])cube([d_salt_pepper,d_salt_pepper,max]);
        
        // Lotion Cutout
        translate([2*wall+d_salt_pepper,wall,wall])cube([w_lotion, d_lotion,max]);
        
        // HairBrush
        translate([3*wall+d_salt_pepper+w_lotion,d_box-d_brush-wall,wall])cube([w_brush,d_brush,max]);
        
        // sunscreen
        translate([3*wall+d_salt_pepper+w_lotion,wall])cube([d_sunscreen,d_sunscreen,max]);   
    }
}

// horizontal slice for testing
intersection(){
    organizer();
    translate([0,0,10])cube([max,max,10]);
}

