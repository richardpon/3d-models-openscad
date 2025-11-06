include <../settings.scad>


module crossguard(){
    translate([0,0,-3.5])import("Dowel Crossguard.stl");
}

hull(){
//    crossguard();
  //  linear_extrude(h=.1)projection()crossguard();
}
//crossguard();


module footprint(){
    projection()
    translate([0,0,0])crossguard();
}



module layer4(){
    linear_extrude(h=7.5)
    intersection(){
        projection(cut=true)
        translate([0,0,-7.2])crossguard();
        translate([0,0,0])square([120,3.84], center=true);
    }
}

module layer3(){
    linear_extrude(h=5.5)
    intersection(){
        projection(cut=true)
        translate([0,0,-5.5])crossguard();
        square([120,9], center=true);
    }
}

module layer2(){
    linear_extrude(h=3)
    intersection(){
        projection(cut=true)
        translate([0,0,-2.6])crossguard();
        square([80,13.6], center=true);
    }
}

module layer1(){
    linear_extrude(h=.2)
    projection(cut=true)
    translate([0,0,-.5])crossguard();
}




union(){
    crossguard();
    layer4();
    layer3();
    layer2();
    layer1();
}
