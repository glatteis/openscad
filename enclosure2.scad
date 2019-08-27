include <lasercut.scad>; 

PRINTER_WIDTH = 102;
PRINTER_DEPTH = 56;

BOX_WIDTH = 130;
BOX_DEPTH = 110;
BOX_HEIGHT = 70;

BUTTON_DIAMETER = 19;

WOOD_WIDTH = 3.1;


color("white", 0.5) {
    lasercutoutBox(thickness = WOOD_WIDTH, x=BOX_HEIGHT, y=BOX_WIDTH, z=BOX_DEPTH, sides=4, num_fingers=4);
    lasercutoutSquare(thickness = WOOD_WIDTH, x=BOX_WIDTH, y=BOX_DEPTH, 
    finger_joints=[
            [UP, 1, 4],
            [DOWN, 1, 4]
            [LEFT, 1, 4]
            [RIGHT, 1, 4]
        ]);
}