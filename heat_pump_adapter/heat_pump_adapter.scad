$fn = $preview ? 32: 128;


total_length=307;
total_thickness=50;
total_height=42; 

linear_extrude(height=total_length){
    difference(){
        square([total_thickness, total_height]);
        translate([15,9.99,0])square([6,6]);     //bottom rail slider
        translate([5,-.01,0])square([37,10.01]); //bottom
        translate([10,32.01,0])square([30,10]);  //top holder 
    }
}