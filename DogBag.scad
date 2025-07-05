$fa = 1;
$fs = 0.5;

archWidth = 114;
archHeight = 56;
archThickness = 9;

archesOffset = 11;

loopDiameter = 2.4;

union() {
    translate([archesOffset/2, 0, 0])
        arch(archWidth, archHeight, archThickness);
    translate([-archesOffset/2, 0, 0])
        arch(archWidth, archHeight, archThickness);

    translate([archWidth/2, 0, 0])
        rotate([180, 0, 0])
            loop(loopDiameter, archesOffset, archesOffset);
    translate([-archWidth/2, 0, 0])
        rotate([180, 0, 0])
            loop(loopDiameter, archesOffset, archesOffset);
}

// 3D square profile arch
module arch(width, height, thickness) {
    translate([0, 0, -2])
        linear_extrude(height = 4)
            arc(width, height, thickness);
}

// 2D arch
module arc(width, height, thickness) {
    outerDiameter = width + thickness/2;
    innerDiameter = outerDiameter - thickness;

    heightToWidthRatio = height * 2 / width;

    scale([1, heightToWidthRatio, 1]) {
        difference() {
            difference() {
                circle(d=outerDiameter);
                circle(d=innerDiameter);
            }
            translate([0, -outerDiameter/2, 0])
              square(outerDiameter, center= true);
       }
    }
}

// 3D connection loop
module loop(diameter, width, height) {
    rotate_extrude(angle = 180, start=0, convexity = 2)
        translate([width/2, 0, 0])
            circle(diameter/2);
}
