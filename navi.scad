width = 70;
depth = 42;
height = 18;
caseheight = 4;

pw = 2;

$fn=100;

module Case() {
    cube([width, depth, pw]);
    cube([pw, depth, height]);
    translate([width, 0, 0]) {
        cube([pw, depth, height]);
    }
    cube([width, pw, height]);
    translate([0, depth, 0]) {
        cube([width + pw, pw, height]);
    }
}

module Lid() {
    difference() {
        cube([width + 3*pw, depth + 3*pw, pw]);
        translate([10, 5, -pw]) {
            cube([width - 3, depth - 5, pw*3]);
        }
    }
    translate([0, 0, -caseheight]) {
        translate([width + 2*pw, 0, 0]) {
            cube([pw, depth + 2*pw, caseheight + pw]);
        }
        cube([pw, depth + 2*pw, caseheight + pw]);
        cube([width+2*pw, pw, caseheight]);
        translate([0, depth + 2*pw, 0]) {
            cube([width+3*pw, pw, caseheight]);
        }
    }
}

/* Case(); */
translate([-pw, -pw, 25]) {
    Lid();
};
