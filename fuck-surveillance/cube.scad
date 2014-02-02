cl = 50; // camera length
cw = 30; // camera width
wd = 2;  // word depth

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
	scale([1,1,0.75]) sphere(r=10,$fn=13);
}

module corner_tilt(x,y) {
	rotate(a=atan(x/sqrt(pow(x,2)+pow(y,2))),v=[x,y,0])
		child();
}

ground() scale([1,1,0.15])
	corner_tilt(x=cl,y=cw)
	union() {
		cube([cl,cw,cw]);

		// lens
		translate([3,15,15]) rotate([0,-90,0]) lens();

		// fuck
		translate([-15,cw-1,60])
			rotate([-90,0,0])
			scale([1,2,1])
			linear_extrude(wd + 1)
			import("fuck.dxf");

		// surveillance
		translate([5,-2,cw-1])
			scale([0.5,1,1])
			linear_extrude(wd + 1)
			import("surveillance.dxf");
	}
