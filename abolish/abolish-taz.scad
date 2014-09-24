r=0.9;
s=4;

difference() {
	translate([-61.5,-11.5])
		scale([r,r,r])
		minkowski() {
			linear_extrude(height=0.1)
				import("abolish.dxf");
			difference() {
				sphere(r=s,$fn=8);
				translate([-s*3,-s*3,-s*6]) cube([s*6,s*6,s*6]);
			}
		}
	translate([0,0,0.3])  cylinder(2,7,7);
}
