difference() {
	translate([-136,-45.86])
		scale([4,4,6])
		minkowski() {
			linear_extrude(height=0.1)
				import("shrunk.dxf");
			difference() {
				sphere(r=0.9,$fn=30);
				translate([-3,-3,-6]) cube([6,6,6]);
			}
		}
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
