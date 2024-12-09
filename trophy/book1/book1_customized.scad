$fn = $preview ? 32: 128;

font="Nimbus Roman No9 L:style=Italic";

font_size=5.5;

module book(){
    translate([10,0,0])
    rotate([0,180,0])
    rotate([0,0,45]){
        translate([-120,-50,-11.75])import("book_1.stl");
    };
}

module text1(){
    translate([-20,-5.3,3.3])rotate([90,0,0])linear_extrude(2)text("READ-A-THON", size=font_size,font=font);
}


difference(){
    book();
    text1();
}


//text1();
