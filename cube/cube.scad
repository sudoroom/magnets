inf = 100;   // "infinity"
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

ground() scale([1,1,0.15])
	rotate(a=35.265,v=[1,1,0])
	union() {
		cube([30,30,40]);
		translate([3,15,15]) rotate([0,-90,0]) lens();
	}
