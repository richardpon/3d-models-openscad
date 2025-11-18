$fn = $preview ? 32: 128;

font="Nimbus Roman No9 L:style=Italic";

font_size=5.5;

module book(){
    rotate([0,0,0]){
        translate([-60,-80,0])import("book_3.stl");
    };
}

module text1(){
    translate([13.7,1.6,2])rotate([90,0,0])linear_extrude(2)text("2025", size=font_size,font=font);
}


difference(){
    book();
    text1();
}


//book();
//text1();


