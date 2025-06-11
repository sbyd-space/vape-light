// for PCB revision F
// 06/2025

//part of https://github.com/sbyd-space/vape-light

//License: CC BY 4.0
//https://creativecommons.org/licenses/by/4.0/

$fn=128;  //resolution

h_lower=5; //length of lower part inside the tube
d_lower=15.6; //diameter of lower part inside the tube
thickness_end=7; //thickness of upper end

d_upper=16.2; //diameter of rim of upper part
r_fillet=(d_upper-thickness_end)/2; //radius of the big fillet
h_rim=1.7; //thickness of the rim sitting on the end of the tube
h_upper=10; //overall height of upper part

d_button=2.2; //diameter of button hole
h_button=6; //height of button above tube


 difference(){ //part 1
     union(){ //main body
        translate([0,0,0])cylinder(h=h_upper,r=d_upper/2); //upper part
        translate([0,0,-h_lower])cylinder(h=h_lower,r=d_lower/2); //lower part
    }
    translate([0,r_fillet+thickness_end/2,r_fillet+h_rim])rotate([0,90,0])translate([0,0,-50])cylinder(h=100,r=r_fillet); //cutter for big fillet
    translate([0,thickness_end/2,h_rim+r_fillet])translate([-50,0,0])cube([100,100,100]); //cutting cube above fillet

    //cutout for pcb:
    translate([-6.2,-.4,-3.75])cube([12.4,1.6,10+3.75]);
    translate([-5.2,-.4,-5])cube([10.4,1.6,1.5]);
    
        
    translate([0,0,h_button])rotate([-90,0,0])cylinder(h=d_upper/2,r=d_button/2); // cutout for button cap
    hull(){ // cutout for button body and legs
        translate([-1.6,1.2,h_button])rotate([-90,0,0])cylinder(h=1.6,r1=3.35,r2=2.6);
        translate([1.6,1.2,h_button])rotate([-90,0,0])cylinder(h=1.6,r1=3.35,r2=2.6);
    }
    translate([4.5,0,h_button])rotate([-90,0,0])cylinder(h=10,r=0.7);// cutout for led
    translate([4.5,1.2,h_button])rotate([-90,0,0])cylinder(h=1,r1=1.3, r2=0.7);// cutout for led body
    
    translate([-25,-50,-25])cube([50,50,50]); //cutter cube for unused half
}


 translate([0,-2.5,0])   //separate parts for printing 
 difference(){ //part 2
    union(){ //main body
        translate([0,0,0])cylinder(h=h_upper,r=d_upper/2); //upper part
        translate([0,0,-h_lower])cylinder(h=h_lower,r=d_lower/2); //lower part
        union() { //pcb support plate
            translate([-6,-1.2,h_upper])cube([12,.8,11.5]);   
            translate([-4.5,-1.2,h_upper])cube([9,.8,13]);  
            translate([-4.5,-1.2,h_upper+11.5])rotate([-90,0,0])cylinder(h=.8,r=1.5);  //radiussed corner
            translate([4.5,-1.2,h_upper+11.5])rotate([-90,0,0])cylinder(h=.8,r=1.5);   //radiussed corner
        }        
    }
    mirror([0,1,0]) { //mirrored from other side
        translate([0,r_fillet+thickness_end/2,r_fillet+h_rim])rotate([0,90,0])translate([0,0,-50])cylinder(h=100,r=r_fillet); //cutter for big fillet
        translate([0,thickness_end/2,h_rim+r_fillet])translate([-50,0,0])cube([100,100,100]); //cutting cube above fillet
    }
 
    //cutout for pcb:
    translate([-6.2,-.4,-3.75])cube([12.4,1.6,10+3.75]);
    translate([-5.2,-.4,-5])cube([10.4,1.6,1.5]);
    
    translate([-25,0,-25])cube([50,50,50]); //cutter cube for unused half
}
