$fn = $preview ? 32: 128;

// RADIUS!
opening_radius = 2.5;
small_radius = 5;
big_radius = 15;
length = 50;
tolerance=.001;


difference(){
    cylinder(h=length, r1=big_radius, r2=small_radius, center = true);
    cylinder(h=length+tolerance, r=opening_radius, center=true);
}