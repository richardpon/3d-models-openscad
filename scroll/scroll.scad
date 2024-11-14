$fn = $preview ? 32: 128;


difference(){
    rotate([-90,0,90]){
        translate([-105,10,-15])import("scroll_blank.stl");
    };

    translate([0,2,19.5])linear_extrude(2)text("hello", size=5);
}