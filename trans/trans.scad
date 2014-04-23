module arm() {
	translate([-2.5,21]) square([5,30]);
}

linear_extrude(height=10) {
	difference() {
		circle(r=25,$fn=100);
		circle(r=20,$fn=100);
	}
	arm();
	rotate(a=120, v=[0,0,1]) arm();
	rotate(a=240, v=[0,0,1]) arm();
}