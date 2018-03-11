use <core.scad>
use <MCAD/nuts_and_bolts.scad>

module piston_cover()
{
    difference(){
        
        $fn=256; cylinder(r=31,h=110);
        translate([15,15,2.3]) boltHole(3.1,length=20);
        translate([15,-15,2.3]) boltHole(3.1,length=20);
        translate([-15,15,2.3]) boltHole(3.1,length=20);
        translate([-15,-15,2.3]) boltHole(3.1,length=20);
        translate([0,0,10.1]) body();
    }
    
}

piston_cover();