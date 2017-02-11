//------------------------------------------------------------------------------------------
// THIS CODE WAS GENERATED WITH GRAPHSCAD
//------------------------------------------------------------------------------------------
// Graphscad is a graphical nodal editor to create .SCAD files
//
// More info : http://graphscad.free.fr
//
// Scad Files created with Graphscad can be edited by graphscad
// Scad Files created with Graphscad can be read by Openscad
//
//------------------------------------------------------------------------------------------
module planetarygear_Chris_L_T(planet_teeth=16,sun_teeth=12)
{
 //////////////////////////////////////////////////////////////////////////////////////////////
 // Public Domain Parametric Involute Spur Gear (and involute helical gear and involute rack)
 // version 1.1
 // by Leemon Baird, 2011, Leemon@Leemon.com
 //http://www.thingiverse.com/thing:5505
 //
 // This file is public domain.  Use it for any purpose, including commercial
 // applications.  Attribution would be nice, but is not required.  There is
 // no warranty of any kind, including its correctness, usefulness, or safety.
 //
 // This is parameterized involute spur (or helical) gear.  It is much simpler and less powerful than
 // others on Thingiverse.  But it is public domain.  I implemented it from scratch from the
 // descriptions and equations on Wikipedia and the web, using Mathematica for calculations and testing,
 // and I now release it into the public domain.
 //
 //        http://en.wikipedia.org/wiki/Involute_gear
 //        http://en.wikipedia.org/wiki/Gear
 //        http://en.wikipedia.org/wiki/List_of_gear_nomenclature
 //        http://gtrebaol.free.fr/doc/catia/spur_gear.html
 //        http://www.cs.cmu.edu/~rapidproto/mechanisms/chpt7.html
 //
 // The module gear() gives an involute spur gear, with reasonable defaults for all the parameters.
 // Normally, you should just choose the first 4 parameters, and let the rest be default values.
 // The module gear() gives a gear in the XY plane, centered on the origin, with one tooth centered on
 // the positive Y axis.  The various functions below it take the same parameters, and return various
 // measurements for the gear.  The most important is pitch_radius, which tells how far apart to space
 // gears that are meshing, and adendum_radius, which gives the size of the region filled by the gear.
 // A gear has a "pitch circle", which is an invisible circle that cuts through the middle of each
 // tooth (though not the exact center). In order for two gears to mesh, their pitch circles should
 // just touch.  So the distance between their centers should be pitch_radius() for one, plus pitch_radius()
 // for the other, which gives the radii of their pitch circles.
 //
 // In order for two gears to mesh, they must have the same mm_per_tooth and pressure_angle parameters.
 // mm_per_tooth gives the number of millimeters of arc around the pitch circle covered by one tooth and one
 // space between teeth.  The pitch angle controls how flat or bulged the sides of the teeth are.  Common
 // values include 14.5 degrees and 20 degrees, and occasionally 25.  Though I've seen 28 recommended for
 // plastic gears. Larger numbers bulge out more, giving stronger teeth, so 28 degrees is the default here.
 //
 // The ratio of number_of_teeth for two meshing gears gives how many times one will make a full
 // revolution when the the other makes one full revolution.  If the two numbers are coprime (i.e.
 // are not both divisible by the same number greater than 1), then every tooth on one gear
 // will meet every tooth on the other, for more even wear.  So coprime numbers of teeth are good.
 //
 // The module rack() gives a rack, which is a bar with teeth.  A rack can mesh with any
 // gear that has the same mm_per_tooth and pressure_angle.
 //
 // Some terminology:
 // The outline of a gear is a smooth circle (the "pitch circle") which has mountains and valleys
 // added so it is toothed.  So there is an inner circle (the "root circle") that touches the
 // base of all the teeth, an outer circle that touches the tips of all the teeth,
 // and the invisible pitch circle in between them.  There is also a "base circle", which can be smaller than
 // all three of the others, which controls the shape of the teeth.  The side of each tooth lies on the path
 // that the end of a string would follow if it were wrapped tightly around the base circle, then slowly unwound.
 // That shape is an "involute", which gives this type of gear its name.
 //
 //////////////////////////////////////////////////////////////////////////////////////////////
 //An involute spur gear, with reasonable defaults for all the parameters.
 //Normally, you should just choose the first 4 parameters, and let the rest be default values.
 //Meshing gears must match in mm_per_tooth, pressure_angle, and twist,
 //and be separated by the sum of their pitch radii, which can be found with pitch_radius().
 module gear (
     mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
     number_of_teeth = 11,   //total number of teeth around the entire perimeter
     thickness       = 6,    //thickness of gear in mm
     hole_diameter   = 3,    //diameter of the hole in the center, in mm
     twist           = 0,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
     teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
     pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
     clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
     backlash        = 0.0   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
 )
 {
      pi = 3.1415926;
      p  = mm_per_tooth * number_of_teeth / pi / 2;
    //radius of pitch circle
      c  = p + mm_per_tooth / pi - clearance;
          //radius of outer circle
      b  = p*cos(pressure_angle);
                      //radius of base circle
      r  = p-(c-p)-clearance;
                          //radius of root circle
      t  = mm_per_tooth/2-backlash/2;
                  //tooth thickness at pitch circle
      k  = -gear_iang(b, p) - t/2/p/pi*180;
  {
           //angle to where involute meets base circle on each side of tooth
           difference()
   {
                for (i = [0:number_of_teeth-teeth_to_hide-1] )
                    rotate([0,0,i*360/number_of_teeth])
                        linear_extrude(height = thickness, center = true, convexity = 10, twist = twist)
                            polygon(
                                points=[
                                    [0, -hole_diameter/10],
                                    gear_polar(r, -181/number_of_teeth),
                                    gear_polar(r, r<b ? k : -180/number_of_teeth),
                                    gear_q7(0/5,r,b,c,k, 1),gear_q7(1/5,r,b,c,k, 1),gear_q7(2/5,r,b,c,k, 1),gear_q7(3/5,r,b,c,k, 1),gear_q7(4/5,r,b,c,k, 1),gear_q7(5/5,r,b,c,k, 1),
                                    gear_q7(5/5,r,b,c,k,-1),gear_q7(4/5,r,b,c,k,-1),gear_q7(3/5,r,b,c,k,-1),gear_q7(2/5,r,b,c,k,-1),gear_q7(1/5,r,b,c,k,-1),gear_q7(0/5,r,b,c,k,-1),
                                    gear_polar(r, r<b ? -k : 180/number_of_teeth),
                                    gear_polar(r, 181/number_of_teeth)
                                ],
                                 paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
                            );
                cylinder(h=2*thickness+1, r=hole_diameter/2, center=true, $fn=20);
   }
  }
 }
 ;
 //these 4 functions are used by gear
 function gear_polar(r,theta)   = r*[sin(theta), cos(theta)];
                             //convert gear_polar to cartesian coordinates
 function gear_iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/3.1415926*180 - acos(r1/r2);
  //unwind a string this many degrees to go from radius r1 to radius r2
 function gear_q7(f,r,b,r2,t,s) = gear_q6(b,s,t,(1-f)*max(b,r)+f*r2);
                          //radius a fraction f up the curved side of the tooth
 function gear_q6(b,s,t,d)      = gear_polar(d,s*(gear_iang(b,d)+t));
                               //point at radius d on the involute curve
 function ring_gear_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-1]);
 module ring_gear(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-1])gear(mm_per_tooth=3,number_of_teeth=sun_teeth+2*planet_teeth,thickness=20,hole_diameter=0,twist=0,teeth_to_hide=0,pressure_angle=28,clearance=0,backlash=0);
 }
 function node_cylinder_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-5.5]);
 module node_cylinder(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-5.5])cylinder(r=((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))+10),r1=((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))+10),h=11,center=false,$fn=(16+((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))+10)*3.14116));
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cylinder_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_cylinder(i,j,k,l,m,n);
   ring_gear(i,j,k,l,m,n);
  }
 }
 function planet_gear_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module planet_gear(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  gear(mm_per_tooth=3,number_of_teeth=planet_teeth,thickness=10,hole_diameter=3,twist=0,teeth_to_hide=0,pressure_angle=28,clearance=0,backlash=0);
 }
 function planet_at_top_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90)),(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90)),-1])*planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_at_top(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90)),(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90)),-1])planet_gear_spin(i,j,k,l,m,n);
 }
 function sun_gear_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module sun_gear(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  gear(mm_per_tooth=3,number_of_teeth=sun_teeth,thickness=10,hole_diameter=3,twist=0,teeth_to_hide=0,pressure_angle=28,clearance=0,backlash=0);
 }
 function planet_at_bottom_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = onlytranslate(planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*translate([((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90))*-1),((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90))*-1),-1])*negonlytranslate(planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_at_bottom(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  multmatrix(m=onlytranslate(planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*translate([((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90))*-1),((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90))*-1),-1])*negonlytranslate(planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n)))planet_gear_spin(i,j,k,l,m,n);
 }
 function sun_spin_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,-$t*180*(planet_teeth/sun_teeth+1)])*sun_gear_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module sun_spin(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,-$t*180*(planet_teeth/sun_teeth+1)])sun_gear(i,j,k,l,m,n);
 }
 function planet_on_left_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90)),((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90))*-1),-1])*if_planet_odd_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_on_left(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90)),((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90))*-1),-1])if_planet_odd(i,j,k,l,m,n);
 }
 function planet_on_right_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90))*-1),(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90)),-1])*if_planet_odd_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_on_right(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([((((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*cos($t*90))*-1),(((((3)*((sun_teeth+2*planet_teeth)/ 3.1415926 / 2)))-(((3)*((planet_teeth)/ 3.1415926 / 2))))*sin($t*90)),-1])if_planet_odd(i,j,k,l,m,n);
 }
 function ring_colour_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module ring_colour(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  {
   color([0.5,0.5,1,1])node_boolean(i,j,k,l,m,n);
  }
 }
 function planet_gear_spin_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,$t*90*(sun_teeth/planet_teeth+1)])*planet_gear_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_gear_spin(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,$t*90*(sun_teeth/planet_teeth+1)])planet_gear(i,j,k,l,m,n);
 }
 function sun_colour_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = if_sun_odd_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module sun_colour(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  {
   color([0.4,1,0.6,1])if_sun_odd(i,j,k,l,m,n);
  }
 }
 function node_if_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_if(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  if((sun_teeth+planet_teeth)%2==0)
  {
   {
   }
  }
   else
  {
   node_linearextrude(i,j,k,l,m,n);
  }
 }
 function node_text_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,]);
 module node_text(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,])text(text="        Gears cannot mesh: sum of teeth is odd",size=10,valign="center");
 }
 function node_linearextrude_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=1,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text(i,j,k,l,m,n);
  }
 }
 function sun_phase_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,180/sun_teeth])*sun_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module sun_phase(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,180/sun_teeth])sun_spin(i,j,k,l,m,n);
 }
 function if_sun_odd_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = sun_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module if_sun_odd(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  if(sun_teeth%2==1)
  {
   sun_spin(i,j,k,l,m,n);
  }
   else
  {
   sun_phase(i,j,k,l,m,n);
  }
 }
 function planet_phase_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,180/planet_teeth])*planet_gear_spin_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module planet_phase(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,180/planet_teeth])planet_gear_spin(i,j,k,l,m,n);
 }
 function if_planet_odd_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = planet_phase_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module if_planet_odd(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  if((sun_teeth+planet_teeth)%4==2)
  {
   planet_phase(i,j,k,l,m,n);
  }
   else
  {
   planet_gear_spin(i,j,k,l,m,n);
  }
 }
 function node_if0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_linearextrude0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_if0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  if(planet_teeth+2>0.7071*(sun_teeth+planet_teeth))
  {
   node_linearextrude0(i,j,k,l,m,n);
  }
   else
  {
   {
   }
  }
 }
 function node_linearextrude0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=1,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text0(i,j,k,l,m,n);
  }
 }
 function node_text0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,]);
 module node_text0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,])text(text="          Warning: planet gears collide",size=10,valign="center");
 }
 planet_at_top();
 planet_at_bottom();
 planet_on_left();
 planet_on_right();
 ring_colour();
 sun_colour();
 node_if();
 node_if0();
 /*--------------------------------------------------------------------------------------------------------
  Graphscad Utils functions
  This code is Used By Graphscad Nodal Editor to generate SCAD files
 --------------------------------------------------------------------------------------------------------*/
 function det4x4(a) =
 a[0][0]*a[1][1]*a[2][2]*a[3][3] + a[0][0]*a[1][2]*a[2][3]*a[3][1] + a[0][0]*a[1][3]*a[2][1]*a[3][2]
 + a[0][1]*a[1][0]*a[2][3]*a[3][2] + a[0][1]*a[1][2]*a[2][0]*a[3][3] + a[0][1]*a[1][3]*a[2][2]*a[3][0]
 + a[0][2]*a[1][0]*a[2][1]*a[3][3] + a[0][2]*a[1][1]*a[2][3]*a[3][0] + a[0][2]*a[1][3]*a[2][0]*a[3][1]
 + a[0][3]*a[1][0]*a[2][2]*a[3][1] + a[0][3]*a[1][1]*a[2][0]*a[3][2] + a[0][3]*a[1][2]*a[2][1]*a[3][0]
 - a[0][0]*a[1][1]*a[2][3]*a[3][2] - a[0][0]*a[1][2]*a[2][1]*a[3][3] - a[0][0]*a[1][3]*a[2][2]*a[3][1]
 - a[0][1]*a[1][0]*a[2][2]*a[3][3] - a[0][1]*a[1][2]*a[2][3]*a[3][0] - a[0][1]*a[1][3]*a[2][0]*a[3][2]
 - a[0][2]*a[1][0]*a[2][3]*a[3][1] - a[0][2]*a[1][1]*a[2][0]*a[3][3] - a[0][2]*a[1][3]*a[2][1]*a[3][0]
 - a[0][3]*a[1][0]*a[2][1]*a[3][2] - a[0][3]*a[1][1]*a[2][2]*a[3][0] - a[0][3]*a[1][2]*a[2][0]*a[3][1];
 function invb00(a) = a[1][1]*a[2][2]*a[3][3] + a[1][2]*a[2][3]*a[3][1] + a[1][3]*a[2][1]*a[3][2] - a[1][1]*a[2][3]*a[3][2] - a[1][2]*a[2][1]*a[3][3] - a[1][3]*a[2][2]*a[3][1];
 function invb01(a) = a[0][1]*a[2][3]*a[3][2] + a[0][2]*a[2][1]*a[3][3] + a[0][3]*a[2][2]*a[3][1] - a[0][1]*a[2][2]*a[3][3] - a[0][2]*a[2][3]*a[3][1] - a[0][3]*a[2][1]*a[3][2];
 function invb02(a) = a[0][1]*a[1][2]*a[3][3] + a[0][2]*a[1][3]*a[3][1] + a[0][3]*a[1][1]*a[3][2] - a[0][1]*a[1][3]*a[3][2] - a[0][2]*a[1][1]*a[3][3] - a[0][3]*a[1][2]*a[3][1];
 function invb03(a) = a[0][1]*a[1][3]*a[2][2] + a[0][2]*a[1][1]*a[2][3] + a[0][3]*a[1][2]*a[2][1] - a[0][1]*a[1][2]*a[2][3] - a[0][2]*a[1][3]*a[2][1] - a[0][3]*a[1][1]*a[2][2];
 function invb10(a) = a[1][0]*a[2][3]*a[3][2] + a[1][2]*a[2][0]*a[3][3] + a[1][3]*a[2][2]*a[3][0] - a[1][0]*a[2][2]*a[3][3] - a[1][2]*a[2][3]*a[3][0] - a[1][3]*a[2][0]*a[3][2];
 function invb11(a) = a[0][0]*a[2][2]*a[3][3] + a[0][2]*a[2][3]*a[3][0] + a[0][3]*a[2][0]*a[3][2] - a[0][0]*a[2][3]*a[3][2] - a[0][2]*a[2][0]*a[3][3] - a[0][3]*a[2][2]*a[3][0];
 function invb12(a) = a[0][0]*a[1][3]*a[3][2] + a[0][2]*a[1][0]*a[3][3] + a[0][3]*a[1][2]*a[3][0] - a[0][0]*a[1][2]*a[3][3] - a[0][2]*a[1][3]*a[3][0] - a[0][3]*a[1][0]*a[3][2];
 function invb13(a) = a[0][0]*a[1][2]*a[2][3] + a[0][2]*a[1][3]*a[2][0] + a[0][3]*a[1][0]*a[2][2] - a[0][0]*a[1][3]*a[2][2] - a[0][2]*a[1][0]*a[2][3] - a[0][3]*a[1][2]*a[2][0];
 function invb20(a) = a[1][0]*a[2][1]*a[3][3] + a[1][1]*a[2][3]*a[3][0] + a[1][3]*a[2][0]*a[3][1] - a[1][0]*a[2][3]*a[3][1] - a[1][1]*a[2][0]*a[3][3] - a[1][3]*a[2][1]*a[3][0];
 function invb21(a) = a[0][0]*a[2][3]*a[3][1] + a[0][1]*a[2][0]*a[3][3] + a[0][3]*a[2][1]*a[3][0] - a[0][0]*a[2][1]*a[3][3] - a[0][1]*a[2][3]*a[3][0] - a[0][3]*a[2][0]*a[3][1];
 function invb22(a) = a[0][0]*a[1][1]*a[3][3] + a[0][1]*a[1][3]*a[3][0] + a[0][3]*a[1][0]*a[3][1] - a[0][0]*a[1][3]*a[3][1] - a[0][1]*a[1][0]*a[3][3] - a[0][3]*a[1][1]*a[3][0];
 function invb23(a) = a[0][0]*a[1][3]*a[2][1] + a[0][1]*a[1][0]*a[2][3] + a[0][3]*a[1][1]*a[2][0] - a[0][0]*a[1][1]*a[2][3] - a[0][1]*a[1][3]*a[2][0] - a[0][3]*a[1][0]*a[2][1];
 function invb30(a) = a[1][0]*a[2][2]*a[3][1] + a[1][1]*a[2][0]*a[3][2] + a[1][2]*a[2][1]*a[3][0] - a[1][0]*a[2][1]*a[3][2] - a[1][1]*a[2][2]*a[3][0] - a[1][2]*a[2][0]*a[3][1];
 function invb31(a) = a[0][0]*a[2][1]*a[3][2] + a[0][1]*a[2][2]*a[3][0] + a[0][2]*a[2][0]*a[3][1] - a[0][0]*a[2][2]*a[3][1] - a[0][1]*a[2][0]*a[3][2] - a[0][2]*a[2][1]*a[3][0];
 function invb32(a) = a[0][0]*a[1][2]*a[3][1] + a[0][1]*a[1][0]*a[3][2] + a[0][2]*a[1][1]*a[3][0] - a[0][0]*a[1][1]*a[3][2] - a[0][1]*a[1][2]*a[3][0] - a[0][2]*a[1][0]*a[3][1];
 function invb33(a) = a[0][0]*a[1][1]*a[2][2] + a[0][1]*a[1][2]*a[2][0] + a[0][2]*a[1][0]*a[2][1] - a[0][0]*a[1][2]*a[2][1] - a[0][1]*a[1][0]*a[2][2] - a[0][2]*a[1][1]*a[2][0];
 function inv4x4(a)= (1/det4x4(a))*[
 [invb00(a),invb01(a),invb02(a),invb03(a)],
 [invb10(a),invb11(a),invb12(a),invb13(a)],
 [invb20(a),invb21(a),invb22(a),invb23(a)],
 [invb30(a),invb31(a),invb32(a),invb33(a)]];
 function onlytranslate(a)=  [
                        [1,0,0,a[0][3]],
                        [0,1,0,a[1][3]],
                        [0,0,1,a[2][3]],
                        [0,0,0,1]];
 function negonlytranslate(a)=[
                        [1,0,0,-a[0][3]],
                        [0,1,0,-a[1][3]],
                        [0,0,1,-a[2][3]],
                        [0,0,0,1]];
 function lookatvec(t,parentmat) = [t[0]-parentmat[0][3],
                                 t[1]-parentmat[1][3],
                                 t[2]-parentmat[2][3]];
 /*
              rx = '0'
              ry = 'acos('+tz+'/norm(['+tx+','+ty+','+tz+']))'
              rz = 'atan2('+ty+','+tx+')'
 */
 function lookatrot(t,parentmat) = [0,
                                 acos((t[2]-parentmat[2][3])/norm(lookatvec(t,parentmat))),
                                 atan2(t[1]-parentmat[1][3],t[0]-parentmat[0][3])];
 function gettranslation(m) = [m[0][3],m[1][3],m[2][3]];
 function vectormulmatrix(v,m) = m*v;
 function vectorlength(v) = norm(v);
 function vectorx(v) = v[0];
 function vectory(v) = v[1];
 function vectorz(v) = v[2];
 function vectoradd(a,b) = (a+b);
 function vectorsub(a,b) = (a-b);
 function vectormul(a,b) = (a*b);
 function vectordiv(a,b) = (a*(1/b));
 function scale(v)=[[v[0],0,0,0],
                    [0,v[1],0,0],
                    [0,0,v[2],0],
                    [0,0,0,1]];
 function rotatex(a)=[[1,0,0,0],
                      [0,cos(a),-sin(a),0],
                      [0,sin(a),cos(a),0],
                      [0,0,0,1]];
 function rotatey(a)=[[cos(a),0,sin(a),0],
                      [0,1,0,0],
                      [-sin(a),0,cos(a),0],
                      [0,0,0,1]];
 function rotatez(a)=[[cos(a),-sin(a),0,0],
                      [sin(a),cos(a),0,0],
                      [0,0,1,0],
                      [0,0,0,1]];
 function rotatea(c,s,l,m,n)=[[l*l*(1-c)+c,m*l*(1-c)-n*s,n*l*(1-c)+m*s,0],
                              [l*m*(1-c)+n*s,m*m*(1-c)+c,n*m*(1-c)-l*s,0],
                              [l*n*(1-c)-m*s,m*n*(1-c)+l*s,n*n*(1-c)+c,0],
                              [0,0,0,1]];
 function rotateanv(a,nv)=rotatea(cos(a),sin(a),nv[0],nv[1],nv[2]);
 function rotate(a,v, normV=true)=(v==undef)?rotatez(a[2])*rotatey(a[1])*rotatex(a[0]):
                      normV ? rotateanv(a,v/sqrt(v*v)) : rotateanv(a,v);
 function translate(v)=[[1,0,0,v[0]],
                        [0,1,0,v[1]],
                        [0,0,1,v[2]],
                        [0,0,0,1]];
 function mirrorabc(a,b,c)=[[1-2*a*a,-2*a*b,-2*a*c,0],
                            [-2*a*b,1-2*b*b,-2*b*c,0],
                            [-2*a*c,-2*b*c,1-2*c*c,0],
                            [0,0,0,1]];
 function mirrornv(nv)=mirrorabc(nv[0],nv[1],nv[2]);
 function mirror(v)=mirrornv(v/sqrt(v*v));
}
planetarygear_Chris_L_T();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "ring_gear",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "mm_per_tooth",
                    "value": "3"
                },
                {
                    "type": "str",
                    "name": "number_of_teeth",
                    "value": "sun_teeth+2*planet_teeth"
                },
                {
                    "type": "str",
                    "name": "thickness",
                    "value": "20"
                },
                {
                    "type": "str",
                    "name": "hole_diameter",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "teeth_to_hide",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "pressure_angle",
                    "value": "28"
                },
                {
                    "type": "str",
                    "name": "clearance",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "backlash",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                }
            ],
            "typename": "Node_gear",
            "version": 1,
            "y": -82.2948362864708,
            "x": -748.1447424484991
        },
        {
            "name": "node_cylinder",
            "inputplugs": [
                {
                    "connection": "ring_width.a_add_b",
                    "type": "str",
                    "name": "radius",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "11"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-5.5"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": -73.69831393447765,
            "x": -1.6295307324967325
        },
        {
            "name": "node_boolean",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "op",
                    "value": "difference",
                    "combo": [
                        "difference",
                        "union",
                        "intersection"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "connection": "node_cylinder.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "ring_gear.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object8",
                    "value": ""
                }
            ],
            "typename": "Node_boolean",
            "version": 1,
            "y": -106.39245260635244,
            "x": 228.0269145800031
        },
        {
            "name": "ring_width",
            "inputplugs": [
                {
                    "connection": "ring_gear.pitch_radius",
                    "type": "str",
                    "name": "a",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "10"
                }
            ],
            "typename": "Node_add",
            "version": 1,
            "y": -108.23773580947733,
            "x": -210.4025092481217
        },
        {
            "name": "planet_gear",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "mm_per_tooth",
                    "value": "3"
                },
                {
                    "type": "str",
                    "name": "number_of_teeth",
                    "value": "planet_teeth"
                },
                {
                    "type": "str",
                    "name": "thickness",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "hole_diameter",
                    "value": "3"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "teeth_to_hide",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "pressure_angle",
                    "value": "28"
                },
                {
                    "type": "str",
                    "name": "clearance",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "backlash",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_gear",
            "version": 1,
            "y": 279.40331887802256,
            "x": -750.1098432324964
        },
        {
            "name": "planet_at_top",
            "inputplugs": [
                {
                    "connection": "planet_gear_spin.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "connection": "sine.a_mul_b",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "connection": "cosine.a_mul_b",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": 135.4329282530225,
            "x": 407.4693364550035
        },
        {
            "name": "planet_orbit_radius",
            "inputplugs": [
                {
                    "connection": "ring_gear.pitch_radius",
                    "type": "str",
                    "name": "a",
                    "value": "0"
                },
                {
                    "connection": "planet_gear.pitch_radius",
                    "type": "str",
                    "name": "b",
                    "value": "0"
                }
            ],
            "typename": "Node_sub",
            "version": 1,
            "y": 70.74982278427251,
            "x": -418.57924752937146
        },
        {
            "name": "sun_gear",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "mm_per_tooth",
                    "value": "3"
                },
                {
                    "type": "str",
                    "name": "number_of_teeth",
                    "value": "sun_teeth"
                },
                {
                    "type": "str",
                    "name": "thickness",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "hole_diameter",
                    "value": "3"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "teeth_to_hide",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "pressure_angle",
                    "value": "28"
                },
                {
                    "type": "str",
                    "name": "clearance",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "backlash",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_gear",
            "version": 1,
            "y": 648.8049985655225,
            "x": -758.4789057324963
        },
        {
            "name": "minus_sine",
            "inputplugs": [
                {
                    "connection": "sine.a_mul_b",
                    "type": "str",
                    "name": "a",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "-1"
                }
            ],
            "typename": "Node_mul",
            "version": 1,
            "y": 321.2024595030225,
            "x": 18.516211455003486
        },
        {
            "name": "planet_at_bottom",
            "inputplugs": [
                {
                    "connection": "planet_gear_spin.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "connection": "minus_sine.a_mul_b",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "connection": "minus_cos.a_mul_b",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "local",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": 547.3157407530225,
            "x": 407.02793020500354
        },
        {
            "name": "sun_spin",
            "inputplugs": [
                {
                    "connection": "sun_gear.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "-$t*180*(planet_teeth/sun_teeth+1)"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": 855.9988462217725,
            "x": -442.1800776074965
        },
        {
            "name": "planet_on_left",
            "inputplugs": [
                {
                    "connection": "if_planet_odd.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "connection": "cosine.a_mul_b",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "connection": "minus_sine.a_mul_b",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": 750.4329282530225,
            "x": 402.4693364550035
        },
        {
            "name": "planet_on_right",
            "inputplugs": [
                {
                    "connection": "if_planet_odd.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "connection": "minus_cos.a_mul_b",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "connection": "sine.a_mul_b",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": 339.4329282530225,
            "x": 414.67636770500343
        },
        {
            "name": "ring_colour",
            "inputplugs": [
                {
                    "connection": "node_boolean.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "r",
                    "value": "0.5"
                },
                {
                    "type": "str",
                    "name": "g",
                    "value": "0.5"
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "a",
                    "value": "1"
                }
            ],
            "typename": "Node_color",
            "version": 1,
            "y": -106.39824362197743,
            "x": 423.4809243456294
        },
        {
            "name": "planet_gear_spin",
            "inputplugs": [
                {
                    "connection": "planet_gear.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "$t*90*(sun_teeth/planet_teeth+1)"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": 282.4018554687501,
            "x": -388.5109863281268
        },
        {
            "name": "sine",
            "inputplugs": [
                {
                    "connection": "planet_orbit_radius.a_sub_b",
                    "type": "str",
                    "name": "a",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "sin($t*90)"
                }
            ],
            "typename": "Node_mul",
            "version": 1,
            "y": 136.29345703125045,
            "x": -171.39672851562676
        },
        {
            "name": "cosine",
            "inputplugs": [
                {
                    "connection": "planet_orbit_radius.a_sub_b",
                    "type": "str",
                    "name": "a",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "cos($t*90)"
                }
            ],
            "typename": "Node_mul",
            "version": 1,
            "y": 434.73095703125,
            "x": -161.5217285156268
        },
        {
            "name": "minus_cos",
            "inputplugs": [
                {
                    "connection": "cosine.a_mul_b",
                    "type": "str",
                    "name": "a",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "-1"
                }
            ],
            "typename": "Node_mul",
            "version": 1,
            "y": 518.02392578125,
            "x": 23.80092773437312
        },
        {
            "name": "node_param",
            "inputplugs": [
                {
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "planet_teeth"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "16"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 555.761065321888,
            "x": -1012.9568473007702
        },
        {
            "name": "node_param1",
            "inputplugs": [
                {
                    "connection": "node_param.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "sun_teeth"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "12"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 761.7103555566086,
            "x": -1011.0916316581987
        },
        {
            "name": "sun_colour",
            "inputplugs": [
                {
                    "connection": "if_sun_odd.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "r",
                    "value": "0.4"
                },
                {
                    "type": "str",
                    "name": "g",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "0.6"
                },
                {
                    "type": "str",
                    "name": "a",
                    "value": "1"
                }
            ],
            "typename": "Node_color",
            "version": 1,
            "y": 868.8329878906263,
            "x": 150.93499648437313
        },
        {
            "name": "node_if",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "expression",
                    "value": "(sun_teeth+planet_teeth)%2==0"
                },
                {
                    "type": "object",
                    "name": "true",
                    "value": ""
                },
                {
                    "connection": "node_linearextrude.object",
                    "type": "object",
                    "name": "false",
                    "value": ""
                }
            ],
            "typename": "Node_if",
            "version": 1,
            "y": 250.13624816649428,
            "x": -1157.2564744291903
        },
        {
            "name": "node_text",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "        Gears cannot mesh: sum of teeth is odd"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "valign",
                    "value": "center",
                    "combo": [
                        "center",
                        "top",
                        "bottom"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": 392.5787911132802,
            "x": -1612.2772001709027
        },
        {
            "name": "node_linearextrude",
            "inputplugs": [
                {
                    "connection": "node_text.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "true",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "convexity",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "slices",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "scale",
                    "value": "1"
                }
            ],
            "typename": "Node_linearextrude",
            "version": 1,
            "y": 388.72703330078093,
            "x": -1394.3219267334025
        },
        {
            "name": "sun_phase",
            "inputplugs": [
                {
                    "connection": "sun_spin.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "180/sun_teeth"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": 995.9321899414053,
            "x": -260.80010986328125
        },
        {
            "name": "if_sun_odd",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "expression",
                    "value": "sun_teeth%2==1"
                },
                {
                    "connection": "sun_spin.object",
                    "type": "object",
                    "name": "true",
                    "value": ""
                },
                {
                    "connection": "sun_phase.object",
                    "type": "object",
                    "name": "false",
                    "value": ""
                }
            ],
            "typename": "Node_if",
            "version": 1,
            "y": 886.0689086914056,
            "x": -80.13604736328142
        },
        {
            "name": "planet_phase",
            "inputplugs": [
                {
                    "connection": "planet_gear_spin.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "180/planet_teeth"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": 644.3760752172764,
            "x": -218.76507521930125
        },
        {
            "name": "if_planet_odd",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "expression",
                    "value": "(sun_teeth+planet_teeth)%4==2"
                },
                {
                    "connection": "planet_phase.object",
                    "type": "object",
                    "name": "true",
                    "value": ""
                },
                {
                    "connection": "planet_gear_spin.object",
                    "type": "object",
                    "name": "false",
                    "value": ""
                }
            ],
            "typename": "Node_if",
            "version": 1,
            "y": 668.0699462890616,
            "x": 116.82836914062446
        },
        {
            "name": "node_if0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "expression",
                    "value": "planet_teeth+2>0.7071*(sun_teeth+planet_teeth)"
                },
                {
                    "connection": "node_linearextrude0.object",
                    "type": "object",
                    "name": "true",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "false",
                    "value": ""
                }
            ],
            "typename": "Node_if",
            "version": 1,
            "y": -89.19858487307704,
            "x": -1089.2601939345027
        },
        {
            "name": "node_linearextrude0",
            "inputplugs": [
                {
                    "connection": "node_text0.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "true",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "convexity",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "slices",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "scale",
                    "value": "1"
                }
            ],
            "typename": "Node_linearextrude",
            "version": 1,
            "y": 66.35863769531443,
            "x": -1394.2821191406242
        },
        {
            "name": "node_text0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "          Warning: planet gears collide"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "valign",
                    "value": "center",
                    "combo": [
                        "center",
                        "top",
                        "bottom"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": 65.63085449218943,
            "x": -1605.8285058593742
        },
        {
            "name": "node_comment0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "This Planetarry gear was upgraded by Chris L.T"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": -194.9873192282243,
            "x": -1167.9668671628735
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/