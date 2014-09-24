r=1.1;
s=4;

difference() {
	translate([-75.25,-13])
		scale([r,r,r])
		minkowski() {
			linear_extrude(height=0.1)
				import("abolish.dxf");
			difference() {
				sphere(r=s,$fn=8);
				translate([-s*3,-s*3,-s*6]) cube([s*6,s*6,s*6]);
			}
		}
	translate([0,0,0.3])  cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
