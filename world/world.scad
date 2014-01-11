difference() {
	scale([1,1,0.175]) sphere(r=24,$fn=40);
	translate([0,0,0.3])     cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1])    cylinder(1.75,0.5,0.5);
	translate([-50,-50,-50]) cube([100,100,50]);
}
