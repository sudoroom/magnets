ratio=0.6;

difference() {
	translate([-50,-100,0])
		scale([ratio,ratio,1])
//		minkowski() {
			linear_extrude(height=0.1)
				import("omni.dxf");
//			difference() {
//				sphere(r=0.9,$fn=30);
//				translate([-3,-3,-6]) cube([6,6,6]);
//			}
//		}
//	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
//	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}

//#cube([10,10,10]);