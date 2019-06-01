union () {
  difference() {
    color("gold") rotate([11,1,0]) translate([-3.9,-238.55,-46]) import("Palm.stl");
    scale(.99) hull() import("icon-holder.stl");
  }
  color("red") import("icon-holder.stl");
}
