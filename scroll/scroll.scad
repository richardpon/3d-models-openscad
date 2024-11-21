$fn = $preview ? 32: 128;


module text_1(){
    translate([-.75,7.7,18])rotate([-25,0,0])linear_extrude(2)text("I", size=4);
}

module heart(){
    translate([-.2,6,18.4])rotate([-2,0,0])scale([.2,.2,1])import("heart.stl");
}

module text_2(){
    translate([-9,-4.2,16.8])rotate([24,0,0])linear_extrude(2)text("Reading", size=4);
}


module scroll(){
    rotate([-90,0,90]){
        translate([-105,10,-15])import("scroll_blank.stl");
    };
}



difference(){
    scroll();
    text_1();
    heart();
    text_2();
}


*text_1();
*text_2();
*heart();


