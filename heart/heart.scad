difference() {
	translate([-12,-12,0]) minkowski() {
		linear_extrude(height=4) union() {
			square(24,24);
			translate([24,12,0]) scale([1.9,1]) circle(12);
			translate([12,24,0]) scale([1,1.9]) circle(12);
		}
		difference() {
			sphere(r=6,$fn=20);
			translate([-6,-6,-12]) cube([-12,-12,-12]);
		}
	}
	translate([0,0,0.25])    cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1])  cylinder(0.2,0.5,0.5);
	translate([-50,-50,-50]) cube([100,100,50]);
}
