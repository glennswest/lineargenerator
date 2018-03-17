// Magnet 5mm square
$fn=256;
use <MCAD/nuts_and_bolts.scad>

tl=190;
coillen = 13 * 7;
coilstart = ((tl - coillen) / 2);
coilend   = coilstart+coillen;

// 13 * 30 = 390 magnets

module magnet()
{
    cube([5.05,5.05,5.1]);
}


module tube(ra,th,tlen)
{
        difference(){
          translate([0,0,0])  cylinder(r=ra+th,h=tlen);
          translate([0,0,-2]) cylinder(r=ra,h=tlen+4);
        }
    
}

module rounded_sq(thesize)
{
    difference(){
        translate([0-thesize/2,0-thesize/2,0]) cube([thesize,thesize,2]);
        translate([0,0,-1]) tube(thesize/2+3,40,4);
    }
}
module shell()
{
    rotate([0,0,6.5]) cylinder(r=31,h=tl);
    hull(){
       translate([0,0,0])  translate([-40,-40,0]) cube([80,80,2]); 
       translate([0,0,10]) cylinder(r=31,h=10);
       }
    hull(){
       translate([0,0,tl-20]) cylinder(r=31,h=10); 
       translate([0,0,tl-2])  translate([-40,-40,0]) cube([80,80,2]); 
       }  
    for (z = [coilstart:7:coilend]){
       translate([0,0,z]) rounded_sq(80); //cylinder(r=40,h=2); 
       }
}


module body()
{
    difference(){
       shell();
       translate([0,0,-.1]) rotate([0,0,6.4]) cylinder(r=30,h=tl+1);
       translate([-30,30,-.1]) boltHole(5.1,length=tl+10);
       translate([30,-30,-.1]) boltHole(5.1,length=tl+10);
       translate([ 30,30,-.1]) boltHole(5.1,length=tl+10);
       translate([-30,-30,-.1]) boltHole(5.1,length=tl+10); 
       
       translate([0,40,5]) cylinder(r=4,h=tl-10);
       translate([40,0,5]) cylinder(r=4,h=tl-10);
       translate([0,-40,5]) cylinder(r=4,h=tl-10);
       translate([-40,0,5]) cylinder(r=4,h=tl-10); 
    }
    
}


body();