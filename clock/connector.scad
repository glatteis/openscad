extra_length = 0.65;
cube([0.75, 1.0 + 0.4 + extra_length, 0.1]);
translate([0, 1.0 + 0.2 + extra_length, 0]) {
    cube([0.75, 0.2, 0.25]);
};
translate([0, 0, 0]) {
    cube([0.75, 0.8, 0.2]);
};
translate([0, -0.4, 0]) {
    cube([0.75, 0.4, 0.1 + 0.5]);
};
translate([0, -0.4, 0.5]) {
    cube([0.75, 0.7, 0.1]);
}
