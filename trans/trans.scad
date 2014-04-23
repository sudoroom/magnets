module arm(f = false,m = false) {
	translate([-2.5,21]) square([5,30]);
	if (f) {
		translate ([-10,33]) square([20,5]);
	}
	if (m) {
		translate([0,54])
			polygon(points=[[0,0],[10,-10],[7.5,-12.5],[0,-5],[-7.5,-12.5],[-10,-10]],paths=[[0,1,2,3,4,5,6]]);
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