include <../settings.scad>

// Medal
module base_medal(){
    union(){
        // STL from https://www.thingiverse.com/thing:6708761
        translate([0,0,-8.4])rotate([90,0,90])import("Medal1V3.stl");
        translate([0,0,-1.42])linear_extrude(3, center=true)circle(r=30);
    }
}


stamp_height=.4;

module graphics(){
    scale_factor=.4;
    //translate([0,3.5,stamp_height/2-.001])
    translate([0,3.5,.41])
    linear_extrude(stamp_height+.2, center=true)
    scale([scale_factor,scale_factor,1])import("dragon-boat-medal-design-cropped-removed-small-text.svg", center= true, dpi=300);
}

module text1(){
    translate([0,-20,stamp_height])
    linear_extrude(stamp_height+.2, center=true)
    text("DRAGON BOAT", font="ARIAL:style=Bold", size=4, halign="center");
}

module text2(){
    translate([0,-26,stamp_height])
    linear_extrude(stamp_height+.2, center=true)
    text("FESTIVAL", font="ARIAL:style=Bold", size=4, halign="center");
}
/*
module outer_ring() {
    translate([0,0,-2.2+stamp_height])
    difference(){
        cylinder(h=5, r=33.28, center=true);
        cylinder(h=5+.002, r=32.28, center=true);
    }
}
*/
// graphics + text
module stamp(){
    graphics();
    text1();
    text2();


}


module medal_with_graphics(){
    union(){
        base_medal();
        stamp();
    }
}

module loop_top(){
    translate([0,0,2]) //added height here
    intersection(){
        medal_with_graphics();
        translate([0,50,-5])cube([30,10,10], center=true);
    }
}


module hook_sides(){
    intersection(){
        medal_with_graphics();
        translate([0,44,-5])cube([30,2,10], center=true);
    }
}


module medal_stamp(){
    union(){
        medal_with_graphics();
        loop_top();
        translate([0,0,2])hook_sides();
        translate([0,-2,2])hook_sides();
        translate([0,-4,2])hook_sides();
    }
}

difference(){
    medal_stamp();
    // shave the bottom to ensure flat
    translate([0,0,-13.25])cylinder(h=10, r=50,center=true);
}

