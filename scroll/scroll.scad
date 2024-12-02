$fn = $preview ? 32: 128;

font="Nimbus Roman No9 L:style=Italic";

font_size=5;

module text_1(){
    translate([-.75,7.7,17.25])rotate([-28,0,0])linear_extrude(2)text("I", size=font_size,font=font);
}

module text_2(){
    translate([-6,1.8,17.8])rotate([-2,0,0])linear_extrude(2)text("Love", size=font_size,font=font);
}


module text_3(){
    translate([-8,-4.2,15.8])rotate([24,0,0])linear_extrude(2)text("Books", size=font_size,font=font);
}


module scroll(){
    rotate([-90,0,90]){
        translate([-105,10,-15])import("scroll_blank.stl");
    };
}



difference(){
    scroll();
    text_1();
    text_2();
    text_3();
}


*text_1();
*text_2();
*text_3();


