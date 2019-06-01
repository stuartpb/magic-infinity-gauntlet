use <superellipse.scad>;

$fn = 90;

icon_depth = 7.85;
icon_length = 30.45;
icon_width = 26.3;

/*
e = .9;
t = .6;
it = 1-t;
id = icon_depth;
iil = icon_length - icon_depth;
iiw = icon_width - icon_depth;

hull () {
  translate([0,-iil*it/2,0]) scale([iiw/id*e,iil/id*t,1]) sphere(d=id);
  translate([0,iil*it/2,0]) scale([iiw/id*e,iil/id*t,1]) sphere(d=id);
  translate([-iiw*it/2,0,0]) scale([iiw/id*t,iil/id*e,1]) sphere(d=id);
  translate([iiw*it/2,0,0]) scale([iiw/id*t,iil/id*e,1]) sphere(d=id);
}
*/

sepow = .87;

scale([icon_width, icon_length, icon_depth])
superellipse(power1=sepow, power2=sepow, steps=$fn, ysteps=$fn);