module Cover() {
SPHERE_RADIUS = 2.8;
    difference() {
        cylinder(0.2, 3.5, 3.5);
        translate([3, 0, -.05]) {
            cylinder(0.4, 0.2, 0.2);
        };
        translate([-3, 0, -.05]) {
            cylinder(0.4, 0.2, 0.2);
        };
        sphere(SPHERE_RADIUS - 0.5);
    };
    
    intersection() {
    cylinder(r1=SPHERE_RADIUS, r2=SPHERE_RADIUS, h = 100);
        
    intersection() {
        difference() {
            cylinder(r1= SPHERE_RADIUS, r2 = SPHERE_RADIUS / 2, h = 2.5);
            translate([0, 0, -0.5]) {
                cylinder(r1= SPHERE_RADIUS-0.2, r2 = SPHERE_RADIUS / 2 - 0.2, h = 2.5);
            };
        };
        union() {
            sphere(SPHERE_RADIUS*0.95);
            cylinder(0.3, 3.5, 3.5);
            };
    };
    };
}

$fn=200;
Cover();
