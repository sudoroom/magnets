ratio=0.5;

difference() {
	translate([7,0,0])
		minkowski() {
			translate([-50,-100,0])
				scale([ratio,ratio,10])
				linear_extrude(height=0.1)
				import("omni.dxf");
			difference() {
				scale([0.5,0.5,1]) sphere(r=6,$fn=14);
				translate([-6,-6,-12]) cube([12,12,12]);
			}
		}
//	cube([20,20,20]);
	translate([0,0,0.3])  cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}

//#cylinder(10,6.75,6.75);
//#cube([10,10,10]);
