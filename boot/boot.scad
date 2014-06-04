module ankle() {
	translate([0,-45,-30])
		linear_extrude(1)
		scale([0.9,1.5]) circle(r=20,$fn=30);
}

module button() {
	scale([1,0.7,1]) sphere(r=3,$fn=40);
}

module stps() {
	minkowski() {
		translate([-20,-65,0])
			scale([0.27,0.55,1])
			linear_extrude(0.01)
			import("smash.dxf");
		scale([1,1,1.5]) sphere(r=1,$fn=10);
	}
}

module boot() {
	// foot
	hull() {
		union() {
			difference() {
				scale([1.2,2,1.1])
					sphere(r=20,$fn=50);
				translate([-50,-50,0])
					cube([100,100,100]);
			}
			translate([0,0,-1])
				linear_extrude(1)
				translate([0,-35])
				scale([1.1,2.3])
				circle(r=20);
		}
		ankle();
	}

	// leg
	difference() {
		hull() {
			ankle();
			translate([0,-45,-80])
				linear_extrude(1)
				scale([1.05,1.65])
				circle(r=20,$fn=100);
		}
		translate([0,-14.5,-90])
			scale([600,40,45])
			rotate([0,0,45])
			cube([1,1,1]);
	}
	translate([0,-14,-50]) button();
	translate([0,-14,-60]) button();
	translate([0,-14,-70]) button();
}

rotate([20,-35,20]) boot();
