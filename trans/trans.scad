module smoother(w=1.5) {
	cylinder(4,w,w,$fn=8);
	translate([0,0,3.999]) cylinder(2,w,w/2.5,$fn=8);
}

module arrow(l = 10, t = 2.5) {
	polygon(points=[[0,0],[l,-l],[l-t,-l-t],[0,-2*t],[-l+t,-l-t],[-l,-l]],paths=[[0,1,2,3,4,5,6]]);
}

module arm(f = false,m = false) {
	translate([-1,14])
		square([2,18]);
	if (f) {
		translate ([-8,19.5])
			square([16,2]);
	}
	if (m) {
		translate([0,33])
			arrow(8,1.4);
	}
}

minkowski() {
	linear_extrude(height=0.1) {
		difference() {
			circle(r=15,$fn=100);
			circle(r=13,$fn=100);
		}
		arm(f = true, m = true);
		rotate(a=120, v=[0,0,1]) arm(m = true);
		rotate(a=240, v=[0,0,1]) arm(f = true);
	}
	smoother(w=1);
}

difference() {
	linear_extrude(height=10)
		rotate(a=30, v=[0,0,1])
		circle(r=14.5,$fn=3);
	rotate(a=-4, v=[1,4,0])
		translate([-50,-50,4.75])
		cube([100,100,100]);
	translate([0,0,0.3])     cylinder(1.75,6.75,6.75);
	translate([0,0,-0.1])    cylinder(1.75,0.5,0.5);
}
