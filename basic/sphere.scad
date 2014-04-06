difference() {
	sphere(r=20,$fn=300);
	translate([-20,-20,-40]) cube([40,40,40]);
	translate([0,0,0.3])     cylinder(2,7,7);
	translate([0,0,-0.1])    cylinder(2,0.5,0.5);
}
