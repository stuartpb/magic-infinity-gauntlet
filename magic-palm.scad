module palmBase() {
  color("gold")
    rotate([11,1,0])
    translate([-3.75,-238.4,-44.9])
    import("Palm_remeshed.stl", convexity = 5);
}

module magicPalm () {
  union () {
    difference() {
      palmBase();
      scale(.99) hull() import("icon-holder.stl");
    }
    color("gold") // change this color to help find the intersection
      import("icon-holder.stl");
  }
}

$fn = 180;
gap = 0;

module discPalmBase () {
  translate([.05,-.35,0]) magicPalm();
}

module discBase (tol = 0) {
  union () {
    scale([0.995,1.02,1]) cylinder(d=40+tol, h=10);
    translate([0,0,-10]) scale([30+tol,40+tol,1]) cylinder(d=1, h=15);
  }
}

module palmDiscOut () {
  difference () {
    discPalmBase();
    discBase(gap);
  }
}

module palmDiscPart () {
  intersection () {
    discPalmBase();
    discBase(-gap);
  }
}

module discTestPiece () {
  intersection () {
    palmDiscOut();
    translate([0,.125,-15]) scale([0.995,1.02,1]) cylinder(d=57.5, h=30);
  }
}

magicPalm();
//tolTestPiece();
//palmDiscOut();
//palmDiscPart();
