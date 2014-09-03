ratio=0.5;

difference() {
		union() {
			translate([-50,-100,0])
				scale([ratio,ratio,10])
				linear_extrude(height=0.1)
				import("omni.dxf");
			difference() {
				sphere(r=6,$fn=30);
				translate([-6,-6,-12]) cube([12,12,12]);
			}
		}
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}

//#cube([10,10,10]);