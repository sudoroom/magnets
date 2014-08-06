difference() {
	translate([-60,-90,0])
		scale([15,15,1])
		linear_extrude(height=5)
		import("duck.dxf");
	translate([0,0,0.3])  cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
