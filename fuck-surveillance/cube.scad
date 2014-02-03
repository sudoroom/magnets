cl = 50; // camera length
cw = 30; // camera width
wd = 8;  // word depth

inf = cl * 4;   // "infinity"
zer = 0.001; // "zero"

module ground() {
	difference() {
		minkowski() {
			translate([0,0,(zer-inf)])
				cylinder(inf,zer,zer,$fn=3);
			child();
		}
		translate([-inf/2,-inf/2,-2*inf])
			cube([inf,inf,2*inf]);
	}
}

module lens() {
	difference() {
		cylinder(7.5,10,10);
		cylinder(8.5,9,9);
	}
	scale([1,1,0.75])
		rotate([-45,45,0])
		sphere(r=10,$fn=40);
}

module corner_tilt(x,y) {
	rotate(a=atan(x/sqrt(pow(x,2)+pow(y,2))),v=[x,y,0])
		child();
}

difference() {
	translate([-20,-8,0]) union() {

		// camera
		ground()
			scale([1,1,0.2])
			corner_tilt(x=cl,y=cw)
			union() {
				cube([cl,cw,cw]);
				translate([3,15,15])
					rotate([0,-90,0])
					lens();
			}

		// fuck
		translate([-5,-20])
			linear_extrude(wd)
			scale([0.93,1.5])
			import("fuck.dxf");

		// surveillance
		translate([15,-8])
			linear_extrude(wd)
			scale([0.35,1])
			import("surveillance.dxf");
	}

	// magnet holes
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
