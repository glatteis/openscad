scale([0.92, 0.92, 0.92]) {
    import("Shimano_hollowtech_tool_TL-FC16.STL");
};
$fn=100;
translate([26/2, 26/2, 0]) {
    difference() {
        cylinder(3, r1=40,r2=40);
        translate([-30, 0, -.5]) {
            cylinder(8, r1=5,r2=5);
        }
        translate([30, 0, -.5]) {
            cylinder(8, r1=5,r2=5);
        }
        translate([0, 30, -.5]) {
            cylinder(8, r1=5,r2=5);
        }
        translate([0, 30, -.5]) {
            cylinder(8, r1=5,r2=5);
        }
        translate([0, -30, -.5]) {
            cylinder(8, r1=5,r2=5);
        }
    };
}
