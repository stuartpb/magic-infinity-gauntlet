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

magicPalm();
