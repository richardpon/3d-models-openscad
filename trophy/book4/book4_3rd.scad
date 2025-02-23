$fn = $preview ? 32: 128;

font="Nimbus Roman No9 L:style=Italic";

font_size=18;
ordinal_size=5.5;

text_number="3";
text_ordinal="rd";


module book(){
    rotate([0,0,-45]){
        translate([15,40,-8])import("book_4_blank.stl");
    };
}

module text1(){
    translate([-10,-10,-.8])rotate([0,0,0])linear_extrude(2)
    offset(r=.75)
    text(text_number, size=font_size, font=font);
}

module text2(){
    translate([3,1,-.8])rotate([0,0,0])linear_extrude(2)
    offset(r=.2)
    text(text_ordinal, size=ordinal_size, font=font);
}


difference(){
    book();
    text1();
    text2();
}



//book();
//text1();
//text2();


