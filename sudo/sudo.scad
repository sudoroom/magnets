difference() {
	scale([4,4])
	translate([-34,-10,0]) minkowski() {
		linear_extrude(height=0.1)
			import("shrunk.dxf");
		difference() {
			sphere(r=3,$fn=13);
			translate([-1,-1,-2]) cube([2,2,2]);
		}
	}
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
