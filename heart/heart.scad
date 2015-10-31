difference() {
	translate([-10,-10,0]) minkowski() {
		linear_extrude(height=0.1) union() {
			square(20,20);
			translate([20,10,0]) scale([1.9,1]) circle(10);
			translate([10,20,0]) scale([1,1.9]) circle(10);
		}
		difference() {
			sphere(r=5,$fn=15);
			translate([-5,-5,-10]) cube([10,10,10]);
		}
	}
	translate([0,0,0.3])     cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1])    cylinder(1.75,0.5,0.5);
	translate([-50,-50,-50]) cube([100,100,50]);
}
