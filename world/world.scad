difference() {
	union() {
		scale([1,1,0.3]) sphere(r=24,$fn=40);
		intersection() {
			scale([1,1,0.3]) sphere(r=25,$fn=40);
			translate([-35,-24,0])
				scale([0.24,0.24,1])
				linear_extrude(height=9)
				import("world.dxf");
		}
	}
	translate([0,0,0.3])     cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1])    cylinder(1.75,0.5,0.5);
	translate([-50,-50,-50]) cube([100,100,50]);
}
