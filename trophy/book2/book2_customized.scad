$fn = $preview ? 32: 128;

font="Nimbus Roman No9 L:style=Italic";

font_size=5.5;

module book(){
    translate([3.8,23,0])
    rotate([0,180,0])
    rotate([0,0,112.5]){
        translate([-95,-130,-5])import("book_2.stl");
    };
}

module text1(){
    translate([12,1.5,-2.4])rotate([90,0,0])linear_extrude(2)text("ORION", size=font_size,font=font);
}


difference(){
    book();
    text1();
}


//book();
//text1();


