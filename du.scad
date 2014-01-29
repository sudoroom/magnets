tall = 40; // how tall of a U

// primitive 2D U-shape
module yoo(r) {
	union() {
		circle(r=r,$fn=20);
		translate([-r,0,0])
			square([2*r,tall]);
	}
}

// hemisphere to minkowski with
module hemisphere(r) {
	difference() {
		sphere(r=r,$fn=12);
		translate([-r,-r,-2*r]) cube([2*r,2*r,2*r]);
	}
}

// dome of a U-shape
module dome(gap, thick, pad = 0) {
	minkowski() {
		linear_extrude(height=1.5) difference() {
			yoo(r=(gap + thick - (thick/2) + 0.1));
			yoo(r=(gap + thick - (thick/2) - 0.1));
		}
		hemisphere(r=(thick/2 - pad));
	}
}

// flat bottom of a U-shape
module bed(w,h) {
	translate([-w/2,-w/2,0]) cube([w,w,h]);
}

// complete single U-shape
module bar(gap,thick) {
	// the flat bed
	intersection() {
		dome(gap=gap, thick=thick);
		bed(w=tall*thick,h=1.25);
	}
	// the hollow dome
	difference() {
		dome(gap=gap, thick=thick);
		dome(gap=gap, thick=thick, pad=0.25);
	}
}

// two U-shapes together
module du(thick, gap) {
	for (i=[0,1]) {
		bar(gap=(gap + thick*i), thick=thick);
	}
}

// housing for the magnet hole
module maghouse(r,h) {
	cylinder(h,r,r);
	rotate([0,0,a])
		translate([-r,0,0])
		cube([2*r,r,h]);
}

// transform along with the whole DU
module du_tf() {
	translate([10,-25,0]) child();
}

// transform along with the SE text area
module caption() {
	du_tf() translate([1,-20,0])
		scale([0.2,0.2,1])
		rotate([0,0,28])
		child();
}

difference() {
	union() {
		du_tf() du(thick=9, gap=1);
		maghouse(r=7.55,h=2.5,a=60);

		// "double union" text
		caption() intersection() {
			linear_extrude(height=5)
				import("text.dxf");
			translate([50,19,0])
				scale([8,3,0.35])
				sphere(r=10,$fn=40);
		}
	}

	// magnet hole
	translate([0,0,0.3])     cylinder(1.75,6.5,6.5);

	// topology pinholes
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
	translate([13,-37.75,-0.1]) cylinder(1.75,0.5,0.5);

	// see through the ceiling during development
//	translate([-40,-45,3.5]) cube([80,80,10]);
}

/*/ old magnet sphere for reference
translate([-50,0,0]) difference() {
       scale([1,1,0.3]) sphere(r=24,$fn=40);
       translate([-50,-50,-50]) cube([100,100,50]);
}*/
