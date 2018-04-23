// Magnet 5mm square
$fn=256;
use <MCAD/nuts_and_bolts.scad>

module magnet()
{
    cube([5.05,5.05,5.05]);
   // %translate([.025,.025,0]) cube([5,5,5]);
}

module body()
{
    difference(){
      rotate([0,0,6.5]) cylinder(r=31,h=5);
      translate([0,0,-1]) rotate([0,0,6.5]) cylinder(r=18,h=20);
    }    
    
    
}

module piston_core()
{
  difference(){
     body();
     z = -0.01;
      for (a =[0:12:360]) rotate([0,0,a]) translate([0,25,z]) rotate([0,0,-5.5]) magnet();
      
        translate([15,15,-0.1]) boltHole(3.1,length=20);
        translate([15,-15,-0.1]) boltHole(3.1,length=20);
        translate([-15,15,-0.1]) boltHole(3.1,length=20);
        translate([-15,-15,-0.1]) boltHole(3.1,length=20);
  }
}

piston_core();