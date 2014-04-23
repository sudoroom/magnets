module arrow(l = 10, t = 2.5) {
	polygon(points=[[0,0],[l,-l],[l-t,-l-t],[0,-2*t],[-l+t,-l-t],[-l,-l]],paths=[[0,1,2,3,4,5,6]]);
}

module arm(f = false,m = false) {
	translate([-2.5,21]) square([5,30]);
	if (f) {
		translate ([-10,33]) square([20,5]);
	}
	if (m) {
		translate([0,30])
			arrow(10,2.5);
	}
}

linear_extrude(height=10) {
	difference() {
		circle(r=25,$fn=100);
		circle(r=20,$fn=100);
	}
	arm(f = true, m = true);
	rotate(a=120, v=[0,0,1]) arm(m = true);
	rotate(a=240, v=[0,0,1]) arm(f = true);
}