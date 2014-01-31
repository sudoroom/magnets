tall = 30; // how tall of a U

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

// complete single U-shape
module bar(gap,thick) {
	dome(gap=gap, thick=thick);
}

// two U-shapes together
module du(thick, gap) {
	for (i=[0,1]) {
		bar(gap=(gap + thick*i*0.9), thick=thick);
	}
}

difference() {
	translate([0,10,0]) du(thick=11, gap=1.25);

	// magnet hole
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
