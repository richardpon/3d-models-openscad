include <../settings.scad>

// Medal
module base_medal(){
    union(){
        translate([0,0,-8.4])rotate([90,0,90])import("Medal1V3.stl");
        translate([0,0,-1.42])linear_extrude(3, center=true)circle(r=30);
    }
}


engrave_depth=.5;

module graphics(){
    scale_factor=.4;
    translate([0,2,-engrave_depth]) 
    translate([0,1.5,1.58])
    linear_extrude(3, center=true)
    scale([scale_factor,scale_factor,1])import("dragon-boat-medal-design-cropped-removed-small-text.svg", center= true, dpi=300);
}

module text1(){
    translate([0,-20,.41-engrave_depth])
    linear_extrude(engrave_depth+.2, center=true)
    text("DRAGON BOAT", font="ARIAL:style=Bold", size=4, halign="center");
}

module text2(){
    translate([0,-26,.41-engrave_depth])
    linear_extrude(engrave_depth+.2, center=true)
    text("FESTIVAL", font="ARIAL:style=Bold", size=4, halign="center");
}

module medal_with_graphics(){
    difference(){
        base_medal();
        graphics();
        text1();
        text2();
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



union(){
    medal_with_graphics();
    loop_top();
    translate([0,0,2])hook_sides();
    translate([0,-2,2])hook_sides();
    translate([0,-4,2])hook_sides();
}