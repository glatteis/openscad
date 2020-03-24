module Grid3D(n, ppl, bw, dpth, eink, kabel, eink_w, mult) {
    module Hook(length) {
        translate([0, -length+.001, 0]) cube([ppl, length + 0.002, dpth/2]);
        translate([0, -length, -3]) cube([ppl, 2*ppl/5, 3]);
        translate([0, -length, -dpth/2 - 3]) cube([ppl, length, dpth/2]);
    }

    w = n*ppl;
    difference() {
        for (ix = [1:n-1]) {
            translate([0, (ix)*ppl, 0])
                cube([w+bw, bw, dpth]);
        }
        for (i=[0:1]) {
            translate([ppl/2-eink_w/2 + i*ppl*(n-1)+ i*eink_w/2, 0, dpth-kabel+.001]) {
                cube([eink_w/2, w+bw, kabel]);
            }
        }
    }

    difference() {
        union() {
            translate([-bw*mult, -bw*mult]) 
                cube([w+bw*mult*2, bw*mult, dpth]);
            
            translate([-bw*mult, w]) 
                cube([w+bw*mult*2, bw*mult, dpth]);
        }
        translate([ppl/4, -bw*mult - .1, 0]) cube([ppl/2, bw*mult + .2, dpth/2]);
        translate([w-ppl+ppl/4, -bw*mult - .1, 0]) cube([ppl/2, bw*mult + .2, dpth/2]);
        translate([ppl/4, w - .1, 0]) cube([ppl/2, bw*mult + .2, dpth/2]);
        translate([w-ppl+ppl/4, w - .1, 0]) cube([ppl/2, bw*mult + .2, dpth/2]);
    }

    module Slot() {
        module Wall(u, upper) {
            cube([bw, ppl / 6, dpth]);
        };
        difference() {
            cylinder(h = dpth, r = ppl/6, $fn=100);
            translate([-1, 0, 0.01]) {
                for (i=[0,1]) {
                    translate([0, (-ppl/6)*i, 0]) {
                        cube([2, ppl/6, dpth+0.01]);
                    }
                };
            };
        };

    }

    for (iy = [1:n-1]) {
        for (ix = [1:n]) {
            translate([iy*ppl, (ix)*ppl, 0]) {
                Slot();
            };
        }
    }

    for (ix=[0:3]) {
        iy = 0;
        translate([w / 2 - ppl*1.5 + ix*ppl, (iy)*ppl, 0]) {
            Slot();
        };
    }

    
    /* for (iy = [1:n]) { */
    /*     translate([0, iy*ppl-eink_w/2, dpth-eink+.001]) */
    /*         cube([w+bw, eink_w, eink]); */
    /* } */


    translate([w, 0])
        cube([bw*mult, ppl*(n), dpth]);
    
    translate([-bw*mult, 0])
        cube([bw*mult, ppl*(n), dpth]);

    translate([-bw*mult, -bw*mult, -1]) {
        cube([w + bw*mult*2, w + bw*mult*2, 1]);
    };

    translate([w/2 - ppl / 2, w, -1]) {
        difference() {
            cube([ppl, 2*ppl / 4, dpth]);
            translate([2*ppl/12, 0, -.1])
            cube([2*ppl/3, 2*ppl/6 + 1.1, dpth + .2]);
        }
    }
}

/* front_plate_dim = 216.6; */
/* color("#009999") */
/* translate([-200 / 12, -120 / 12, 5]) */
/*     cube([front_plate_dim, front_plate_dim, 3]); */
wall_thickness = .5;
Grid3D(11, 200 / 12, wall_thickness, 5, .3, 2, 10, 5);

/* translate([-wall_thickness, -wall_thickness, 10]) */
/* Backplate(200/12, wall_thickness, .3); */

/* module Backplate(ppl, add, depth) { */
/*     cube([11 * ppl + add, 12 * ppl + add, depth]); */
/* } */


/*
// #####################


s = ["ESKISTEFÜNF",
"ZEHNVIERTEL",
"ZWANZIGAVOR",
"NACHJPQHALB",
"VIERYÄMFÜNF",
"ZWEINSIEBEN",
"SECHSLZwÖLF",
"ACHTZEhNEUN",
"DREIELFXUHR",
"GUTENMORGEN"];


$fn=100;

too_large = "Mw";
umlauts = "ÖÜ";
um_repl = "OU";

color("black") {
    translate([-200 / 12, -120 / 12]) {
        Clock2D(11, 11, 200 / 12, s);
    }
    
};

module Clock2D(x, y, ppl, string, minute_timers=true) {
    width = x*ppl;
    height = y*ppl;
    circle_rad = ppl/6;
    
    draw_lines = false;
    line_width = 2;
    transl_up = 1;
    if (draw_lines) {
        translate([ppl, ppl]) {
            for (i = [0:y]) {
                translate([i*ppl-line_width/2,transl_up]) {
                    #square([line_width, width]);
                }
                translate([0, i*ppl + transl_up]) {
                    #square([width, line_width]);
                }
            }
        }
    }
    
    difference() {
        square([width+ppl*2, height+ppl*2]);
        
        translate([ppl, ppl]) {
            for (line = [0:y-1]) {
                if (minute_timers && line == 0) {
                    for (i = [0:3]) {
                        translate([ppl*i+circle_rad+(ppl/circle_rad)-ppl*(4-x)/2,
                                ppl/2+circle_rad/2]) {
                            circle(circle_rad);
                            
                        }
                    }
                    
                } else {
                    for (char = [0:x-1]) {
                        translate([ppl/2+ppl*char, ppl/4+ppl*line]) {
                            to_print = string[y-1-line][char];
                            
                            uml = search(to_print, umlauts);
                            text_size = ppl*.9;
                            if (to_print == "w") {
                                intersection() {
                                    translate([-text_size*.5,0])
                                    square([text_size,text_size*.8]);
                                    
                                    text(to_print, size=text_size*1.2, font="Earth Orbiter Condensed",halign="center");
                                    
                                };
                            } else if (to_print == "M") {
                                intersection() {
                                    translate([-text_size*.5,0])
                                    square([text_size,text_size*.8]);
                                    translate([0,-text_size*.2])
                                    text(to_print, size=text_size*1.2, font="Earth Orbiter Condensed",halign="center");
                                    
                                };
                            } else if (to_print == "Ü") {
                                translate([0, ppl*.65])
                                for (i=[-1:2:1])
                                translate([i*.16*ppl,0])
                                text(".", size=text_size, font="Earth Orbiter Title", halign="center");
                                text("U", size=text_size, font="Earth Orbiter Title",halign="center");
                            } else if (to_print == "Ä") {
                                translate([0, ppl*.65])
                                for (i=[-1:2:1])
                                translate([i*.25*ppl,0])
                                text(".", size=text_size, font="Earth Orbiter Title", halign="center");
                                text("A", size=text_size, font="Earth Orbiter Title",halign="center");
                               
                            } else if (to_print == "Ö") {
                                translate([0, ppl*.35])
                                for (i=[-1:2:1])
                                translate([i*ppl*.15,0])
                                text(".", size=text_size, font="Earth Orbiter Title", halign="center");
                                text("O", size=text_size, font="Earth Orbiter Title", halign="center");
                                
                            } else {
                                text(to_print, size=text_size, font="Earth Orbiter Title",halign="center");
                                echo(to_print);
                            }
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    
}
*/
