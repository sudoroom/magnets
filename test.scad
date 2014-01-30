scale([0.6,1,1]) union() {
translate([0,0,1.25]) difference() {
	rotate([90,0,0]) cylinder(30,15,15,$fn=200);
	rotate([90,0,0]) translate([0,0,0.25])
		cylinder(29.5,14.5,14.5,$fn=200);
	translate([-16,-31,-16]) cube([32,32,16]);
//	translate([-5,-35,0]) cube([10,50,10]);
}
difference() {
	linear_extrude(height=1.25)
		translate([-15,-30])
		square([30,30]);
	translate([0,-15,-0.1]) cylinder(1.75,0.5,0.5);
}
}
