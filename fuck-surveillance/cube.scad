cl = 45; // camera length
cw = 25; // camera width
wd = 8;  // word depth
ca = 10;  // crack angle
cd = 20; // crack depth

inf = cl * 10;   // "infinity"
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

module shard(a = 0,s = 1) {
	translate([cd,12,cw/2])
		rotate([a,0,0])
		scale([0.2,s*1,1])
		cylinder(cw*3,cw,cw,$fn=3,center=true);
}
module shards() {
	translate([-cw,-cw/2,-cw/2])
		cube([cw+cd+0.01,cw*2,cw*2]);
	shard(270,1);
	shard(0,1.3);
	shard(300,0.8);
	shard(20,0.3);
	shard(230,0.1);
}
module crack() {
	translate([cd,0,0])
		rotate(a=-ca,v=[0,0,1])
		translate([-cd,0,0])
		difference() {
			child();
			shards();
		}
	intersection() {
		child();
		shards();
	}
}

module lens() {
	difference() {
		cylinder(7.5,10,10);
		cylinder(8.5,9,9);
	}
	scale([1,1,0.75])
		rotate([-45,45,0])
		sphere(r=10,$fn=40);
}

module bat(s = 6) {
	hull() {
		sphere(r=s*1.6,$fn=30);
		translate([s*15,0,0]) sphere(r=s/2,$fn=30);
	}
	translate([s*15,0,0])
		scale([s*0.14,1,1])
		sphere(r=s,$fn=30);
}

module corner_tilt(x,y) {
	rotate(a=atan(x/sqrt(pow(x,2)+pow(y,2))),v=[x,y,0])
		child();
}

difference() {
	translate([-22,-7,0]) union() {

		// camera
		ground()
			scale([1,1,0.24]) {

				// camera
				corner_tilt(x=cl,y=cw)
					crack()
					union() {
						cube([cl,cw,cw]);
						translate([3,cw/2,cw/2])
							rotate([0,-90,0])
							lens();
					}

				// bat
				translate([40,18,10])
					scale([1,1,3])
					rotate([0,3,18])
					bat(4);
			}

		intersection() {
//			translate([25,7,0]) scale([1,1,0.1663]) sphere(r=50,$fn=100);
			union() {

		// fuck
		translate([38,-5])
			linear_extrude(wd)
			scale([1.1,1.1])
			import("no.dxf");

		// surveillance
		translate([37,-14])
			linear_extrude(wd)
			scale([0.31,0.7])
			import("pictures.dxf");

			}
		}
	}

	// magnet holes
	translate([0,0,0.3])  cylinder(1.75,6.5,6.5);
	translate([0,0,-0.1]) cylinder(1.75,0.5,0.5);
}
