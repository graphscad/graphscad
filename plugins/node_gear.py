# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_gear(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a gear'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'mm_per_tooth', 'value': '3', 'type': 'str','tip':'units per tooth'},
                {'name': 'number_of_teeth', 'value': '10', 'type': 'str','tip':'number of teeth for gear'},
                {'name': 'thickness', 'value': '1', 'type': 'str','tip':'thickness of gear'},
                {'name': 'hole_diameter', 'value': '3', 'type': 'str','tip':'diameter of center hole'},
                {'name': 'twist', 'value': '0', 'type': 'str','tip':'angle twist'},
                {'name': 'teeth_to_hide', 'value': '0', 'type': 'str','tip':'count of teeth to hide'},
                {'name': 'pressure_angle', 'value': '28', 'type': 'str','tip':'pressure angle for teeth shape'},
                {'name': 'clearance', 'value': '0', 'type': 'str','tip':''},
                {'name': 'backlash', 'value': '0', 'type': 'str','tip':''},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'}
                ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output object'},
                {'name': 'pitch_radius', 'value': '0', 'type': 'str','tip':'output the pitch radius of gear (depends on teeth count and unit per tooth)'}
                ]

    def getheader(self):
        return """
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
) {
    pi = 3.1415926;
    p  = mm_per_tooth * number_of_teeth / pi / 2;  //radius of pitch circle
    c  = p + mm_per_tooth / pi - clearance;        //radius of outer circle
    b  = p*cos(pressure_angle);                    //radius of base circle
    r  = p-(c-p)-clearance;                        //radius of root circle
    t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
    k  = -gear_iang(b, p) - t/2/p/pi*180; {        //angle to where involute meets base circle on each side of tooth
        difference() {
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
};    
//these 4 functions are used by gear
function gear_polar(r,theta)   = r*[sin(theta), cos(theta)];                            //convert gear_polar to cartesian coordinates
function gear_iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/3.1415926*180 - acos(r1/r2); //unwind a string this many degrees to go from radius r1 to radius r2
function gear_q7(f,r,b,r2,t,s) = gear_q6(b,s,t,(1-f)*max(b,r)+f*r2);                         //radius a fraction f up the curved side of the tooth 
function gear_q6(b,s,t,d)      = gear_polar(d,s*(gear_iang(b,d)+t));                              //point at radius d on the involute curve

        """
        
        
        
    def evaluate(self):
        mm_per_tooth=self.getinputplugvalue('mm_per_tooth')
        number_of_teeth=self.getinputplugvalue('number_of_teeth')
        thickness=self.getinputplugvalue('thickness')
        hole_diameter=self.getinputplugvalue('hole_diameter')
        twist=self.getinputplugvalue('twist')
        teeth_to_hide=self.getinputplugvalue('teeth_to_hide')
        pressure_angle=self.getinputplugvalue('pressure_angle')
        clearance=self.getinputplugvalue('clearance')
        backlash=self.getinputplugvalue('backlash')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        code='gear('
        code=code+'mm_per_tooth='+mm_per_tooth+','
        code=code+'number_of_teeth='+number_of_teeth+','
        code=code+'thickness='+thickness+','
        code=code+'hole_diameter='+hole_diameter+','
        code=code+'twist='+twist+','
        code=code+'teeth_to_hide='+teeth_to_hide+','
        code=code+'pressure_angle='+pressure_angle+','
        code=code+'clearance='+clearance+','
        code=code+'backlash='+backlash+');'

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(code)
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        
        p  = '((('+mm_per_tooth+')*(('+number_of_teeth+')/ 3.1415926 / 2)))'  #radius of pitch circle
#         c  = p + mm_per_tooth / pi - clearance;        //radius of outer circle
#         b  = p*cos(pressure_angle);                    //radius of base circle
#         r  = p-(c-p)-clearance;                        //radius of root circle
#         t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
        
        self.setoutputplugvalue('pitch_radius',p)
        
        return
