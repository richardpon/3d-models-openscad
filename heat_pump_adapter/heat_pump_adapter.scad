$fn = $preview ? 32: 128;

linear_extrude(height=222){
    difference(){
        square([47, 65]);
        translate([15,9.99,0])square([6,6]);     //bottom rail slider
        translate([5,-.01,0])square([37,10.01]); //bottom
        translate([16,55.01,0])square([14,10]);  //top holder 
        translate([0,25.01,0])square([5,40]);  //top left save material
        translate([42.01,25.01,0])square([5,40]);  //top right save material
    }
}