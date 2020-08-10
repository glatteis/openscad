delta = 0.01;

width = 2.7;
depth = 6.5;
height = 2.0;
difference() {
    cube([width, depth, height]);
    translate([0.1, 0.1, 0.1]) {
        cube([width - 0.2, depth - 0.2, height]);
    };
    hole_width = 1;
    translate([width / 2 - hole_width / 2, -delta, height / 2 - hole_width / 2]) {
        cube([hole_width, .1 + delta*2, hole_width]);
    };
};
